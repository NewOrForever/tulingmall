package com.tuling.tulingmall.history.controller;

import com.tuling.tulingmall.history.service.MigrateCentreService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 查询历史订单Controller
 */
@Slf4j
@Controller
@Api(tags = "QueryOrderHistoryController",description = "查询历史订单")
@RequestMapping("/order/history")
public class QueryOrderHistoryController {

    // TODO fox 实现对历史订单的查询

}
