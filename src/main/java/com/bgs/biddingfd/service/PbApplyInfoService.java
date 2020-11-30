package com.bgs.biddingfd.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.PbApplyInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbObjectInfo;

/**
 * <p>
 * 竞买人报名信息表	 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbApplyInfoService extends IService<PbApplyInfo> {

    IPage<PbItemObjectInfo> selectApplyInfo(IPage<PbItemObjectInfo> pbItemInfoPage, Integer moneyStatus,String itemName, Integer resourceType);

    PbItemObjectInfo selectPaytheDeposit(Integer applyId);

    int updateApplyInfoMoney(Integer money, Integer applyId);

    PbItemObjectInfo selectObjectInfo(Integer itemId);

    int updateApplyInfoMoneyStatus(Integer applyId, Integer moneyStatus);
}
