package com.bgs.biddingfd.service;

import com.bgs.biddingfd.pojo.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    List<Map<String,Object>> jurisdiction(Object userLogin);

    User login(User form);

    boolean addUser(Map<String,Object> form);

    boolean repetition(String str);

    boolean consignor(Map<String,Object> map);

    List<Map<String,Object>> baocun(Integer id, Integer userDifferentiate);

    boolean filesUpload(Map<String,Object> strMap);
}
