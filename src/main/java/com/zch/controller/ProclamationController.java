package com.zch.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zch.entity.Proclamation;
import com.zch.service.ProclamationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Proclamation)表控制层
 *  公告
 * @author makejava
 * @since 2020-07-07 16:52:57
 */
@ResponseBody
@Controller
@RequestMapping("/proclamation")
public class ProclamationController {

    @Autowired
    private ProclamationService proclamationService;

    @RequestMapping("/findPro")
    public List<Proclamation> findPro(){
        List<Proclamation> list=proclamationService.findPro();
        return list;
    }

    @RequestMapping("/findProByPage/{page}")
    public PageInfo<Proclamation> findProByPage(@PathVariable Integer page){
        PageHelper.startPage(page, 1);
        PageInfo<Proclamation> pageInfo=new PageInfo<Proclamation>(proclamationService.getFindPro());
        return pageInfo;
    }

}