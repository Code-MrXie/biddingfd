package com.bgs.biddingfd.service.impl;

import com.bgs.biddingfd.mapper.PbFileImgInfoMapper;
import com.bgs.biddingfd.pojo.PbFileImgInfo;
import com.bgs.biddingfd.pojo.PbFileInfo;
import com.bgs.biddingfd.mapper.PbFileInfoMapper;
import com.bgs.biddingfd.service.PbFileInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 文件信息表 服务实现类
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Service
public class PbFileInfoServiceImpl extends ServiceImpl<PbFileInfoMapper, PbFileInfo> implements PbFileInfoService {

    @Autowired
    PbFileImgInfoMapper pbFileImgInfoMapper;

    @Override
    public List<String> imgInfo(Integer objectId) {
        return pbFileImgInfoMapper.imgInfo(objectId);
    }
}
