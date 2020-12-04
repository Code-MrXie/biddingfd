package com.bgs.biddingfd.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.*;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

import java.util.List;

/**
 * <p>
 * 项目信息表 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbItemInfoService extends IService<PbItemInfo> {

    List<Map<String,Object>> likeElectronic(Map<String,String> map);

    Boolean stopBid(Integer id);

    Boolean subBidRule(Integer id, PbBiddingRules setBidRule);

    List<PbObjectInfo> signInfo(Integer id);

    PbObjectInfo signRuleInfo(Integer code);

    Boolean subSetSignRule(PbObjectInfo signRule);

    PbBiddingRules bidRuleDetail(Integer itemId);

    IPage<PbItemObjectInfo> selectPbItemInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType);

    IPage<PbQuoteInfo> selectBiddingHall(IPage<PbQuoteInfo> pbItemInfoPage, Integer itemId);

    List<PbItemInfo> findPbItemInfo(PbItemInfo pbItemInfo);

    boolean deteleThis(Integer itemId);

    Map<String,Object> ListingLinkShow();
}
