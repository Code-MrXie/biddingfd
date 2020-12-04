package com.bgs.biddingfd.service.impl;

import com.bgs.biddingfd.pojo.PbResultInfo;
import com.bgs.biddingfd.mapper.PbResultInfoMapper;
import com.bgs.biddingfd.service.PbResultInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 成交结果表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PbResultInfoServiceImpl extends ServiceImpl<PbResultInfoMapper, PbResultInfo> implements PbResultInfoService {

    @Autowired
    PbResultInfoMapper pbResultInfoMapper;

    @Override
    public List<Map<String, Object>> resultShow(Integer flow) {
        return pbResultInfoMapper.resultShow(flow);
    }

    @Override
    public Boolean subResult(Integer seqId) {
        return pbResultInfoMapper.subResult(seqId);
    }

    @Override
    public List<Map<String, Object>> resultInfo() {
        return pbResultInfoMapper.resultInfo();
    }
}
