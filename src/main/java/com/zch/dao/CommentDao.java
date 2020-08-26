package com.zch.dao;

import com.zch.entity.Comment;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (Comment)表数据库访问层
 *
 * @author makejava
 * @since 2020-07-13 13:12:45
 */
public interface CommentDao {
    /*获取该本书的所有评论信息*/
    public List<Comment> findByCoId(Integer id) throws RuntimeException;
    /*修改这本书的点赞数*/
    public int updateClikes(Integer clikes,Integer cid) throws RuntimeException;
    /*修改这本书的点赞数*/
    public int updateCulikes(Integer culikes,Integer cid) throws RuntimeException;
    /*所有的评论*/
    public List<Comment> findQuery() throws RuntimeException;
}