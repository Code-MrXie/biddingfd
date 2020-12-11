package com.bgs.biddingfd.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.PbApplyInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bgs.biddingfd.pojo.PbItemObjectInfo;
import com.bgs.biddingfd.pojo.PbObjectInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 竞买人报名信息表	 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Repository
public interface PbApplyInfoMapper extends BaseMapper<PbApplyInfo> {

    IPage<PbItemObjectInfo> selectApplyInfo(@Param("page") IPage<PbItemObjectInfo> pbItemInfoPage,@Param("moneyStatus")Integer moneyStatus, @Param("itemName")String itemName,@Param("resourceType") Integer resourceType);

    PbItemObjectInfo selectPaytheDeposit(Integer applyId);

    int updateApplyInfoMoney(@Param("money")Integer money,@Param("applyId") Integer applyId);

    PbItemObjectInfo selectObjectInfo(Integer itemId);

    int updateApplyInfoMoneyStatus(Integer applyId, Integer depositBack);

    IPage<PbItemObjectInfo> selectApplyInfo23(@Param("page") IPage<PbItemObjectInfo> pbItemInfoPage,@Param("moneyStatus")Integer moneyStatus, @Param("itemName")String itemName,@Param("resourceType") Integer resourceType);

    IPage<PbItemObjectInfo> selectNormalMargin(@Param("page")IPage<PbItemObjectInfo> pbItemInfoPage, @Param("moneyStatus")Integer moneyStatus,@Param("itemName") String itemName, @Param("isReturn")Integer isReturn);

    IPage<PbItemObjectInfo> selectAbNormalMargin(@Param("page")IPage<PbItemObjectInfo> pbItemInfoPage, @Param("moneyStatus")Integer moneyStatus,@Param("itemName") String itemName, @Param("moneyStatus1")Integer moneyStatus1);

    IPage<PbItemObjectInfo> selectApplyDetailInfo(@Param("page")IPage<PbItemObjectInfo> pbItemInfoPage, @Param("depositBack")Integer depositBack, @Param("itemName")String itemName, @Param("resourceType")Integer resourceType);

    IPage<PbItemObjectInfo> caiwuselectApplyDetailInfo(@Param("page")IPage<PbItemObjectInfo> pbItemInfoPage, @Param("isReturn")Integer isReturn, @Param("itemName")String itemName, @Param("resourceType")Integer resourceType);

    int updateApplyInfoIsReturnStatus(Integer applyId, Integer isReturn);

    List<Map<String, Object>> applyTable(Integer itemId);

    IPage<PbItemObjectInfo> selectApplyInfo(IPage<PbItemObjectInfo> pbItemInfoPage, String itemName, Integer resourceType);
}
