package com.bgs.biddingfd.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.bgs.biddingfd.pojo.*;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目信息表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbItemInfoMapper extends BaseMapper<PbItemInfo> {

    List<Map<String,Object>> electronicTable();

    List<Map<String,Object>> likeElectronic(@Param("itemName") String name, @Param("itemCode") String code);

    Boolean stopBid(@Param("id") Integer id);

    Boolean setBidRule(@Param("id") Integer id,@Param("b1") Integer b1);

    boolean bidRule(PbBiddingRules setBidRule);

    List<PbObjectInfo> signInfo(@Param("id") Integer id);

    PbObjectInfo signRuleInfo(@Param("code") Integer code);

    PbBiddingRules bidRuleDetail(@Param("itemId") Integer itemId);

    Boolean subSetSignRule(PbObjectInfo signRule);
    IPage<PbItemObjectInfo> selectPbItemInfo(@Param("page") IPage<PbItemObjectInfo> page, @Param("itemName") String itemName, @Param("resourceType")  Integer resourceType);

    IPage<PbQuoteInfo> selectBiddingHall(@Param("page")IPage<PbQuoteInfo> pbItemInfoPage, @Param("itemId")Integer itemId);

    List<PbItemInfo> findPbItemInfo(PbItemInfo pbItemInfo);

    boolean deteleThis(Integer itemId);

    List<Map<String,Object>> theContractFor(Map<String,Object> map);

    Map<String,Object> transaction(Map<String,Object> map1);

    boolean filesUpload(@Param("name") String s,@Param("path")  String s1,@Param("id")  String id);

    Map<String,Object> examine(Map<String,Object> id);

    boolean tupianupdate(@Param("name")String s, @Param("upload")String upload);
}
