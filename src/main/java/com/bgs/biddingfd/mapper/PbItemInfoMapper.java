package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbBiddingRules;
import com.bgs.biddingfd.pojo.PbItemInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bgs.biddingfd.pojo.PbObjectInfo;
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


    List<PbObjectInfo> signInfo(@Param("id") Integer id);

    PbObjectInfo signRuleInfo(@Param("code") Integer code);

    PbBiddingRules bidRuleDetail(@Param("itemId") Integer itemId);
}
