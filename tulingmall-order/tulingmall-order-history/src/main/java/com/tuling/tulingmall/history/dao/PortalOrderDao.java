package com.tuling.tulingmall.history.dao;

import com.tuling.tulingmall.history.domain.OmsOrderDetail;
import com.tuling.tulingmall.history.model.OmsOrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 订单迁移自定义Dao
 */
@Mapper
public interface PortalOrderDao {

    List<OmsOrderDetail> getRangeOrders(
            @Param("orderTableName") String orderTableName,
            @Param("orderItemTableName") String orderItemTableName,
            @Param("orderId") Long maxOrderId,
            @Param("gmtCreate") Date gmtCreate,
            @Param("fetchRecordNumbers") int fetchRecordNumbers);

    int deleteMigrateOrdersItems(@Param("orderItemTableName") String orderItemTableName,
                                 @Param("minOrderId") Long minOrderId,
                                 @Param("maxOrderId") Long maxOrderId);

    int deleteMigrateOrders(@Param("orderTableName") String orderTableName,
                            @Param("minOrderId") Long minOrderId,
                            @Param("maxOrderId") Long maxOrderId);

}
