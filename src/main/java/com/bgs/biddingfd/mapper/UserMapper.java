package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    List<Map<String,Object>> jurisdiction(Integer userLogin);

    User login(@Param("idc") String idc , @Param("ps") String ps);

    boolean addUser(Map<String,Object> form);

    boolean addRole(Object id);

    Map<String,Object> repetition(String str);

    boolean consignor(Map<String,Object> map);

    boolean consignor1(Object id);

    List<Map<String,Object>> baocun(@Param("id")Integer id,@Param("userDifferentiate") Integer userDifferentiate);

    boolean filesUpload(Map<String,Object> strMap);
}
