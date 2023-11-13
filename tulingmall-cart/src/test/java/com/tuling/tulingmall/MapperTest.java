package com.tuling.tulingmall;

import com.tuling.tulingmall.mapper.OmsCartItemMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author roy
 * @desc
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class MapperTest {

    @Autowired
    private OmsCartItemMapper cartItemMapper;

    @Test
    public void CartItemTest(){
        System.out.println(cartItemMapper.selectByPrimaryKey(12L));
    }
}
