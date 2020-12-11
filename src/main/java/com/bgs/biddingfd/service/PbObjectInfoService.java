package com.bgs.biddingfd.service;

import com.bgs.biddingfd.pojo.PbObjectInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 标的信息表 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbObjectInfoService extends IService<PbObjectInfo> {

    PbObjectInfo ShowObject(Integer objectId);

    List<PbObjectInfo> showAllPbObjectInfo();
}
