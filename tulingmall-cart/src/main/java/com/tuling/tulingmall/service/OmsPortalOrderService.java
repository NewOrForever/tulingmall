package com.tuling.tulingmall.service;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.exception.BusinessException;
import com.tuling.tulingmall.domain.ConfirmOrderResult;
import com.tuling.tulingmall.domain.OmsOrderDetail;
import com.tuling.tulingmall.domain.OrderParam;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 前台订单管理Service
 * Created by macro on 2018/8/30.
 */
public interface OmsPortalOrderService {

    ConfirmOrderResult generateConfirmOrder(List<Long> itemIds, Long memberId) throws BusinessException;

}

