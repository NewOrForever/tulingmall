/*
 Navicat Premium Data Transfer

 Source Server         : tlmall-normal-master-71
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.65.71:3306
 Source Schema         : tl_mall_normal

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 14/10/2022 19:09:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(0) NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `read_count` int(0) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `help_count` int(0) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report`  (
  `id` bigint(0) NULL DEFAULT NULL,
  `report_type` int(0) NULL DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_status` int(0) NULL DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(0) NULL DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户举报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT '展示图片',
  `sort` int(0) NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(0) NULL DEFAULT NULL,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区和产品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (25, 1, 26, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (26, 2, 26, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (27, 3, 26, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (28, 4, 26, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (30, 1, 43, NULL, NULL);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (35, 1, 42, NULL, NULL);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(0) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题主图',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `collect_count` int(0) NULL DEFAULT NULL,
  `read_count` int(0) NULL DEFAULT NULL,
  `comment_count` int(0) NULL DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `forward_count` int(0) NULL DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题分类名称',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES (1, 1, '轮廓分明，双摄手机映现细腻美照', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t26434/217/1381240043/254214/290f9d5b/5bc6c11cN54567a27.jpg!q70.jpg', NULL, 1, '2018-11-11 13:26:55', 100, 1000, 100, NULL, '手机对于拍照党来说，已经不仅仅是通讯工具那么简单了。因为有时TA还充当着“单反”的角色，来不断地带给那些喜欢拍照的人惊喜。所以，在这里准备一波高颜值的双摄手机来给大家。让TA们灵敏捕捉影像的能力，为你展现出轮廓更加分明、且画质更加细腻的美照。', 1, NULL, NULL, '精选专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (2, 1, '交通拥挤有妙招，电动车小巧穿行无障碍', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t14224/229/529700229/74868/a1cc7364/5a314f85N5bfd22c7.jpg!q70.jpg', NULL, 1, '2018-11-12 13:27:00', 100, 1000, 100, NULL, '随着人们消费水平的提高，公路上的小车是越来越多了，导致每到上下班高峰期的时候，大路的车辆堵了一环又一环，而且你根本不知道它到底会塞多久，所以我们需要变通一下，不妨骑上电动车来个绿色出行，它够小巧玲珑，即使交通再怎么拥挤，也总有它可以通过的地方。', 1, NULL, NULL, '精选专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (3, 1, '无酒不成席，甘香白酒开怀助兴', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t1/881/4/12265/114011/5bd1446fEc71114bf/68925bfb4a2adc44.jpg!q70.jpg', NULL, 1, '2018-11-13 13:27:05', 100, 1000, 100, NULL, '白酒是由各种优质的高粱，小麦，大米等谷物为原料，经过传统工艺的长时间酿造，酒液在这样的环境中慢慢发酵，最终变成清香浓郁的白酒，被摆上人们的餐桌，供人畅饮，是一种受到大众喜爱的绝佳饮品。', 1, NULL, NULL, '精选专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (4, 2, '真规划不盲扫，全域清洁净无尘', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t15205/35/2539924281/429185/72fa7857/5aab2c4bN6a32a6c5.png', NULL, 1, '2018-11-01 13:27:09', 100, 1000, 100, NULL, '科技时代，聪明女人会选择用智慧来减负，和繁琐的家务挥手再见，才能腾出更多休闲时间。规划式扫地机器人设计个性化，它能够跟据房间布置呈现清扫路线，实现规划式覆盖性清洁，少遗漏不盲扫，从而大幅度降低损耗，侦测技术遇到家具及时避让，杜绝猛烈撞击，任它灵巧穿梭于低矮空间，坐享居家净无尘。', 1, NULL, NULL, '家电专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (5, 2, '抑菌更纯净，直饮净水保家人健康', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t11428/340/1504074828/20474/1e8cab1e/5a0305d3Nb1e7a762.jpg!q70.jpg', NULL, 1, '2018-11-06 13:27:18', 100, 1000, 100, NULL, '在城里居住，首先要担心的是饮水问题。桶装水太贵不够经济，还不一定是干净的。自己去干净的水源地取水也不切实际。此时只有选择在家里安装一台净水器才实在。装上一台直饮式的净水器，方便安全，关键是水质过滤得比较纯净，很大限度地处理了大部分的废弃物，留下健康的矿物质水。好生活，从一口干净的纯净水开始。', 1, NULL, NULL, '家电专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (6, 2, '储鲜冷冻灵活变，多门无霜更贴心', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t13015/356/2397552584/605232/46c88e6e/5a5321bcN6a8866f0.png', NULL, 1, '2018-11-07 13:27:21', 100, 1000, 100, NULL, '春节临近，每个家庭都要储备不少食材，但各种食材的保鲜方式与温度不尽相同，而多门风冷冰箱能轻松满足您。它们容积大占地小，拥有多个可以独立调节温度的温区，满足对不同类食材的存放需求，同时省去除霜烦恼，还可以通过温度调节满足您对大冷藏及大冷冻的需求变化，从而带来更好的保鲜冷冻体验，为新年宴请保驾护航。', 1, NULL, NULL, '家电专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (7, 2, '想喝健康水，就用304不锈钢热水壶', 'https://img13.360buyimg.com/mobilecms/s1500x600_jfs/t12541/90/443985343/33603/65d6e884/5a0bb77aNff08550a.jpg!q70.jpg', NULL, 1, '2019-01-29 11:21:55', 100, 1000, 100, NULL, '大冬天的喝一口热水，不仅能够暧身还可以给身体补充足够的水份，但是对于热水壶的购买却是需要慎之又慎，材质不好的热水壶在烧水的过程当中极容易产生对身体不利的有害物，极大影响人们的身体健康。304不锈钢热水壶选用食品级不不锈钢，确保水质安全，烧水健康好水，为您的饮水健康保驾护航。', 1, NULL, NULL, '家电专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (8, 2, '你尽情赖床！早餐“煲”在它身上', 'https://img14.360buyimg.com/mobilecms/s1500x600_jfs/t15949/363/1450937723/89513/7d8c1219/5a531d28N2aaec2a6.jpg!q70.jpg', NULL, 1, '2019-01-29 13:07:13', 100, 1000, 100, NULL, '赖床不想起，饿了的时候想吃饭又要现做等待简直饥肠辘辘让人心烦，所以一款带有预约功能的电饭煲简直不要太贴心，你睡懒觉的时候它已经给你做好了香滑软糯的粥，起床就能享美味是不是很贴心呐。', 1, NULL, NULL, '家电专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (9, 2, '小白变大厨，微波炉为实力加持', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t1/8774/21/11460/38908/5c2cbfcfEdab1ef03/d5800f0f7cf05b38.jpg!q70.jpg', NULL, 1, '2019-01-29 13:08:18', 100, 1000, 100, NULL, '对于厨艺小白而言，没有什么能比掌握好火候更来得困难的了！毕竟烹饪出食物的味道好坏，很大程度上还是对火候的掌控，想要轻松掌握火候，当然少不了一款微波炉的撑场，内设多功能，满足不同的烹饪需求，简单方便易操作，让厨艺小白秒变大师！', 1, NULL, NULL, '家电专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (10, 2, '十秒鲜榨，冬日把爱浓缩成杯果汁', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t13708/126/308291722/542847/26ee6edd/5a07dc72N3252a9e0.png', NULL, 1, '2019-01-29 13:10:02', 100, 1000, 100, NULL, '寒瑟冬日女友不喜欢吃水果，用便携迷你果汁机，撩妹又养胃。一按一转，碾压切割，简单快速制作，压榨出纯原味果汁。一键启动，十秒出汁，保留食物营养，轻轻松松粉碎食物，营养在手，说走就走。', 1, NULL, NULL, '家电专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (11, 3, '饭点未到肚已空？美味饼干先充饥', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t13240/79/443357432/38567/94792c4c/5a0ba054N89388654.jpg!q70.jpg', NULL, 1, '2019-01-29 13:10:45', 100, 1000, 100, NULL, '一上午都把精力集中在工作中，刚闲下来就发现自己已是饥肠辘辘了，可饭点却还没到，怎么办呢？不妨让这些美味饼干先帮你充充饥吧！酥香松脆有营养，每一口都让人回味无穷，既能满足你挑剔的味蕾又能起到果腹效果，快快为自己备上吧！', 1, NULL, NULL, '美食专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (12, 3, '赖床无罪，香酥面包营养又便捷', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t9775/33/1197239610/38547/34899011/59ddbd01N0bd693bb.jpg!q70.jpg', NULL, 1, '2019-01-29 13:11:41', 100, 1000, 100, NULL, '赖床是很多年轻人的通病，特别是秋冬季节，都会恋恋不舍温暖的被窝。对于苦逼的上班族来说，就算再多睡几分钟，还是要起床的，甚至来不及吃早餐。面包营养丰富，能快速饱腹，且携带方便，再搭配一盒牛奶，一顿简单而不失营养的早餐能提供一天的能量，让赖床族多睡几分钟也无妨。', 1, NULL, NULL, '美食专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (13, 3, '夹心饼干，予多重滋味交织舌尖', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t18877/139/652452758/27262/36e6ed6e/5a9d5b6dN327150e8.jpg!q70.jpg', NULL, 1, '2019-01-29 13:12:38', 100, 1000, 100, NULL, '饼干味道香脆可口，深受不少人的青睐。饼干的种类多样，而夹心饼干就是其中一种，相比普通饼干而言，夹心饼干有着更丰富的口感，当肚子空空如也的时候，来一些美味的夹心饼干，既能解馋，又能扛饿。下面就为大家推荐一组好吃的夹心饼干，作为办公室小零食非常不错。', 1, NULL, NULL, '美食专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (14, 4, '户外Party，便携音箱烘气氛', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t17125/265/644948348/42066/6f2dc610/5a9c9da1N9a95ee2c.jpg!q70.jpg', NULL, 1, '2019-01-29 13:13:53', 100, 1000, 100, NULL, '初春的季节，除了户外的各种踏青旅行，在户外开异常Party也是很惬意。户外派对，气氛的烘托肯定不能离开音箱的衬托，选择一款户外的便携音箱，无线蓝牙连接，免去有线的束缚，携带使用更方便。', 1, NULL, NULL, '数码专题', NULL, NULL);
INSERT INTO `cms_subject` VALUES (15, 5, '今冬潮包look，凹出绚丽女王范', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t8365/191/1901440450/575969/c71560c9/59c3144dNe6d8dd2f.png', NULL, 1, '2019-01-29 13:15:12', 100, 1000, 100, NULL, '潮流时尚的美包，搭配潮服，会让你魅力一直在线。因为潮包一直是女性出游扮美的秘籍，它不仅能够帮你收纳日常小物件，还能让你解放双手，这里推荐的时尚美包，随意搭配一件服饰，都可以让你潮范十足，凹出绚丽女王范。', 1, NULL, NULL, '服饰专题', NULL, NULL);

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(0) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES (1, '精选专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jingxuan.png', 3, 1, 100, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (2, '家电专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', 7, 1, 0, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (3, '美食专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_meishi.png', 3, 1, 0, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (4, '数码专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', 1, 1, 0, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (5, '服饰专题', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', 1, 1, 0, NULL, NULL);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(0) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(0) NULL DEFAULT NULL,
  `product_id` bigint(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 27, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 28, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 29, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 31, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (7, 2, 35, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (29, 2, 36, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (30, 2, 32, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (31, 3, 33, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (38, 3, 34, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (41, 2, 30, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (42, 1, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (43, 2, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (44, 3, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (45, 4, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (46, 5, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (47, 6, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (48, 7, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (49, 8, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (50, 9, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (51, 10, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (52, 11, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (53, 12, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (54, 13, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (55, 14, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (56, 15, 26, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (58, 1, 43, NULL, NULL);
INSERT INTO `cms_subject_product_relation` VALUES (63, 1, 42, NULL, NULL);

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(0) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `attend_count` int(0) NULL DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(0) NULL DEFAULT NULL COMMENT '关注人数',
  `read_count` int(0) NULL DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '话题内容',
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(0) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(0) NULL DEFAULT NULL,
  `sort` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_id` bigint(0) NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
