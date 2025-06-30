/*
 Navicat Premium Data Transfer

 Source Server         : tlmall-order-master-223
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.65.223:3306
 Source Schema         : tl_mall_order

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/10/2022 19:11:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  `send_status` int(0) NULL DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(0) NULL DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司收发货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_0
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_0`;
CREATE TABLE `oms_order_0`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_0
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_1
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_1`;
CREATE TABLE `oms_order_1`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_1
-- ----------------------------
INSERT INTO `oms_order_1` VALUES (10100101, 1, NULL, '10100101', '2022-10-11 07:32:48', NULL, 6066.00, 6066.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'Fox', '15612345678', '100001', '北京', '天津', '天津', 'xxxxxxx', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_1` VALUES (10101201, 1, NULL, '10101201', '2022-10-11 08:30:55', NULL, 3788.00, 3788.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'Fox', '15612345678', '100001', '北京', '天津', '天津', 'xxxxxxx', NULL, 0, 0, NULL, '2022-10-11 09:18:37', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-10101201.png', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_10
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_10`;
CREATE TABLE `oms_order_10`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_10
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_11
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_11`;
CREATE TABLE `oms_order_11`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_11
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_12
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_12`;
CREATE TABLE `oms_order_12`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_12
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_13
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_13`;
CREATE TABLE `oms_order_13`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_13
-- ----------------------------
INSERT INTO `oms_order_13` VALUES (61015, 462245, NULL, '61015', '2022-09-20 08:27:57', NULL, 4999.00, 4999.00, 0.00, 0.00, 0.00, NULL, 500.00, 1, 0, 0, 1, NULL, NULL, NULL, 5499, 5499, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-20 16:28:30.715127', NULL, 0);
INSERT INTO `oms_order_13` VALUES (61016, 462245, NULL, '61016', '2022-09-20 08:59:54', NULL, 4999.00, 4999.00, 0.00, 0.00, 0.00, NULL, 500.00, 1, 0, 0, 1, NULL, NULL, NULL, 5499, 5499, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-20 16:59:54.674592', NULL, 0);
INSERT INTO `oms_order_13` VALUES (302145, 462245, NULL, '302145', '2022-07-23 08:10:23', NULL, 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 1, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-07-25 08:08:14', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-302145.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (500145, 462245, NULL, '500145', '2022-07-26 09:34:09', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (500245, 462245, NULL, '500245', '2022-07-26 09:36:59', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (500345, 462245, NULL, '500345', '2022-07-26 09:51:52', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (500445, 462245, NULL, '500445', '2022-07-26 09:56:26', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (500545, 462245, NULL, '500545', '2022-07-26 09:57:48', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (500645, 462245, NULL, '500645', '2022-07-26 10:08:48', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (500745, 462245, NULL, '500745', '2022-07-26 10:09:47', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-500745.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (700045, 462245, NULL, '700045', '2022-07-27 07:23:48', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-07-27 09:26:38', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-700045.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (900045, 462245, NULL, '900045', '2022-09-14 06:06:04', NULL, 5398.00, 5398.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-09-14 06:11:20', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-900045.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (900145, 462245, NULL, '900145', '2022-09-14 06:06:33', NULL, 5398.00, 5398.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-09-14 07:06:21', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-900145.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (1100045, 462245, NULL, '1100045', '2022-09-14 07:07:54', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-09-14 07:13:21', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-1100045.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (1100145, 462245, NULL, '1100145', '2022-09-14 07:11:51', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-09-14 07:17:21', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-1100145.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (9700945, 462245, NULL, '9700945', '2022-10-11 05:32:25', NULL, 5398.00, 5398.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-10-11 05:44:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (10100645, 462245, NULL, '10100645', '2022-10-11 07:48:36', NULL, 5398.00, 5398.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-10-11 07:54:24', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-10100645.png', NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (10100845, 462245, NULL, '10100845', '2022-10-11 07:50:31', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-10-11 07:58:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_13` VALUES (10100945, 462245, NULL, '10100945', '2022-10-11 07:54:03', NULL, 111.00, 111.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2022-10-11 08:04:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_14
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_14`;
CREATE TABLE `oms_order_14`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_14
-- ----------------------------
INSERT INTO `oms_order_14` VALUES (9300846, 462246, NULL, '9300846', '2022-10-11 03:17:23', NULL, 139.00, 139.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'mark', '13912345678', '100001', '河北', '河北', '北京', 'mark', NULL, 0, 0, NULL, '2022-10-11 03:23:30', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-9300846.png', NULL, NULL, NULL);
INSERT INTO `oms_order_14` VALUES (9700046, 462246, NULL, '9700046', '2022-10-11 04:01:12', NULL, 139.00, 139.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'mark', '13912345678', '100001', '河北', '河北', '北京', 'mark', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_14` VALUES (9700146, 462246, NULL, '9700146', '2022-10-11 04:10:12', NULL, 139.00, 139.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'mark', '13912345678', '100001', '河北', '河北', '北京', 'mark', NULL, 0, 0, NULL, '2022-10-11 04:21:30', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-9700146.png', NULL, NULL, NULL);
INSERT INTO `oms_order_14` VALUES (9700446, 462246, NULL, '9700446', '2022-10-11 05:15:07', NULL, 278.00, 278.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'mark', '13912345678', '100001', '河北', '河北', '北京', 'mark', NULL, 0, 0, NULL, '2022-10-11 05:25:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_15
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_15`;
CREATE TABLE `oms_order_15`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_15
-- ----------------------------
INSERT INTO `oms_order_15` VALUES (61015, 462245, NULL, '61015', '2022-09-20 08:27:57', NULL, 4999.00, 4999.00, 0.00, 0.00, 0.00, NULL, 500.00, 1, 0, 0, 1, NULL, NULL, NULL, 5499, 5499, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-20 16:28:30.717761', NULL, 0);
INSERT INTO `oms_order_15` VALUES (9701147, 462247, NULL, '9701147', '2022-10-11 05:56:22', NULL, 278.00, 278.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'xxx', '12312234233', '111111', '北京', '天津', '河北', '11', NULL, 0, 0, NULL, '2022-10-11 06:07:10', NULL, NULL, NULL, NULL, '/static/qrcode/alipay/qr-9701147.png', NULL, NULL, NULL);
INSERT INTO `oms_order_15` VALUES (9701247, 462247, NULL, '9701247', '2022-10-11 05:58:07', NULL, 417.00, 417.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'xxx', '12312234233', '111111', '北京', '天津', '河北', '11', NULL, 0, 0, NULL, '2022-10-11 06:06:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_15` VALUES (10100547, 462247, NULL, '10100547', '2022-10-11 07:48:32', NULL, 556.00, 556.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'xxx', '12312234233', '111111', '北京', '天津', '河北', '11', NULL, 0, 0, NULL, '2022-10-11 07:55:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_15` VALUES (10503447, 462247, NULL, '10503447', '2022-10-11 09:36:20', NULL, 834.00, 834.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'xxx', '12312234233', '111111', '北京', '天津', '河北', '11', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_15` VALUES (10503547, 462247, NULL, '10503547', '2022-10-11 09:37:48', NULL, 834.00, 834.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 5, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'xxx', '12312234233', '111111', '北京', '天津', '河北', '11', NULL, 0, 0, NULL, '2022-10-11 09:46:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_15` VALUES (10503647, 462247, NULL, '10503647', '2022-10-11 09:38:50', NULL, 834.00, 834.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, 'xxx', '12312234233', '111111', '北京', '天津', '河北', '11', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_15` VALUES (10504447, 462247, NULL, '10504447', '2022-10-11 09:56:34', NULL, 834.00, 834.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_15` VALUES (10504547, 462247, NULL, '10504547', '2022-10-11 09:56:49', NULL, 834.00, 834.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, 1, 0, 0, NULL, NULL, NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_16
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_16`;
CREATE TABLE `oms_order_16`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_16
-- ----------------------------
INSERT INTO `oms_order_16` VALUES (61016, 462245, NULL, '61016', '2022-09-20 08:59:54', NULL, 4999.00, 4999.00, 0.00, 0.00, 0.00, NULL, 500.00, 1, 0, 0, 1, NULL, NULL, NULL, 5499, 5499, '秒杀特惠活动', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-20 16:59:54.677871', NULL, 0);

-- ----------------------------
-- Table structure for oms_order_17
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_17`;
CREATE TABLE `oms_order_17`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_17
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_18
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_18`;
CREATE TABLE `oms_order_18`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_18
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_19
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_19`;
CREATE TABLE `oms_order_19`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_19
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_2
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_2`;
CREATE TABLE `oms_order_2`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_2
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_20
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_20`;
CREATE TABLE `oms_order_20`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_20
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_21
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_21`;
CREATE TABLE `oms_order_21`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_21
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_22
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_22`;
CREATE TABLE `oms_order_22`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_22
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_23
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_23`;
CREATE TABLE `oms_order_23`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_23
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_24
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_24`;
CREATE TABLE `oms_order_24`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_24
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_25
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_25`;
CREATE TABLE `oms_order_25`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_25
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_26
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_26`;
CREATE TABLE `oms_order_26`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_26
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_27
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_27`;
CREATE TABLE `oms_order_27`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_27
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_28
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_28`;
CREATE TABLE `oms_order_28`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_28
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_29
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_29`;
CREATE TABLE `oms_order_29`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_29
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_3
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_3`;
CREATE TABLE `oms_order_3`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_3
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_30
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_30`;
CREATE TABLE `oms_order_30`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_30
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_31
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_31`;
CREATE TABLE `oms_order_31`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_31
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_4
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_4`;
CREATE TABLE `oms_order_4`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_4
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_5
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_5`;
CREATE TABLE `oms_order_5`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_5
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_6
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_6`;
CREATE TABLE `oms_order_6`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_6
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_7
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_7`;
CREATE TABLE `oms_order_7`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_7
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_8
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_8`;
CREATE TABLE `oms_order_8`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_8
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_9
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_9`;
CREATE TABLE `oms_order_9`  (
  `id` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单id',
  `member_id` bigint(0) NOT NULL,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(0) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(0) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(0) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(0) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(0) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(0) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(0) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(0) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付二维码地址',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  `version` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`order_sn`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_9
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_0
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_0`;
CREATE TABLE `oms_order_item_0`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_0
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_1
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_1`;
CREATE TABLE `oms_order_item_1`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_1
-- ----------------------------
INSERT INTO `oms_order_item_1` VALUES (89002, 10100101, '10100101', 38, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', NULL, NULL, 2199.00, 2, 122, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2199.00, 0, 0, NULL, '2022-10-11 15:32:51.415271', NULL);
INSERT INTO `oms_order_item_1` VALUES (89003, 10100101, '10100101', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 12, 132, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 4.00, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 15:32:51.415271', NULL);
INSERT INTO `oms_order_item_1` VALUES (89023, 10101201, '10101201', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11 ', NULL, NULL, 3788.00, 1, 143, NULL, NULL, NULL, NULL, NULL, '单品促销', NULL, 0.00, 0.00, 3788.00, 0, 0, NULL, '2022-10-11 16:30:55.182528', NULL);

-- ----------------------------
-- Table structure for oms_order_item_10
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_10`;
CREATE TABLE `oms_order_item_10`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_10
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_11
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_11`;
CREATE TABLE `oms_order_item_11`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_11
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_12
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_12`;
CREATE TABLE `oms_order_item_12`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_12
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_13
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_13`;
CREATE TABLE `oms_order_item_13`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_13
-- ----------------------------
INSERT INTO `oms_order_item_13` VALUES (7000, 302145, '302145', 27, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', NULL, NULL, 2699.00, 1, 98, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, NULL, '2022-07-23 16:10:23.698912', NULL);
INSERT INTO `oms_order_item_13` VALUES (9001, 500145, '500145', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-26 17:34:30.767960', NULL);
INSERT INTO `oms_order_item_13` VALUES (9002, 500245, '500245', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-26 17:36:59.533195', NULL);
INSERT INTO `oms_order_item_13` VALUES (9003, 500345, '500345', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-26 17:51:53.530037', NULL);
INSERT INTO `oms_order_item_13` VALUES (9004, 500445, '500445', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-26 17:56:25.972931', NULL);
INSERT INTO `oms_order_item_13` VALUES (9005, 500545, '500545', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-26 17:57:48.565267', NULL);
INSERT INTO `oms_order_item_13` VALUES (9006, 500645, '500645', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-26 18:08:48.688037', NULL);
INSERT INTO `oms_order_item_13` VALUES (9007, 500745, '500745', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-26 18:09:47.089195', NULL);
INSERT INTO `oms_order_item_13` VALUES (11000, 700045, '700045', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-07-27 15:23:50.124813', NULL);
INSERT INTO `oms_order_item_13` VALUES (13000, 900045, '900045', 27, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', NULL, NULL, 2699.00, 2, 98, NULL, NULL, NULL, NULL, NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2699.00, 0, 0, NULL, '2022-09-14 14:06:04.254932', NULL);
INSERT INTO `oms_order_item_13` VALUES (13001, 900145, '900145', 27, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', NULL, NULL, 2699.00, 2, 98, NULL, NULL, NULL, NULL, NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2699.00, 0, 0, NULL, '2022-09-14 14:06:32.568144', NULL);
INSERT INTO `oms_order_item_13` VALUES (13002, 1100045, '1100045', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-09-14 15:07:54.249002', NULL);
INSERT INTO `oms_order_item_13` VALUES (13003, 1100145, '1100145', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-09-14 15:11:51.428483', NULL);
INSERT INTO `oms_order_item_13` VALUES (87008, 9700945, '9700945', 27, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', NULL, NULL, 2699.00, 2, 98, NULL, NULL, NULL, NULL, NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2699.00, 0, 0, NULL, '2022-10-11 13:32:24.851646', NULL);
INSERT INTO `oms_order_item_13` VALUES (89016, 10100645, '10100645', 27, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', NULL, NULL, 2699.00, 2, 98, NULL, NULL, NULL, NULL, NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2699.00, 0, 0, NULL, '2022-10-11 15:48:35.153905', NULL);
INSERT INTO `oms_order_item_13` VALUES (89021, 10100845, '10100845', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-10-11 15:50:30.208120', NULL);
INSERT INTO `oms_order_item_13` VALUES (89022, 10100945, '10100945', 30, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', NULL, NULL, 111.00, 1, 112, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 111.00, 0, 0, NULL, '2022-10-11 15:54:03.155921', NULL);

-- ----------------------------
-- Table structure for oms_order_item_14
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_14`;
CREATE TABLE `oms_order_item_14`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_14
-- ----------------------------
INSERT INTO `oms_order_item_14` VALUES (85008, 9300846, '9300846', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 1, 130, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 11:17:23.369953', NULL);
INSERT INTO `oms_order_item_14` VALUES (87000, 9700046, '9700046', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 1, 130, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 12:01:15.023214', NULL);
INSERT INTO `oms_order_item_14` VALUES (87001, 9700146, '9700146', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 1, 130, NULL, NULL, NULL, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 12:10:11.676686', NULL);
INSERT INTO `oms_order_item_14` VALUES (87004, 9700446, '9700446', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 2, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 25.00, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 13:15:07.117299', NULL);

-- ----------------------------
-- Table structure for oms_order_item_15
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_15`;
CREATE TABLE `oms_order_item_15`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_15
-- ----------------------------
INSERT INTO `oms_order_item_15` VALUES (63015, 61015, '61015', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 4999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 4999.00, 5499, 5499, NULL, '2022-09-20 16:28:30.759155', NULL);
INSERT INTO `oms_order_item_15` VALUES (87010, 9701147, '9701147', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 2, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 25.00, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 13:56:21.898776', NULL);
INSERT INTO `oms_order_item_15` VALUES (87011, 9701247, '9701247', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 3, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 16.50, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 13:58:07.075707', NULL);
INSERT INTO `oms_order_item_15` VALUES (89015, 10100547, '10100547', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 4, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 12.50, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 15:48:32.026974', NULL);
INSERT INTO `oms_order_item_15` VALUES (93000, 10503447, '10503447', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 6, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 8.50, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 17:36:19.776308', NULL);
INSERT INTO `oms_order_item_15` VALUES (93001, 10503547, '10503547', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 6, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 8.50, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 17:37:48.586859', NULL);
INSERT INTO `oms_order_item_15` VALUES (93002, 10503647, '10503647', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 6, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 8.50, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 17:38:49.862247', NULL);
INSERT INTO `oms_order_item_15` VALUES (93007, 10504447, '10504447', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 6, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 8.50, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 17:56:33.502396', NULL);
INSERT INTO `oms_order_item_15` VALUES (93008, 10504547, '10504547', 40, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, NULL, 139.00, 6, 130, NULL, NULL, NULL, NULL, NULL, '满减优惠：满200.00元，减50.00元', 8.50, 0.00, 0.00, 139.00, 0, 0, NULL, '2022-10-11 17:56:48.795576', NULL);

-- ----------------------------
-- Table structure for oms_order_item_16
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_16`;
CREATE TABLE `oms_order_item_16`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_16
-- ----------------------------
INSERT INTO `oms_order_item_16` VALUES (63016, 61016, '61016', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '苹果', '7437799', 4999.00, 1, NULL, NULL, 19, NULL, NULL, NULL, '秒杀特惠活动', 0.00, 0.00, 0.00, 4999.00, 5499, 5499, NULL, '2022-09-20 16:59:54.692454', NULL);

-- ----------------------------
-- Table structure for oms_order_item_17
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_17`;
CREATE TABLE `oms_order_item_17`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_17
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_18
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_18`;
CREATE TABLE `oms_order_item_18`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_18
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_19
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_19`;
CREATE TABLE `oms_order_item_19`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_19
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_2
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_2`;
CREATE TABLE `oms_order_item_2`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_2
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_20
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_20`;
CREATE TABLE `oms_order_item_20`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_20
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_21
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_21`;
CREATE TABLE `oms_order_item_21`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_21
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_22
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_22`;
CREATE TABLE `oms_order_item_22`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_22
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_23
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_23`;
CREATE TABLE `oms_order_item_23`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_23
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_24
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_24`;
CREATE TABLE `oms_order_item_24`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_24
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_25
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_25`;
CREATE TABLE `oms_order_item_25`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_25
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_26
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_26`;
CREATE TABLE `oms_order_item_26`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_26
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_27
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_27`;
CREATE TABLE `oms_order_item_27`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_27
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_28
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_28`;
CREATE TABLE `oms_order_item_28`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_28
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_29
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_29`;
CREATE TABLE `oms_order_item_29`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_29
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_3
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_3`;
CREATE TABLE `oms_order_item_3`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_3
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_30
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_30`;
CREATE TABLE `oms_order_item_30`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_30
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_31
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_31`;
CREATE TABLE `oms_order_item_31`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_31
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_4
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_4`;
CREATE TABLE `oms_order_item_4`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_4
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_5
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_5`;
CREATE TABLE `oms_order_item_5`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_5
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_6
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_6`;
CREATE TABLE `oms_order_item_6`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_6
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_7
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_7`;
CREATE TABLE `oms_order_item_7`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_7
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_8
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_8`;
CREATE TABLE `oms_order_item_8`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_8
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item_9
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item_9`;
CREATE TABLE `oms_order_item_9`  (
  `id` bigint(0) NOT NULL DEFAULT 0,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(0) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(0) NULL DEFAULT 0,
  `gift_growth` int(0) NULL DEFAULT 0,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item_9
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `order_status` int(0) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(0) NULL DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(0) NULL DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` int(0) NULL DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货备注',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单退货申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货类型',
  `sort` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(0) NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(0) NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(0) NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(0) NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(0) NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 7, 7, '2022-07-28 16:16:11.746438', NULL);

-- ----------------------------
-- Procedure structure for copy_order_table
-- ----------------------------
DROP PROCEDURE IF EXISTS `copy_order_table`;
delimiter ;;
CREATE PROCEDURE `copy_order_table`()
BEGIN
	DECLARE o_loop int DEFAULT 0;  -- 循环次数控制
	set o_loop = 0;
	while (o_loop<=31) do
	   set @ddl=CONCAT('create table oms_order','_',o_loop,' select * from oms_order where 0;');
			prepare stmt from @ddl;
			execute stmt;
	   set @ddl2=CONCAT('ALTER TABLE oms_order','_',o_loop,' ADD PRIMARY KEY (id);');
			prepare stmt from @ddl2;
			execute stmt;		
		 set @ddl2=CONCAT('ALTER TABLE oms_order','_',o_loop,' ADD UNIQUE INDEX idx_ordersn(order_sn);');
			prepare stmt from @ddl2;
			execute stmt;	
	   set @ddl3=CONCAT('ALTER TABLE oms_order','_',o_loop,' ADD INDEX idx_member_id(member_id);');
			prepare stmt from @ddl3;
			execute stmt;	
	   set @ddl4=CONCAT('create table oms_order_item','_',o_loop,' select * from oms_order_item where 0;');
			prepare stmt from @ddl4;
			execute stmt;	
		 set @ddl6=CONCAT('ALTER TABLE oms_order_item','_',o_loop,' ADD PRIMARY KEY (id);');
			prepare stmt from @ddl6;
			execute stmt;				
	   set @ddl5=CONCAT('ALTER TABLE oms_order_item','_',o_loop,' ADD INDEX idx_order_id(order_id);');
			prepare stmt from @ddl5;
			execute stmt;	
	   set @ddl5=CONCAT('ALTER TABLE oms_order_item','_',o_loop,' ADD INDEX idx_order_sn(order_sn);');
			prepare stmt from @ddl5;
			execute stmt;	
		  set o_loop = o_loop+1;
	end while;	#Routine body goes here...

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
