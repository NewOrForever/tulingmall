/*
 Navicat Premium Data Transfer

 Source Server         : tlmall-normal-master-71
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.65.71:3306
 Source Schema         : tl_mall_promotion

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/10/2022 19:09:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `type` int(0) NULL DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` int(0) NULL DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(0) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `per_limit` int(0) NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `use_type` int(0) NULL DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` int(0) NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` int(0) NULL DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(0) NULL DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime(0) NULL DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `member_level` int(0) NULL DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (2, 0, '全品类通用券', 0, 92, 10.00, 1, 100.00, '2018-08-27 16:40:47', '2018-11-23 16:40:47', 0, '满100减10', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (3, 0, '小米手机专用券', 0, 92, 50.00, 1, 1000.00, '2018-08-27 16:40:47', '2018-11-16 16:40:47', 2, '小米手机专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (4, 0, '手机品类专用券', 0, 92, 300.00, 1, 2000.00, '2018-08-27 16:40:47', '2018-09-15 16:40:47', 1, '手机分类专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (7, 0, 'T恤分类专用优惠券', 0, 93, 50.00, 1, 500.00, '2018-08-27 16:40:47', '2018-08-15 16:40:47', 1, '满500减50', 100, 0, 7, '2018-08-27 16:40:47', NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (8, 0, '新优惠券', 0, 100, 100.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-27 00:00:00', 0, '测试', 100, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (9, 0, '全品类通用券', 0, 100, 5.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (10, 0, '全品类通用券', 0, 100, 15.00, 1, 200.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (11, 0, '全品类通用券', 0, 1000, 50.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 1000, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (12, 0, '移动端全品类通用券', 1, 1, 10.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (22, 0, '华为手机专用', 0, 999, 999.00, 1, 2000.00, '2020-03-24 16:00:00', '2020-12-30 16:00:00', 2, NULL, 1000, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (23, 0, '华为手机专用', 0, 999, 999.00, 1, 2000.00, '2020-03-24 16:00:00', '2020-12-30 16:00:00', 2, NULL, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(0) NULL DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `use_status` int(0) NULL DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(0) NULL DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号码',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券使用、领取历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES (12, 2, 4, '0340981248320004', 'zhensan', 1, '2018-11-12 14:16:50', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (13, 3, 4, '0342977234360004', 'zhensan', 1, '2018-11-12 14:17:10', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (14, 4, 4, '0343342928830004', 'zhensan', 1, '2018-11-12 14:17:13', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (15, 2, 5, '0351883832180005', 'lisi', 1, '2018-11-12 14:18:39', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (16, 3, 5, '0352201672680005', 'lisi', 1, '2018-11-12 14:18:42', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (17, 4, 5, '0352505810180005', 'lisi', 1, '2018-11-12 14:18:45', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (18, 2, 6, '0356114588380006', 'wangwu', 1, '2018-11-12 14:19:21', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (19, 3, 6, '0356382856920006', 'wangwu', 1, '2018-11-12 14:19:24', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (20, 4, 6, '0356656798470006', 'wangwu', 1, '2018-11-12 14:19:27', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (21, 2, 3, '0363644984620003', 'windy', 1, '2018-11-12 14:20:36', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (22, 3, 3, '0363932820300003', 'windy', 1, '2018-11-12 14:20:39', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (23, 4, 3, '0364238275840003', 'windy', 1, '2018-11-12 14:20:42', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (24, 2, 7, '0385034833070007', 'lion', 1, '2018-11-12 14:24:10', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (25, 3, 7, '0385350208650007', 'lion', 1, '2018-11-12 14:24:13', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (26, 4, 7, '0385632733900007', 'lion', 1, '2018-11-12 14:24:16', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (27, 2, 8, '0388779132990008', 'shari', 1, '2018-11-12 14:24:48', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (28, 3, 8, '0388943658810008', 'shari', 1, '2018-11-12 14:24:49', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (29, 4, 8, '0389069398320008', 'shari', 1, '2018-11-12 14:24:51', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (30, 2, 9, '0390753935250009', 'aewen', 1, '2018-11-12 14:25:08', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (31, 3, 9, '0390882954470009', 'aewen', 1, '2018-11-12 14:25:09', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (32, 4, 9, '0391025542810009', 'aewen', 1, '2018-11-12 14:25:10', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (36, 22, 1, '9924320362620001', 'windir', 1, '2020-03-27 08:53:57', 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `product_category_id` bigint(0) NULL DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类名称',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品分类关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(0) NULL DEFAULT NULL,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品的关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `status` int(0) NULL DEFAULT NULL COMMENT '上下线状态,1上线、0下线',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '秒杀时间段名称',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (3, '秒杀专场', '2020-02-15', '2027-06-23', 1, '2018-11-16 11:11:31', NULL, NULL);
INSERT INTO `sms_flash_promotion` VALUES (7, '春季家电家具疯狂秒杀6', '2021-11-04', '2021-11-25', 0, '2018-11-16 11:12:35', NULL, NULL);

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `member_id` int(0) NULL DEFAULT NULL,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购通知记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(0) NULL DEFAULT NULL COMMENT '秒杀活动ID->关联sms_flash_promotion表',
  `flash_promotion_session_id` bigint(0) NULL DEFAULT NULL COMMENT '当前日期活动场次编号',
  `product_id` bigint(0) NULL DEFAULT NULL COMMENT '产品ID',
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(0) NULL DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(0) NULL DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx-product-id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1544584813415948290 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品限时购与商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (26, 3, 2, 32, 60.00, 4, 1, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 3, 5, 29, 4999.00, 7, 1, 100, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (41, 3, 1, 42, 499.00, 100, 1, 2, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (42, 3, 3, 26, 3700.00, 123, 1, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (43, 3, 4, 26, 3699.00, 9900087, 11, 1, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (45, 3, 1, 27, 2699.00, 100, 1, 99, '2022-07-06 15:31:31.264611', NULL);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次名称',
  `start_time` time(0) NULL DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time(0) NULL DEFAULT NULL COMMENT '每日结束时间',
  `status` int(0) NULL DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购场次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '16:00场', '08:00:00', '10:00:33', 1, '2018-11-16 13:22:17', NULL, NULL);
INSERT INTO `sms_flash_promotion_session` VALUES (2, '18:00场', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34', NULL, NULL);
INSERT INTO `sms_flash_promotion_session` VALUES (3, '20:00场', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37', NULL, NULL);
INSERT INTO `sms_flash_promotion_session` VALUES (4, '10:00场', '02:00:00', '04:00:00', 1, '2018-11-16 13:22:41', NULL, NULL);
INSERT INTO `sms_flash_promotion_session` VALUES (5, '13:00场', '05:00:00', '07:00:00', 1, '2018-11-16 13:22:45', NULL, NULL);
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 0, '2018-11-16 13:21:34', NULL, NULL);
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:33', '21:00:33', 0, '2018-11-16 13:22:55', NULL, NULL);

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(0) NULL DEFAULT NULL COMMENT '点击数',
  `order_count` int(0) NULL DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(0) NULL DEFAULT 0 COMMENT '排序',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页轮播广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES (2, '夏季大热促销', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '2018-11-01 14:01:37', '2023-11-15 14:01:37', 0, 0, 0, NULL, '夏季大热促销', 0, NULL, NULL);
INSERT INTO `sms_home_advertise` VALUES (3, '夏季大热促销1', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '2018-11-13 14:01:37', '2023-11-13 14:01:37', 0, 0, 0, NULL, '夏季大热促销1', 0, NULL, NULL);
INSERT INTO `sms_home_advertise` VALUES (4, '夏季大热促销2', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '2018-11-13 14:01:37', '2023-11-13 14:01:37', 1, 0, 0, NULL, '夏季大热促销2', 0, NULL, NULL);
INSERT INTO `sms_home_advertise` VALUES (9, '电影推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2023-12-01 00:00:00', 1, 0, 0, 'www.baidu.com', '电影推荐广告', 100, NULL, NULL);
INSERT INTO `sms_home_advertise` VALUES (10, '汽车促销广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2023-11-24 00:00:00', 1, 0, 0, 'xxx', NULL, 99, NULL, NULL);
INSERT INTO `sms_home_advertise` VALUES (11, '汽车推荐广告', 1, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200318/201907121110574365537.jpg', '2018-11-13 00:00:00', '2023-12-30 00:00:00', 1, 0, 0, '39', NULL, 98, NULL, NULL);

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(0) NULL DEFAULT NULL COMMENT '品牌ID[关联pms_brand品牌推荐]',
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `recommend_status` int(0) NULL DEFAULT NULL COMMENT '推荐状态:1推荐，0取消推荐',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序序号',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES (1, 1, '万和', 1, 200, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (2, 2, '三星', 1, 0, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (6, 6, '小米', 1, 300, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (8, 5, '方太', 1, 100, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (32, 50, '海澜之家', 1, 0, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (33, 51, '苹果', 1, 0, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (35, 3, '华为', 1, 0, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (36, 4, '格力', 1, 0, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (37, 5, '方太', 0, 0, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (38, 1, '万和', 1, 0, NULL, NULL);
INSERT INTO `sms_home_brand` VALUES (39, 21, 'OPPO', 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新鲜好物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES (2, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 200, NULL, NULL);
INSERT INTO `sms_home_new_product` VALUES (8, 26, '华为 HUAWEI P20 ', 1, 0, NULL, NULL);
INSERT INTO `sms_home_new_product` VALUES (15, 42, '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 4G全网通 老人学生双卡双待手机', 1, 300, NULL, NULL);
INSERT INTO `sms_home_new_product` VALUES (16, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 1, 0, NULL, NULL);

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人气推荐商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES (3, 26, '华为 HUAWEI P20 ', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_product` VALUES (4, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_product` VALUES (5, 28, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_product` VALUES (6, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_product` VALUES (7, 30, 'HLA海澜之家简约动物印花短袖T恤', 0, 100, NULL, NULL);

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(0) NULL DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'polo衬衫的也时尚', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_subject` VALUES (15, 2, '大牌手机低价秒', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_subject` VALUES (16, 3, '晓龙845新品上市', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_subject` VALUES (17, 4, '夏天应该穿什么', 1, 0, NULL, NULL);
INSERT INTO `sms_home_recommend_subject` VALUES (18, 5, '夏季精选', 1, 100, NULL, NULL);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, '品牌手机降价', 1, 0, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
