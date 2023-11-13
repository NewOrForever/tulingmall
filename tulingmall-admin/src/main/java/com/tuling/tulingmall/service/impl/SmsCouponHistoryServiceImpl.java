package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.mapper.SmsCouponHistoryMapper;
import com.tuling.tulingmall.model.SmsCouponHistory;
import com.tuling.tulingmall.service.SmsCouponHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 优惠券领取记录管理Service实现类
 * Created on 2018/11/6.
 */
@Service
public class SmsCouponHistoryServiceImpl implements SmsCouponHistoryService {
    @Autowired
    private SmsCouponHistoryMapper historyMapper;
    @Override
    public List<SmsCouponHistory> list(Long couponId, Integer useStatus, String orderSn, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);

        QueryWrapper<SmsCouponHistory> wrapper = new QueryWrapper<>();
        if(couponId!=null){
            wrapper.eq("coupon_id",couponId);
        }
        if(useStatus!=null){
            wrapper.eq("user_status",useStatus);
        }
        if(!StringUtils.isEmpty(orderSn)){
            wrapper.eq("order_sn",orderSn);
        }
        return historyMapper.selectList(wrapper);
    }
}
