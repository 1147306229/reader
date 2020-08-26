package com.zch.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Comment)实体类
 *
 * @author makejava
 * @since 2020-07-13 13:12:45
 */
public class Comment{
    
    private Integer cid;
    /**
    * 内容
    */
    private String content;
    /**
    * 赞同人数
    */
    private Integer clikes;
    /**
    * 不赞同人数
    */
    private Integer culikes;
    /**
    * 日期
    */
    private Date cdate;
    
    private Integer bid;

    @Override
    public String toString() {
        return "Comment{" +
                "cid=" + cid +
                ", content='" + content + '\'' +
                ", clikes=" + clikes +
                ", culikes=" + culikes +
                ", cdate=" + cdate +
                ", bid=" + bid +
                ", user=" + user +
                '}';
    }

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getClikes() {
        return clikes;
    }

    public void setClikes(Integer clikes) {
        this.clikes = clikes;
    }

    public Integer getCulikes() {
        return culikes;
    }

    public void setCulikes(Integer culikes) {
        this.culikes = culikes;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

}