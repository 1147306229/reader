package com.zch.dao;

import com.zch.entity.Type;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (Type)表数据库访问层
 *
 * @author makejava
 * @since 2020-07-13 10:26:42
 */
public interface TypeDao {

  public List<Type> findQuery() throws RuntimeException;
}