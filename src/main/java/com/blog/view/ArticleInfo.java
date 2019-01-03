package com.blog.view;

import java.util.Date;

/**
 * Created by heanxing on 2018/12/28.
 */
public class ArticleInfo {
    private String id;
    private String typeId;
    private String title;
    private String conten;
    private String contenText;  //文章简介
    private String cover;       //文章封面
    private String viewCount;   //浏览次数
    private Date  updateTime;   //文章最后一次修改时间
    private int status;         //文章的状态(1:)

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getViewCount() {
        return viewCount;
    }

    public void setViewCount(String viewCount) {
        this.viewCount = viewCount;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getConten() {
        return conten;
    }

    public void setConten(String conten) {
        this.conten = conten;
    }

    public String getContenText() {
        return contenText;
    }

    public void setContenText(String contenText) {
        this.contenText = contenText;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }


    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
