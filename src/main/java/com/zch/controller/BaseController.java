package com.zch.controller;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.PropertiesEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * @description: 父类控制器，所以的自定义控制器全部继承此类
 * @author: zch
 * @create: 2020-07-07
 */
@Controller
public class BaseController {

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        dataBinder.registerCustomEditor(Date.class,
                new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));

        // Timestamp时间戳格式的转换，带时分秒
        dataBinder.registerCustomEditor(Timestamp.class, new TimestampEditor());
    }

    public class TimestampEditor extends PropertiesEditor {
        @Override
        public void setAsText(String text) throws IllegalArgumentException {
            setValue(Timestamp.valueOf(text));
        }

        @Override
        public String getAsText() {
            return getValue().toString();
        }
    }

}
