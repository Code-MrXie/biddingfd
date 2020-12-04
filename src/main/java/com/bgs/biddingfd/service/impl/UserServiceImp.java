package com.bgs.biddingfd.service.impl;

import com.bgs.biddingfd.mapper.UserMapper;
import com.bgs.biddingfd.pojo.User;
import com.bgs.biddingfd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImp implements UserService {


    @Autowired
    UserMapper userMapper;

    //权限设置
    @Override
    public List<Map<String, Object>> jurisdiction(Object userLogin) {
        User user = (User) userLogin;
        System.out.println("权限+++++"+user);
        List<Map<String, Object>> list = userMapper.jurisdiction(user.getRoleId());
        for(Map<String,Object> map : list){
            int i = Integer.parseInt(String.valueOf(map.get("parent_id")));
            if(i==0){ //判断父节点进入
                List<Map<String,Object>> list1 = new ArrayList<>(); //创建一个新的集合
                for (Map<String,Object> map1 : list) {		//再次遍历全查集合
                    Integer pid = Integer.parseInt(map.get("p_id").toString()); //子类if
                    Integer parentId = Integer.parseInt(map1.get("parent_id").toString());
                    if(pid==parentId){
                        list1.add(map1);
                    }
                }
                map.put("sid",list1);
            }
        }
        System.out.println(list);
        return list;
    }

    //用户登录
    @Override
    public User login(User form) {
        User map =  userMapper.login(form.getIdCard(),form.getPassword());
        System.out.println(map);
        return map;
    }

    //用户注册
    @Override
    @Transactional
    public boolean addUser(Map<String,Object> form) {
        boolean b = userMapper.addUser(form);
        Object id = form.get("id");
        System.out.println("自增返回id+++"+ id);
        boolean b1 = userMapper.addRole(id);
        if(b1 != false && b!= false){
            return true;
        }
        return false;
    }

    @Override
    public boolean repetition(String str) {
        Map<String,Object> map = userMapper.repetition(str);
        if(  map!=null){
            return true;
        }
        return false;
    }

    //委托人注册
    @Override
    @Transactional
    public boolean consignor(Map<String, Object> map) {
        boolean b = userMapper.consignor(map);
        Object id = map.get("id");
        boolean b1 = userMapper.consignor1(id);
        return b;
    }

    //完善信息 附件
    @Override
    public List<Map<String, Object>> baocun(Integer id, Integer userDifferentiate) {
        List<Map<String, Object>> list = userMapper.baocun(id,userDifferentiate);
        return list;
    }

    //上传
    @Override
    public boolean filesUpload(Map<String,Object> strMap) {
        boolean b= userMapper.filesUpload(strMap);
        return false;
    }
}
