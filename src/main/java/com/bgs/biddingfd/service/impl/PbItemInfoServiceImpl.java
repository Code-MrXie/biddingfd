package com.bgs.biddingfd.service.impl;

import com.bgs.biddingfd.pojo.PbBiddingRules;
import com.bgs.biddingfd.pojo.PbItemInfo;
import com.bgs.biddingfd.mapper.PbItemInfoMapper;
import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.bgs.biddingfd.service.PbItemInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目信息表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PbItemInfoServiceImpl extends ServiceImpl<PbItemInfoMapper, PbItemInfo> implements PbItemInfoService {

    @Resource
    PbItemInfoMapper pbItemInfoMapper;


    @Override
    public List<Map<String, Object>> electronicTable() {
        return pbItemInfoMapper.electronicTable();
    }


    @Override
    public List<Map<String, Object>> likeElectronic(String name, String code) {
        return pbItemInfoMapper.likeElectronic(name,code);
    }

    @Override
    public Boolean stopBid(Integer id) {
        return pbItemInfoMapper.stopBid(id);
    }

    @Override
    public Boolean subBidRule(Integer id, Map<String, String> map) {
//        String rule_model  = map.get("rule_model");
//        String free_bid_time  = map.get("free_bid_time");
//        String bid_delay_time = map.get("bid_delay_time");
//        String bid_interval_time = map.get("bid_interval_time");
//        Integer b1 = pbItemInfoMapper.bidRule(rule_model,free_bid_time,bid_delay_time,bid_interval_time);
//        System.out.println(b1);
//        Boolean b = pbItemInfoMapper.setBidRule(id,b1);
        return false;
    }

    @Override
    public List<PbObjectInfo> signInfo(Integer id) {
        return pbItemInfoMapper.signInfo(id);
    }

    @Override
    public PbObjectInfo signRuleInfo(Integer code) {
        return pbItemInfoMapper.signRuleInfo(code);
    }

    @Override
    public Boolean subSetSignRule(Integer objectId, PbObjectInfo map) {

        System.out.println(map);
        return null;
    }

    @Override
    public PbBiddingRules bidRuleDetail(Integer itemId) {
        return pbItemInfoMapper.bidRuleDetail(itemId);
    }
}
