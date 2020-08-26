package com.zch.service.impl;

import com.zch.entity.Book;
import com.zch.dao.BookDao;
import com.zch.exception.ServiceException;
import com.zch.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Book)表服务实现类
 *
 * @author makejava
 * @since 2020-07-01 14:47:54
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;


    @Override
    public List<Book> getBook() {
        return bookDao.findBook();
    }

    @Override
    public List<Book> getBookByIndex() {
        return bookDao.findBookBydateAndE();
    }

    @Override
    public Book getBookId(Integer id) {
        return bookDao.findBookById(id);
    }

    @Override
    public List<Book> getQuery() throws ServiceException {
        return bookDao.query();
    }

    @Override
    public Book getQueryById(Integer bid) throws ServiceException {
        return bookDao.queryById(bid);
    }

    @Override
    public int getDelBook(Integer bid) throws ServiceException {
        List<Book> bookAndChapt = bookDao.findBookAndChapt(bid);
        if (bookAndChapt.size() >0&&bookAndChapt!=null) {
            throw new ServiceException("删除失败，请先删除该本书的其它章节!");
        }
        return bookDao.delBook(bid);
    }

    @Override
    public int getUpdateBook(Book book) throws ServiceException {
        int i = bookDao.updateBook(book);
        if(i<=0) {
            throw new ServiceException("修改失败");
        }
        return bookDao.updateBook(book);
    }

    @Override
    public int getDelAll(Long[] ids) throws ServiceException {
        return bookDao.delAll(ids);
    }

    @Override
    public int getAddBook(Book book) throws ServiceException {
        return bookDao.addBook(book);
    }
}