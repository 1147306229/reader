package com.zch.service;

import com.zch.entity.Proclamation;
import com.zch.exception.ServiceException;

import java.util.List;

/**
 * (Proclamation)表服务接口
 *
 * @author makejava
 * @since 2020-07-07 16:52:57
 */
public interface ProclamationService {
    public List<Proclamation> findPro() throws ServiceException;

    public List<Proclamation> getFindPro() throws ServiceException;
}