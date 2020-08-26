package com.zch.dao;

import com.zch.entity.Book;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * (Book)表数据库访问层
 *
 * @author makejava
 * @since 2020-07-01 14:47:54
 */
public interface BookDao {
    public List<Book> findBook() throws RuntimeException;

    public List<Book> findBookBydateAndE() throws RuntimeException;

    public Book findBookById(Integer id) throws RuntimeException;

    public List<Book> query() throws RuntimeException;

    public Book queryById(Integer bid) throws RuntimeException;

    /*查询书籍是否有章节*/
    public List<Book> findBookAndChapt(Integer bid) throws RuntimeException;

    public int delBook(Integer bid) throws RuntimeException;

    public int updateBook(Book book) throws RuntimeException;

    public int delAll(Long[] ids) throws RuntimeException;

    public int addBook(Book book) throws RuntimeException;
}