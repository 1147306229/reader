package com.zch.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.zch.entity.Book;
import com.zch.entity.User;
import com.zch.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * (User)表控制层
 *
 * @author makejava
 * @since 2020-06-24 15:04:20
 */
@Controller
@RequestMapping("/users")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    /*查询所有书籍信息*/
    @RequestMapping("/query")
    public @ResponseBody
    Map<String,Object> queryUser(int page, int limit){
        PageHelper.startPage(page, limit);
        PageInfo<User> pageInfo=new PageInfo<User>(userService.findUser());
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

    @RequestMapping(value = "/findUser", method = RequestMethod.GET)
    public ModelAndView findUser() {
        List<User> user = userService.findUser();
        ModelAndView model = new ModelAndView();
        model.addObject("user", user);
        model.setViewName("/reader.jsp");
        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody
    User userLogin(@RequestBody User user) throws Exception {
        if ("1147306229".equals(user.getUsername()) && "123".equals(user.getUpassword())) {
            user.setUnickname("登录成功！");
        }
        return user;
    }

    @RequestMapping("/user")
    public void user(@RequestBody String body) {
        System.out.println(body);
    }

    @RequestMapping("/users")
    public @ResponseBody
    User users(@RequestBody User user) {
        user.setUsername("666");
        user.setUpassword("666");
        return user;
    }

    /*
     * spring文件的上传
     *
     * */
 /*   @RequestMapping("/upload")
    public String upload(HttpServletRequest request,@RequestParam MultipartFile[] upload) throws Exception {
        for (int i=0;i<upload.length;i++){
            String path = request.getSession().getServletContext().getRealPath("/statics/uploads/");
            File file=new File(path);
            if(!file.exists()){
                file.mkdirs();
            }

            String filename=upload[i].getOriginalFilename();
            String uuid= UUID.randomUUID().toString().replace("-","");
            filename=uuid+"_"+filename;

            upload[i].transferTo(new File(path,filename));
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.addObject("filename",filename);
            System.out.println(filename);
        }
        return "success";
    }*/

    @RequestMapping(value = "/uploada")
    public String uploads(HttpServletRequest request, MultipartFile upload) throws Exception {
        String path = request.getSession().getServletContext().getRealPath("/statics/uploads/");
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }

        String filename = upload.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid + "_" + filename;

        upload.transferTo(new File(path, filename));
        request.setAttribute("filename", filename);
        System.out.println(filename);
        return "success";
    }

    /*
     *
     * 跨服务器上传
     * */
    @RequestMapping("/uploads")
    public void uploads(MultipartFile upload) throws Exception {
        //定义上传文件服务器路径
        String path = "";

        String filename = upload.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid + "_" + filename;

        Client client = Client.create();
        WebResource webResource = client.resource(path + filename);

        webResource.put(upload.getBytes());
    }

    @RequestMapping("/update")
    public String updateUser(){
        return "user";
    }






    /*局部*/
    /*@ExceptionHandler
    public String getExceptionMsg(RuntimeException e,HttpServletRequest request){
        //把异常信息提出来
        request.setAttribute("error",e.getMessage());
        return "error";
    }*/
}