package com.zch.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.io.Serializable;

/**
 * (Book)实体类
 *
 * @author makejava
 * @since 2020-07-01 15:31:12
 */
@Component
public class Book{

    public Integer getBmpass() {
        return bmpass;
    }

    public void setBmpass(Integer bmpass) {
        this.bmpass = bmpass;
    }

    /*
    * 书籍总月票数
    * */
    private Integer bmpass;

    /**
    * 书籍id
    */
    private Integer bid;
    /**
    * 书名
    */
    private String bookname;
    /**
    * 书籍热度
    */
    private Integer bhot;
    /**
    * 书籍创建时间
    */

    public Integer tid;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    private Date bcreatdate;
    /**
    * 外键
    */
    private Integer uid;

    /*
    * 图片
    * */
    private String bpath;

    /*
    * 状态
    */
    private Integer bstatus;

    /*
    * 是否需要vip
    * */
    private Integer bisfree;

    /*
    * 是否签约
    * */
    private Integer bsign;


    public Integer getBsign() {
        return bsign;
    }

    public void setBsign(Integer bsign) {
        this.bsign = bsign;
    }

    public Integer getBisfree() {
        return bisfree;
    }

    public void setBisfree(Integer bisfree) {
        this.bisfree = bisfree;
    }

    public Integer getBstatus() {
        return bstatus;
    }

    public void setBstatus(Integer bstatus) {
        this.bstatus = bstatus;
    }

    /*
    * 详细内容介绍
    * */
    private String bdetail;

    public String getBdetail() {
        return bdetail;
    }

    public void setBdetail(String bdetail) {
        this.bdetail = bdetail;
    }

    public String getBpath() {
        return bpath;
    }

    public void setBpath(String bpath) {
        this.bpath = bpath;
    }

    private User user;

    private Type type;

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public Integer getBhot() {
        return bhot;
    }

    public void setBhot(Integer bhot) {
        this.bhot = bhot;
    }

    public Date getBcreatdate() {
        return bcreatdate;
    }

    public void setBcreatdate(Date bcreatdate) {
        this.bcreatdate = bcreatdate;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

}