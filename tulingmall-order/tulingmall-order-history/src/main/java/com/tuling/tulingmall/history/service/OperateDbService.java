package com.tuling.tulingmall.history.service;


import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.history.domain.OmsOrderDetail;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 订单迁移MySQL数据库管理Service接口
 */
public interface OperateDbService {

    List<OmsOrderDetail> getOrders(long maxOrderId, int tableCount, Date endDate, int fetchRecordNumbers);

    @Transactional(value = "dbTransactionManager",rollbackFor = Throwable.class)
    void deleteOrders(int tableCount,long minOrderId,long maxOrderId);
}
