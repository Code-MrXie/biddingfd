package com.bgs.biddingfd.mapper;

import com.bgs.biddingfd.pojo.PbFileImgInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 标的图片信息表 Mapper 接口
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbFileImgInfoMapper extends BaseMapper<PbFileImgInfo> {

    List<String> imgInfo(@Param("objectId") Integer objectId);
}
