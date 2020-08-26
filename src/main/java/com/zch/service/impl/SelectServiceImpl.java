package com.zch.service.impl;

import com.zch.entity.Select;
import com.zch.dao.SelectDao;
import com.zch.exception.ServiceException;
import com.zch.service.SelectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Select)表服务实现类
 *
 * @author makejava
 * @since 2020-07-14 20:38:03
 */
@Service("selectService")
public class SelectServiceImpl implements SelectService {
    @Autowired
    private SelectDao selectDao;


    @Override
    public List<Select> getFindByChapterId(Integer id) throws ServiceException {
        return selectDao.findByChapterId(id);
    }

    @Override
    public List<Select> getFindSeArticleById(Integer bid) throws ServiceException {
        return selectDao.findSeArticleById(bid);
    }
}