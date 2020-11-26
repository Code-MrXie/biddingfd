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
 * 竞价历史表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbQuoteInfo对象", description="竞价历史表")
public class PbQuoteInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "标的id")
    private Integer objectId;

    @ApiModelProperty(value = "报价")
    private BigDecimal quotePrice;

    @ApiModelProperty(value = "报名表ID")
    private Integer applyId;

    @ApiModelProperty(value = "报价时间")
    private Date quoteTime;

    @ApiModelProperty(value = "优先权")
    private Integer isPriority;

    @ApiModelProperty(value = "是否删除")
    private String isDel;


}
