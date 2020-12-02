package com.bgs.biddingfd.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.PbApplyInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbObjectInfo;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 竞买人报名信息表	 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbApplyInfoService extends IService<PbApplyInfo> {


    PbItemObjectInfo selectPaytheDeposit(Integer applyId);

    int updateApplyInfoMoney(Integer money, Integer applyId);

    PbItemObjectInfo selectObjectInfo(Integer itemId);

    int updateApplyInfoMoneyStatus(Integer applyId, Integer depositBack);

    IPage<PbItemObjectInfo> selectNormalMargin(IPage<PbItemObjectInfo> pbItemInfoPage, Integer moneyStatus, String itemName, Integer isReturn);

    IPage<PbItemObjectInfo> selectAbNormalMargin(IPage<PbItemObjectInfo> pbItemInfoPage, Integer moneyStatus, String itemName, Integer moneyStatus1);

    IPage<PbItemObjectInfo> selectApplyDetailInfo(IPage<PbItemObjectInfo> pbItemInfoPage, Integer depositBack, String itemName, Integer resourceType);

    IPage<PbItemObjectInfo> caiwuselectApplyDetailInfo(IPage<PbItemObjectInfo> pbItemInfoPage, Integer isReturn, String itemName, Integer resourceType);

    int updateApplyInfoIsReturnStatus(Integer applyId, Integer isReturn);


    List<Map<String,Object>> applyTable(Integer itemId);

    IPage<PbItemObjectInfo> selectApplyInfo(IPage<PbItemObjectInfo> pbItemInfoPage, Integer moneyStatus, String itemName, Integer resourceType);
}
