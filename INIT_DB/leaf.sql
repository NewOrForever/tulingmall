/*
 Navicat Premium Data Transfer

 Source Server         : tlmall-normal-master-71
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.65.71:3306
 Source Schema         : leaf

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/10/2022 19:08:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for leaf_alloc
-- ----------------------------
DROP TABLE IF EXISTS `leaf_alloc`;
CREATE TABLE `leaf_alloc`  (
  `biz_tag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `max_id` bigint(0) NOT NULL DEFAULT 1,
  `step` int(0) NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`biz_tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaf_alloc
-- ----------------------------
INSERT INTO `leaf_alloc` VALUES ('leaf-segment-test', 10001, 2000, 'Test leaf Segment Mode Get Id', '2022-06-29 22:00:52');
INSERT INTO `leaf_alloc` VALUES ('order_id', 107000, 2000, '订单id', '2022-10-11 17:09:38');
INSERT INTO `leaf_alloc` VALUES ('order_item_id', 95000, 2000, '订单详情项ID', '2022-10-11 17:09:42');

SET FOREIGN_KEY_CHECKS = 1;
