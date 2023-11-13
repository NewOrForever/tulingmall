package com.tuling.leafcore;


import com.tuling.leafcore.common.Result;

public interface IDGen {
    Result get(String key);
    boolean init();
}
