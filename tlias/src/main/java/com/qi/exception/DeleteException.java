package com.qi.exception;


public class DeleteException extends RuntimeException {

    /**
     * 错误码，前端可根据此码做特殊处理
     */
    private Integer code;

    public DeleteException(String message) {
        super(message);
        this.code = 4001; // 业务错误码：4001表示班级删除失败
    }

    public DeleteException(String message, Integer code) {
        super(message);
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }
}
