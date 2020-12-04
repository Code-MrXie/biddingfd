package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbResultInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 成交结果表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbResultInfoMapper extends BaseMapper<PbResultInfo> {

    List<Map<String,Object>> resultShow(@Param("flow") Integer flow);

    Boolean subResult(@Param("seqId") Integer seqId);

    List<Map<String,Object>> resultInfo();
}
