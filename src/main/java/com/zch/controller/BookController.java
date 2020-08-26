package com.zch.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zch.entity.Book;
import com.zch.exception.ServiceException;
import com.zch.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Book)表控制层
 *
 * @author makejava
 * @since 2020-07-01 14:47:54
 */
@Controller
@RequestMapping("/book")
public class BookController extends BaseController {

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/findBook", method = RequestMethod.POST)
    public @ResponseBody
    List<Book> findBook() throws Exception {
        List<Book> book = bookService.getBook();
        return book;
    }

    /*显示首页书籍内容*/
    @RequestMapping(value = "/findByIndex", method = RequestMethod.POST)
    public @ResponseBody
    List<Book> findBookByIndex() {
        List<Book> book = bookService.getBookByIndex();
        return book;
    }

    /*一本小说书籍信息显示*/
    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    public ModelAndView enterChapterPage(@PathVariable Integer id) {
        Book book = bookService.getBookId(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("book", book);
        modelAndView.setViewName("chapter");
        return modelAndView;
    }

    @RequestMapping(value = "/delBookById/{bid}", method = RequestMethod.GET)
    public @ResponseBody
    Map<String, Object> delBookById(@PathVariable Integer bid) {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = 0;
        try {
            result = bookService.getDelBook(bid);
            map.put("success", result);
        } catch (ServiceException e) {
            map.put("result", e.getMessage());
        }
        return map;
    }

    /*查询所有书籍信息*/
    @RequestMapping("/query")
    public @ResponseBody
    Map<String, Object> queryBook(int page, int limit) {
        PageHelper.startPage(page, limit);
        PageInfo<Book> pageInfo = new PageInfo<Book>(bookService.getQuery());
        Map<String, Object> map = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        map.put("code", 0);
        map.put("msg", "");
        //将全部数据的条数作为count传给前台（一共多少条）
        map.put("count", pageInfo.getTotal());
        //将分页后的数据返回（每页要显示的数据）
        map.put("data", pageInfo.getList());
        //返回给前端
        return map;
    }

    /*进入书籍编辑页面*/
    @RequestMapping("/updateB/{bid}")
    public ModelAndView updateBook(@PathVariable Integer bid) {
        Book query = bookService.getQueryById(bid);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("book", query);
        modelAndView.setViewName("updateBook");
        return modelAndView;
    }

    /*书籍修改*/
    @RequestMapping("/updateBook")
    public @ResponseBody
    Map<String, Object> updateByBook(Book book) {
        Map<String, Object> map = new HashMap<String, Object>();
        int updateBook = 0;
        try {
            updateBook = bookService.getUpdateBook(book);
            map.put("success", updateBook);
        } catch (ServiceException e) {
            map.put("error", e.getMessage());
        }
        return map;
    }

    /*
     *批量删除
     * */
    @RequestMapping("/deleteAll/{ids}")
    @ResponseBody
    public Map<String, Object> delBookAll(@PathVariable Long[] ids) {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = 0;
        try {
            result = bookService.getDelAll(ids);
            map.put("success", result);
        } catch (ServiceException e) {
            map.put("result", e.getMessage());
        }
        return map;
    }

    /*书籍添加页面*/
    @RequestMapping("/add")
    public String add(){
        return "addBook";
    }


    /*书籍添加*/
    @RequestMapping("/addB")
    @ResponseBody
    public Map<String, Object> addB(Book book){
        Map<String, Object> map = new HashMap<String, Object>();
        int add = 0;
        try {
            add = bookService.getAddBook(book);
            map.put("success", add);
        } catch (ServiceException e) {
            map.put("error", e.getMessage());
        }
        return map;
    }


}