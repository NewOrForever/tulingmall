/*
 Navicat Premium Data Transfer

 Source Server         : tlmall-normal-master-71
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.65.71:3306
 Source Schema         : tl_mall_user

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/10/2022 19:09:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `age` int(0) NOT NULL DEFAULT 0 COMMENT '年龄',
  `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '职位',
  `hire_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '入职时间',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name_age_position`(`name`, `age`, `position`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employees
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(0) NULL DEFAULT NULL,
  `refresh_token_validity` int(0) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('api-gateway', 'order-service,product-service,member-service', '$2a$10$KRhK7wkCbXD5MmxN2M6V/.V0IlwOLuzh3/8oqvFfEK1u1J1ZRlcBu', 'read,write', 'password', NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-03 17:25:15.845210', NULL);
INSERT INTO `oauth_client_details` VALUES ('member-service', NULL, '$2a$10$KRhK7wkCbXD5MmxN2M6V/.V0IlwOLuzh3/8oqvFfEK1u1J1ZRlcBu', 'read,write,test', 'password,refresh_token', NULL, NULL, 86400, 9999999, NULL, 'true', '2022-07-03 17:25:15.980572', NULL);
INSERT INTO `oauth_client_details` VALUES ('order_app', 'order-service', '$2a$10$KRhK7wkCbXD5MmxN2M6V/.V0IlwOLuzh3/8oqvFfEK1u1J1ZRlcBu', 'read', 'password', '', NULL, 86400, NULL, NULL, '', '2022-07-03 17:25:16.197777', NULL);
INSERT INTO `oauth_client_details` VALUES ('portal_app', 'order-service,product-service,api-gateway,authorize-server', '$2a$10$KRhK7wkCbXD5MmxN2M6V/.V0IlwOLuzh3/8oqvFfEK1u1J1ZRlcBu', 'read,write', 'password,authorization_code,refresh_token', 'http://portal.tuling.com:8855/callBack', NULL, 86400, 3600, NULL, 'true', '2022-07-03 17:25:16.590195', NULL);
INSERT INTO `oauth_client_details` VALUES ('product_app', 'product-service', '$2a$10$KRhK7wkCbXD5MmxN2M6V/.V0IlwOLuzh3/8oqvFfEK1u1J1ZRlcBu', 'read,write', 'password', NULL, NULL, 86400, NULL, NULL, '', '2022-07-03 17:25:17.140949', NULL);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, 'test', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1, '2022-06-29 12:59:10.576018', NULL);
INSERT INTO `ums_admin` VALUES (3, 'admin', '$2a$10$HIukCOoyY2lk9FP8YSxWNuxPJIfXpORkOfpEP61yHiaM34m6TcMh6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-03-20 15:38:50', 1, '2022-06-29 12:59:10.802486', NULL);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器登录类型',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1579076798348546050 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (1542373639127494657, 3, '2022-06-30 00:05:06', '0:0:0:0:0:0:0:1', NULL, NULL, '2022-06-30 13:05:06.182208', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1543857126477062145, 3, '2022-07-04 02:19:57', '0:0:0:0:0:0:0:1', NULL, NULL, '2022-07-04 15:19:57.270425', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1543894490482089986, 3, '2022-07-04 04:48:25', '0:0:0:0:0:0:0:1', NULL, NULL, '2022-07-04 17:48:25.575278', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1543901707440648194, 3, '2022-07-04 05:17:06', '0:0:0:0:0:0:0:1', NULL, NULL, '2022-07-04 18:17:06.238039', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1544192290004590593, 3, '2022-07-05 00:31:46', '0:0:0:0:0:0:0:1', NULL, NULL, '2022-07-05 13:31:46.342260', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1544560225084665858, 3, '2022-07-06 00:53:49', '0:0:0:0:0:0:0:1', NULL, NULL, '2022-07-06 13:53:48.931030', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1544580748875313154, 3, '2022-07-06 02:15:22', '0:0:0:0:0:0:0:1', NULL, NULL, '2022-07-06 15:15:22.204590', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1551797374611816450, 3, '2022-07-26 00:11:40', '127.0.0.1', NULL, NULL, '2022-07-26 13:11:39.803774', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1552491519072448514, 3, '2022-07-27 22:09:57', '127.0.0.1', NULL, NULL, '2022-07-28 11:09:56.760419', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1552566350858113025, 3, '2022-07-28 03:07:18', '127.0.0.1', NULL, NULL, '2022-07-28 16:07:18.096195', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1552945647502495746, 3, '2022-07-29 04:14:29', '192.168.65.44', NULL, NULL, '2022-07-29 17:14:29.358426', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1567718853291483137, 3, '2022-09-07 22:37:56', '127.0.0.1', NULL, NULL, '2022-09-08 11:37:56.084207', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1569197861241802754, 3, '2022-09-12 00:34:59', '127.0.0.1', NULL, NULL, '2022-09-12 13:34:59.087943', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1569203847868387329, 3, '2022-09-12 00:58:46', '127.0.0.1', NULL, NULL, '2022-09-12 13:58:46.414645', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1578997500103118849, 3, '2022-10-09 01:35:15', '192.168.65.48', NULL, NULL, '2022-10-09 14:35:15.048068', NULL);
INSERT INTO `ums_admin_login_log` VALUES (1579076798348546049, 3, '2022-10-09 06:50:21', '192.168.65.48', NULL, NULL, '2022-10-09 19:50:21.213745', NULL);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(0) NULL DEFAULT NULL,
  `permission_id` bigint(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和权限关系表(除角色中定义的权限以外的加减权限)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(0) NULL DEFAULT NULL,
  `role_id` bigint(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES (13, 3, 1, '2022-06-29 13:01:57.510981', NULL);
INSERT INTO `ums_admin_role_relation` VALUES (15, 3, 2, '2022-06-29 13:01:57.706464', NULL);
INSERT INTO `ums_admin_role_relation` VALUES (16, 3, 4, '2022-06-29 13:01:58.021518', NULL);

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `change_type` int(0) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(0) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成长值变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `change_type` int(0) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(0) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(0) NULL DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(0) NULL DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(0) NULL DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(0) NULL DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分消费设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(0) NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` int(0) NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` int(0) NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '用户来源',
  `integration` int(0) NULL DEFAULT NULL COMMENT '积分',
  `growth` int(0) NULL DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(0) NULL DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(0) NULL DEFAULT NULL COMMENT '历史积分数量',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 462248 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, NULL, 'test', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', 'test', '180', 1, '2022-07-03 03:39:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-03 15:36:13.050483', NULL);
INSERT INTO `ums_member` VALUES (462245, NULL, 'roy', '$2a$10$eo6qnvKKq8cOkf7XkRFMwe29pA1YoE4tEbA5tK820JvkUu1ZIIOIW', 'roy', '123', 1, '2022-07-03 03:39:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-03 16:39:42.447505', NULL);
INSERT INTO `ums_member` VALUES (462246, NULL, 'mark', '$2a$10$eo6qnvKKq8cOkf7XkRFMwe29pA1YoE4tEbA5tK820JvkUu1ZIIOIW', 'mark', '124', 1, '2022-07-03 03:39:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-03 16:39:42.447505', NULL);
INSERT INTO `ums_member` VALUES (462247, NULL, 'test2', '$2a$10$zUnskPAYscI1P4qQYICN.OvFU63eELVwqegx/thOqkxN2shB5KDEy', 'test', '181', 1, '2022-07-03 03:39:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-03 15:36:13.050483', NULL);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth_point` int(0) NULL DEFAULT NULL,
  `default_status` int(0) NULL DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(0) NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(0) NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(0) NULL DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(0) NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(0) NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(0) NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(0) NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_type` int(0) NULL DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `tag_id` bigint(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和标签关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `product_category_id` bigint(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员与产品分类关系表（用户喜欢的分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_status` int(0) NULL DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址(街道)',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 462245, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, NULL);
INSERT INTO `ums_member_receive_address` VALUES (3, 462245, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '福田区', '清水河街道', NULL, NULL);
INSERT INTO `ums_member_receive_address` VALUES (4, 462245, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, NULL);
INSERT INTO `ums_member_receive_address` VALUES (5, 8, 'Monkey', '13131313131', NULL, '110110', '北京', '北京', '北京', '我家住在黄土高坡哦', NULL, NULL);
INSERT INTO `ums_member_receive_address` VALUES (6, 1, 'Fox', '15612345678', NULL, '100001', '北京', '天津', '天津', 'xxxxxxx', '2022-09-28 19:23:52.547759', NULL);
INSERT INTO `ums_member_receive_address` VALUES (7, 462246, 'mark', '13912345678', NULL, '100001', '河北', '河北', '北京', 'mark', '2022-10-11 11:17:12.076649', NULL);
INSERT INTO `ums_member_receive_address` VALUES (8, 462247, 'xxx', '12312234233', NULL, '111111', '北京', '天津', '河北', '11', '2022-10-11 13:54:41.441382', NULL);

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(0) NULL DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(0) NULL DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(0) NULL DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分成长规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `consume_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(0) NULL DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(0) NULL DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(0) NULL DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(0) NULL DEFAULT NULL COMMENT '退货数量',
  `login_count` int(0) NULL DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(0) NULL DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(0) NULL DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(0) NULL DEFAULT NULL,
  `collect_subject_count` int(0) NULL DEFAULT NULL,
  `collect_topic_count` int(0) NULL DEFAULT NULL,
  `collect_comment_count` int(0) NULL DEFAULT NULL,
  `invite_friend_count` int(0) NULL DEFAULT NULL,
  `recent_order_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次下订单时间',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员统计信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_order_count` int(0) NULL DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动打标签完成订单金额',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth` int(0) NULL DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(0) NULL DEFAULT NULL COMMENT '赠送积分',
  `type` int(0) NULL DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `pid` bigint(0) NULL DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int(0) NULL DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `status` int(0) NULL DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (1, 0, '商品', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0, '2022-06-29 13:01:13.296603', NULL);
INSERT INTO `ums_permission` VALUES (2, 1, '商品列表', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0, '2022-06-29 13:01:13.768034', NULL);
INSERT INTO `ums_permission` VALUES (3, 1, '添加商品', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0, '2022-06-29 13:01:14.279306', NULL);
INSERT INTO `ums_permission` VALUES (4, 1, '商品分类', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0, '2022-06-29 13:01:15.097373', NULL);
INSERT INTO `ums_permission` VALUES (5, 1, '商品类型', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0, '2022-06-29 13:01:16.194810', NULL);
INSERT INTO `ums_permission` VALUES (6, 1, '品牌管理', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0, '2022-06-29 13:01:17.075114', NULL);
INSERT INTO `ums_permission` VALUES (7, 2, '编辑商品', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0, '2022-06-29 13:01:17.985960', NULL);
INSERT INTO `ums_permission` VALUES (8, 2, '删除商品', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0, '2022-06-29 13:01:18.583416', NULL);
INSERT INTO `ums_permission` VALUES (9, 4, '添加商品分类', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0, '2022-06-29 13:01:19.368345', NULL);
INSERT INTO `ums_permission` VALUES (10, 4, '修改商品分类', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0, '2022-06-29 13:01:19.808795', NULL);
INSERT INTO `ums_permission` VALUES (11, 4, '删除商品分类', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0, '2022-06-29 13:01:20.581498', NULL);
INSERT INTO `ums_permission` VALUES (12, 5, '添加商品类型', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0, '2022-06-29 13:01:21.050829', NULL);
INSERT INTO `ums_permission` VALUES (13, 5, '修改商品类型', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0, '2022-06-29 13:01:21.641232', NULL);
INSERT INTO `ums_permission` VALUES (14, 5, '删除商品类型', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0, '2022-06-29 13:01:22.211787', NULL);
INSERT INTO `ums_permission` VALUES (15, 6, '添加品牌', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0, '2022-06-29 13:01:22.732997', NULL);
INSERT INTO `ums_permission` VALUES (16, 6, '修改品牌', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0, '2022-06-29 13:01:23.217059', NULL);
INSERT INTO `ums_permission` VALUES (17, 6, '删除品牌', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0, '2022-06-29 13:01:23.425772', NULL);
INSERT INTO `ums_permission` VALUES (18, 0, '首页', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0, '2022-06-29 13:01:23.834296', NULL);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `admin_count` int(0) NULL DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(0) NULL DEFAULT 0,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, '商品管理员', '商品管理员', 0, '2018-09-30 15:46:11', 1, 0, '2022-06-29 13:00:24.751723', NULL);
INSERT INTO `ums_role` VALUES (2, '商品分类管理员', '商品分类管理员', 0, '2018-09-30 15:53:45', 1, 0, '2022-06-29 13:00:24.856364', NULL);
INSERT INTO `ums_role` VALUES (3, '商品类型管理员', '商品类型管理员', 0, '2018-09-30 15:53:56', 1, 0, '2022-06-29 13:00:25.183934', NULL);
INSERT INTO `ums_role` VALUES (4, '品牌管理员', '品牌管理员', 0, '2018-09-30 15:54:12', 1, 0, '2022-06-29 13:00:26.017213', NULL);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(0) NULL DEFAULT NULL,
  `permission_id` bigint(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色和权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1, '2022-06-29 13:00:49.138993', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2, '2022-06-29 13:00:49.307570', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3, '2022-06-29 13:00:49.640712', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7, '2022-06-29 13:00:50.202592', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8, '2022-06-29 13:00:51.139879', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4, '2022-06-29 13:00:52.042575', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9, '2022-06-29 13:00:52.501264', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10, '2022-06-29 13:00:53.344375', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11, '2022-06-29 13:00:53.900148', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5, '2022-06-29 13:00:54.388318', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12, '2022-06-29 13:00:54.607728', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13, '2022-06-29 13:00:54.790387', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14, '2022-06-29 13:00:54.989893', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6, '2022-06-29 13:00:55.241939', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15, '2022-06-29 13:00:55.556883', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16, '2022-06-29 13:00:55.883507', NULL);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17, '2022-06-29 13:00:56.091207', NULL);

SET FOREIGN_KEY_CHECKS = 1;
