package com.bgs.biddingfd.service;


import com.bgs.biddingfd.pojo.PbItemApplyInfo;

import java.util.List;

public interface PbItemApplyInfoService {

    //项目申请添加
    int AddPbItemApplyInfo(PbItemApplyInfo pbItemApplyInfo);

    List<PbItemApplyInfo> PbItemApplyInfoAll(Long applyPersonId);

    PbItemApplyInfo SelectPbItemApplyInfo(String itemName);

    List<PbItemApplyInfo> PbItemApplyInfoStatusToOne();
}
