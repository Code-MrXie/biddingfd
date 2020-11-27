package com.bgs.biddingfd.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.PbItemInfo;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbQuoteInfo;
import org.apache.ibatis.annotations.Param;

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

    IPage<PbQuoteInfo> selectBiddingHall(@Param("page")IPage<PbQuoteInfo> pbItemInfoPage, @Param("itemId")Integer itemId);
}
