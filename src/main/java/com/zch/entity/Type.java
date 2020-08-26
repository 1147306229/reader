package com.zch.entity;

import java.io.Serializable;

/**
 * (Type)实体类
 *
 * @author makejava
 * @since 2020-07-13 13:12:12
 */
public class Type implements Serializable {
    private static final long serialVersionUID = 192037340214266972L;
    
    private Integer tid;
    
    private String typename;


    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

}