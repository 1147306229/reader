package com.zch.controller;

import com.zch.entity.Type;
import com.zch.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Type)表控制层
 *
 * @author makejava
 * @since 2020-07-13 10:26:42
 */
@Controller
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @RequestMapping("/query")
    public @ResponseBody List<Type> query(){
        List<Type> findQuery = typeService.getFindQuery();
        return findQuery;
    }


}