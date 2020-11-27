package com.bgs.biddingfd.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.*;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.lettuce.core.dynamic.annotation.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目信息表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbItemInfoMapper extends BaseMapper<PbItemInfo> {

    List<Map<String,Object>> electronicTable();

    List<Map<String,Object>> likeElectronic(@Param("name") String name, @Param("code") String code);

    Boolean stopBid(@Param("id") Integer id);

    Boolean setBidRule(@Param("id") Integer id,@Param("b1") Integer b1);

    boolean bidRule(PbBiddingRules setBidRule);

    List<PbObjectInfo> signInfo(@Param("id") Integer id);

    PbObjectInfo signRuleInfo(@Param("code") Integer code);

    PbBiddingRules bidRuleDetail(@Param("itemId") Integer itemId);

    Boolean subSetSignRule(PbObjectInfo signRule);
    IPage<PbItemObjectInfo> selectPbItemInfo(@org.apache.ibatis.annotations.Param("page") IPage<PbItemObjectInfo> page, @org.apache.ibatis.annotations.Param("itemName") String itemName, @org.apache.ibatis.annotations.Param("resourceType")  Integer resourceType);

    IPage<PbQuoteInfo> selectBiddingHall(@org.apache.ibatis.annotations.Param("page")IPage<PbQuoteInfo> pbItemInfoPage, @org.apache.ibatis.annotations.Param("itemId")Integer itemId);

}
