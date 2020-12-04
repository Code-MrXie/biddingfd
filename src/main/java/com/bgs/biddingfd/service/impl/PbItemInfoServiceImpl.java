package com.bgs.biddingfd.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.*;
import com.bgs.biddingfd.mapper.PbItemInfoMapper;
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
    public List<Map<String, Object>> likeElectronic(Map<String,String> map) {
        return pbItemInfoMapper.likeElectronic(map);
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

    @Override
    public IPage<PbItemObjectInfo> selectPbItemInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType) {
        return pbItemInfoMapper.selectPbItemInfo(pbItemInfoPage,itemName,resourceType);
    }

    @Override
    public IPage<PbQuoteInfo> selectBiddingHall(IPage<PbQuoteInfo> pbItemInfoPage, Integer itemId) {
        return pbItemInfoMapper.selectBiddingHall(pbItemInfoPage,itemId);
    }

    @Override
    public List<PbItemInfo> findPbItemInfo(PbItemInfo pbItemInfo) {
        return pbItemInfoMapper.findPbItemInfo(pbItemInfo);
    }

    @Override
    public boolean deteleThis(Integer itemId) {
        return pbItemInfoMapper.deteleThis(itemId);
    }

    @Override
    public Map<String, Object> ListingLinkShow() {
        return pbItemInfoMapper.ListingLinkShow();
    }
}
