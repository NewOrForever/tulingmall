package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.mapper.SmsHomeBrandMapper;
import com.tuling.tulingmall.model.SmsHomeBrand;
import com.tuling.tulingmall.service.SmsHomeBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 首页品牌管理Service实现类
 * Created on 2018/11/6.
 */
@Service
public class SmsHomeBrandServiceImpl implements SmsHomeBrandService {
    @Autowired
    private SmsHomeBrandMapper homeBrandMapper;
    @Override
    public int create(List<SmsHomeBrand> homeBrandList) {
        for (SmsHomeBrand smsHomeBrand : homeBrandList) {
            smsHomeBrand.setRecommendStatus(1);
            smsHomeBrand.setSort(0);
            homeBrandMapper.insert(smsHomeBrand);
        }
        return homeBrandList.size();
    }

    @Override
    public int updateSort(Long id, Integer sort) {
        SmsHomeBrand homeBrand = new SmsHomeBrand();
        homeBrand.setId(id);
        homeBrand.setSort(sort);
        return homeBrandMapper.updateById(homeBrand);
    }

    @Override
    public int delete(List<Long> ids) {
        return homeBrandMapper.deleteBatchIds(ids);
    }

    @Override
    public int updateRecommendStatus(List<Long> ids, Integer recommendStatus) {
        UpdateWrapper<SmsHomeBrand> wrapper = new UpdateWrapper<>();
        wrapper.in("id",ids);
        SmsHomeBrand record = new SmsHomeBrand();
        record.setRecommendStatus(recommendStatus);
        return homeBrandMapper.update(record,wrapper);
    }

    @Override
    public List<SmsHomeBrand> list(String brandName, Integer recommendStatus, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        QueryWrapper<SmsHomeBrand> wrapper = new QueryWrapper<>();
        if(!StringUtils.isEmpty(brandName)){
            wrapper.like("brand_name","%"+brandName+"%");
        }
        if(recommendStatus!=null){
            wrapper.eq("recommend_status",recommendStatus);
        }
        wrapper.orderByDesc("sort");
        return homeBrandMapper.selectList(wrapper);
    }
}
