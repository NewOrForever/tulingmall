/*
 Navicat Premium Data Transfer

 Source Server         : tlmall-normal-master-71
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.65.71:3306
 Source Schema         : tl_mall_goods

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/10/2022 19:08:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_count` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '相册表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(0) NULL DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画册图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(0) NULL DEFAULT NULL,
  `factory_status` int(0) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(0) NULL DEFAULT NULL,
  `product_count` int(0) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(0) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, '三星的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', NULL, 'Victoria\'s Secret的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', NULL, 'Victoria\'s Secret的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string', NULL, NULL);
INSERT INTO `pms_brand` VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg', NULL, 'BOOB的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg', '', '海澜之家的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '苹果的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事', NULL, NULL);
INSERT INTO `pms_brand` VALUES (59, '朵唯', 'duowei', 0, 1, 1, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2b84746650fc122d67749a876c453619.png', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2b84746650fc122d67749a876c453619.png', '朵唯', NULL, NULL);

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star` int(0) NULL DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL COMMENT '0->显示，1->隐藏',
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(0) NULL DEFAULT NULL,
  `read_count` int(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment
-- ----------------------------
INSERT INTO `pms_comment` VALUES (1, 26, 'windir', '华为 HUAWEI P20', 0, '', '2020-02-09 08:58:31', 0, '', 0, 0, '东西还不错', '', NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(0) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品评价回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------
INSERT INTO `pms_comment_replay` VALUES (1, 1, 'windir', NULL, '真的吗？那我可以买一个了', '2020-02-09 09:06:48', 0, NULL, NULL);

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `charge_type` int(0) NULL DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10, 2) NULL DEFAULT NULL,
  `continme_fee` decimal(10, 2) NULL DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地（省、市）',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `member_level_id` bigint(0) NULL DEFAULT NULL,
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品会员价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL, '2022-06-30 13:53:08.382780', NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL, '2022-06-30 13:53:08.793987', NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL, '2022-06-30 13:53:09.292762', NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL, '2022-06-30 13:53:10.324658', NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL, '2022-06-30 13:53:10.620333', NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL, '2022-06-30 13:53:11.291607', NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL, '2022-06-30 13:53:11.882143', NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL, '2022-06-30 13:53:12.809980', NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL, '2022-06-30 13:53:13.548802', NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL, '2022-06-30 13:53:14.330506', NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL, '2022-06-30 13:53:14.957316', NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL, '2022-06-30 13:53:15.596053', NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL, '2022-06-30 13:53:16.189776', NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL, '2022-06-30 13:53:16.589418', NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL, '2022-06-30 13:53:17.072666', NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL, '2022-06-30 13:53:17.455669', NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL, '2022-06-30 13:53:18.055880', NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, '黄金会员', '2022-06-30 13:53:18.763856', NULL);
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, '白金会员', '2022-06-30 13:53:19.166706', NULL);
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, '钻石会员', '2022-06-30 13:53:19.565771', NULL);
INSERT INTO `pms_member_price` VALUES (142, 31, 1, NULL, '黄金会员', '2022-06-30 13:53:20.358292', NULL);
INSERT INTO `pms_member_price` VALUES (143, 31, 2, NULL, '白金会员', '2022-06-30 13:53:20.938340', NULL);
INSERT INTO `pms_member_price` VALUES (144, 31, 3, NULL, '钻石会员', '2022-06-30 13:53:21.146527', NULL);
INSERT INTO `pms_member_price` VALUES (148, 32, 1, NULL, '黄金会员', '2022-06-30 13:53:21.447384', NULL);
INSERT INTO `pms_member_price` VALUES (149, 32, 2, NULL, '白金会员', '2022-06-30 13:53:21.805542', NULL);
INSERT INTO `pms_member_price` VALUES (150, 32, 3, NULL, '钻石会员', '2022-06-30 13:53:22.066815', NULL);
INSERT INTO `pms_member_price` VALUES (154, 33, 1, NULL, '黄金会员', '2022-06-30 13:53:22.224668', NULL);
INSERT INTO `pms_member_price` VALUES (155, 33, 2, NULL, '白金会员', '2022-06-30 13:53:22.554191', NULL);
INSERT INTO `pms_member_price` VALUES (156, 33, 3, NULL, '钻石会员', '2022-06-30 13:53:23.329014', NULL);
INSERT INTO `pms_member_price` VALUES (169, 36, 1, NULL, '黄金会员', '2022-06-30 13:53:23.604319', NULL);
INSERT INTO `pms_member_price` VALUES (170, 36, 2, NULL, '白金会员', '2022-06-30 13:53:23.762459', NULL);
INSERT INTO `pms_member_price` VALUES (171, 36, 3, NULL, '钻石会员', '2022-06-30 13:53:24.025177', NULL);
INSERT INTO `pms_member_price` VALUES (172, 35, 1, NULL, '黄金会员', '2022-06-30 13:53:24.362984', NULL);
INSERT INTO `pms_member_price` VALUES (173, 35, 2, NULL, '白金会员', '2022-06-30 13:53:24.672890', NULL);
INSERT INTO `pms_member_price` VALUES (174, 35, 3, NULL, '钻石会员', '2022-06-30 13:53:24.914209', NULL);
INSERT INTO `pms_member_price` VALUES (175, 34, 1, NULL, '黄金会员', '2022-06-30 13:53:25.320688', NULL);
INSERT INTO `pms_member_price` VALUES (176, 34, 2, NULL, '白金会员', '2022-06-30 13:53:25.637304', NULL);
INSERT INTO `pms_member_price` VALUES (177, 34, 3, NULL, '钻石会员', '2022-06-30 13:53:26.181314', NULL);
INSERT INTO `pms_member_price` VALUES (192, 27, 1, NULL, '黄金会员', '2022-06-30 13:53:26.830276', NULL);
INSERT INTO `pms_member_price` VALUES (193, 27, 2, NULL, '白金会员', '2022-06-30 13:53:27.612250', NULL);
INSERT INTO `pms_member_price` VALUES (194, 27, 3, NULL, '钻石会员', '2022-06-30 13:53:28.303987', NULL);
INSERT INTO `pms_member_price` VALUES (195, 28, 1, NULL, '黄金会员', '2022-06-30 13:53:28.522897', NULL);
INSERT INTO `pms_member_price` VALUES (196, 28, 2, NULL, '白金会员', '2022-06-30 13:53:28.686321', NULL);
INSERT INTO `pms_member_price` VALUES (197, 28, 3, NULL, '钻石会员', '2022-06-30 13:53:29.196844', NULL);
INSERT INTO `pms_member_price` VALUES (198, 29, 1, NULL, '黄金会员', '2022-06-30 13:53:29.669519', NULL);
INSERT INTO `pms_member_price` VALUES (199, 29, 2, NULL, '白金会员', '2022-06-30 13:53:29.902738', NULL);
INSERT INTO `pms_member_price` VALUES (200, 29, 3, NULL, '钻石会员', '2022-06-30 13:53:30.337556', NULL);
INSERT INTO `pms_member_price` VALUES (207, 30, 1, NULL, '黄金会员', '2022-06-30 13:53:30.802520', NULL);
INSERT INTO `pms_member_price` VALUES (208, 30, 2, NULL, '白金会员', '2022-06-30 13:53:31.010775', NULL);
INSERT INTO `pms_member_price` VALUES (209, 30, 3, NULL, '钻石会员', '2022-06-30 13:53:31.265750', NULL);
INSERT INTO `pms_member_price` VALUES (222, 38, 1, NULL, '黄金会员', '2022-06-30 13:53:31.510773', NULL);
INSERT INTO `pms_member_price` VALUES (223, 38, 2, NULL, '白金会员', '2022-06-30 13:53:32.243570', NULL);
INSERT INTO `pms_member_price` VALUES (224, 38, 3, NULL, '钻石会员', '2022-06-30 13:53:32.716253', NULL);
INSERT INTO `pms_member_price` VALUES (225, 39, 1, NULL, '黄金会员', '2022-06-30 13:53:33.366576', NULL);
INSERT INTO `pms_member_price` VALUES (226, 39, 2, NULL, '白金会员', '2022-06-30 13:53:33.751689', NULL);
INSERT INTO `pms_member_price` VALUES (227, 39, 3, NULL, '钻石会员', '2022-06-30 13:53:33.894574', NULL);
INSERT INTO `pms_member_price` VALUES (228, 40, 1, NULL, '黄金会员', '2022-06-30 13:53:34.053269', NULL);
INSERT INTO `pms_member_price` VALUES (229, 40, 2, NULL, '白金会员', '2022-06-30 13:53:34.203006', NULL);
INSERT INTO `pms_member_price` VALUES (230, 40, 3, NULL, '钻石会员', '2022-06-30 13:53:34.376523', NULL);
INSERT INTO `pms_member_price` VALUES (237, 37, 1, NULL, '黄金会员', '2022-06-30 13:53:34.720741', NULL);
INSERT INTO `pms_member_price` VALUES (238, 37, 2, NULL, '白金会员', '2022-06-30 13:53:35.059780', NULL);
INSERT INTO `pms_member_price` VALUES (239, 37, 3, NULL, '钻石会员', '2022-06-30 13:53:35.467726', NULL);
INSERT INTO `pms_member_price` VALUES (240, 41, 1, NULL, '黄金会员', '2022-06-30 13:53:35.676410', NULL);
INSERT INTO `pms_member_price` VALUES (241, 41, 2, NULL, '白金会员', '2022-06-30 13:53:36.143041', NULL);
INSERT INTO `pms_member_price` VALUES (242, 41, 3, NULL, '钻石会员', '2022-06-30 13:53:36.899471', NULL);
INSERT INTO `pms_member_price` VALUES (243, 26, 1, NULL, '黄金会员', '2022-06-30 13:53:37.494570', NULL);
INSERT INTO `pms_member_price` VALUES (244, 26, 2, NULL, '白金会员', '2022-06-30 13:53:38.283978', NULL);
INSERT INTO `pms_member_price` VALUES (245, 26, 3, NULL, '钻石会员', '2022-06-30 13:53:39.029622', NULL);
INSERT INTO `pms_member_price` VALUES (249, 43, 1, NULL, '黄金会员', '2022-06-30 13:53:39.658516', NULL);
INSERT INTO `pms_member_price` VALUES (250, 43, 2, NULL, '白金会员', '2022-06-30 13:53:40.000217', NULL);
INSERT INTO `pms_member_price` VALUES (251, 43, 3, NULL, '钻石会员', '2022-06-30 13:53:40.520299', NULL);
INSERT INTO `pms_member_price` VALUES (264, 42, 1, NULL, '黄金会员', '2022-06-30 13:53:40.968185', NULL);
INSERT INTO `pms_member_price` VALUES (265, 42, 2, NULL, '白金会员', '2022-06-30 13:53:41.374850', NULL);
INSERT INTO `pms_member_price` VALUES (266, 42, 3, NULL, '钻石会员', '2022-06-30 13:53:41.977998', NULL);

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(0) NULL DEFAULT NULL,
  `product_category_id` bigint(0) NULL DEFAULT NULL,
  `feight_template_id` bigint(0) NULL DEFAULT NULL,
  `product_attribute_category_id` bigint(0) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int(0) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(0) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(0) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(0) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(0) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(0) NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(0) NULL DEFAULT 0 COMMENT '赠送的成长值',
  `gift_point` int(0) NULL DEFAULT 0 COMMENT '赠送的积分',
  `use_point_limit` int(0) NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `low_stock` int(0) NULL DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(0) NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `album_pics` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端网页详情',
  `promotion_start_time` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(0) NULL DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(0) NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 49, 7, 0, 0, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, 4, '华为 HUAWEI P30', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套', NULL, NULL);
INSERT INTO `pms_product` VALUES (26, 6, 19, 0, 4, '小米 11 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 0, 0, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', NULL, NULL, 0, 1, '小米', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 0, 0, 0, 0, 0, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', NULL, NULL, 0, 3, '小米', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 0, 0, 0, 0, 0, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 4, '小米', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 0, 0, 0, 0, 0, 5499.00, NULL, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', 'http://tulingmall.oss-cn-beijing.aliyuncs.com/tulingmall/images/20200305/QQ图片20191114194714.jpg', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL, NULL);
INSERT INTO `pms_product` VALUES (31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL, NULL);
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, 1, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤', NULL, NULL);
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, NULL, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码', NULL, NULL);
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, NULL, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码', NULL, NULL);
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, NULL, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋', NULL, NULL);
INSERT INTO `pms_product` VALUES (36, 58, 29, 0, NULL, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋', NULL, NULL);
INSERT INTO `pms_product` VALUES (37, 3, 19, 0, 3, '(华为)HUAWEI MateBook X Pro 2019款 13.9英寸3K触控全面屏 轻薄笔记本', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/800_800_1555752016264mp.png', '', 0, 1, 1, 1, 0, 0, 0, 7999.00, NULL, 5, 5, 5, '(华为)HUAWEI MateBook X Pro 2019款 13.9英寸3K触控全面屏 轻薄笔记本', '', 7999.00, 1000, 0, '件', 133.00, 0, '3', 'HUAWEI MateBook X Pro 2019款 13.9英寸', '', '', 'HUAWEI MateBook X Pro 2019款 13.9英寸', 'HUAWEI MateBook X Pro 2019款 13.9英寸', '<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/201907121110572544603 (1).jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/201907121110574365537.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/201907121110575085887.jpg\" /></p>', '', NULL, NULL, 0, 0, '华为', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (38, 3, 19, 0, 3, '华为nova6se 手机 绮境森林 全网通（8G+128G)', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', '', 0, 1, 1, 1, 0, 0, 0, 2199.00, NULL, 69, 1000, 0, '华为nova6se 手机 绮境森林 全网通（8G+128G)', '青春版', 2299.00, 0, 0, '', 178.00, 0, '3', '', '商品具有中国强制性产品认证（CCC）编号，符合国家CCC认证标准。', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_5097A805644914DFE330ED65A0FC2DA41228E18F88AE627D.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_A02429A8BDFD9296CF4425299A6D4114D7008B0D234B0FD2.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_FA50CDD2624930996E0E1AADFDE36D30BCA429AAE15C1163.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/1.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/3.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/4.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/6.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/7.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/8.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/9.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/10.jpg\" /></p>', '', NULL, NULL, 0, 0, '华为', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (39, 59, 30, 0, 4, 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/6df99dab78bb2014.jpg', '', 0, 1, 1, 1, 0, 0, 0, 31.90, NULL, 5, 5, 0, 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', '杨过-马云牌钢化膜', 31.90, 1000, 0, '张', 10.00, 0, '3', '', '', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/17244f7f7e8d496c.jpg,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/b32e689349a062cb.jpg', 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', 'iPhone7/6s/8钢化膜苹果8Plus全屏复盖抗蓝光防窥防偷看手机膜', '<p>马云-杨过牌手机膜,防水防火抗暴击,你与首富的距离只差一块膜的厚度</p>\n<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5a041acaN61fbf759.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/67a7bc034bd775f6.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/993de3eafa9297e9.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5a041ab8Nee227de5.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/5a041ac4Ne4c86b08.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/fb940234cd80d172.jpg\" /></p>', '', NULL, NULL, 0, 0, '朵唯', '手机配件', NULL, NULL);
INSERT INTO `pms_product` VALUES (40, 49, 8, 0, 1, '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '', 0, 1, 1, 1, 0, 0, 0, 139.00, NULL, 5, 5, 0, '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', 139.00, 1000, 0, '件', 200.00, 0, '3', '七匹狼短袖T恤', '', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/120c9e32ba692a2e.jpg,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/c6d444dae7235d47.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '<p>jack-ma同款T恤</p>\n<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/01-f749c132a4b313cb1.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/02-f749c132a4b313cb1.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/04-4620808b690441ab.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/05-e231e99b71c381a3.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/06-f394e86daff28cd8.jpg\" /></p>', '', NULL, NULL, 0, 4, '七匹狼', 'T恤', NULL, NULL);
INSERT INTO `pms_product` VALUES (41, 3, 19, 0, 3, '华为P40 Pro GG CC 杨过帅vs小龙女哈哈哈哈哈', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', '', 0, 1, 0, 0, 0, 0, 0, 7999.00, NULL, 100, 100, 0, '华为P40 Pro', '华为P40 Pro', 7999.00, 100, 0, '台', 209.00, 0, '', 'p40', '', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/2_164565E3E3B05D72733B33D4729958ABBE3A55FCD6935A80.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/3_1A25C03E6231A9165A376271469674FB5DAAB1CF8C0AED7A.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/4_CA8A4EE1388761516493C8D99D64C22F69C469AD7AB52E90.png,http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/5_6F1BFFCC2409D1AAFD7F1A79A9BA3D78588B9A5E6CE61D98.png', '华为P40 Pro', '华为P40 Pro', '<p><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/5AE3622E8098253D4653A38CA576E022F3D2FB71AA89F3C5.jpg\" /><img class=\"wscnph\" src=\"http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/D4FF84AC83ECBB3A930DEC57B7EE34247E7800E0FB4BB7C9.jpg\" /></p>', '', NULL, NULL, 0, 0, '华为', '手机通讯', NULL, NULL);
INSERT INTO `pms_product` VALUES (42, 59, 19, 0, 3, '朵唯智能手机 4G全网通 老人学生双卡双待手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '3333', 0, 1, 1, 1, 0, 0, 0, 527.00, NULL, 0, 0, 0, '后置双摄，国产虎贲芯片！优化散热结构！浅薄机身！朵唯4月特惠！', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 4G全网通 老人学生双卡双待手机', 599.00, 100, 0, '部', 350.00, 0, '2,1,3', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 ', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 ', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 ', '<p><img src=\"http://img30.360buyimg.com/sku/jfs/t1/159458/8/366/274699/5feade9bE29f47d46/0bec91c539721422.jpg\" width=\"790\" height=\"1191\" /></p>', '', NULL, NULL, 0, 0, '朵唯', '手机通讯', NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(0) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_type` int(0) NULL DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(0) NULL DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(0) NULL DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(0) NULL DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(0) NULL DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(0) NULL DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(0) NULL DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G,256G', 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (46, 3, '网络', 0, 1, '3G,4G', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (49, 4, '手机膜-材料', 0, 1, '钢化,石英玻璃,普通', 0, 0, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (50, 4, '手机膜-厚度', 0, 0, '', 0, 0, 0, 0, 0, 1, NULL, NULL);
INSERT INTO `pms_product_attribute` VALUES (51, 4, '手机膜-颜色', 0, 0, '', 0, 0, 0, 0, 1, 0, NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attribute_count` int(0) NULL DEFAULT 0 COMMENT '属性数量',
  `param_count` int(0) NULL DEFAULT 0 COMMENT '参数数量',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品属性分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (1, '服装-T恤', 2, 5, NULL, NULL);
INSERT INTO `pms_product_attribute_category` VALUES (2, '服装-裤装', 2, 4, NULL, NULL);
INSERT INTO `pms_product_attribute_category` VALUES (3, '手机数码-手机通讯', 2, 4, NULL, NULL);
INSERT INTO `pms_product_attribute_category` VALUES (4, '配件', 2, 1, NULL, NULL);
INSERT INTO `pms_product_attribute_category` VALUES (5, '居家', 0, 0, NULL, NULL);
INSERT INTO `pms_product_attribute_category` VALUES (6, '洗护', 0, 0, NULL, NULL);
INSERT INTO `pms_product_attribute_category` VALUES (10, '测试分类', 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_attribute_id` bigint(0) NULL DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 340 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储产品参数信息的表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '春季', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '青年', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018年春', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '长袖', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, '米白色,浅黄色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, '春季', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, '青年', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018年春', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, '长袖', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (183, 31, 24, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (184, 31, 25, '夏季', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (185, 31, 37, '青年', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (186, 31, 38, '2018年夏', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (187, 31, 39, '短袖', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (213, 27, 43, '黑色,蓝色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (214, 27, 45, '5.8', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (215, 27, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (216, 27, 47, 'Android', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (217, 27, 48, '3000ml', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (218, 28, 43, '金色,银色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (219, 28, 45, '5.0', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (220, 28, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (221, 28, 47, 'Android', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (222, 28, 48, '2800ml', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (223, 29, 43, '金色,银色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (224, 29, 45, '4.7', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (225, 29, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (226, 29, 47, 'IOS', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (227, 29, 48, '1960ml', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (239, 30, 7, '红色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (240, 30, 24, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (241, 30, 25, '夏季', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (242, 30, 37, '青年', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (243, 30, 38, '2018年夏', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (244, 30, 39, '短袖', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (265, 38, 43, '幻夜黑,奇幻森林,樱雪晴空', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (266, 38, 45, '6.4英寸', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (267, 38, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (268, 38, 47, 'Android', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (269, 38, 48, '4200mhA', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (270, 39, 51, '黑色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (271, 39, 50, '50mm', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (272, 40, 7, '白色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (273, 40, 24, 'jack-ma0102937', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (274, 40, 25, '夏季', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (275, 40, 37, '青年', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (276, 40, 38, '2018年夏', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (277, 40, 39, '短袖', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (288, 37, 43, '深空灰', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (289, 37, 45, '6.4英寸', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (290, 37, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (291, 37, 47, 'Android', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (292, 37, 48, '4200mhA', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (294, 41, 43, '黑色,白色', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (295, 41, 45, '6.4', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (296, 41, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (297, 41, 47, 'Android', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (298, 41, 48, '5500MA', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (299, 26, 50, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (305, 43, 43, '蓝,金,绿', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (306, 43, 45, '18.5~19：9', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (307, 43, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (308, 43, 47, 'Android', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (309, 43, 48, '小于12 W', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (330, 42, 43, '蓝,金,绿', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (331, 42, 45, '18.5~19：9', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (332, 42, 46, '4G', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (333, 42, 47, 'Android', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (334, 42, 48, '小于12 W', NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (335, 32, 24, NULL, NULL, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (336, 32, 25, '夏季', '2022-07-06 14:03:45.383144', NULL);
INSERT INTO `pms_product_attribute_value` VALUES (337, 32, 26, '青年', '2022-07-06 14:03:57.703606', NULL);
INSERT INTO `pms_product_attribute_value` VALUES (338, 32, 37, '2018年夏', '2022-07-06 14:04:06.260666', NULL);
INSERT INTO `pms_product_attribute_value` VALUES (339, 32, 38, '短袖', '2022-07-06 14:04:14.550177', NULL);

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(0) NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(0) NULL DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nav_status` int(0) NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(0) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(0) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (1, 0, '服装', 0, 100, '件', 1, 1, 1, NULL, '服装', '服装分类', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (2, 0, '手机数码', 0, 100, '件', 1, 1, 1, NULL, '手机数码', '手机数码', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (3, 0, '家用电器', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', '家用电器', '家用电器', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (4, 0, '家具家装', 0, 100, '件', 1, 1, 1, NULL, '家具家装', '家具家装', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, NULL, '汽车用品', '汽车用品', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (7, 1, '外套', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', '外套', '外套', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_tshirt.png', 'T恤', 'T恤', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xiuxianku.png', '休闲裤', '休闲裤', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_niuzaiku.png', '牛仔裤', '牛仔裤', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_chenshan.png', '衬衫', '衬衫分类', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (19, 2, '手机通讯', 1, 0, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', '手机通讯', '手机通讯', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (29, 1, '男鞋', 1, 0, '', 0, 0, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xie.png', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (30, 2, '手机配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '手机配件', '手机配件', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (31, 2, '摄影摄像', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (32, 2, '影音娱乐', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (33, 2, '数码配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (34, 2, '智能设备', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (35, 3, '电视', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (36, 3, '空调', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (37, 3, '洗衣机', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (38, 3, '冰箱', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (39, 3, '厨卫大电', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (43, 4, '厨房卫浴', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (44, 4, '灯饰照明', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (45, 4, '五金工具', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (46, 4, '卧室家具', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (47, 4, '客厅家具', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (48, 5, '全新整车', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (49, 5, '车载电器', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (50, 5, '维修保养', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);
INSERT INTO `pms_product_category` VALUES (51, 5, '汽车装饰', 1, 0, '', 1, 1, 0, '', '', '', NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(0) NULL DEFAULT NULL,
  `product_attribute_id` bigint(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24, NULL, NULL);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24, NULL, NULL);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24, NULL, NULL);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24, NULL, NULL);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25, NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `full_price` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品满减表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (44, 31, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (46, 32, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (48, 33, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (53, 36, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (54, 35, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (55, 34, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (59, 27, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (60, 28, 500.00, 50.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (61, 28, 1000.00, 120.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (62, 29, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (65, 30, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (70, 38, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (71, 39, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (72, 40, 200.00, 50.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (75, 37, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (76, 41, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (77, 26, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (79, 43, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_full_reduction` VALUES (84, 42, 0.00, 0.00, NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `count` int(0) NULL DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品阶梯价格表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (48, 31, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (50, 32, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (52, 33, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (57, 36, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (58, 35, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (59, 34, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (64, 27, 2, 0.80, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (65, 27, 3, 0.75, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (66, 28, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (67, 29, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (70, 30, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (75, 38, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (76, 39, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (77, 40, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (80, 37, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (81, 41, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (82, 26, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (84, 43, 0, 0.00, 0.00, NULL, NULL);
INSERT INTO `pms_product_ladder` VALUES (89, 42, 0, 0.00, 0.00, NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `price_old` decimal(10, 2) NULL DEFAULT NULL,
  `price_new` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_old` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_new` decimal(10, 2) NULL DEFAULT NULL,
  `gift_point_old` int(0) NULL DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(0) NULL DEFAULT NULL,
  `use_point_limit_old` int(0) NULL DEFAULT NULL,
  `use_point_limit_new` int(0) NULL DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `status` int(0) NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈详情',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品审核记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, '验证通过', NULL, NULL);
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, '验证通过', NULL, NULL);

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT 0 COMMENT '库存',
  `lock_stock` int(0) NULL DEFAULT 0 COMMENT '锁定库存',
  `low_stock` int(0) NULL DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sp3` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int(0) NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单品促销价格',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku的库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (1, 7, '123456', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (2, 8, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (3, 9, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (4, 10, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (5, 11, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (6, 12, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (7, 13, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (8, 14, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (9, 18, 'string', 100.00, 0, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (10, 7, 'string', 0.00, 0, 0, 0, 'string', 'string', 'sp3', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (11, 7, 'string', 0.00, 0, 0, 0, 'string', 'string', 'sp33', 'string', 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (12, 22, '111', 99.00, 0, 0, NULL, 'x', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (13, 22, '112', 99.00, 0, 0, NULL, 'xx', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (78, 23, '201806070023001', 99.00, 0, 0, NULL, '米白色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (79, 23, '201806070023002', 99.00, 0, 0, NULL, '米白色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (80, 23, '201806070023003', 99.00, 0, 0, NULL, '浅黄色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (81, 23, '201806070023004', 99.00, 0, 0, NULL, '浅黄色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2699.00, 79, -16, 5, '黑色', '32G', NULL, NULL, NULL, 2699.00, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (99, 27, '201808270027002', 2999.00, 100, 0, NULL, '黑色', '64G', NULL, NULL, NULL, 2699.00, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (100, 27, '201808270027003', 2699.00, 100, 0, NULL, '蓝色', '32G', NULL, NULL, NULL, 2699.00, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (101, 27, '201808270027004', 2999.00, 100, 0, NULL, '蓝色', '64G', NULL, NULL, NULL, 2699.00, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 99, -9, NULL, '金色', '16G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 100000, 1559, NULL, '金色', '32G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, 0, NULL, '银色', '16G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, 0, NULL, '银色', '32G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 100000, 3128, NULL, '金色', '32G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, 0, NULL, '金色', '64G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, 0, NULL, '银色', '32G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, 0, NULL, '银色', '64G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (110, 34, '202003020010101', 3000.00, 1000, 0, 5, '黑色', '16g', NULL, NULL, 0, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (112, 30, '1111', 111.00, 0, 11, 1, '红色', 'M', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (121, 38, '20200311', 2199.00, 100, 0, 1, '幻夜黑', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (122, 38, '20200311', 2199.00, 74, 26, 1, '幻夜黑', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (123, 38, '20200311', 2199.00, 100, 0, 1, '奇幻森林', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_5097A805644914DFE330ED65A0FC2DA41228E18F88AE627D.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (124, 38, '20200311', 2199.00, 100, 0, 1, '奇幻森林', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_5097A805644914DFE330ED65A0FC2DA41228E18F88AE627D.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (125, 38, '20200311', 2199.00, 100, 0, 1, '樱雪晴空', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (126, 38, '20200311', 2199.00, 100, 0, 1, '樱雪晴空', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (127, 39, '202003110039001', 28.80, 1000, 0, 1, '钢化', '黑色', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/6df99dab78bb2014.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (128, 39, '202003110039002', 28.80, 1000, 0, 1, '石英玻璃', '黑色', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2e7114084535b9a2.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (129, 39, '202003110039003', 28.80, 1000, 0, 1, '普通', '黑色', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/b32e689349a062cb.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (130, 40, '202003110040001', 139.30, 49, 51, 5, '白色', 'XL', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/bd267b1b8082246a.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (131, 40, '202003110040002', 139.30, 100, 0, 5, '白色', 'X', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/bd267b1b8082246a.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (132, 40, '202003110040003', 139.30, 1, 99, 5, '白色', 'M', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/bd267b1b8082246a.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (137, 37, '202003170037001', 7999.00, 1000, 0, 10, '深空灰', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/800_800_1555751961085.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (138, 37, '202003170037002', 7999.00, 1000, 0, 10, '深空灰', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200317/800_800_1555751961085.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (139, 41, '202003270041001', 7980.00, 1000, 0, 10, '黑色', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (140, 41, '202003270041002', 7980.00, 1000, 0, 10, '黑色', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (141, 41, '202003270041003', 7980.00, 1000, 0, 10, '白色', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/2_164565E3E3B05D72733B33D4729958ABBE3A55FCD6935A80.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (142, 41, '202003270041004', 7980.00, 1000, 0, 10, '白色', '128G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/2_164565E3E3B05D72733B33D4729958ABBE3A55FCD6935A80.png', NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (143, 26, '201806070026001', 3788.00, 494, 5, NULL, '金色', '16G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (144, 26, '201806070026002', 3999.00, 500, 33, NULL, '金色', '32G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (145, 26, '201806070026003', 3788.00, 500, 0, NULL, '银色', '16G', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (146, 26, '201806070026004', 3999.00, 500, 0, NULL, '银色', '32G', NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
