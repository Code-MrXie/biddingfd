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
    @Override
    public IPage<PbItemObjectInfo> selectApplyInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType) {
        return pbApplyInfoMapper.selectApplyInfo(pbItemInfoPage,itemName,resourceType);
    }

    @Override
    public PbItemObjectInfo selectPaytheDeposit(Integer applyId) {
        return pbApplyInfoMapper.selectPaytheDeposit(applyId);
    }
}
