package com.qi.pojo;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Emp {
    private Integer id; //ID,主键
    @NotBlank(message = "用户名不能为空")
    private String username; //用户名
    private String password; //密码
    @NotBlank(message = "姓名不能为空")
    private String name; //姓名
    @NotNull(message = "性别不能为空")
    private Integer gender; //性别, 1:男, 2:女
    @NotBlank(message = "手机号不能为空")
    @Pattern(regexp = "^1[3-9]\\d{9}$", message = "手机号格式不正确")
    private String phone; //手机号
    @NotNull(message = "职位不能为空")
    private Integer job; //职位, 1:班主任,2:讲师,3:学工主管,4:教研主管,5:咨询师
    @NotNull(message = "薪资不能为空")
    @Min(value = 0, message = "薪资不能为负数")
    private Integer salary; //薪资
    private String image; //头像
    @NotNull(message = "入职日期不能为空")
    private LocalDate entryDate; //入职日期
    @NotNull(message = "部门ID不能为空")
    private Integer deptId; //关联的部门ID
    private LocalDateTime createTime; //创建时间
    private LocalDateTime updateTime; //修改时间

    //封装部门名称
    private String deptName; //部门名称
    //工作经历列表
    private List<EmpExpr> exprList;


}
