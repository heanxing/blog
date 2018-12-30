package com.blog.dao;

import com.blog.view.UserInfo;
import org.apache.ibatis.annotations.Param;

/**
 * Created by heanxing on 2018/12/26.
 */
public interface UserInfoDao {

    /**
     * 校验用户
     * @param loginName 登录名
     * @param passWord 登录密码
     * @return
     */
    UserInfo selectUser(@Param("loginName") String loginName, @Param("passWord") String passWord);



}
