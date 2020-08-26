package com.zch.dao;

import com.zch.entity.Proclamation;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (Proclamation)表数据库访问层
 *
 * @author makejava
 * @since 2020-07-07 16:52:57
 */
public interface ProclamationDao {
    public List<Proclamation> findPro() throws RuntimeException;

    public List<Proclamation> findPros() throws RuntimeException;
}