package com.tuling.tulingmall.ordercurr.domain;

import lombok.Data;

@Data
public class RocksDBVo {

    private String cfName;
    private String key;
    private String value;

}
