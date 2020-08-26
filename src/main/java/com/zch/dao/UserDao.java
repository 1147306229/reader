package com.zch.dao;

import com.zch.entity.User;
import com.zch.exception.ServiceException;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * (User)表数据库访问层
 *
 * @author makejava
 * @since 2020-06-24 15:04:19
 */

public interface UserDao {
    public List<User> findUser();

}