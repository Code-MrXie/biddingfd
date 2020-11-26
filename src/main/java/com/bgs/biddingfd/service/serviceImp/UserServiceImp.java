package com.bgs.biddingfd.service.serviceImp;

import com.bgs.biddingfd.mapper.UserMapper;
import com.bgs.biddingfd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImp implements UserService {


    @Autowired
    UserMapper userMapper;

    @Override
    public List<Map<String, Object>> jurisdiction() {
        List<Map<String, Object>> list = userMapper.jurisdiction();

        System.out.println("测试权限"+list);
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
}
