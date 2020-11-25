package com.bgs.biddingfd.service.impl;

import com.bgs.biddingfd.pojo.User;
import com.bgs.biddingfd.mapper.UserMapper;
import com.bgs.biddingfd.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

}
