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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public Boolean subBidRule(Integer id, PbBiddingRules setBidRule) {
       boolean b= pbItemInfoMapper.bidRule(setBidRule);
        //返回主键自增
        System.out.println(setBidRule.getRuleId());
        Boolean aBoolean = pbItemInfoMapper.setBidRule(id, setBidRule.getRuleId());
        return aBoolean;
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
    public Boolean subSetSignRule( PbObjectInfo signRule) {

        return pbItemInfoMapper.subSetSignRule(signRule);
    }


    @Override
    public PbBiddingRules bidRuleDetail(Integer itemId) {
        return pbItemInfoMapper.bidRuleDetail(itemId);
    }
}
