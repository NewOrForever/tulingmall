package com.tuling.tulingmall.service.impl;


import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.domain.PmsProductParam;
import com.tuling.tulingmall.mapper.PmsSkuStockMapper;
import com.tuling.tulingmall.mapper.SmsFlashPromotionProductRelationMapper;
import com.tuling.tulingmall.model.PmsSkuStock;
import com.tuling.tulingmall.dao.FlashPromotionProductDao;
import com.tuling.tulingmall.domain.CartPromotionItem;
import com.tuling.tulingmall.model.SmsFlashPromotionProductRelation;
import com.tuling.tulingmall.rediscomm.util.RedisOpsExtUtil;
import com.tuling.tulingmall.service.PmsProductService;
import com.tuling.tulingmall.service.StockManageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.Date;
import java.util.List;


/**
 *
 * @author ：图灵学院
 * @date ：Created in 2020/2/25
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Service
@Slf4j
public class StockManageServiceImpl implements StockManageService {

    @Autowired
    private PmsSkuStockMapper skuStockMapper;

    @Autowired
    private SmsFlashPromotionProductRelationMapper flashPromotionProductRelationMapper;

    @Autowired
    private FlashPromotionProductDao flashPromotionProductDao;

    @Autowired
    private PmsProductService productService;

    @Autowired
    private RedisOpsExtUtil redisOpsUtil;

    @Override
    public Integer incrStock(Long productId, Long skuId, Integer quanlity, Integer miaosha, Long flashPromotionRelationId) {
        return null;
    }

    @Override
    public Integer descStock(Long productId, Long skuId, Integer quanlity, Integer miaosha, Long flashPromotionRelationId) {
        return null;
    }

    /**
     * 获取产品库存
     * @param productId
     * @param flashPromotionRelationId
     * @return
     */
    @Override
    public CommonResult<Integer> selectStock(Long productId, Long flashPromotionRelationId) {

        SmsFlashPromotionProductRelation miaoshaStock = flashPromotionProductRelationMapper.selectByPrimaryKey(flashPromotionRelationId);
        if(ObjectUtils.isEmpty(miaoshaStock)){
            return CommonResult.failed("不存在该秒杀商品！");
        }

        return CommonResult.success(miaoshaStock.getFlashPromotionCount());
    }

    @Override
    public CommonResult lockStock(List<CartPromotionItem> cartPromotionItemList) {
        try {

            for (CartPromotionItem cartPromotionItem : cartPromotionItemList) {
                PmsSkuStock skuStock = skuStockMapper.selectByPrimaryKey(cartPromotionItem.getProductSkuId());
                // TODO 待优化，用写 sql 的方式来来防止 ABA 问题
                // update set a=a+1 where id=?
                // 如果直接先计算好数据然后直接更新 -> 高并发时会有数据不一致问题，数据会被覆盖掉
                // A 线程 和 B 线程进来查询锁定的库存都是10，各自加1，A 先提交 -> 数据库中变成11 -> B再提交，库存锁定还是 11，但是实际应该变成12
                skuStock.setLockStock(skuStock.getLockStock() + cartPromotionItem.getQuantity());
                skuStockMapper.updateByPrimaryKeySelective(skuStock);
            }
            return CommonResult.success(true);
        }catch (Exception e) {
            log.error("锁定库存失败...");
            return CommonResult.failed();
        }
    }

    //验证秒杀时间
    private boolean volidateMiaoShaTime(PmsProductParam product) {
        //当前时间
        Date now = new Date();
        //todo 查看是否有秒杀商品,秒杀商品库存
        if(product.getFlashPromotionStatus() != 1
                || product.getFlashPromotionEndDate() == null
                || product.getFlashPromotionStartDate() == null
                || now.after(product.getFlashPromotionEndDate())
                || now.before(product.getFlashPromotionStartDate())){
            return false;
        }
        return true;
    }

}
