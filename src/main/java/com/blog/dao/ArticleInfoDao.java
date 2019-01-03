package com.blog.dao;

import com.blog.view.ArticleInfo;
import com.blog.view.TypeInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by heanxing on 2018/12/26.
 */
public interface ArticleInfoDao {


   List<ArticleInfo> listNormal();


   ArticleInfo selectById(@Param("id")String id);
}
