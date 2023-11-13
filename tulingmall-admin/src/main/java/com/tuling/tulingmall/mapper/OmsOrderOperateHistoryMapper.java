package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.model.OmsOrderOperateHistory;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
@DS("order")
public interface OmsOrderOperateHistoryMapper extends BaseMapper<OmsOrderOperateHistory> {
    @Select("<script>" +
            "INSERT INTO oms_order_operate_history (order_id, operate_man, create_time, order_status, note) VALUES" +
            "        <foreach collection=\"list\" separator=\",\" item=\"item\" index=\"index\">" +
            "            (#{item.orderId}," +
            "            #{item.operateMan}," +
            "            #{item.createTime,jdbcType=TIMESTAMP}," +
            "            #{item.orderStatus}," +
            "            #{item.note})" +
            "        </foreach>" +
            "</script>")
    int insertList(@Param("list") List<OmsOrderOperateHistory> orderOperateHistoryList);
}