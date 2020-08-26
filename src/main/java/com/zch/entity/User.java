package com.zch.entity;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.io.Serializable;
import java.util.List;

/**
 * (User)实体类
 *
 * @author makejava
 * @since 2020-07-01 15:31:30
 */
@Component
public class User{

    /**
    * 用户id
    */
    private Integer uid;
    /**
    * 用户名
    */
    private String username;
    /**
    * 用户密码
    */
    private String upassword;
    /**
    * 性别
    */
    private String ugender;
    /**
    * 昵称
    */
    private String unickname;
    /**
    * 用户创建时间
    */
    private Date ucreatdate;
    /**
    * 用户月票
    */
    private Integer umpass;

    /*
    * 头像地址
    * */
    private String uavatar;


    public List<Book> getBook() {
        return book;
    }

    public void setBook(List<Book> book) {
        this.book = book;
    }

    private List<Book> book=new ArrayList<Book>();


    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUavatar() {
        return uavatar;
    }

    public void setUavatar(String uavatar) {
        this.uavatar = uavatar;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUgender() {
        return ugender;
    }

    public void setUgender(String ugender) {
        this.ugender = ugender;
    }

    public String getUnickname() {
        return unickname;
    }

    public void setUnickname(String unickname) {
        this.unickname = unickname;
    }

    public Date getUcreatdate() {
        return ucreatdate;
    }

    public void setUcreatdate(Date ucreatdate) {
        this.ucreatdate = ucreatdate;
    }

    public Integer getUmpass() {
        return umpass;
    }

    public void setUmpass(Integer umpass) {
        this.umpass = umpass;
    }

}