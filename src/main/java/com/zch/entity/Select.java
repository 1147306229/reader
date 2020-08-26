package com.zch.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Select)实体类
 *
 * @author makejava
 * @since 2020-07-14 20:38:03
 */
public class Select {
    
    private Integer sid;
    /**
    * 文章内容
    */
    private String scontent;
    /**
    * 时间
    */
    private Date sdate;
    
    private Integer bid;
    /**
    * 标题
    */
    private String stitle;
    /**
    * 小说章节
    */
    private Integer schapter;

    private User user;

    private Book book;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getScontent() {
        return scontent;
    }

    public void setScontent(String scontent) {
        this.scontent = scontent;
    }

    public Date getSdate() {
        return sdate;
    }

    public void setSdate(Date sdate) {
        this.sdate = sdate;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getStitle() {
        return stitle;
    }

    public void setStitle(String stitle) {
        this.stitle = stitle;
    }

    public Integer getSchapter() {
        return schapter;
    }

    public void setSchapter(Integer schapter) {
        this.schapter = schapter;
    }

}