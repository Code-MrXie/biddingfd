package com.bgs.biddingfd.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 文件信息表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbFileInfo对象", description="文件信息表")
public class PbFileInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "项目ID")
    private Integer itemId;

    @ApiModelProperty(value = "标的ID")
    private Integer objectId;

    @ApiModelProperty(value = "文件ID")
    private String md5;

    @ApiModelProperty(value = "文件名称")
    private String fileName;

    @ApiModelProperty(value = "文件大小")
    private Double fileLength;

    @ApiModelProperty(value = "文件格式")
    private String fileExt;

    @ApiModelProperty(value = "公告类型")
    private Integer fileType;

    @ApiModelProperty(value = "是否发布外网")
    private String isPub;

    @ApiModelProperty(value = "父级ID")
    private Integer parentId;

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
