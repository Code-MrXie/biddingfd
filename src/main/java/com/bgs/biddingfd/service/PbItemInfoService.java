package com.bgs.biddingfd.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bgs.biddingfd.pojo.PbItemInfo;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbQuoteInfo;

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
    IPage<PbItemObjectInfo> selectPbItemInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType);

    List<PbItemInfo> findPbItemInfo(PbItemInfo pbItemInfo);
    IPage<PbQuoteInfo> selectBiddingHall(IPage<PbQuoteInfo> pbItemInfoPage, Integer itemId);

//    PageInfo<PbItemInfo> selectPbItemInfo(Integer pageSize, Integer currentPage, String itemName, Integer resourceType);
}
