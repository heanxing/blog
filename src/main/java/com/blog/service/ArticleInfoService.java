package com.blog.service;

import com.blog.dao.ArticleInfoDao;
import com.blog.dao.TypeInfoDao;
import com.blog.view.ArticleInfo;
import com.blog.view.TypeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Created by heanxing on 2018/12/26.
 */

@Service(" ArticleInfoService")
public class ArticleInfoService {


    @Autowired
    private ArticleInfoDao articleInfoDao;
    public List<ArticleInfo> listNormal(){

        return articleInfoDao.listNormal();
    }


    public ArticleInfo selectById(String id) {
        return articleInfoDao.selectById(id);
    }
}
