package com.zch.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zch.entity.Proclamation;
import com.zch.entity.Select;
import com.zch.service.SelectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * (Select)表控制层
 *
 * @author makejava
 * @since 2020-07-14 20:38:03
 */
@Controller
@RequestMapping("/select")
public class ReadBookController {

    @Autowired
    private SelectService selectService;

    @RequestMapping("/findChByTit/{id}")
    public @ResponseBody List<Select> findChByTit(@PathVariable Integer id){
        List<Select> list = selectService.getFindByChapterId(id);
        return list;
    }

    //记录第几章，阅读书籍
    @RequestMapping("/findSelectArticleById/{schapter}/{bid}")
    public ModelAndView findSelectArticleById(@PathVariable Integer schapter,@PathVariable Integer bid){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("schapter",schapter);
        modelAndView.addObject("bid",bid);
        modelAndView.setViewName("readBook");
        return modelAndView;
    }

    //章节阅读
    @RequestMapping("/findSelectContent/{page}/{bid}/{schapter}")
    public @ResponseBody PageInfo<Select> findSelectContent(@PathVariable Integer page,@PathVariable Integer bid,@PathVariable Integer schapter){
        if(page==schapter){
            PageHelper.startPage(page, 1);
        }else if(page<schapter){
            PageHelper.startPage(schapter, 1);
        }
        else if(page>schapter){
            PageHelper.startPage(page, 1);
        }
        else{
            PageHelper.startPage(page+1, 1);
        }

        PageInfo<Select> pageInfo=new PageInfo<Select>(selectService.getFindSeArticleById(bid));
        return pageInfo;
    }



}