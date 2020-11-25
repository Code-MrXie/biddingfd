package com.bgs.biddingfd.pojo;

import java.math.BigDecimal;
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
 * 成交结果表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbResultInfo对象", description="成交结果表")
public class PbResultInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "标的id")
    private Integer objectId;

    @ApiModelProperty(value = "标的是否成交")
    private String isDeal;

    @ApiModelProperty(value = "竞得人ID")
    private Integer enterId;

    @ApiModelProperty(value = "竞得价")
    private BigDecimal bidPrice;

    @ApiModelProperty(value = "佣金")
    private BigDecimal fee;

    @ApiModelProperty(value = "竞得时间")
    private Date bidTime;

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
