package com.zch.service;

import com.zch.entity.Select;
import com.zch.exception.ServiceException;

import java.util.List;

/**
 * (Select)表服务接口
 *
 * @author makejava
 * @since 2020-07-14 20:38:03
 */
public interface SelectService {
    public List<Select> getFindByChapterId(Integer id) throws ServiceException;

    public List<Select> getFindSeArticleById(Integer bid) throws ServiceException;
}