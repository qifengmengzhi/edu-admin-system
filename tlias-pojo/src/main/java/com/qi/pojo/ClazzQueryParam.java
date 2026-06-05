package com.qi.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Max;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClazzQueryParam {
    /** 班级名称，模糊查询 */
    private String name;

    /** 范围匹配的开始时间（结课时间），格式：yyyy-MM-dd */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate begin;

    /** 范围匹配的结束时间（结课时间），格式：yyyy-MM-dd */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate end;
    /** 分页查询的页码，默认为1 */

    private Integer page = 1;

    /** 分页查询的每页记录数，默认为10 */
    @Min(value = 1, message = "每页条数最小为1")
    @Max(value = 100, message = "每页条数最大为100")
    private Integer pageSize = 10;

}
