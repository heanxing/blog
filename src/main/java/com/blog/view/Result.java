package com.blog.view;

import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by heanxing on 2018/12/28.
 */
public class Result {
    //code:状态码；成功：200 失败：250
    private  String code;
    private String message;
    private Map<String,Object> data = new HashMap<String,Object>();

    public static Result success(){
        Result result= new Result();
        result.setCode("200");
        result.setMessage("处理成功");
        return result;
    }

    public static Result error(String string){
        Result result= new Result();
        result.setCode("250");

        if (StringUtils.isEmpty(string)){
            result.setMessage("操作失败");
        }else {
            result.setMessage(string);

        }
        return result;
    }


    public Result add(String key,Object value){
      this.getData().put(key,value);
      return this;
    }




    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
