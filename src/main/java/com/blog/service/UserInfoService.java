package com.blog.service;

import com.blog.dao.UserInfoDao;
import com.blog.view.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by heanxing on 2018/12/26.
 */

@Service("UserInfoService")
public class UserInfoService {


    @Autowired
    private UserInfoDao userInfoDao;
    public UserInfo selectUser(String loginName, String passWord){
        return userInfoDao.selectUser(loginName,passWord);
    }


}
