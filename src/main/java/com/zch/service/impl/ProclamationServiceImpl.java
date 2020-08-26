package com.zch.service.impl;

import com.zch.entity.Proclamation;
import com.zch.dao.ProclamationDao;
import com.zch.exception.ServiceException;
import com.zch.service.ProclamationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Proclamation)表服务实现类
 *
 * @author makejava
 * @since 2020-07-07 16:52:57
 */
@Service("proclamationService")
public class ProclamationServiceImpl implements ProclamationService {
    @Autowired
    private ProclamationDao proclamationDao;

    @Override
    public List<Proclamation> findPro() {
        return proclamationDao.findPro();
    }

    @Override
    public List<Proclamation> getFindPro() throws ServiceException {
        return proclamationDao.findPros();
    }
}