package com.bgs.biddingfd.service;

import com.bgs.biddingfd.pojo.PbResultInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 成交结果表 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbResultInfoService extends IService<PbResultInfo> {

    List<Map<String,Object>> resultShow(Integer flow);

    Boolean subResult(Integer seqId);

    List<Map<String,Object>> resultInfo();
}
