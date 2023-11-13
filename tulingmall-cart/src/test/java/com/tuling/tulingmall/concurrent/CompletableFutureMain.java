package com.tuling.tulingmall.concurrent;

import java.util.Random;
import java.util.concurrent.CompletableFuture;

public class CompletableFutureMain {
    public static void main(String[] args) throws Exception {
        // 第一个任务:商品id
        CompletableFuture<String> cfQuery = CompletableFuture.supplyAsync(() -> {
            return query("iphone12");
        });
        // query成功后继续执行下一个任务:
        CompletableFuture<String> cfFetch = cfQuery.thenApplyAsync((code) -> {
            return comment(code);
        });
        //comment成功后打印结果:
        cfFetch.thenAccept((result) -> {
            System.out.println( result);
        });
        // 主线程不要立刻结束，否则CompletableFuture默认使用的线程池会立刻关闭:
        Thread.sleep(2000);
    }

    static String query(String name) {
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
        }
        int random = new Random().nextInt(10);
        return random<=5?"20210709":"0000";
    }

    static String comment(String code) {
        if (code.equals("0000")){
            return "没有任何评论";
        }
       return "苹果手机没有华为好";

    }
}
