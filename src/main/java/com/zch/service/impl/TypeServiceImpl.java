package com.zch.service.impl;

import com.zch.entity.Type;
import com.zch.dao.TypeDao;
import com.zch.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Type)表服务实现类
 *
 * @author makejava
 * @since 2020-07-13 10:26:42
 */
@Service("typeService")
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeDao typeDao;

    @Override
    public List<Type> getFindQuery() throws RuntimeException {
        return typeDao.findQuery();
    }
}