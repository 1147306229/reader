package com.zch.controller.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * java类简单作用描述:自定义拦截器
 *
 * @ProjectName: SSM-ReadBook
 * @Package: com.zch.controller.interceptor
 * @Description: java类作用描述
 * @Author: 钟创辉
 * @CreateDate: 2020/7/1 10:13
 * @UpdateDate: 2020/7/1 10:13
 * @UpdateRemark: The modified content
 * @Version: 1.0
 * <p>Copyright: Copyright (c) 2020</p>
 */
public class MyInterceptor implements HandlerInterceptor {
    //return false表示不会执行Controller中的方法，反之则会
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("拦截器执行了");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
