/*
 Navicat Premium Data Transfer

 Source Server         : tlmall-cart-master-184
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.65.184:3306
 Source Schema         : tl_mall_cart

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/10/2022 19:08:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `product_sku_id` bigint(0) NULL DEFAULT NULL,
  `member_id` bigint(0) NULL DEFAULT NULL,
  `quantity` int(0) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `sp1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性2',
  `sp3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性3',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(0) NULL DEFAULT 0 COMMENT '是否删除',
  `product_category_id` bigint(0) NULL DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_test`(`member_id`, `delete_status`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (12, 26, 90, 1, 1, 3788.00, '金色', '16G', NULL, NULL, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (13, 27, 98, 1, 3, 2699.00, '黑色', '32G', NULL, NULL, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (14, 28, 102, 1, 39, 649.00, '金色', '16G', NULL, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (15, 28, 103, 1, 3, 699.00, '金色', '32G', NULL, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (16, 29, 106, 1, 6, 5499.00, '金色', '32G', NULL, NULL, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (17, 26, 92, 1, 23, 3788.00, '银色', '16G', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026003', 'windir', '2020-01-15 07:23:58', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (18, 26, 93, 1, 4, 3999.00, '银色', '32G', NULL, NULL, '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'windir', '2020-01-16 09:15:23', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (41, 28, 0, 1, 1, 649.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', NULL, 'windir', '2020-02-28 12:14:36', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (42, 11, 0, 1, 2, 249.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '女式超柔软拉毛运动开衫1', '匠心剪裁，垂感质地', NULL, 'windir', '2020-02-28 12:14:48', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (43, 38, 126, 1, 1, 2199.00, '樱雪晴空', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_42B09549789695A42D621CF87DC53B5EBE9385772DC61FB9mp.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '华为nova6se 手机 绮境森林 全网通（8G+128G)', NULL, 'windir', '2020-03-17 05:39:55', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (44, 27, 98, 10, 1, 2699.00, '黑色', '32G', NULL, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', NULL, 'yangguo', '2020-03-17 06:13:46', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (45, 27, 99, 1, 1, 2999.00, '黑色', '64G', NULL, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', NULL, 'windir', '2020-03-18 13:43:45', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (46, 38, 122, 1, 2, 2199.00, '幻夜黑', '64G', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/78_78_AB008D014A661DF6E52E184269C6A8A453885402D7D6FC0Bmp.png', '华为nova6se 手机 绮境森林 全网通（8G+128G)', '华为nova6se 手机 绮境森林 全网通（8G+128G)', NULL, 'windir', '2020-03-27 09:08:33', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (47, 41, 140, 1, 1, 7999.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200327/1_DE7F785A7E0C276D3A1F40A5C6D82B07D2AED60CE1F73795mp.png', '华为P40 Pro', '华为P40 Pro', NULL, 'windir', '2020-03-27 13:25:59', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (48, 26, 144, 8, 1, 3788.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'Monkey', '2021-02-26 08:15:27', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (49, 26, 144, 8, 1, 3788.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'Monkey', '2021-02-28 11:37:32', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (50, 26, 144, 8, 1, 3788.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'Monkey', '2021-03-03 06:31:19', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (51, 26, 144, 8, 1, 3788.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'Monkey', '2021-03-04 07:18:07', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (52, 26, 144, 8, 2, 3788.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'Monkey', '2021-03-15 08:24:52', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (53, 40, 130, 8, 1, 139.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, 'Monkey', '2021-05-24 08:20:00', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (54, 27, 98, 8, 1, 2699.00, '黑色', '32G', NULL, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', NULL, 'Monkey', '2021-05-25 05:12:59', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (55, 29, 106, 8, 3, 5499.00, '金色', '32G', NULL, NULL, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', NULL, 'Monkey', '2021-06-07 06:39:22', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (56, 26, 90, 1, 1, 3788.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'windir', '2021-08-02 12:18:18', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (57, 27, 98, 462245, 2, 2699.00, '黑色', '32G', NULL, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', NULL, 'roy', '2022-07-08 01:57:48', NULL, 0, NULL, NULL, NULL, NULL, '2022-07-08 14:57:48.491086', NULL);
INSERT INTO `oms_cart_item` VALUES (58, 30, 112, 462245, 1, 111.00, '红色', 'M', NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200309/面试宝典图 .jpg', 'HLA海澜之家简约动物印花短袖T恤', '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', NULL, 'roy', '2022-07-26 04:20:58', NULL, 0, NULL, NULL, NULL, NULL, '2022-07-26 17:20:59.821094', NULL);
INSERT INTO `oms_cart_item` VALUES (59, 40, 132, 1, 2, 139.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, 'test', '2022-09-27 07:13:26', NULL, 1, NULL, NULL, NULL, NULL, '2022-09-27 20:13:27.187851', NULL);
INSERT INTO `oms_cart_item` VALUES (60, 40, 130, 1, 3, 139.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, 'test', '2022-09-27 08:27:45', NULL, 1, NULL, NULL, NULL, NULL, '2022-09-27 21:27:45.575335', NULL);
INSERT INTO `oms_cart_item` VALUES (61, 40, 132, 1, 12, 139.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, 'test', '2022-09-28 00:42:14', NULL, 0, NULL, NULL, NULL, NULL, '2022-09-28 13:42:16.513621', NULL);
INSERT INTO `oms_cart_item` VALUES (62, 40, 130, 462247, 6, 139.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, 'test', '2022-10-10 22:10:57', NULL, 0, NULL, NULL, NULL, NULL, '2022-10-11 11:10:57.373446', NULL);
INSERT INTO `oms_cart_item` VALUES (63, 40, 130, 462246, 2, 139.00, NULL, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/19e846e727dff337.jpg', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', '七匹狼短袖T恤男纯棉舒适春夏修身运动休闲短袖三条装 圆领3条装', NULL, 'mark', '2022-10-10 22:12:25', NULL, 0, NULL, NULL, NULL, NULL, '2022-10-11 11:12:24.565167', NULL);
INSERT INTO `oms_cart_item` VALUES (64, 26, 143, 1, 1, 3788.00, NULL, NULL, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '小米 11 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', NULL, 'test', '2022-10-11 02:35:44', NULL, 0, NULL, NULL, NULL, NULL, '2022-10-11 15:35:44.203155', NULL);
INSERT INTO `oms_cart_item` VALUES (65, 27, 98, 1, 1, 2699.00, '黑色', '32G', NULL, NULL, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', NULL, 'test', '2022-10-11 02:42:04', NULL, 0, NULL, NULL, NULL, NULL, '2022-10-11 15:42:03.947944', NULL);

SET FOREIGN_KEY_CHECKS = 1;
