package com.bgs.biddingfd.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.PbApplyInfo;
import com.bgs.biddingfd.mapper.PbApplyInfoMapper;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.bgs.biddingfd.service.PbApplyInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 竞买人报名信息表	 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PbApplyInfoServiceImpl extends ServiceImpl<PbApplyInfoMapper, PbApplyInfo> implements PbApplyInfoService {
    @Autowired
    private PbApplyInfoMapper pbApplyInfoMapper;

//    @Override
//    public IPage<PbItemObjectInfo> selectApplyInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType) {
//        return  pbApplyInfoMapper.selectApplyInfo(pbItemInfoPage,itemName,resourceType);
//    }
    @Override
    public IPage<PbItemObjectInfo> selectApplyInfo(IPage<PbItemObjectInfo> pbItemInfoPage, Integer moneyStatus, String itemName, Integer resourceType) {
        return  pbApplyInfoMapper.selectApplyInfo(pbItemInfoPage,moneyStatus,itemName,resourceType);
    }

    @Override
    public PbItemObjectInfo selectPaytheDeposit(Integer applyId) {
        return pbApplyInfoMapper.selectPaytheDeposit(applyId);
    }

    @Override
    public int updateApplyInfoMoney(Integer money, Integer applyId) {
        return pbApplyInfoMapper.updateApplyInfoMoney(money,applyId);
    }

    @Override
    public PbItemObjectInfo selectObjectInfo(Integer itemId) {
        return pbApplyInfoMapper.selectObjectInfo(itemId);
    }

    @Override
    public int updateApplyInfoMoneyStatus(Integer applyId, Integer depositBack) {
        return pbApplyInfoMapper.updateApplyInfoMoneyStatus(applyId,depositBack);
    }

    @Override
    public IPage<PbItemObjectInfo> selectNormalMargin(IPage<PbItemObjectInfo> pbItemInfoPage, Integer moneyStatus, String itemName, Integer isReturn) {
        return pbApplyInfoMapper.selectNormalMargin(pbItemInfoPage,moneyStatus,itemName,isReturn);
    }
    @Override
    public IPage<PbItemObjectInfo> selectAbNormalMargin(IPage<PbItemObjectInfo> pbItemInfoPage, Integer moneyStatus, String itemName, Integer moneyStatus1) {
        return pbApplyInfoMapper.selectAbNormalMargin(pbItemInfoPage,moneyStatus,itemName,moneyStatus1);
    }

    @Override
    public IPage<PbItemObjectInfo> selectApplyDetailInfo(IPage<PbItemObjectInfo> pbItemInfoPage, Integer depositBack, String itemName, Integer resourceType) {
        return pbApplyInfoMapper.selectApplyDetailInfo(pbItemInfoPage,depositBack,itemName,resourceType);
    }

    @Override
    public IPage<PbItemObjectInfo> caiwuselectApplyDetailInfo(IPage<PbItemObjectInfo> pbItemInfoPage, Integer isReturn, String itemName, Integer resourceType) {
        return pbApplyInfoMapper.caiwuselectApplyDetailInfo(pbItemInfoPage,isReturn,itemName,resourceType);
    }

    @Override
    public int updateApplyInfoIsReturnStatus(Integer applyId, Integer isReturn) {
        return pbApplyInfoMapper.updateApplyInfoIsReturnStatus(applyId,isReturn);
    }

    @Override
    public List<Map<String,Object>> applyTable(Integer itemId) {
        return pbApplyInfoMapper.applyTable(itemId);
    }


}
