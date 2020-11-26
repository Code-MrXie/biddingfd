package com.bgs.biddingfd.service;

import com.bgs.biddingfd.pojo.PbItemInfo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.bgs.biddingfd.pojo.PbObjectInfo;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目信息表 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbItemInfoService extends IService<PbItemInfo> {

    List<Map<String,Object>> electronicTable();

    List<Map<String,Object>> likeElectronic(String name, String code);

    Boolean stopBid(Integer id);

    Boolean subBidRule(Integer id, Map<String,String> map);

    List<PbObjectInfo> signInfo(Integer id);

    PbObjectInfo signRuleInfo(Integer code);

    Boolean subSetSignRule(Integer objectId, PbObjectInfo map);
}
