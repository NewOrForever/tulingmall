//package com.tuling.tulingmall.ordercurr.service.impl;
//
//import com.tuling.tulingmall.ordercurr.domain.CartPromotionItem;
//import com.tuling.tulingmall.ordercurr.model.UmsMemberReceiveAddress;
//
//import java.math.BigDecimal;
//import java.util.ArrayList;
//import java.util.List;
//
//public class MockService {
//
//    public static List<UmsMemberReceiveAddress> getUmsMemberReceiveAddress(){
//        List<UmsMemberReceiveAddress> result = new ArrayList<>();
//        UmsMemberReceiveAddress  ua = new UmsMemberReceiveAddress();
//        ua.setId(1L);
//        ua.setMemberId(1L);
//        ua.setName("Mocker_1");
//        ua.setPhoneNumber("MockerPhoneNumber_1");
//        ua.setDefaultStatus(1);
//        ua.setPostCode("MockerPostCode_1");
//        ua.setProvince("Mocker_Province_1");
//        ua.setCity("Mocker_City_1");
//        ua.setRegion("Mocker_Region_1");
//        ua.setDetailAddress("Mocker_Detail_1");
//        result.add(ua);
//        UmsMemberReceiveAddress  ub = new UmsMemberReceiveAddress();
//        ub.setId(2L);
//        ub.setMemberId(2L);
//        ub.setName("Mocker_2");
//        ub.setPhoneNumber("MockerPhoneNumber_2");
//        ub.setDefaultStatus(2);
//        ub.setPostCode("MockerPostCode_2");
//        ub.setProvince("Mocker_Province_2");
//        ub.setCity("Mocker_City_2");
//        ub.setRegion("Mocker_Region_2");
//        ub.setDetailAddress("Mocker_Detail_2");
//        result.add(ub);
//        return result;
//    }
//
//    public static UmsMemberReceiveAddress getMemberReceiveAddress(){
//        UmsMemberReceiveAddress  ua = new UmsMemberReceiveAddress();
//        ua.setId(1L);
//        ua.setMemberId(1L);
//        ua.setName("Mocker_1");
//        ua.setPhoneNumber("MockerPhoneNumber_1");
//        ua.setDefaultStatus(1);
//        ua.setPostCode("MockerPostCode_1");
//        ua.setProvince("Mocker_Province_1");
//        ua.setCity("Mocker_City_1");
//        ua.setRegion("Mocker_Region_1");
//        ua.setDetailAddress("Mocker_Detail_1");
//        return ua;
//    }
//
//
//    public static List<CartPromotionItem> listSelectedPromotion(List<Long> itemIds, Long memberId) {
//        List<CartPromotionItem> cartPromotionItemList = new ArrayList<>();
//        CartPromotionItem a = new CartPromotionItem("mock促销_1",
//                new BigDecimal(1),100,100,100);
//        a.setPrice(new BigDecimal(100));
//        a.setQuantity(10);
//        cartPromotionItemList.add(a);
//        CartPromotionItem b = new CartPromotionItem("mock促销_2",
//                new BigDecimal(2),200,200,200);
//        b.setPrice(new BigDecimal(200));
//        b.setQuantity(20);
//        cartPromotionItemList.add(b);
//        return cartPromotionItemList;
//    }
//}
