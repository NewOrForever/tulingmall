package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.mapper.OmsOrderReturnReasonMapper;
import com.tuling.tulingmall.model.OmsOrderReturnReason;
import com.tuling.tulingmall.service.OmsOrderReturnReasonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 订单原因管理Service实现类
 * Created on 2018/10/17.
 */
@Service
public class OmsOrderReturnReasonServiceImpl implements OmsOrderReturnReasonService {
    @Autowired
    private OmsOrderReturnReasonMapper returnReasonMapper;
    @Override
    public int create(OmsOrderReturnReason returnReason) {
        returnReason.setCreateTime(new Date());
        return returnReasonMapper.insert(returnReason);
    }

    @Override
    public int update(Long id, OmsOrderReturnReason returnReason) {
        returnReason.setId(id);
        return returnReasonMapper.updateById(returnReason);
    }

    @Override
    public int delete(List<Long> ids) {
        return returnReasonMapper.deleteBatchIds(ids);
    }

    @Override
    public List<OmsOrderReturnReason> list(Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        QueryWrapper<OmsOrderReturnReason> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("create_time");
        return returnReasonMapper.selectList(queryWrapper);
    }

    @Override
    public int updateStatus(List<Long> ids, Integer status) {
        if(!status.equals(0)&&!status.equals(1)){
            return 0;
        }
        OmsOrderReturnReason record = new OmsOrderReturnReason();
        record.setStatus(status);
        UpdateWrapper<OmsOrderReturnReason> updateWrapper = new UpdateWrapper<>();
        updateWrapper.in("id",ids);
        return returnReasonMapper.update(record,updateWrapper);
    }

    @Override
    public OmsOrderReturnReason getItem(Long id) {
        return returnReasonMapper.selectById(id);
    }
}
