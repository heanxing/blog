package com.blog.exception;

/**
 * Created by heanxing on 2018/12/28.
 */
public class AnException extends Exception {
    private static final long serialVersionUID = 1L;

    // 异常信息
    public String message;

    public AnException(String message){
        super(message);
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
