package com.bgs.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 标的图片信息表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbFileImgInfo对象", description="标的图片信息表")
public class PbFileImgInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "标的id")
    private Integer objectId;

    @ApiModelProperty(value = "图片md5")
    private String fileMd5;

    @ApiModelProperty(value = "文件名称")
    private String fileName;

    @ApiModelProperty(value = "文件大小")
    private Double fileSize;

    @ApiModelProperty(value = "文件格式")
    private String fileExt;

    @ApiModelProperty(value = "流程ID")
    private Integer flowId;

    @ApiModelProperty(value = "运行ID")
    private Integer runId;

    @ApiModelProperty(value = "创建用户GUID")
    private Integer createUserId;

    @ApiModelProperty(value = "更新用户GUID")
    private Integer updateUserId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "是否删除")
    private String isDel;


}
