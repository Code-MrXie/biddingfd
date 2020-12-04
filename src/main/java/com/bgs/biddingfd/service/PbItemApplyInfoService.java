package com.bgs.biddingfd.service;


import com.bgs.biddingfd.pojo.PbItemApplyInfo;
import com.bgs.biddingfd.pojo.User;

import java.util.List;

public interface PbItemApplyInfoService {

    //项目申请添加
    int AddPbItemApplyInfo(PbItemApplyInfo pbItemApplyInfo);

    List<PbItemApplyInfo> PbItemApplyInfoAll(Long applyPersonId);

    PbItemApplyInfo SelectPbItemApplyInfo(String itemName);

    List<PbItemApplyInfo> PbItemApplyInfoStatusToOne();

    int PbItemApplyInfotongguo(Integer seqId);

    int PbItemApplyInfoUpdaOnThree(Integer seqId);

    PbItemApplyInfo pbItemApplyInfoSelectOne(Integer id);

    int PbItemApplyInfoDel(Integer seqId);

    List<PbItemApplyInfo> PbItemApplyInfoStatusToTWO();

    List<User> userSelect();

    int PbItemApplyInfoSuccessFenPei(Integer seqId, Integer userId);
}
