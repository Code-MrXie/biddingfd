package com.bgs.biddingfd.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.PbApplyInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbObjectInfo;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 竞买人报名信息表	 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbApplyInfoMapper extends BaseMapper<PbApplyInfo> {

    IPage<PbItemObjectInfo> selectApplyInfo(@Param("page") IPage<PbItemObjectInfo> pbItemInfoPage,@Param("moneyStatus")Integer moneyStatus, @Param("itemName")String itemName,@Param("resourceType") Integer resourceType);

    PbItemObjectInfo selectPaytheDeposit(Integer applyId);

    int updateApplyInfoMoney(@Param("money")Integer money,@Param("applyId") Integer applyId);

    PbItemObjectInfo selectObjectInfo(Integer itemId);

    int updateApplyInfoMoneyStatus(Integer applyId, Integer moneyStatus);

    IPage<PbItemObjectInfo> selectApplyInfo23(@Param("page") IPage<PbItemObjectInfo> pbItemInfoPage,@Param("moneyStatus")Integer moneyStatus, @Param("itemName")String itemName,@Param("resourceType") Integer resourceType);
}
