package com.zch.service.impl;

import com.zch.entity.Comment;
import com.zch.dao.CommentDao;
import com.zch.exception.ServiceException;
import com.zch.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Comment)表服务实现类
 *
 * @author makejava
 * @since 2020-07-13 13:12:45
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;


    @Override
    public List<Comment> getCoById(Integer id) throws ServiceException {
        return commentDao.findByCoId(id);
    }

    @Override
    public int updateClikes(Integer clikes, Integer cid) throws ServiceException {
        return commentDao.updateClikes(clikes,cid);
    }

    @Override
    public int updateCulikes(Integer culikes, Integer cid) throws ServiceException {
        return commentDao.updateCulikes(culikes,cid);
    }

    @Override
    public List<Comment> getFindQuery() throws RuntimeException {
        return commentDao.findQuery();
    }
}