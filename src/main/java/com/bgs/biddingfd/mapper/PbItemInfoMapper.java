package com.bgs.biddingfd.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 项目信息表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbItemInfoMapper extends BaseMapper<PbItemInfo> {

    IPage<PbItemObjectInfo> selectPbItemInfo(@Param("page") IPage<PbItemObjectInfo> page, @Param("itemName") String itemName, @Param("resourceType")  Integer resourceType);

    Boolean stopBid(@Param("id") Integer id);


    List<PbObjectInfo> signInfo(@Param("id") Integer id);

    PbObjectInfo signRuleInfo(@Param("code") Integer code);

    PbBiddingRules bidRuleDetail(@Param("itemId") Integer itemId);


}
