package com.zch.dao;

import com.zch.entity.Select;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (Select)表数据库访问层
 *
 * @author makejava
 * @since 2020-07-14 20:38:03
 */
public interface SelectDao {
    public List<Select> findByChapterId(Integer id) throws RuntimeException;

    public List<Select> findSeArticleById(Integer bid) throws RuntimeException;
}