package com.zch.service;

import com.zch.entity.Book;
import com.zch.exception.ServiceException;

import java.util.List;
import java.util.Map;

/**
 * (Book)表服务接口
 *
 * @author makejava
 * @since 2020-07-01 14:47:54
 */
public interface BookService {
    public List<Book> getBook() throws ServiceException;

    public List<Book> getBookByIndex() throws ServiceException;

    public Book getBookId(Integer id) throws ServiceException;

    public List<Book> getQuery() throws ServiceException;

    public Book getQueryById(Integer bid) throws ServiceException;

    public int getDelBook(Integer bid) throws ServiceException;

    public int getUpdateBook(Book book) throws ServiceException;

    public int getDelAll(Long[] ids) throws ServiceException;

    public int getAddBook(Book book) throws ServiceException;

}