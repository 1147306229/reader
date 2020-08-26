package com.zch.service;

import com.zch.entity.User;
import java.util.List;

/**
 * (User)表服务接口
 *
 * @author makejava
 * @since 2020-06-24 15:04:19
 */
public interface UserService {
    public List<User> findUser();

}