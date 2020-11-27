package com.bgs.biddingfd.pojo;

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
 * 竞价规则表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PbBiddingRules对象", description="竞价规则表")
public class PbBiddingRules implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "rule_id", type = IdType.ID_WORKER)
    private Integer ruleId;

    @ApiModelProperty(value = "竞价模式")
    private String ruleModel;

    @ApiModelProperty(value = "自由竞价时间")
    private String freeBidTime;

    @ApiModelProperty(value = "延时竞价时长（秒）")
    private String bidDelayTime;

    @ApiModelProperty(value = "竞价标的间隔时间")
    private String bidIntervalTime;


}
