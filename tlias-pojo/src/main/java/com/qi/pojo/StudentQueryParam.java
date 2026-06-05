package com.qi.pojo;


import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Data;

/**
 * 学员信息查询参数实体类
 */
@Data
public class StudentQueryParam {

    /** 学员姓名，支持模糊查询 */
    private String name;

    /**
     * 学历
     * 1:初中, 2:高中, 3:大专, 4:本科, 5:硕士
     */
    private Integer degree;

    /** 班级ID */
    private Integer clazzId;

    /**
     * 分页查询的页码
     * 如果未指定，默认为1
     */

    private Integer page = 1;

    /**
     * 分页查询的每页记录数
     * 如果未指定，默认为10
     */
    @Min(value = 1, message = "每页条数最小为1")
    @Max(value = 100, message = "每页条数最大为100")
    private Integer pageSize = 10;
}
