package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.dto.SmsFlashPromotionProduct;
import com.tuling.tulingmall.mapper.SmsFlashPromotionProductRelationMapper;
import com.tuling.tulingmall.model.SmsFlashPromotionProductRelation;
import com.tuling.tulingmall.service.SmsFlashPromotionProductRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 限时购商品关联管理Service实现类
 * Created on 2018/11/16.
 */
@Service
public class SmsFlashPromotionProductRelationServiceImpl implements SmsFlashPromotionProductRelationService {
    @Autowired
    private SmsFlashPromotionProductRelationMapper relationMapper;
    @Override
    public int create(List<SmsFlashPromotionProductRelation> relationList) {
        for (SmsFlashPromotionProductRelation relation : relationList) {
            relationMapper.insert(relation);
        }
        return relationList.size();
    }

    @Override
    public int update(Long id, SmsFlashPromotionProductRelation relation) {
        relation.setId(id);
        return relationMapper.updateById(relation);
    }

    @Override
    public int delete(Long id) {
        return relationMapper.deleteById(id);
    }

    @Override
    public SmsFlashPromotionProductRelation getItem(Long id) {
        return relationMapper.selectById(id);
    }

    @Override
    public List<SmsFlashPromotionProduct> list(Long flashPromotionId, Long flashPromotionSessionId, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        return relationMapper.getList(flashPromotionId,flashPromotionSessionId);
    }

    @Override
    public long getCount(Long flashPromotionId, Long flashPromotionSessionId) {
        QueryWrapper<SmsFlashPromotionProductRelation> wrapper = new QueryWrapper<>();
        wrapper.eq("flash_promotion_id",flashPromotionId);
        wrapper.eq("flash_promotion_session_id",flashPromotionSessionId);
        return relationMapper.selectCount(wrapper);
    }
}
