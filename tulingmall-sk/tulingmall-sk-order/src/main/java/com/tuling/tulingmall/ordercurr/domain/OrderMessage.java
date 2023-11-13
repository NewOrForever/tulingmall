package com.tuling.tulingmall.ordercurr.domain;

import com.tuling.tulingmall.ordercurr.model.OmsOrder;
import com.tuling.tulingmall.ordercurr.model.OmsOrderItem;
import lombok.Data;

import java.util.Date;

/**
 * @author ：图灵学院
 * @date ：Created in 2020/2/25
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Data
public class OrderMessage {

    private OmsOrder order;

    private OmsOrderItem orderItem;

    //秒杀活动记录ID
    private Long flashPromotionRelationId;

    //限购数量
    private Integer flashPromotionLimit;
    /*
     * 秒杀活动结束日期
     */
    private Date flashPromotionEndDate;
}
