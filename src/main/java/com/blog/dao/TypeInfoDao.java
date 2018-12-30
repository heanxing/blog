package com.blog.dao;

import com.blog.view.TypeInfo;
import com.blog.view.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by heanxing on 2018/12/26.
 */
public interface TypeInfoDao {


   List<TypeInfo> list();

   int insert(@Param("sort") String sort, @Param("name") String name );

   int  update(@Param("id")String id, @Param("sort") String sort, @Param("name") String name );

   int delete(@Param("idArr")String[] idArr);
}
