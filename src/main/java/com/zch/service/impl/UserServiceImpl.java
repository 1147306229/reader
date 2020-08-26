package com.zch.service.impl;

import com.zch.entity.User;
import com.zch.dao.UserDao;
import com.zch.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (User)表服务实现类
 *
 * @author makejava
 * @since 2020-06-24 15:04:19
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;


    @Override
    public List<User> findUser() {
        return userDao.findUser();
    }
}