package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbQuoteInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 竞价历史表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbQuoteInfoMapper extends BaseMapper<PbQuoteInfo> {

    Integer yanshi(@Param("objectId") Integer objectId);
}
