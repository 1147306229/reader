package com.zch.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zch.entity.Book;
import com.zch.entity.Comment;
import com.zch.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * (Comment)表控制层
 *评论
 * @author makejava
 * @since 2020-07-13 13:12:45
 */
@Controller
@RequestMapping("/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;


    //查询这本书的所有评论信息
    @RequestMapping(value = "/queryCommentById/{id}",method = RequestMethod.POST)
    public @ResponseBody List<Comment> queryCommentById(@PathVariable Integer id){
        List<Comment> list = commentService.getCoById(id);
        List<Comment> commentList=new ArrayList<Comment>();
        return list;
    }

    @RequestMapping(value = "/updateClikes/{cid}/{clikes}",method = RequestMethod.GET)
    public @ResponseBody void updateClikes(@PathVariable Integer cid,@PathVariable Integer clikes){

    }

    @RequestMapping("/query")
    public @ResponseBody
    Map<String,Object> queryBook(int page, int limit){
        PageHelper.startPage(page, limit);
        PageInfo<Comment> pageInfo=new PageInfo<Comment>(commentService.getFindQuery());
        Map<String,Object> map =new HashMap<String,Object>();
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


}