package com.bgs.service.impl;

import com.bgs.pojo.Permission;
import com.bgs.mapper.PermissionMapper;
import com.bgs.service.PermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 权限表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {

}
