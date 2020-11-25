package com.bgs.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author xieCode
 * @since 2020-11-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="User对象", description="用户表")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户姓名")
    private String userName;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "身份证号")
    @TableField("idCard")
    private String idCard;

    @ApiModelProperty(value = "联系方式")
    private String mobile;

    @ApiModelProperty(value = "银行卡")
    private String card;

    @ApiModelProperty(value = "银行账户")
    private String cardName;

    @ApiModelProperty(value = "真实姓名")
    private String realName;

    @ApiModelProperty(value = "企业名称")
    private String businessName;

    @ApiModelProperty(value = "企业地址")
    private String businessAddress;

    @ApiModelProperty(value = "法人姓名")
    private String corName;

    @ApiModelProperty(value = "法人身份证")
    private Integer corNum;


}
