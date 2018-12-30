package com.blog.service;

import com.blog.dao.TypeInfoDao;

import com.blog.view.Result;
import com.blog.view.TypeInfo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by heanxing on 2018/12/26.
 */

@Service("TypeInfoService")
public class TypeInfoService {


    @Autowired
    private TypeInfoDao typeInfoDao;

    public List<TypeInfo> list(){
        return typeInfoDao.list();
    }


    public void save(String[] idArr, String[] sortArr, String[] nameArr){
        //遍历一个数组
        for (int i = 0;i<idArr.length;i++){
            //判断需要更新插入
            if (StringUtils.isEmpty(idArr[i])){
                //插入
                typeInfoDao.insert(sortArr[i],nameArr[i]);


            }else {
                //更新
                typeInfoDao.update(idArr[i],sortArr[i],nameArr[i]);


            }
        }

    }


    public void delete(String[] idArr) {
        typeInfoDao.delete(idArr);
    }
}
