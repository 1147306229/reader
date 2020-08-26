package com.zch.service;

import com.zch.entity.Type;
import java.util.List;

/**
 * (Type)表服务接口
 *
 * @author makejava
 * @since 2020-07-13 10:26:42
 */
public interface TypeService {

    public List<Type> getFindQuery() throws RuntimeException;
}