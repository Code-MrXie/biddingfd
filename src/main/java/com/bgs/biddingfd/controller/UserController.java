package com.bgs.biddingfd.controller;


import com.bgs.biddingfd.pojo.User;
import com.bgs.biddingfd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.*;

@RestController
public class UserController {

    @Autowired
    UserService userService;


    //权限验证操作
    @ResponseBody
    @RequestMapping("/jurisdiction")
    public List<Map<String,Object>> jurisdiction(HttpSession session) {
        Object userLogin = session.getAttribute("UserLogin");
        List<Map<String,Object>> list = userService.jurisdiction(userLogin);
        return list;
    }

    //登录操作
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public boolean login(@RequestBody User form, HttpSession session) {
        System.out.println(form);
        User user = userService.login(form);
        session.setAttribute("UserLogin", user);
        System.out.println(user);
        System.out.println("user"+user);
        if(user==null){
            return false;
        }
        return true;
    }
    @RequestMapping(value = "/loginadd")
    public String add() {
        System.out.println("走不");
        return "forward:/login/login.jsp";
    }


    //添加操作
    @ResponseBody
    @RequestMapping(value = "/register/addUser",method = RequestMethod.POST)
    public boolean addUser(@RequestBody Map<String,Object> form, HttpSession session) {
      boolean b =  userService.addUser(form);
        return b;
    }


    //检验是否重复身份证
    @ResponseBody
    @RequestMapping(value = "/repetition",method = RequestMethod.POST)
    public boolean repetition(@RequestBody Map<String,Object> map) {
        String str = String.valueOf(map.get("str"));
        boolean b = userService.repetition(str);
        return b;
    }

    //委托人注册
    @ResponseBody
    @RequestMapping(value = "/consignor",method = RequestMethod.POST)
    public boolean consignor(@RequestBody Map<String,Object> map) {
        System.out.println(map);
        boolean b = userService.consignor(map);
        return b;
    }

    //注册资料完善
    @ResponseBody
    @RequestMapping(value = "/perfect")
    public User perfect(HttpSession session) {
        Object attribute = session.getAttribute("UserLogin");
        User user = (User) attribute;
        System.out.println(user);
        return user;
    }

    //完善资料  附件信息
    @ResponseBody
    @RequestMapping(value = "/baocun")
    public List<Map<String,Object>>  baocun(HttpSession session) {
        Object attribute = session.getAttribute("UserLogin");
        User user = (User) attribute;
        Integer id = user.getId();
        Integer userDifferentiate = user.getUserDifferentiate();
        System.out.println(user);
        List<Map<String,Object>> list = userService.baocun(id,userDifferentiate);
        System.out.println("-----------------"+list);
        return list;
    }
    @ResponseBody
    @RequestMapping(value = "/filesUpload",method = RequestMethod.POST)
    public boolean  filesUpload(@RequestParam("file") MultipartFile picture,@RequestParam("str") String str) {
        // 获取原文件名
        String fileName = picture.getOriginalFilename();
        //获取文件大小  字节
        long size = picture.getSize();

        System.out.println(str);
        System.out.println(fileName +" --  "+size);
        String[] split = fileName.split("\\.");
        System.out.println(Arrays.toString(split));

        Map<String,Object> strMap = new HashMap<>();
        strMap.put("id", str);
        strMap.put("name", split[0]);
        strMap.put("geshi", split[1]);
        strMap.put("size", size);
        strMap.put("fileName", fileName);

        boolean b = userService.filesUpload(strMap);
        return b;
    }


}







