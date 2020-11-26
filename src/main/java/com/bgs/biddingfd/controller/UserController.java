package com.bgs.biddingfd.controller;

import com.bgs.biddingfd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {

    @Autowired
    UserService userService;

    @ResponseBody
    @RequestMapping("/jurisdiction")
    public List<Map<String,Object>> jurisdiction(HttpSession session) {
        List<Map<String,Object>> list = userService.jurisdiction();

        return list;
    }

}
