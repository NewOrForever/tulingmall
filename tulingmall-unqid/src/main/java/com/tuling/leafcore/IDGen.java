package com.tuling.leafcore;


import com.tuling.leafcore.common.Result;
import com.tuling.leafcore.segment.SegmentIDGenImpl;
import com.tuling.leafcore.segment.model.SegmentBuffer;

public interface IDGen {
    /**
     * 发号 {@link SegmentIDGenImpl#getIdFromSegmentBuffer(SegmentBuffer)}
     * 双 buffer 机制（{@link SegmentBuffer#currentPos}），当前号段使用了 10% 时，异步加载下一个号段（{@link SegmentBuffer#nextPos()}）
     * 当前号段使用完时，切换到下一个号段（{@link SegmentBuffer#switchPos()}）- 线程锁需要双重检查防止并发切换并提高性能
     * @param key - 业务类型
     */
    Result get(String key);

    /**
     * 初始化 - 确保 db 中的 业务类型 初始化到 cache 中
     * 每隔 1 分钟会更新一次缓存
     * @see com.tuling.leafcore.segment.SegmentIDGenImpl#updateCacheFromDb()
     */
    boolean init();
}
