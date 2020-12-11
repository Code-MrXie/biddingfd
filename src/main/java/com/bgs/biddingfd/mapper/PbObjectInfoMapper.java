package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 标的信息表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbObjectInfoMapper extends BaseMapper<PbObjectInfo> {

    PbObjectInfo ShowObject(Integer objectId);

    List<PbObjectInfo> showAllPbObjectInfo();
}
