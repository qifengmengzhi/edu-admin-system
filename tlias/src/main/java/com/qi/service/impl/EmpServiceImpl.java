package com.qi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.qi.exception.UpdatePwException;
import com.qi.mapper.EmpExprMapper;
import com.qi.mapper.EmpMapper;
import com.qi.pojo.*;
import com.qi.service.EmpLogService;
import com.qi.service.EmpService;
import com.qi.utils.BCryptUtil;
import com.qi.utils.CurrentHolder;
import com.qi.utils.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.util.CollectionUtils;

import com.qi.exception.LoginException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpMapper empMapper;
    @Autowired
    private EmpExprMapper empExprMapper;
    @Autowired
    private EmpLogService empLogService;


    @Override
    //自定义注解，表示当前方法属于目标方法
    public PageResult<Emp> page(EmpQueryParam param) {
        //设置分页参数
        PageHelper.startPage(param.getPage(), param.getPageSize());
        //查询数据
        List<Emp> list = empMapper.findAll(param);
        Page<Emp> p = (Page<Emp>) list;
        return new PageResult(p.getTotal(), p.getResult());
    }

    @Override
    @Transactional(rollbackFor = {Exception.class})
    public void insert(Emp emp) throws Exception {

        try {
            //默认密码加密
            emp.setPassword(BCryptUtil.encrypt("123456"));
            //设置创建时间，修改时间
            emp.setCreateTime(LocalDateTime.now());
            emp.setUpdateTime(LocalDateTime.now());
            //添加员工
            empMapper.save(emp);

            List<EmpExpr> exprList = emp.getExprList();
            if (!CollectionUtils.isEmpty(exprList)) {
                //设置员工ID
                exprList.forEach(empExpr -> empExpr.setEmpId(emp.getId()));

            }

            //添加工作经历
            if(emp.getExprList()!=null&&emp.getExprList().size()>0)
            empExprMapper.insert(emp.getExprList());
        } finally {
            //记录操作日志
            EmpLog empLog = new EmpLog(null, LocalDateTime.now(), emp.toString());
            empLogService.insertLog(empLog);
        }

    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public void delete(Integer[] ids) {
        try {
            //删除员工经历
            empExprMapper.delete(ids);
            //删除员工
            empMapper.delete(ids);
        } finally {
            //记录操作日志
            EmpLog empLog = new EmpLog(null, LocalDateTime.now(), "删除id为" + ids.toString() + "的员工");
            empLogService.insertLog(empLog);
        }

    }

    @Override
    public Emp getInfo(Integer id) {
        Emp emp = empMapper.getInfo(id);
        return emp;
    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public void update(Emp emp) {
        //设置修改时间
        emp.setUpdateTime(LocalDateTime.now());
        //修改员工
        empMapper.update(emp);
        //删除旧的员工经历
        empExprMapper.delete(new Integer[]{emp.getId()});
        //添加新的员工经历
        List<EmpExpr> exprList = emp.getExprList();
        if (!CollectionUtils.isEmpty(exprList)) {
            //设置员工ID
            exprList.forEach(empExpr ->
                    empExpr.setEmpId(emp.getId()));
            empExprMapper.insert(exprList);
        }

    }

    @Override
    public List<Emp> findAll() {
        return empMapper.findAll(new EmpQueryParam());
    }

    //员工登录
    @Override
    public LoginInfo login(LoginDTO loginDTO) {
        LoginInfo loginInfo = empMapper.login(loginDTO);
        if(loginInfo==null|| !BCryptUtil.matches(loginDTO.getPassword(), loginInfo.getPassword())) {
                throw new LoginException("用户名或密码错误");
        }
        else {
          loginInfo.setToken(JwtUtils.generateJwt(
                  Map.of("username", loginInfo.getUsername(),
                          "id", loginInfo.getId())));

        }
        return loginInfo;
    }

    @Override
    public void updatePassword(String oldPassword, String newPassword) {
        //验证新旧密码是否一致
        if(oldPassword.equals(newPassword)){
            throw new UpdatePwException("新密码不能与旧密码相同");
        }else {
            //验证旧密码是否正确
            Integer empId = CurrentHolder.getCurrentId();
            Emp info = empMapper.getInfo(empId);
            if(!BCryptUtil.matches(oldPassword, info.getPassword())){
                throw new UpdatePwException("旧密码错误");
            }else
            {
                //修改密码，加密
                empMapper.updatePassword(empId,BCryptUtil.encrypt(newPassword));
            }
        }

    }

    @Override
    public List<EmpExportVO> getExportList() {
        return empMapper.getExportList();
    }

}
