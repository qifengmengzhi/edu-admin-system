package com.qi.controller;

import com.qi.pojo.Result;
import com.qi.utils.AliyunOSSOperator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Slf4j
@RestController
public class UploadController {
    @Autowired
    private AliyunOSSOperator aliyunOSSOperator;
    @PostMapping("/upload")
    /*本地磁盘存储方案*/
//    public Result upload(String name, Integer age, MultipartFile file) throws IOException {
//        String originalFilename = file.getOriginalFilename();
//        UUID uuid = UUID.randomUUID();
//        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
//        file.transferTo(new File("D:/images/" + uuid+extension));
//        log.info("上传文件:{},{},{}",name,age,file);
//        return Result.success();
//    }
    public Result upload(MultipartFile file) throws Exception {
        String originalFilename = file.getOriginalFilename();
        log.info("上传文件:{}",file);
        return Result.success(aliyunOSSOperator.upload(file.getBytes(),originalFilename));
    }
}
