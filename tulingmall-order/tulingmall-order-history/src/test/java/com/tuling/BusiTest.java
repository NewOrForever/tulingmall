package com.tuling;

import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author ：楼兰
 * @date ：Created in 2021/4/19
 * @description:
 **/

@SpringBootTest
@RunWith(SpringRunner.class)
public class BusiTest {
//    @Autowired
//    private OmsPortalOrderService portalOrderService;
//
//    @Test
//    public void generateOrder() throws BusinessException {
//        OrderParam orderParam = new OrderParam();
//        orderParam.setMemberReceiveAddressId(5L);
//        orderParam.setPayType(1);
//        orderParam.setItemIds(Arrays.asList(55L));
//        Long memberId=8L;
//        System.out.println(portalOrderService.generateOrder(orderParam, memberId));
//    }

//    @Autowired
//    private SeataATOrderService orderService;
//
//    @Test
//    public void executeOrderService() {
//        orderService.init();
//        orderService.insert(10);
//        System.out.println("1 == "+orderService.selectAll());
//        orderService.insertFailed(20);
//        System.out.println("2 == "+orderService.selectAll());
//        orderService.cleanup();
//    }
//
//    @Autowired
//    private DataSource dataSource;
//
//    @Test
//    public void rawSeataTest() throws SQLException {
//        TransactionTypeHolder.set(TransactionType.BASE);
//        try (Connection connection = dataSource.getConnection()) {
//            connection.setAutoCommit(false);
//            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO t_order (user_id, status) VALUES (?, ?)");
//            doInsert(preparedStatement);
//            connection.commit();
//        } finally {
//            TransactionTypeHolder.clear();
//        }
//    }
//
//    private void doInsert(final PreparedStatement preparedStatement) throws SQLException {
//        for (int i = 0; i < 10; i++) {
//            preparedStatement.setObject(1, i);
//            preparedStatement.setObject(2, "init");
//            preparedStatement.executeUpdate();
//        }
//    }
}

