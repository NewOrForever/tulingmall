package com.tuling.tulingmall.ordercurr.service.impl;

import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.ordercurr.mapper.OmsOrderReturnReasonMapper;
import com.tuling.tulingmall.ordercurr.model.OmsOrderReturnReason;
import com.tuling.tulingmall.ordercurr.model.OmsOrderReturnReasonExample;
import com.tuling.tulingmall.ordercurr.service.OmsOrderReturnReasonService;
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
//        return returnReasonMapper.updateById(returnReason);
        return returnReasonMapper.updateByPrimaryKeySelective(returnReason);
    }

    @Override
    public int delete(List<Long> ids) {
        OmsOrderReturnReasonExample example = new OmsOrderReturnReasonExample();
        example.createCriteria().andIdIn(ids);
        return returnReasonMapper.deleteByExample(example);
//        return returnReasonMapper.deleteBatchIds(ids);
    }

    @Override
    public List<OmsOrderReturnReason> list(Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
//        QueryWrapper<OmsOrderReturnReason> queryWrapper = new QueryWrapper<>();
//        queryWrapper.orderByDesc("create_time");
//        return returnReasonMapper.selectList(queryWrapper);

        OmsOrderReturnReasonExample example = new OmsOrderReturnReasonExample();
        example.setOrderByClause("create_time DESC");
        return returnReasonMapper.selectByExample(example);
    }

    @Override
    public int updateStatus(List<Long> ids, Integer status) {
        if(!status.equals(0)&&!status.equals(1)){
            return 0;
        }
        OmsOrderReturnReason record = new OmsOrderReturnReason();
        record.setStatus(status);
//        UpdateWrapper<OmsOrderReturnReason> updateWrapper = new UpdateWrapper<>();
//        updateWrapper.in("id",ids);
//        return returnReasonMapper.update(record,updateWrapper);

        OmsOrderReturnReasonExample example = new OmsOrderReturnReasonExample();
        example.createCriteria().andIdIn(ids);
        return returnReasonMapper.updateByExample(record,example);
    }

    @Override
    public OmsOrderReturnReason getItem(Long id) {
        return returnReasonMapper.selectByPrimaryKey(id);
    }
}
