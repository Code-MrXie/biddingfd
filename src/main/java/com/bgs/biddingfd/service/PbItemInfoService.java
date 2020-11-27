package com.bgs.biddingfd.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bgs.biddingfd.pojo.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目信息表 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbItemInfoService extends IService<PbItemInfo> {
    IPage<PbItemObjectInfo> selectPbItemInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType);

    IPage<PbQuoteInfo> selectBiddingHall(IPage<PbQuoteInfo> pbItemInfoPage, Integer itemId);

//    PageInfo<PbItemInfo> selectPbItemInfo(Integer pageSize, Integer currentPage, String itemName, Integer resourceType);

    List<Map<String,Object>> electronicTable();

    List<Map<String,Object>> likeElectronic(String name, String code);

    Boolean stopBid(Integer id);

    Boolean subBidRule(Integer id, Map<String,String> map);

    List<PbObjectInfo> signInfo(Integer id);

    PbObjectInfo signRuleInfo(Integer code);

    Boolean subSetSignRule(Integer objectId, PbObjectInfo map);

    PbBiddingRules bidRuleDetail(Integer itemId);



}
