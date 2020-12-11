package com.bgs.biddingfd.service.impl;

import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.bgs.biddingfd.mapper.PbObjectInfoMapper;
import com.bgs.biddingfd.service.PbObjectInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 标的信息表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PbObjectInfoServiceImpl extends ServiceImpl<PbObjectInfoMapper, PbObjectInfo> implements PbObjectInfoService {
    @Resource
    private PbObjectInfoMapper pbObjectInfoMapper;

    @Override
    public PbObjectInfo ShowObject(Integer objectId) {
        return pbObjectInfoMapper.ShowObject(objectId);
    }

    @Override
    public List<PbObjectInfo> showAllPbObjectInfo() {
        List<PbObjectInfo> list=pbObjectInfoMapper.showAllPbObjectInfo();
        return list;
    }
}
