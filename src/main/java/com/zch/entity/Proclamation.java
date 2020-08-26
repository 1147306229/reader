package com.zch.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (Proclamation)实体类
 *
 * @author makejava
 * @since 2020-07-07 16:52:57
 */
public class Proclamation implements Serializable {
    private static final long serialVersionUID = 921291205456459004L;
    
    private Integer pid;
    /**
    * 标题
    */
    private String ptitle;
    /**
    * 内容
    */
    private String pcontent;
    /**
    * 创建日期
    */
    private Date pdate;


    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }

}