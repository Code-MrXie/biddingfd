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
 * 补充公告信息表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbSupplyInfo对象", description="补充公告信息表")
public class PbSupplyInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "项目ID")
    private Integer itemId;

    @ApiModelProperty(value = "标的ID")
    private Integer objectId;

    @ApiModelProperty(value = "自由竞价时长（秒）")
    private Integer bidFreeLen;

    @ApiModelProperty(value = "延时竞价时长（秒）")
    private Integer bidDelayLen;

    @ApiModelProperty(value = "标的竞价开始时间")
    private Date bidStartTime;

    @ApiModelProperty(value = "标的竞价结束时间")
    private Date bidEndTime;

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
