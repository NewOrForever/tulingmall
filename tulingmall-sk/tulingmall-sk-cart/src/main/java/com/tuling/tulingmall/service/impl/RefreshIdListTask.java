package com.tuling.tulingmall.service.impl;

import com.tuling.tulingmall.feignapi.unqid.UnqidFeignApi;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;

import static com.tuling.tulingmall.service.impl.SecKillConfirmOrderServiceImpl.FETCH_PERIOD;
import static com.tuling.tulingmall.service.impl.SecKillConfirmOrderServiceImpl.ORDER_COUNT_LIMIT_SECOND;

@Slf4j
public class RefreshIdListTask implements Runnable{

    public static final String LEAF_ORDER_ID_KEY = "order_id";
    public static final String LEAF_ORDER_ITEM_ID_KEY = "order_item_id";

    private ConcurrentLinkedQueue<String> orderIdList;
    private ConcurrentLinkedQueue<String> orderItemIdList;
    private UnqidFeignApi unqidFeignApi;

    public RefreshIdListTask(ConcurrentLinkedQueue<String> orderIdList,
                             UnqidFeignApi unqidFeignApi,
                             ConcurrentLinkedQueue<String> orderItemIdList) {
        this.orderIdList = orderIdList;
        this.unqidFeignApi = unqidFeignApi;
        this.orderItemIdList = orderItemIdList;
    }

    @Override
    public void run() {
        if (!orderIdList.isEmpty()) return;
        try {
            int getCount = ORDER_COUNT_LIMIT_SECOND / (1000 / FETCH_PERIOD);
            List<String> segmentIdList = unqidFeignApi.getSegmentIdList(LEAF_ORDER_ID_KEY, getCount);
            orderIdList.addAll(segmentIdList);
            log.info("成功刷新订单id列表，个数{}",segmentIdList.size());
            List<String> segmentItemIdList = unqidFeignApi.getSegmentIdList(LEAF_ORDER_ITEM_ID_KEY, ORDER_COUNT_LIMIT_SECOND);
            orderItemIdList.addAll(segmentItemIdList);
            log.info("成功刷新订单详情id列表，个数{}",segmentIdList.size());
        } catch (Exception e) {
            log.error("获取订单id列表异常：",e);
        }
    }
}
