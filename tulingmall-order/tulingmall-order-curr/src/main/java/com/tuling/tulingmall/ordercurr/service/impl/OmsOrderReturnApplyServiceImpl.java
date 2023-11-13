package com.tuling.tulingmall.ordercurr.service.impl;

import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.ordercurr.dto.OmsOrderReturnApplyResult;
import com.tuling.tulingmall.ordercurr.dto.OmsReturnApplyQueryParam;
import com.tuling.tulingmall.ordercurr.dto.OmsUpdateStatusParam;
import com.tuling.tulingmall.ordercurr.mapper.OmsOrderReturnApplyMapper;
import com.tuling.tulingmall.ordercurr.model.OmsOrderReturnApply;
import com.tuling.tulingmall.ordercurr.model.OmsOrderReturnApplyExample;
import com.tuling.tulingmall.ordercurr.service.OmsOrderReturnApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 订单退货管理Service
 * Created on 2018/10/18.
 */
@Service
public class OmsOrderReturnApplyServiceImpl implements OmsOrderReturnApplyService {
    @Autowired
    private OmsOrderReturnApplyMapper returnApplyMapper;
    @Override
    public List<OmsOrderReturnApply> list(OmsReturnApplyQueryParam queryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        return returnApplyMapper.getList(queryParam);
    }

    @Override
    public int delete(List<Long> ids) {
        OmsOrderReturnApplyExample example = new OmsOrderReturnApplyExample();
        example.createCriteria().andStatusEqualTo(3).andIdIn(ids);
        return returnApplyMapper.deleteByExample(example);
//        UpdateWrapper<OmsOrderReturnApply> updateWrapper = new UpdateWrapper<>();
//        updateWrapper.eq("status",3).and(wrapper->wrapper.in("id",ids));
//        return returnApplyMapper.delete(updateWrapper);
    }

    @Override
    public int updateStatus(Long id, OmsUpdateStatusParam statusParam) {
        Integer status = statusParam.getStatus();
        OmsOrderReturnApply returnApply = new OmsOrderReturnApply();
        if(status.equals(1)){
            //确认退货
            returnApply.setId(id);
            returnApply.setStatus(1);
            returnApply.setReturnAmount(statusParam.getReturnAmount());
            returnApply.setCompanyAddressId(statusParam.getCompanyAddressId());
            returnApply.setHandleTime(new Date());
            returnApply.setHandleMan(statusParam.getHandleMan());
            returnApply.setHandleNote(statusParam.getHandleNote());
        }else if(status.equals(2)){
            //完成退货
            returnApply.setId(id);
            returnApply.setStatus(2);
            returnApply.setReceiveTime(new Date());
            returnApply.setReceiveMan(statusParam.getReceiveMan());
            returnApply.setReceiveNote(statusParam.getReceiveNote());
        }else if(status.equals(3)){
            //拒绝退货
            returnApply.setId(id);
            returnApply.setStatus(3);
            returnApply.setHandleTime(new Date());
            returnApply.setHandleMan(statusParam.getHandleMan());
            returnApply.setHandleNote(statusParam.getHandleNote());
        }else{
            return 0;
        }
//        return returnApplyMapper.updateById(returnApply);
        return returnApplyMapper.updateByPrimaryKey(returnApply);
    }

    @Override
    public OmsOrderReturnApplyResult getItem(Long id) {
        return returnApplyMapper.getDetail(id);
    }
}
