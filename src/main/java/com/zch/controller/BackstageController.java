package com.zch.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zch.entity.Book;
import com.zch.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * java类简单作用描述:后台
 *
 * @ProjectName: SSM-ReadBook
 * @Package: com.zch.controller
 * @Description: java类作用描述
 * @Author: 钟创辉
 * @CreateDate: 2020/7/3 15:53
 * @UpdateDate: 2020/7/3 15:53
 * @UpdateRemark: The modified content
 * @Version: 1.0
 * <p>Copyright: Copyright (c) 2020</p>
 */
@Controller
@RequestMapping("/backstage")
public class BackstageController extends BaseController {

    @Autowired
    private BookService bookService;






}
