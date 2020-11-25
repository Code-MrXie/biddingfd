package com.bgs.pojo;

import java.math.BigDecimal;
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
 * 竞买人保证金详细表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbApplyDetailInfo对象", description="竞买人保证金详细表")
public class PbApplyDetailInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "seq_id", type = IdType.AUTO)
    private Integer seqId;

    @ApiModelProperty(value = "报名表ID")
    private Integer applyId;

    @ApiModelProperty(value = "标的表ID")
    private Integer objectId;

    @ApiModelProperty(value = "保证金金额")
    private BigDecimal money;

    @ApiModelProperty(value = "保证金缴纳时间")
    private Date depositTime;

    @ApiModelProperty(value = "缴纳保证金账号")
    private String depositFrom;

    @ApiModelProperty(value = "是否已退保证金")
    private Integer depositBack;

    @ApiModelProperty(value = "中标人")
    private String isBidder;

    @ApiModelProperty(value = "保证金是否已退")
    private String isReturn;

    @ApiModelProperty(value = "创建用户GUID")
    private Integer createUserId;

    @ApiModelProperty(value = "更新用户GUID")
    private Integer updateUserId;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;


}
