package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbItemInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bgs.biddingfd.pojo.PbObjectInfo;
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

    List<Map<String,Object>> likeElectronic(@Param("name") String name,@Param("code") String code);

    Boolean stopBid(@Param("id") Integer id);

    Boolean setBidRule(@Param("id") Integer id,@Param("b1") Integer b1);

    Integer bidRule(@Param("rule_model")String rule_model,@Param("free_bid_time")String free_bid_time,
                    @Param("bid_delay_time")String bid_delay_time,@Param("bid_interval_time")String bid_interval_time);

    List<PbObjectInfo> signInfo(@Param("id") Integer id);

    PbObjectInfo signRuleInfo(@Param("code") Integer code);
}
