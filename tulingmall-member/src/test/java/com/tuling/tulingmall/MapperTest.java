package com.tuling.tulingmall;

import com.tuling.tulingmall.mapper.UmsMemberMapper;
import com.tuling.tulingmall.mapper.UmsMemberReceiveAddressMapper;
import com.tuling.tulingmall.model.UmsMember;
import com.tuling.tulingmall.model.UmsMemberExample;
import com.tuling.tulingmall.model.UmsMemberReceiveAddress;
import com.tuling.tulingmall.model.UmsMemberReceiveAddressExample;
import com.tuling.tulingmall.service.UmsMemberReceiveAddressService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author roy
 * @desc
 */
@SpringBootTest
@RunWith(SpringRunner.class)
public class MapperTest {
    @Resource
    private UmsMemberMapper memberMapper;

    @Autowired
    private UmsMemberReceiveAddressMapper addressMapper;

    @Autowired
    private UmsMemberReceiveAddressService memberReceiveAddressService;

    @Test
    public void MemberTest(){
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo("roy");
        example.or(example.createCriteria().andPhoneEqualTo("123"));
        List<UmsMember> umsMembers = memberMapper.selectByExample(example);
        umsMembers.forEach(System.out::println);
    }

    @Test
    public void AddressTest(){
//        UmsMemberReceiveAddressExample example = new UmsMemberReceiveAddressExample();
//        example.createCriteria().andMemberIdEqualTo(462254L);
//        List<UmsMemberReceiveAddress> address = addressMapper.selectByExample(example);
//        address.forEach(System.out::println);

        List<UmsMemberReceiveAddress> addressList = memberReceiveAddressService.list(462254L);
        addressList.forEach(System.out::println);
    }


}
