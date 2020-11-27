package com.bgs.biddingfd.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.PbApplyInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;

/**
 * <p>
 * 竞买人报名信息表	 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbApplyInfoService extends IService<PbApplyInfo> {

    IPage<PbItemObjectInfo> selectApplyInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType);
}
