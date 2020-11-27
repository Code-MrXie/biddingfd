package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbItemApplyInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 项目交易申请表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Repository
public interface PbItemApplyInfoMapper extends BaseMapper<PbItemApplyInfo> {

    List<PbItemApplyInfo> findPbItemApplyInfo();
}
