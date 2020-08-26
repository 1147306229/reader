package com.zch.service;

import com.zch.entity.Comment;
import com.zch.exception.ServiceException;

import java.util.List;

/**
 * (Comment)表服务接口
 *
 * @author makejava
 * @since 2020-07-13 13:12:45
 */
public interface CommentService {

   public List<Comment> getCoById(Integer id) throws ServiceException;

   public int updateClikes(Integer clikes,Integer cid) throws ServiceException;

   public int updateCulikes(Integer culikes,Integer cid) throws ServiceException;

   public List<Comment> getFindQuery() throws RuntimeException;

}