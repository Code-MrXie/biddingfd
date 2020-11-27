package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbItemApplyInfo;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AddPbItemApplyInfoMapper {
    //项目申请添加
    int AddPbItemApplyInfo(PbItemApplyInfo pbItemApplyInfo);

    //查看当前委托人提交的所有项目申请书
    List<PbItemApplyInfo> PbItemApplyInfoAll(Long applyPersonId);

    PbItemApplyInfo SelectPbItemApplyInfo(String itemName);

    List<PbItemApplyInfo> PbItemApplyInfoStatusToOne();
}
