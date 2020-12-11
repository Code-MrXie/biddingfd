package com.bgs.biddingfd.service;

import com.bgs.biddingfd.pojo.PbFileImgInfo;
import com.bgs.biddingfd.pojo.PbFileInfo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 文件信息表 服务类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
public interface PbFileInfoService extends IService<PbFileInfo> {

    List<String> imgInfo(Integer objectId);
}
