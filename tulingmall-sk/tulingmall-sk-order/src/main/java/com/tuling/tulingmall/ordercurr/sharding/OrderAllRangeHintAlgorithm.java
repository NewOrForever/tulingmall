package com.tuling.tulingmall.ordercurr.sharding;


import org.apache.shardingsphere.api.sharding.hint.HintShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.hint.HintShardingValue;

import java.util.Collection;

/**
 * @author ：楼兰
 * @date ：Created in 2021/4/15
 * @description: 分库分表后的兜底路由策略，全库表路由。
 **/

public class OrderAllRangeHintAlgorithm implements HintShardingAlgorithm {
    @Override
    public Collection<String> doSharding(Collection availableTargetNames, HintShardingValue shardingValue) {
        return availableTargetNames;
    }
}
