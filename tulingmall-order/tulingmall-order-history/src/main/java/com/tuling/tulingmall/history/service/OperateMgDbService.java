package com.tuling.tulingmall.history.service;

import com.tuling.tulingmall.history.domain.OmsOrderDetail;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 订单迁移mongodb数据库管理Service接口
 */
public interface OperateMgDbService {

    @Transactional(value = "mongoTransactionManager",rollbackFor = Throwable.class)
    void saveToMgDb(List<OmsOrderDetail> orders,long curMaxOrderId,String tableName);

    long getMaxOrderId(String tableName);

}
