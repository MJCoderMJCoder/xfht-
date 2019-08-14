/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50559
 Source Host           : localhost:3306
 Source Schema         : mysql

 Target Server Type    : MySQL
 Target Server Version : 50559
 File Encoding         : 65001

 Date: 26/04/2018 19:30:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (891);
INSERT INTO `hibernate_sequence` VALUES (891);
INSERT INTO `hibernate_sequence` VALUES (891);
INSERT INTO `hibernate_sequence` VALUES (891);
INSERT INTO `hibernate_sequence` VALUES (891);

-- ----------------------------
-- Table structure for hibernate_sequences
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences`  (
  `pk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hibernate_sequences
-- ----------------------------
INSERT INTO `hibernate_sequences` VALUES ('alarm', 13760);
INSERT INTO `hibernate_sequences` VALUES ('cam_db', 10351);
INSERT INTO `hibernate_sequences` VALUES ('department', 10025);
INSERT INTO `hibernate_sequences` VALUES ('feature', 869);
INSERT INTO `hibernate_sequences` VALUES ('match_result', 10014);
INSERT INTO `hibernate_sequences` VALUES ('oplog', 86);
INSERT INTO `hibernate_sequences` VALUES ('org', 100151);
INSERT INTO `hibernate_sequences` VALUES ('permission', 10017);
INSERT INTO `hibernate_sequences` VALUES ('person', 101101);
INSERT INTO `hibernate_sequences` VALUES ('person_status', 101101);
INSERT INTO `hibernate_sequences` VALUES ('role', 2);
INSERT INTO `hibernate_sequences` VALUES ('server', 3);
INSERT INTO `hibernate_sequences` VALUES ('surveillance', 10017);

-- ----------------------------
-- Table structure for jc_acquisition
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition`;
CREATE TABLE `jc_acquisition`  (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT 0 COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT 0 COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT 0 COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT 0 COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '采集列表',
  `dynamic_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL DEFAULT 0 COMMENT '队列',
  `repeat_check_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否采集图片',
  `content_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布时间格式',
  `origin_appoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`acquisition_id`) USING BTREE,
  INDEX `fk_jc_acquisition_channel`(`channel_id`) USING BTREE,
  INDEX `fk_jc_acquisition_contenttype`(`type_id`) USING BTREE,
  INDEX `fk_jc_acquisition_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_acquisition_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_acquisition_history
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_history`;
CREATE TABLE `jc_acquisition_history`  (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` int(11) DEFAULT NULL COMMENT '采集源',
  `content_id` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`history_id`) USING BTREE,
  INDEX `fk_acquisition_history_acquisition`(`acquisition_id`) USING BTREE,
  INDEX `FK44ED01DC56F11B69`(`content_id`) USING BTREE,
  CONSTRAINT `FK44ED01DC56F11B69` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集历史记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_acquisition_temp
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_temp`;
CREATE TABLE `jc_acquisition_temp`  (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `finish_percent` int(3) NOT NULL DEFAULT 0 COMMENT '百分比',
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT 0 COMMENT '顺序',
  PRIMARY KEY (`temp_id`) USING BTREE,
  INDEX `fk_jc_temp_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集进度临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_advertising
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising`;
CREATE TABLE `jc_advertising`  (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告名称',
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告类型',
  `ad_code` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT 1 COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`) USING BTREE,
  INDEX `fk_jc_advertising_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_space_advertising`(`adspace_id`) USING BTREE,
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS广告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_advertising
-- ----------------------------
INSERT INTO `jc_advertising` VALUES (1, 1, 1, 'banner', 'image', NULL, 1, 127, 0, NULL, NULL, '1');
INSERT INTO `jc_advertising` VALUES (2, 2, 1, '通栏广告1', 'image', NULL, 1, 123, 2, NULL, NULL, '1');
INSERT INTO `jc_advertising` VALUES (3, 3, 1, '视频广告上', 'image', NULL, 1, 0, 0, NULL, NULL, '1');
INSERT INTO `jc_advertising` VALUES (4, 4, 1, '视频广告下', 'image', NULL, 1, 0, 0, NULL, NULL, '1');
INSERT INTO `jc_advertising` VALUES (5, 5, 1, '留言板本周热点广告', 'image', NULL, 1, 0, 0, NULL, NULL, '1');
INSERT INTO `jc_advertising` VALUES (6, 1, 1, '测试', 'image', NULL, 1, 0, 0, NULL, NULL, '1');

-- ----------------------------
-- Table structure for jc_advertising_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_attr`;
CREATE TABLE `jc_advertising_attr`  (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_params_advertising`(`advertising_id`) USING BTREE,
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS广告属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_advertising_attr
-- ----------------------------
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_url', '/DHT1/u/cms/www/201512/23134208xvf8.jpg');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_width', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_height', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_url', '/DHT1/u/cms/www/201512/23134208xvf8.jpg');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_width', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_height', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_url', '/DHT1/u/cms/www/201512/23134208xvf8.jpg');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_width', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_height', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_url', '/DHT1/u/cms/www/201512/23134208xvf8.jpg');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_width', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_height', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_url', '/DHT1/u/cms/www/201512/23134208xvf8.jpg');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_width', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_height', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_title', '查看JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_url', '/r/cms/www/red/img/banner.gif');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_width', '735');
INSERT INTO `jc_advertising_attr` VALUES (1, 'image_height', '70');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_title', 'JEECMS官方网站');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_url', '/r/cms/www/red/img/banner1.jpg');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_link', 'http://www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_width', '960');
INSERT INTO `jc_advertising_attr` VALUES (2, 'image_height', '60');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_height', '89');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_url', '/u/cms/www/201112/17144805im1p.jpg');
INSERT INTO `jc_advertising_attr` VALUES (3, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_height', '90');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_link', 'http://');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_url', '/u/cms/www/201112/17145028j3bj.jpg');
INSERT INTO `jc_advertising_attr` VALUES (4, 'image_width', '980');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_height', '109');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_link', 'http://3x.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_url', '/u/cms/www/201112/18155751wi1k.gif');
INSERT INTO `jc_advertising_attr` VALUES (5, 'image_width', '215');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_url', '/DHT1/u/cms/www/201512/23134208xvf8.jpg');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_width', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_height', '100');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (6, 'image_link', 'http://');

-- ----------------------------
-- Table structure for jc_advertising_space
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_space`;
CREATE TABLE `jc_advertising_space`  (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`) USING BTREE,
  INDEX `fk_jc_adspace_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS广告版位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_advertising_space
-- ----------------------------
INSERT INTO `jc_advertising_space` VALUES (1, 1, '页头banner', '全站页头banner', '1');
INSERT INTO `jc_advertising_space` VALUES (2, 1, '通栏广告', '页面中间通栏广告', '1');
INSERT INTO `jc_advertising_space` VALUES (3, 1, '视频广告上', NULL, '1');
INSERT INTO `jc_advertising_space` VALUES (4, 1, '视频广告下', NULL, '1');
INSERT INTO `jc_advertising_space` VALUES (5, 1, '留言板本周热点广告', NULL, '1');

-- ----------------------------
-- Table structure for jc_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel`;
CREATE TABLE `jc_channel`  (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT 1 COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT 2 COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `workflow_id` int(11) DEFAULT NULL COMMENT '工作流id',
  PRIMARY KEY (`channel_id`) USING BTREE,
  INDEX `fk_jc_channel_model`(`model_id`) USING BTREE,
  INDEX `fk_jc_channel_parent`(`parent_id`) USING BTREE,
  INDEX `fk_jc_channel_site`(`site_id`) USING BTREE,
  INDEX `FK357AE7FDDF326A65`(`workflow_id`) USING BTREE,
  CONSTRAINT `FK357AE7FDDF326A65` FOREIGN KEY (`workflow_id`) REFERENCES `jc_workflow` (`workflow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel
-- ----------------------------
INSERT INTO `jc_channel` VALUES (100, 1, 1, NULL, 'picnews', 1, 2, 1, 1, 1, NULL);
INSERT INTO `jc_channel` VALUES (101, 1, 1, NULL, 'newscenter', 3, 4, 2, 1, 1, NULL);
INSERT INTO `jc_channel` VALUES (102, 1, 1, NULL, 'zcfg', 5, 6, 3, 1, 1, NULL);
INSERT INTO `jc_channel` VALUES (103, 1, 1, NULL, 'notice', 7, 8, 4, 1, 1, NULL);
INSERT INTO `jc_channel` VALUES (104, 1, 1, NULL, 'online', 9, 10, 5, 1, 1, NULL);
INSERT INTO `jc_channel` VALUES (107, 3, 1, NULL, 'wsxf', 11, 12, 6, 1, 1, NULL);

-- ----------------------------
-- Table structure for jc_channel_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_attr`;
CREATE TABLE `jc_channel_attr`  (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_channel`(`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目扩展属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_channel_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_count`;
CREATE TABLE `jc_channel_count`  (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT 0 COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT 0 COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT 0 COMMENT '日访问数',
  PRIMARY KEY (`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_count_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目访问量计数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_count
-- ----------------------------
INSERT INTO `jc_channel_count` VALUES (100, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (101, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (102, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (103, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (104, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (107, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jc_channel_depart_control
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_depart_control`;
CREATE TABLE `jc_channel_depart_control`  (
  `channel_id` int(11) NOT NULL DEFAULT 0,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`channel_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `jc_channel_depart_control_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_channel_depart_control_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS部门栏目数据权限关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_channel_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_department`;
CREATE TABLE `jc_channel_department`  (
  `channel_id` int(11) NOT NULL DEFAULT 0,
  `department_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`channel_id`, `department_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `jc_channel_department_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_channel_department_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目部门关联表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_channel_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_ext`;
CREATE TABLE `jc_channel_ext`  (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT 2 COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT 20 COMMENT '每页多少条记录',
  `channel_rule` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT 139 COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT 139 COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT 310 COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT 310 COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT 0 COMMENT '评论(0:匿名;1:会员;2:关闭)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否新窗口打开',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分享(true:开放;false:关闭)',
  `allow_score` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评分(true:开放;false:关闭)',
  `tpl_mobile_channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机栏目页模板',
  PRIMARY KEY (`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目内容表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_ext
-- ----------------------------
INSERT INTO `jc_channel_ext` VALUES (100, '图片新闻', NULL, NULL, '1', '1', '0', '0', 10, NULL, NULL, NULL, '/channel/news.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_channel_ext` VALUES (101, '新闻中心', NULL, NULL, '1', '1', '0', '0', 10, NULL, NULL, NULL, '/channel/news.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_channel_ext` VALUES (102, '政策法规', NULL, NULL, '1', '1', '0', '0', 10, NULL, NULL, NULL, '/channel/news.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_channel_ext` VALUES (103, '信访须知', NULL, NULL, '1', '1', '0', '0', 10, NULL, NULL, NULL, '/channel/news_notice1.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_channel_ext` VALUES (104, '网上信访', NULL, NULL, '1', '1', '0', '0', 10, NULL, NULL, NULL, '/channel/news_notice2.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_channel_ext` VALUES (107, '信访查询', NULL, NULL, '1', '1', '0', '0', 10, NULL, NULL, NULL, '/channel/Letter_AndVisit_Search.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, NULL);

-- ----------------------------
-- Table structure for jc_channel_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_model`;
CREATE TABLE `jc_channel_model`  (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容模板',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排序',
  `tpl_mobile_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '栏目可选内容模型表;',
  PRIMARY KEY (`channel_id`, `priority`) USING BTREE,
  INDEX `fk_jc_model_channel_m`(`model_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目可选内容模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_model
-- ----------------------------
INSERT INTO `jc_channel_model` VALUES (107, 3, '/WEB-INF/t/cms/www/dht/content/Letter_AndVisit.html', 0, '/WEB-INF/t/cms/www/dht/content/Letter_AndVisit.html');

-- ----------------------------
-- Table structure for jc_channel_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_site`;
CREATE TABLE `jc_channel_site`  (
  `channel_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `channel_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `is_display` bit(1) DEFAULT NULL,
  PRIMARY KEY (`channel_site_id`) USING BTREE,
  INDEX `FKB6826491A691AE5`(`site_id`) USING BTREE,
  INDEX `FKB682649C76AD729`(`channel_id`) USING BTREE,
  CONSTRAINT `FKB6826491A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKB682649C76AD729` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_site
-- ----------------------------
INSERT INTO `jc_channel_site` VALUES (4, 1, 100, '图片新闻', 1, b'1');
INSERT INTO `jc_channel_site` VALUES (5, 1, 101, '新闻中心', 2, b'1');
INSERT INTO `jc_channel_site` VALUES (6, 1, 102, '政策法规', 3, b'1');
INSERT INTO `jc_channel_site` VALUES (7, 1, 103, '信访须知', 4, b'1');
INSERT INTO `jc_channel_site` VALUES (8, 1, 104, '网上信访', 5, b'1');
INSERT INTO `jc_channel_site` VALUES (11, 1, 107, '信访查询', 6, b'1');

-- ----------------------------
-- Table structure for jc_channel_site_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_site_count`;
CREATE TABLE `jc_channel_site_count`  (
  `JC_CHANNEL_SITE_COUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `views` int(11) NOT NULL,
  `views_month` int(11) NOT NULL,
  `views_week` int(11) NOT NULL,
  `views_day` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`JC_CHANNEL_SITE_COUNT_ID`) USING BTREE,
  INDEX `FK7C5A0B991A691AE5`(`site_id`) USING BTREE,
  INDEX `FK7C5A0B99C76AD729`(`channel_id`) USING BTREE,
  CONSTRAINT `FK7C5A0B991A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK7C5A0B99C76AD729` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_channel_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_txt`;
CREATE TABLE `jc_channel_txt`  (
  `channel_id` int(11) NOT NULL,
  `txt` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '栏目内容',
  `txt1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '扩展内容1',
  `txt2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '扩展内容2',
  `txt3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目文本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_txt
-- ----------------------------
INSERT INTO `jc_channel_txt` VALUES (103, '<p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">一、本网站受理举报的范围&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">1、按照《中国共产党纪律检查机关控告申诉工作条例》的相关规定，应当由中共哈尔滨市纪委受理的党员、党组织违反党章和其他党内法规，违反党的路线、方针、政策和决议，利用职权谋取私利和其他败坏党风行为的检举、控告。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">2、按照《中华人民共和国行政监察法》相关规定，应当由哈尔滨市监察局受理的国家行政机关及其工作人员和国家行政机关任命的其他人员违反国家法律、法规、政策和决定命令以及违反政纪行为的检举、控告。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">二、本网站受理举报的办理&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">根据被检举、控告人的职务，实行分级办理，有关具体规定《中国共产党纪律检查机关控告申诉工作条例》和《中华人民共和国行政监察法》。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">三、检举、控告人应据实检举、控告，不得捏造事实、制造假证、诬告陷害他人。对借检举、控告诬告陷害他人的，依照有关规定严肃处理；构成犯罪的，移送司法机关依法处理。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">四、注意事项&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">1、网上举报只是反映问题的一种途径，还可通过其他形式进行举报。通信地址：哈尔滨市道里区兆麟街123号市纪委信访室、市监察局举报中心（邮政编码：150010）；举报电话：（0451）12388-1；短信举报电话：18746012388。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">2、提倡署实名举报，署实名举报的请详细填写联系方式。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">3、请如实填写举报表单中的各栏目。填写&quot;举报内容&quot;一栏时，力求详尽，对违纪违法行为发生的时间、地点、主要证据、涉及人员等要交代明确。标有&quot;*&quot;的为必填项目。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">4、为了保障举报人的合法权益,限制恶意的重复举报和垃圾信件,提高网上举报的运行效益,本系统限制每台计算机每天只能提交3封信件。</span></p>', NULL, NULL, NULL);
INSERT INTO `jc_channel_txt` VALUES (104, '<p><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">一、本网站受理举报的范围&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">1、按照《中国共产党纪律检查机关控告申诉工作条例》的相关规定，应当由中共哈尔滨市纪委受理的党员、党组织违反党章和其他党内法规，违反党的路线、方针、政策和决议，利用职权谋取私利和其他败坏党风行为的检举、控告。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">2、按照《中华人民共和国行政监察法》相关规定，应当由哈尔滨市监察局受理的国家行政机关及其工作人员和国家行政机关任命的其他人员违反国家法律、法规、政策和决定命令以及违反政纪行为的检举、控告。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">二、本网站受理举报的办理&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">根据被检举、控告人的职务，实行分级办理，有关具体规定《中国共产党纪律检查机关控告申诉工作条例》和《中华人民共和国行政监察法》。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">三、检举、控告人应据实检举、控告，不得捏造事实、制造假证、诬告陷害他人。对借检举、控告诬告陷害他人的，依照有关规定严肃处理；构成犯罪的，移送司法机关依法处理。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">四、注意事项&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">1、网上举报只是反映问题的一种途径，还可通过其他形式进行举报。通信地址：哈尔滨市道里区兆麟街123号市纪委信访室、市监察局举报中心（邮政编码：150010）；举报电话：（0451）12388-1；短信举报电话：18746012388。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">2、提倡署实名举报，署实名举报的请详细填写联系方式。&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">3、请如实填写举报表单中的各栏目。填写&quot;举报内容&quot;一栏时，力求详尽，对违纪违法行为发生的时间、地点、主要证据、涉及人员等要交代明确。标有&quot;*&quot;的为必填项目。</span><br style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 14px; background-color: rgb(255, 255, 255);\">4、为了保障举报人的合法权益,限制恶意的重复举报和垃圾信件,提高网上举报的运行效益,本系统限制每台计算机每天只能提交3封信件。</span></p>', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_channel_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_user`;
CREATE TABLE `jc_channel_user`  (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `user_id`) USING BTREE,
  INDEX `fk_jc_channel_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目用户关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_user
-- ----------------------------
INSERT INTO `jc_channel_user` VALUES (100, 102);
INSERT INTO `jc_channel_user` VALUES (101, 102);
INSERT INTO `jc_channel_user` VALUES (102, 102);
INSERT INTO `jc_channel_user` VALUES (103, 102);
INSERT INTO `jc_channel_user` VALUES (104, 102);

-- ----------------------------
-- Table structure for jc_chnl_group_contri
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_contri`;
CREATE TABLE `jc_chnl_group_contri`  (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `group_id`) USING BTREE,
  INDEX `fk_jc_channel_group_c`(`group_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目投稿会员组关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_chnl_group_contri
-- ----------------------------
INSERT INTO `jc_chnl_group_contri` VALUES (100, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (101, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (102, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (103, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (104, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (107, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (100, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (101, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (102, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (103, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (104, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (107, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (100, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (101, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (102, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (103, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (104, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (107, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (100, 4);
INSERT INTO `jc_chnl_group_contri` VALUES (101, 4);
INSERT INTO `jc_chnl_group_contri` VALUES (102, 4);
INSERT INTO `jc_chnl_group_contri` VALUES (103, 4);
INSERT INTO `jc_chnl_group_contri` VALUES (104, 4);
INSERT INTO `jc_chnl_group_contri` VALUES (107, 4);
INSERT INTO `jc_chnl_group_contri` VALUES (100, 5);
INSERT INTO `jc_chnl_group_contri` VALUES (101, 5);
INSERT INTO `jc_chnl_group_contri` VALUES (102, 5);
INSERT INTO `jc_chnl_group_contri` VALUES (103, 5);
INSERT INTO `jc_chnl_group_contri` VALUES (104, 5);
INSERT INTO `jc_chnl_group_contri` VALUES (107, 5);
INSERT INTO `jc_chnl_group_contri` VALUES (100, 6);
INSERT INTO `jc_chnl_group_contri` VALUES (101, 6);
INSERT INTO `jc_chnl_group_contri` VALUES (102, 6);
INSERT INTO `jc_chnl_group_contri` VALUES (103, 6);
INSERT INTO `jc_chnl_group_contri` VALUES (104, 6);
INSERT INTO `jc_chnl_group_contri` VALUES (107, 6);

-- ----------------------------
-- Table structure for jc_chnl_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_view`;
CREATE TABLE `jc_chnl_group_view`  (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `group_id`) USING BTREE,
  INDEX `fk_jc_channel_group_v`(`group_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目浏览会员组关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_comment
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment`;
CREATE TABLE `jc_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT 0 COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT 0 COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否审核',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `fk_jc_comment_content`(`content_id`) USING BTREE,
  INDEX `fk_jc_comment_reply`(`reply_user_id`) USING BTREE,
  INDEX `fk_jc_comment_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_comment_user`(`comment_user_id`) USING BTREE,
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_comment_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment_ext`;
CREATE TABLE `jc_comment_ext`  (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  INDEX `fk_jc_ext_comment`(`comment_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS评论扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config`  (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上传附件至数据库',
  `def_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT 1 COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT 120 COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT 120 COMMENT '图片最小高度',
  `mark_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT 20 COMMENT '文字水印大小',
  `mark_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT 50 COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT 1 COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT 0 COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT 0 COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT 12 COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱发件人',
  `email_validate` tinyint(1) DEFAULT 0 COMMENT '开启邮箱验证',
  `view_only_checked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '只有终审才能浏览内容页',
  `inside_site` int(11) DEFAULT NULL COMMENT '内网（通过站点路径区分站点）',
  `office_home` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'openoffice安装目录',
  `office_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'openoffice端口',
  `swftools_home` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'swftoos安装目录',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_config
-- ----------------------------
INSERT INTO `jc_config` VALUES (1, NULL, NULL, 8080, '/dbfile.svl?n=', 0, '/r/cms/www/no_picture.gif', '/login.jspx', NULL, 1, 120, 120, '/r/cms/www/watermark.png', 'www.jeecms.com', 20, '#FF0000', 50, 1, 0, 0, '2018-04-18', '2018-04-18 14:04:23', 'jeecms', 12, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 'D:/SWFTools/pdf2swf', '8810', '0');

-- ----------------------------
-- Table structure for jc_config_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr`  (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_config`(`config_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS配置属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_config_attr
-- ----------------------------
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sso_1', 'http://bbs.cmscms.com/jeebbs4/sso/authenticate.jspx');
INSERT INTO `jc_config_attr` VALUES (1, 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES (1, 'day', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sso_1', 'http://bbs.cmscms.com/jeebbs4/sso/authenticate.jspx');
INSERT INTO `jc_config_attr` VALUES (1, 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES (1, 'day', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sso_1', 'http://bbs.cmscms.com/jeebbs4/sso/authenticate.jspx');
INSERT INTO `jc_config_attr` VALUES (1, 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES (1, 'day', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sso_1', 'http://bbs.cmscms.com/jeebbs4/sso/authenticate.jspx');
INSERT INTO `jc_config_attr` VALUES (1, 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES (1, 'day', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sso_1', 'http://bbs.cmscms.com/jeebbs4/sso/authenticate.jspx');
INSERT INTO `jc_config_attr` VALUES (1, 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES (1, 'day', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sso_1', 'http://bbs.cmscms.com/jeebbs4/sso/authenticate.jspx');
INSERT INTO `jc_config_attr` VALUES (1, 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES (1, 'day', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'v6');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'sinaID', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboKey', NULL);
INSERT INTO `jc_config_attr` VALUES (1, 'qqID', NULL);

-- ----------------------------
-- Table structure for jc_config_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_item`;
CREATE TABLE `jc_config_item`  (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段',
  `item_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 70 COMMENT '排列顺序',
  `def_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT 1 COMMENT '数据类型 \"1\":\"字符串文本\",\"2\":\"整型文本\",\"3\":\"浮点型文本\",\"4\":\"文本区\",\"5\":\"日期\",\"6\":\"下拉列表\",\"7\":\"复选框\",\"8\":\"单选框\"',
  `is_required` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否必填',
  `category` int(11) NOT NULL DEFAULT 1 COMMENT '模型项目所属分类（1注册模型）',
  PRIMARY KEY (`modelitem_id`) USING BTREE,
  INDEX `fk_jc_item_config`(`config_id`) USING BTREE,
  CONSTRAINT `fk_jc_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS配置模型项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content
-- ----------------------------
DROP TABLE IF EXISTS `jc_content`;
CREATE TABLE `jc_content`  (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站；4:投稿)',
  `views_day` int(11) NOT NULL DEFAULT 0 COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日顶数',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '得分',
  PRIMARY KEY (`content_id`) USING BTREE,
  INDEX `fk_jc_content_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_content_type`(`type_id`) USING BTREE,
  INDEX `fk_jc_content_user`(`user_id`) USING BTREE,
  INDEX `fk_jc_contentchannel`(`channel_id`) USING BTREE,
  INDEX `fk_jc_content_model`(`model_id`) USING BTREE,
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 853 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content
-- ----------------------------
INSERT INTO `jc_content` VALUES (833, 100, 1, 1, 1, 1, '2018-01-13 11:02:17', 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (836, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (837, 102, 1, 1, 1, 1, '2018-01-13 12:37:47', 0, 0, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (838, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (839, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (840, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (841, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (842, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (843, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (844, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (845, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (846, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (847, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (848, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (849, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (850, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (851, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (852, 101, 1, 1, 1, 1, '2018-01-13 12:36:20', 0, 0, 0, 2, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jc_content_attachment
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attachment`;
CREATE TABLE `jc_content_attachment`  (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件名称',
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  INDEX `fk_jc_attachment_content`(`content_id`) USING BTREE,
  CONSTRAINT `jc_content_attachment_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_attachment
-- ----------------------------
INSERT INTO `jc_content_attachment` VALUES (833, 0, '/u/cms/www/201801/16145133uf33.png', '弹出层.png', NULL, 0);
INSERT INTO `jc_content_attachment` VALUES (833, 1, '/u/cms/www/201801/16145134d4xo.png', '分配功能室.png', NULL, 0);
INSERT INTO `jc_content_attachment` VALUES (833, 2, '/u/cms/www/201801/1615282189uu.png', '统计样例.png', NULL, 0);

-- ----------------------------
-- Table structure for jc_content_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attr`;
CREATE TABLE `jc_content_attr`  (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容扩展属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_channel`;
CREATE TABLE `jc_content_channel`  (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `content_id`) USING BTREE,
  INDEX `fk_jc_channel_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容栏目关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_channel
-- ----------------------------
INSERT INTO `jc_content_channel` VALUES (100, 833);
INSERT INTO `jc_content_channel` VALUES (101, 836);
INSERT INTO `jc_content_channel` VALUES (102, 837);
INSERT INTO `jc_content_channel` VALUES (101, 838);
INSERT INTO `jc_content_channel` VALUES (101, 839);
INSERT INTO `jc_content_channel` VALUES (101, 840);
INSERT INTO `jc_content_channel` VALUES (101, 841);
INSERT INTO `jc_content_channel` VALUES (101, 842);
INSERT INTO `jc_content_channel` VALUES (101, 843);
INSERT INTO `jc_content_channel` VALUES (101, 844);
INSERT INTO `jc_content_channel` VALUES (101, 845);
INSERT INTO `jc_content_channel` VALUES (101, 846);
INSERT INTO `jc_content_channel` VALUES (101, 847);
INSERT INTO `jc_content_channel` VALUES (101, 848);
INSERT INTO `jc_content_channel` VALUES (101, 849);
INSERT INTO `jc_content_channel` VALUES (101, 850);
INSERT INTO `jc_content_channel` VALUES (101, 851);
INSERT INTO `jc_content_channel` VALUES (101, 852);

-- ----------------------------
-- Table structure for jc_content_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_check`;
CREATE TABLE `jc_content_check`  (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核步数',
  `check_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否退回',
  `reviewer` int(11) DEFAULT NULL COMMENT '终审者',
  `check_date` datetime DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`content_id`) USING BTREE,
  INDEX `fk_jc_content_check_user`(`reviewer`) USING BTREE,
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容审核信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_check
-- ----------------------------
INSERT INTO `jc_content_check` VALUES (833, -1, '', 1, 1, '2018-01-16 14:52:13');
INSERT INTO `jc_content_check` VALUES (836, -1, NULL, 0, 1, '2018-01-24 09:44:43');
INSERT INTO `jc_content_check` VALUES (837, -1, '', 1, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (838, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (839, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (840, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (841, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (842, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (843, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (844, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (845, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (846, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (847, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (848, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (849, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (850, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (851, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (852, 3, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for jc_content_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_count`;
CREATE TABLE `jc_content_count`  (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT 0 COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT 0 COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT 0 COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT 0 COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT 0 COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT 0 COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT 0 COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT 0 COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT 0 COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT 0 COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT 0 COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT 0 COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT 0 COMMENT '总踩数',
  PRIMARY KEY (`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容计数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_count
-- ----------------------------
INSERT INTO `jc_content_count` VALUES (833, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (836, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (837, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (839, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (840, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (841, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (842, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (844, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (846, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (847, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (850, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (852, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jc_content_doc
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_doc`;
CREATE TABLE `jc_content_doc`  (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `avg_score` float(11, 2) DEFAULT NULL COMMENT '平均得分',
  `doc_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文档路径',
  `down_need` int(11) DEFAULT NULL COMMENT '下载需要财富',
  `file_suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文档文件格式',
  `grain` int(11) DEFAULT NULL COMMENT '财富收益',
  `is_open` int(11) DEFAULT NULL COMMENT '是否开放',
  `swf_num` int(11) DEFAULT NULL COMMENT 'swf文件总量',
  `swf_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '转换的swf路径',
  PRIMARY KEY (`content_id`) USING BTREE,
  CONSTRAINT `jc_content_doc_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文库相关;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_ext`;
CREATE TABLE `jc_content_ext`  (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `short_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否加粗',
  `title_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT 1 COMMENT '需要重新生成静态页',
  `pigeonhole_date` date DEFAULT NULL COMMENT '归档日期',
  `toplevel_date` date DEFAULT NULL COMMENT '固顶到期日期',
  `tpl_mobile_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机内容页模板',
  PRIMARY KEY (`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_ext
-- ----------------------------
INSERT INTO `jc_content_ext` VALUES (833, '图片新闻测试', NULL, NULL, NULL, NULL, '图片新闻', '2018-01-13 11:02:17', NULL, NULL, NULL, 0, NULL, NULL, '/u/cms/www/201801/13110212jdqm.png', NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 1, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (836, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', '/u/cms/www/201801/24094403ckxu.mp4', 'FLV', NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (837, '政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规', NULL, NULL, NULL, NULL, '政策法规', '2018-01-13 12:37:47', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 1, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (838, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (839, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (840, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (841, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (842, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (843, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (844, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (845, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (846, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (847, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (848, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (849, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (850, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (851, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (852, '新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心', NULL, NULL, NULL, NULL, '1212', '2018-01-13 12:36:20', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '/WEB-INF/t/cms/www/dht/content/news.html', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_content_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_group_view`;
CREATE TABLE `jc_content_group_view`  (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`, `group_id`) USING BTREE,
  INDEX `fk_jc_content_group_v`(`group_id`) USING BTREE,
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容浏览会员组关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_picture
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_picture`;
CREATE TABLE `jc_content_picture`  (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`, `priority`) USING BTREE,
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_share_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_share_check`;
CREATE TABLE `jc_content_share_check`  (
  `channel_id` int(11) DEFAULT NULL COMMENT '共享栏目',
  `check_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审核意见',
  `check_status` int(11) DEFAULT NULL COMMENT '审核状态 0待审核 1审核通过 2推送',
  `content_id` int(11) DEFAULT NULL COMMENT '共享内容',
  `share_check_id` int(11) NOT NULL AUTO_INCREMENT,
  `share_valid` int(11) DEFAULT NULL COMMENT '共享有效性',
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`share_check_id`) USING BTREE,
  INDEX `channel_id`(`channel_id`) USING BTREE,
  INDEX `content_id`(`content_id`) USING BTREE,
  INDEX `FKB1545DDC1A691AE5`(`site_id`) USING BTREE,
  CONSTRAINT `FKB1545DDC1A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_content_share_check_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_content_share_check_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS共享内容审核信息表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_tag
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_tag`;
CREATE TABLE `jc_content_tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT 1 COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `ak_tag_name`(`tag_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容TAG表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_tag
-- ----------------------------
INSERT INTO `jc_content_tag` VALUES (412, '图片', 1);
INSERT INTO `jc_content_tag` VALUES (413, '新闻', 1);
INSERT INTO `jc_content_tag` VALUES (414, '测试', 1);
INSERT INTO `jc_content_tag` VALUES (415, '新闻中心', 32);
INSERT INTO `jc_content_tag` VALUES (416, '政策法规', 2);

-- ----------------------------
-- Table structure for jc_content_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_topic`;
CREATE TABLE `jc_content_topic`  (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`, `topic_id`) USING BTREE,
  INDEX `fk_jc_content_topic`(`topic_id`) USING BTREE,
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS专题内容关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_txt`;
CREATE TABLE `jc_content_txt`  (
  `content_id` int(11) NOT NULL,
  `txt` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '文章内容',
  `txt1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '扩展内容1',
  `txt2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '扩展内容2',
  `txt3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容文本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_txt
-- ----------------------------
INSERT INTO `jc_content_txt` VALUES (833, '<p>图片新闻</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (836, '<p>121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来121212撒开绿灯HFLKLF回来</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (837, '<p>政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (838, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (839, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (840, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (841, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (842, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (843, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (844, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (845, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (846, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (847, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (848, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (849, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (850, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (851, '<p>121212</p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (852, '<p>121212</p>', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_content_type
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_type`;
CREATE TABLE `jc_content_type`  (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_type
-- ----------------------------
INSERT INTO `jc_content_type` VALUES (1, '普通', 100, 100, 1, 0);
INSERT INTO `jc_content_type` VALUES (2, '图文', 143, 98, 1, 0);
INSERT INTO `jc_content_type` VALUES (3, '焦点', 280, 200, 1, 0);
INSERT INTO `jc_content_type` VALUES (4, '头条', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jc_contenttag
-- ----------------------------
DROP TABLE IF EXISTS `jc_contenttag`;
CREATE TABLE `jc_contenttag`  (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  INDEX `fk_jc_content_tag`(`tag_id`) USING BTREE,
  INDEX `fk_jc_tag_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容标签关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_contenttag
-- ----------------------------
INSERT INTO `jc_contenttag` VALUES (833, 412, 0);
INSERT INTO `jc_contenttag` VALUES (833, 413, 1);
INSERT INTO `jc_contenttag` VALUES (833, 414, 2);
INSERT INTO `jc_contenttag` VALUES (836, 415, 0);
INSERT INTO `jc_contenttag` VALUES (836, 415, 1);
INSERT INTO `jc_contenttag` VALUES (837, 416, 0);
INSERT INTO `jc_contenttag` VALUES (837, 416, 1);
INSERT INTO `jc_contenttag` VALUES (838, 415, 0);
INSERT INTO `jc_contenttag` VALUES (838, 415, 1);
INSERT INTO `jc_contenttag` VALUES (839, 415, 0);
INSERT INTO `jc_contenttag` VALUES (839, 415, 1);
INSERT INTO `jc_contenttag` VALUES (840, 415, 0);
INSERT INTO `jc_contenttag` VALUES (840, 415, 1);
INSERT INTO `jc_contenttag` VALUES (841, 415, 0);
INSERT INTO `jc_contenttag` VALUES (841, 415, 1);
INSERT INTO `jc_contenttag` VALUES (842, 415, 0);
INSERT INTO `jc_contenttag` VALUES (842, 415, 1);
INSERT INTO `jc_contenttag` VALUES (843, 415, 0);
INSERT INTO `jc_contenttag` VALUES (843, 415, 1);
INSERT INTO `jc_contenttag` VALUES (844, 415, 0);
INSERT INTO `jc_contenttag` VALUES (844, 415, 1);
INSERT INTO `jc_contenttag` VALUES (845, 415, 0);
INSERT INTO `jc_contenttag` VALUES (845, 415, 1);
INSERT INTO `jc_contenttag` VALUES (846, 415, 0);
INSERT INTO `jc_contenttag` VALUES (846, 415, 1);
INSERT INTO `jc_contenttag` VALUES (847, 415, 0);
INSERT INTO `jc_contenttag` VALUES (847, 415, 1);
INSERT INTO `jc_contenttag` VALUES (848, 415, 0);
INSERT INTO `jc_contenttag` VALUES (848, 415, 1);
INSERT INTO `jc_contenttag` VALUES (849, 415, 0);
INSERT INTO `jc_contenttag` VALUES (849, 415, 1);
INSERT INTO `jc_contenttag` VALUES (850, 415, 0);
INSERT INTO `jc_contenttag` VALUES (850, 415, 1);
INSERT INTO `jc_contenttag` VALUES (851, 415, 0);
INSERT INTO `jc_contenttag` VALUES (851, 415, 1);
INSERT INTO `jc_contenttag` VALUES (852, 415, 0);
INSERT INTO `jc_contenttag` VALUES (852, 415, 1);

-- ----------------------------
-- Table structure for jc_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_department`;
CREATE TABLE `jc_department`  (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级部门ID',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `site_id` int(11) DEFAULT NULL COMMENT '站点',
  `weights` int(11) DEFAULT NULL COMMENT '权重(值越大，级别越高)',
  PRIMARY KEY (`depart_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `FK2F603E181A691AE5`(`site_id`) USING BTREE,
  CONSTRAINT `FK2F603E181A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_department_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `jc_department` (`depart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_department
-- ----------------------------
INSERT INTO `jc_department` VALUES (1, '总公司', NULL, 1, 1, NULL);
INSERT INTO `jc_department` VALUES (2, '运营处', NULL, 2, 1, NULL);
INSERT INTO `jc_department` VALUES (3, '销售部门1', NULL, 3, 1, 3);
INSERT INTO `jc_department` VALUES (4, '测试', NULL, 13, 1, NULL);
INSERT INTO `jc_department` VALUES (24, '子部门', NULL, 1, 1, 3);
INSERT INTO `jc_department` VALUES (25, 'test2021', NULL, 1, 1, NULL);
INSERT INTO `jc_department` VALUES (26, '12', NULL, 12, 1, 25);

-- ----------------------------
-- Table structure for jc_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `jc_dictionary`;
CREATE TABLE `jc_dictionary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'name',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'value',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'type',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_dictionary
-- ----------------------------
INSERT INTO `jc_dictionary` VALUES (36, '民族', '汉族', 'nation');
INSERT INTO `jc_dictionary` VALUES (37, '民族', '满族', 'nation');
INSERT INTO `jc_dictionary` VALUES (38, '政治面貌', '党员', 'political_face');
INSERT INTO `jc_dictionary` VALUES (39, '政治面貌', '团员', 'political_face');
INSERT INTO `jc_dictionary` VALUES (40, '级别', '省级干部', 'level');
INSERT INTO `jc_dictionary` VALUES (41, '级别', '市级干部', 'level');
INSERT INTO `jc_dictionary` VALUES (42, '级别', '厅局级干部', 'level');
INSERT INTO `jc_dictionary` VALUES (43, '举报事项', '贪污', 'reportingMatter');
INSERT INTO `jc_dictionary` VALUES (44, '举报事项', '受贿', 'reportingMatter');
INSERT INTO `jc_dictionary` VALUES (45, '问题类别', '腐败问题', 'matterCategory');
INSERT INTO `jc_dictionary` VALUES (46, '问题类别', '贪污问题', 'matterCategory');
INSERT INTO `jc_dictionary` VALUES (47, '问题细类', '不做为', 'matterDetailed');
INSERT INTO `jc_dictionary` VALUES (48, '问题细类', '乱做为', 'matterDetailed');

-- ----------------------------
-- Table structure for jc_directive_tpl
-- ----------------------------
DROP TABLE IF EXISTS `jc_directive_tpl`;
CREATE TABLE `jc_directive_tpl`  (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签描述',
  `code` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '标签代码',
  `user_id` int(11) NOT NULL COMMENT '标签创建者',
  PRIMARY KEY (`tpl_id`) USING BTREE,
  INDEX `fk_jc_directive_tpl_user`(`user_id`) USING BTREE,
  INDEX `FKE37000FA94799C65`(`user_id`) USING BTREE,
  CONSTRAINT `FKE37000FA94799C65` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'FComment' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_directive_tpl
-- ----------------------------
INSERT INTO `jc_directive_tpl` VALUES (1, '333', '444', '[@cms_channel_list parentId=channel.id  hasContent=\'false\']\r\n    [#list tag_list as c]\r\n      <a href=\"${c.url}\" target=\"_blank\">${c.name!}</a>\r\n	[/#list]\r\n[/@cms_channel_list]', 1);

-- ----------------------------
-- Table structure for jc_file
-- ----------------------------
DROP TABLE IF EXISTS `jc_file`;
CREATE TABLE `jc_file`  (
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有效',
  `content_id` int(11) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`) USING BTREE,
  INDEX `fk_jc_file_content`(`content_id`) USING BTREE,
  INDEX `FK95AEFCC256F11B69`(`content_id`) USING BTREE,
  CONSTRAINT `FK95AEFCC256F11B69` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_file
-- ----------------------------
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/13105021h00l.png', 'news_tu.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/13110212jdqm.png', 'news_tu.png', 1, 833);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/15084255hdqd.png', 'news_img.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/16145133uf33.png', '弹出层.png', 1, 833);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/16145134d4xo.png', '分配功能室.png', 1, 833);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/1615282189uu.png', '统计样例.png', 1, 833);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/1709103406ux.png', 'logo.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/17091046e06e.png', 'login_bj.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/17095443rjep.png', 'page_bg.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/2010205804n2.png', 'logo.png', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/2010211007vh.png', 'login_bj.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/20102506wf4h.png', 'page_bg.png', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201801/201025361e7a.png', 'login_bj.png', 1, NULL);

-- ----------------------------
-- Table structure for jc_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink`;
CREATE TABLE `jc_friendlink`  (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站地址',
  `logo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '点击次数',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`) USING BTREE,
  INDEX `fk_jc_ctg_friendlink`(`friendlinkctg_id`) USING BTREE,
  INDEX `fk_jc_friendlink_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS友情链接' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_friendlink
-- ----------------------------
INSERT INTO `jc_friendlink` VALUES (51, 1, 1, '在线信访服务大厅', 'http://', '/u/cms/www/201801/2010205804n2.png', '', '', 0, '1', 10);
INSERT INTO `jc_friendlink` VALUES (52, 1, 2, '网站背景图', 'http://', '/u/cms/www/201801/20102506wf4h.png', '', '', 0, '1', 10);
INSERT INTO `jc_friendlink` VALUES (53, 1, 3, '登陆背景图', 'http://', '/u/cms/www/201801/201025361e7a.png', '', '', 0, '1', 10);

-- ----------------------------
-- Table structure for jc_friendlink_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink_ctg`;
CREATE TABLE `jc_friendlink_ctg`  (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `is_synchronization` bit(1) NOT NULL,
  PRIMARY KEY (`friendlinkctg_id`) USING BTREE,
  INDEX `fk_jc_friendlinkctg_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS友情链接类别' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_friendlink_ctg
-- ----------------------------
INSERT INTO `jc_friendlink_ctg` VALUES (1, 1, 'Logo', 1, b'0');
INSERT INTO `jc_friendlink_ctg` VALUES (2, 1, '网站背景图', 2, b'0');
INSERT INTO `jc_friendlink_ctg` VALUES (3, 1, '登陆背景图', 3, b'0');

-- ----------------------------
-- Table structure for jc_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_group`;
CREATE TABLE `jc_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT 4096 COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT 1024 COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认会员组',
  `allow_file_size` int(11) DEFAULT 4096 COMMENT '每个上传文库的文件大小限制kB',
  `allow_file_total` int(11) DEFAULT 0 COMMENT '上传总数限制(0没有限制)',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS会员组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_group
-- ----------------------------
INSERT INTO `jc_group` VALUES (1, '普通会员', 10, 1, 1, 0, 0, NULL, 1, 4096, 0);
INSERT INTO `jc_group` VALUES (2, '高级组', 10, 1, 1, 0, 0, NULL, 0, 4096, 0);
INSERT INTO `jc_group` VALUES (3, 'vip', 10, 1, 1, 0, 0, NULL, 0, 4096, 0);
INSERT INTO `jc_group` VALUES (4, 'test', 10, 1, 1, 0, 0, NULL, 0, 0, 0);
INSERT INTO `jc_group` VALUES (5, 'test1', 10, 1, 1, 0, 0, NULL, 0, 0, 0);
INSERT INTO `jc_group` VALUES (6, 'test2', 10, 1, 1, 0, 0, NULL, 0, 0, 0);

-- ----------------------------
-- Table structure for jc_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook`;
CREATE TABLE `jc_guestbook`  (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `complaintNumber` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `leader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `receptionist` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `appeals` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `preliminaryOpinion` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `satisfied` tinyint(1) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '留言时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`guestbook_id`) USING BTREE,
  INDEX `fk_jc_ctg_guestbook`(`guestbookctg_id`) USING BTREE,
  INDEX `fk_jc_guestbook_admin`(`admin_id`) USING BTREE,
  INDEX `fk_jc_guestbook_member`(`member_id`) USING BTREE,
  INDEX `fk_jc_guestbook_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS留言' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook
-- ----------------------------
INSERT INTO `jc_guestbook` VALUES (97, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf1234567891123456789', 1, 10, 10, '11', '', '12', '13', NULL, '2018-03-19 09:02:25', NULL);
INSERT INTO `jc_guestbook` VALUES (98, 1, 1, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803061046578232', 1, 5, NULL, '', '', '6', '7', NULL, '2018-03-19 09:02:25', NULL);
INSERT INTO `jc_guestbook` VALUES (99, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf1234567891123456788', 1, 9, 123, '123', '', '123', '123', NULL, '2018-03-19 09:02:25', '2018-03-19 09:02:25');
INSERT INTO `jc_guestbook` VALUES (100, 1, 2, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803061800548199', 1, 9, 1, '来访代表', '接待人', '反应问题及诉求', '初步处理意见', 1, '2018-03-19 09:02:25', '2018-03-19 09:02:25');
INSERT INTO `jc_guestbook` VALUES (101, 1, 3, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803071107406569', 1, 9, NULL, '', '接待人', '反应问题及诉求', '初步处理意见', NULL, '2018-03-19 09:02:25', '2018-03-19 09:02:25');
INSERT INTO `jc_guestbook` VALUES (102, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf1234567891123456789', 1, 1, 10, '11', '', '12', '13', NULL, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (103, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf1234567891123456789', 1, 1, 10, '11', '', '12', '13', NULL, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (104, 1, 2, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803081642327439', 1, 9, NULL, '', '324', '234', '234', 1, '2018-03-19 09:02:25', NULL);
INSERT INTO `jc_guestbook` VALUES (105, 1, 1, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803081705256130', 1, 1, NULL, '', '', '3', '3', NULL, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (106, 1, 2, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803091103087254', 1, 3, 123, '123', '123123', '123', '123', 0, '2018-03-19 09:02:25', NULL);
INSERT INTO `jc_guestbook` VALUES (107, 1, 2, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803121328381228', 1, 9, 2, '', '打算', '上访领导', '同意上访', 1, '2018-03-19 09:02:25', '2018-03-19 09:02:25');
INSERT INTO `jc_guestbook` VALUES (108, 1, 3, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803131126369495', 1, 3, NULL, '', 'dsa ', '12', '1212', NULL, '2018-03-19 09:02:25', NULL);
INSERT INTO `jc_guestbook` VALUES (109, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, '信访编号：001', 1, 1, 51, '测试代表1', '', '不作为1', '借鉴1', NULL, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (110, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, '1', 1, 1, NULL, '', '', '1', '1', NULL, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (111, 1, 2, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803151712366909', 1, 2, 123, '123', '123', '123', '123', 1, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (112, 1, 2, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803151713516975', 1, 2, 123, '123', '2302211992', '230221199211225215', '230221199211225215', 1, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (113, 1, 2, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf201803151714568018', 1, 3, 123, '123', '123', '230221199211225215', '230221199211225215', 1, '2018-04-27 08:52:09', NULL);
INSERT INTO `jc_guestbook` VALUES (139, 1, 3, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:22:42', NULL, 0, 0, 'xf201803190922427690', 1, 8, 1, '自己', '菠萝', '贪污5快钱', '退20', NULL, '2018-03-24 09:25:35', NULL);
INSERT INTO `jc_guestbook` VALUES (140, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 10:59:46', NULL, 0, 0, '7', 1, 9, 11, '12', NULL, '13', '14', NULL, '2018-03-19 11:01:56', NULL);
INSERT INTO `jc_guestbook` VALUES (141, 1, 4, NULL, NULL, '0:0:0:0:0:0:0:1', '2018-03-19 09:02:25', NULL, 0, 0, 'xf1234567891123456788', 1, 1, 123, '123', NULL, '123', '123', NULL, NULL, NULL);
INSERT INTO `jc_guestbook` VALUES (142, 1, 2, NULL, NULL, '127.0.0.1', '2018-04-23 08:39:53', NULL, 0, 0, 'xf201804230839535445', 1, 3, 2, '1', '123', '123', '2312', 1, '2018-04-25 08:47:33', NULL);

-- ----------------------------
-- Table structure for jc_guestbook_attachment
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_attachment`;
CREATE TABLE `jc_guestbook_attachment`  (
  `guestbook_id` int(11) NOT NULL,
  `attachment_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 10,
  `type` int(5) NOT NULL,
  `image_recognition` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5F03DAA7255EBA32`(`guestbook_id`) USING BTREE,
  CONSTRAINT `FK5F03DAA7255EBA32` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook_attachment
-- ----------------------------
INSERT INTO `jc_guestbook_attachment` VALUES (97, '/static/upload/portraitImages/1520491273670.png', 'TIM图片20180308143738.png', 10, 12, '第五十六童 宫说I 亡 篷 胴 三     /」\\姨子田饯包测冒泽发了一份匿名 快递送了 回去n嵋 ,资费皇到付n里面本有田两干块饯 , ` 舌泽顺了下耒 , 反正卤尼子零花饯多 , 就当目己帮妯找回饯包田辛苦费吧 , 阖泽觉得目己收费很台理n然后第二夫 , 周$墨看见/」\\姨子发了涤朋友圈 :\"这个/」\\恻子有职业道德 , 偷了我田饯包却把我里面田卡相证件鄱快递回耒了 ,这个社会, i丕皇i2子)\\多啊n \"周泽看了这条朋友圈 , 沉默了一会儿 ,算了 , 予寞妞还皇继续傻习呼瞰子了 , 傻人有傻橇日莺莺将删减过头尾田视频U盘偷偷送到了中年舅子妲姐家 , 具姐姐当夭就去派出所假案 , 凡夫后 , 当地霎万宫万微博也发布了这条消息   这1 言也引起了利躏波谰 , 很多人痛斥那个女生田无耻相猥心狗肺 , 但亘热虔 , 相当初 肘完全不台屠柜比n   而目现在骂这个女生田人 , 当初估五十也骂过那位老师 \"衣冠禽兽\" 口总之, 日子就这么平平静静地过去了好凡夫 , 生意照旧伶淡 日莺莺更加沉迷网络 , 迸步神速 , 而目也开始逐步迷上了网络游戏 , 每夫坐在那里看个副本玫略鄱能看好久.话脱脱田一个网瘾少丸 ', 72);
INSERT INTO `jc_guestbook_attachment` VALUES (107, '/static/upload/portraitImages/1520832426993.doc', '需求申请单 (1).doc', 10, 1, NULL, 76);
INSERT INTO `jc_guestbook_attachment` VALUES (108, '/static/upload/portraitImages/1520911553987.jpg', 'TIM图片20180110113558.jpg', 10, 4, NULL, 77);
INSERT INTO `jc_guestbook_attachment` VALUES (100, '/static/upload/portraitImages/1520930245509.png', '1518079789278.png', 10, 4, '庠别人i态 鳜£走蠢群的, 骺切魄 韫栗枷 而父尻刈义尸厉魄 扛犷魄有一廿辣也这样吧配 曜上只煮妈妈妩 有觐的戮子伫个宝 ~~~~ --\"ixiã>\'ill~日恣不死 但戈这对蓦薏未说太不公平孔 虽傥 我对苷暴并不底杞 可迸还爨斗胆纂慕改敢跚 “世上还íëë奸, 有§的戮子才天个3甙的ë§也和-X-弛§爸一样十分尸厉, 但他却不魄他们\'样)§‘咖 “i4ﬁ”未琏决问氐 而足罢行他的 \"文治政1`” \' !年叶使. 也不知为恍 一向*巧的ätlL,l\'一辗?il皮\'(7小技-}:玩火. 后禾ü妈妈i见L 她蓖扦忒 “4Yﬂ\" 曰#.正*备 Wﬂüw , 峙桃棚 \" 孝亏ëê未得i盹 才使戎鲽过这一虬陲屁 ëëüãíi甙的手未到房问!.和巍i兄话. 式也不记仔吉时他对戎说丁鬟什么, 只竞得辖规得铿塾蚀熄 不久, 戎仅沭下了眼混 向奋奋柬认丁错锶 以后不弄犯妞丁 ---- 4-', 82);
INSERT INTO `jc_guestbook_attachment` VALUES (109, '/static/upload/portraitImages/1520990631564.pdf', 'cxgc2.pdf', 10, 1, NULL, 87);
INSERT INTO `jc_guestbook_attachment` VALUES (109, '/static/upload/portraitImages/1520990695195.jpg', 'QQ图片20180301094625.jpg', 10, 4, NULL, 88);
INSERT INTO `jc_guestbook_attachment` VALUES (139, '/static/upload/portraitImages/1521422236802.doc', '辞职报告.doc', 10, 1, NULL, 89);
INSERT INTO `jc_guestbook_attachment` VALUES (139, '/static/upload/portraitImages/1521422265483.jpg', '微信图片_20180307143940.jpg', 10, 4, NULL, 90);
INSERT INTO `jc_guestbook_attachment` VALUES (102, '/static/upload/portraitImages/1521427496189.docx', '信访进度时间表0305.docx', 10, 1, NULL, 92);
INSERT INTO `jc_guestbook_attachment` VALUES (140, '/static/upload/portraitImages/1521428462714.docx', '信访进度时间表0305.docx', 10, 1, NULL, 93);
INSERT INTO `jc_guestbook_attachment` VALUES (140, '/static/upload/portraitImages/1521428661840.doc', '智能信访数据处理平台内网概要设计（4稿）.doc', 10, 5, NULL, 94);
INSERT INTO `jc_guestbook_attachment` VALUES (140, '/static/upload/portraitImages/1521429290928.doc', '用户使用手册.doc', 10, 9, NULL, 95);
INSERT INTO `jc_guestbook_attachment` VALUES (104, '/static/upload/portraitImages/1521448038669.jpg', '信访登记业务流程.jpg', 10, 12, NULL, 99);
INSERT INTO `jc_guestbook_attachment` VALUES (102, '/static/upload/portraitImages/1521450023326.jpg', '信访登记业务流程.jpg', 10, 4, NULL, 100);
INSERT INTO `jc_guestbook_attachment` VALUES (142, '/static/upload/portraitImages/1524444362072.png', 'QQ截图20180423084315.png', 10, 4, NULL, 103);
INSERT INTO `jc_guestbook_attachment` VALUES (97, '/static/upload/portraitImages/1524444867526.pdf', 'DFreeMarker_Manual_zh_CN.pdf', 10, 5, NULL, 104);
INSERT INTO `jc_guestbook_attachment` VALUES (97, '/static/upload/portraitImages/1524445335436.png', 'QQ截图20180423090140.png', 10, 8, NULL, 106);

-- ----------------------------
-- Table structure for jc_guestbook_case
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_case`;
CREATE TABLE `jc_guestbook_case`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `leader` int(255) DEFAULT NULL COMMENT '主案件',
  `follower` int(255) DEFAULT NULL COMMENT '关联案件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of jc_guestbook_case
-- ----------------------------
INSERT INTO `jc_guestbook_case` VALUES (64, 100, 106);
INSERT INTO `jc_guestbook_case` VALUES (22, 98, 100);
INSERT INTO `jc_guestbook_case` VALUES (82, 111, 112);
INSERT INTO `jc_guestbook_case` VALUES (79, 112, 111);

-- ----------------------------
-- Table structure for jc_guestbook_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg`;
CREATE TABLE `jc_guestbook_ctg`  (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `is_synchronization` bit(1) NOT NULL,
  PRIMARY KEY (`guestbookctg_id`) USING BTREE,
  INDEX `fk_jc_guestbookctg_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS留言类别' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook_ctg
-- ----------------------------
INSERT INTO `jc_guestbook_ctg` VALUES (1, 1, '网上信访', 4, '网上信访', b'0');
INSERT INTO `jc_guestbook_ctg` VALUES (2, 1, '来访登记', 1, '来访登记', b'0');
INSERT INTO `jc_guestbook_ctg` VALUES (3, 1, '来信登记', 2, '来信登记', b'0');
INSERT INTO `jc_guestbook_ctg` VALUES (4, 1, '上级交办', 3, '上级交办', b'0');

-- ----------------------------
-- Table structure for jc_guestbook_ctg_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg_department`;
CREATE TABLE `jc_guestbook_ctg_department`  (
  `depart_id` int(11) NOT NULL DEFAULT 0,
  `guestbookctg_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`depart_id`, `guestbookctg_id`) USING BTREE,
  INDEX `guestbookctg_id`(`guestbookctg_id`) USING BTREE,
  CONSTRAINT `jc_guestbook_ctg_department_ibfk_1` FOREIGN KEY (`depart_id`) REFERENCES `jc_department` (`depart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_guestbook_ctg_department_ibfk_2` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS留言类别部门关联表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook_ctg_department
-- ----------------------------
INSERT INTO `jc_guestbook_ctg_department` VALUES (4, 1);
INSERT INTO `jc_guestbook_ctg_department` VALUES (24, 1);
INSERT INTO `jc_guestbook_ctg_department` VALUES (25, 1);
INSERT INTO `jc_guestbook_ctg_department` VALUES (26, 1);
INSERT INTO `jc_guestbook_ctg_department` VALUES (1, 4);
INSERT INTO `jc_guestbook_ctg_department` VALUES (1, 24);
INSERT INTO `jc_guestbook_ctg_department` VALUES (1, 25);
INSERT INTO `jc_guestbook_ctg_department` VALUES (1, 26);

-- ----------------------------
-- Table structure for jc_guestbook_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ext`;
CREATE TABLE `jc_guestbook_ext`  (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '留言标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '留言内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ',
  `informantName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantNation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantSex` int(11) DEFAULT NULL,
  `informantPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantCardNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantOtherTel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantpoliticalFace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantLevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantPlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reportedName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reportedCompany` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reportedSex` int(11) DEFAULT NULL,
  `reportedDuties` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reportedLevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reportingMatter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `matterCategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `matterDetailed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `informantAge` int(11) DEFAULT NULL,
  `informantEducation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `informantGrade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `abnormalBehavior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `matterProperty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `assign_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上级交办号',
  `assign_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交办人',
  `assign_person_post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交办人职务',
  `assign_company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交办人单位',
  `assign_modality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '交办人形式',
  `preserver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '保管人',
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地点',
  `letterTime` datetime DEFAULT NULL,
  `repeatLetter` tinyint(1) DEFAULT NULL,
  `review_opinions` tinyint(1) DEFAULT NULL,
  `accept` tinyint(1) DEFAULT NULL,
  `administrative_reconsideration` tinyint(1) DEFAULT NULL,
  `publicity` tinyint(1) DEFAULT NULL,
  INDEX `fk_jc_ext_guestbook`(`guestbook_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS留言内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook_ext
-- ----------------------------
INSERT INTO `jc_guestbook_ext` VALUES (97, NULL, NULL, NULL, NULL, NULL, NULL, '7', '汉族', 1, '13512345678', '123456789123456789', NULL, NULL, '党员', NULL, '9', '14', '15', NULL, '省级干部', '省级干部', NULL, '腐败问题', NULL, 8, '研究生学历', 100056, 1, '普通公民', NULL, '普通来访', 'xf1234567891123456789', '2', '3', '4', '口头交办', '5', '6', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (98, '4', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '13512345678', '2', NULL, NULL, '党员', '省级干部', '3', '8', '9', NULL, '10', '省级干部', NULL, '腐败问题', '5', NULL, NULL, 100056, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0);
INSERT INTO `jc_guestbook_ext` VALUES (99, NULL, NULL, NULL, NULL, NULL, NULL, '1231', '汉族', 1, '18745171299', '230221199211225215', NULL, NULL, '党员', NULL, '123', '123', '123', NULL, '市级干部', '市级干部', NULL, '腐败问题', NULL, 23, '研究生学历', 100056, 1, '普通公民', NULL, '普通来访', 'jb1234567891123456788', '123123', '123123', '12312', '电话交办', '3123123', '123123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (100, NULL, NULL, NULL, NULL, NULL, NULL, '姓名', '汉族', 1, '', '230103199001010101', NULL, NULL, '党员', NULL, '居住地址', '被举报人', '单      位', 1, '职     务', '省级干部', NULL, '腐败问题', NULL, 28, '研究生学历', 100056, 1, '普通公民', '无', '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (101, NULL, NULL, NULL, NULL, NULL, NULL, '匿名', '', NULL, '', '', NULL, NULL, '', NULL, '', '被举报人', '单      位', 1, '职     务', '省级干部', NULL, '腐败问题', NULL, NULL, '', 100056, 1, '普通公民', NULL, '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (102, NULL, NULL, NULL, NULL, NULL, NULL, '7', '汉族', 1, '13512345678', '123456789123456789', NULL, NULL, '党员', NULL, '9', '14', '15', NULL, '省级干部', '省级干部', NULL, '腐败问题', NULL, 8, '研究生学历', 100056, 1, '普通公民', NULL, '普通来访', '1', '2', '3', '4', '口头交办', '', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (103, NULL, NULL, NULL, NULL, NULL, NULL, '7', '汉族', 1, '13512345678', '123456789123456789', NULL, NULL, '党员', NULL, '9', '14', '15', NULL, '省级干部', '省级干部', NULL, '腐败问题', NULL, 8, '研究生学历', 100056, 1, '普通公民', NULL, '普通来访', '123123123', '1231', '123', '123', '口头交办', '123', '123', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (104, NULL, NULL, NULL, NULL, NULL, NULL, '1', '汉族', 1, '', '123456789123456789', NULL, NULL, '', NULL, '234', '234', '234', 1, '234', '省级干部', NULL, '腐败问题', NULL, 3, '', 100056, 1, '普通公民', '', '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (105, '3', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '', NULL, NULL, '', '', '', '3', '3', NULL, '4', '省级干部', NULL, '腐败问题', '3', NULL, NULL, 100056, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0);
INSERT INTO `jc_guestbook_ext` VALUES (106, NULL, NULL, NULL, NULL, NULL, NULL, '123', '汉族', 1, '18745171299', '230221199211225215', NULL, NULL, '党员', NULL, '123123', '1231', '123', 1, '123', '省级干部', NULL, '腐败问题', NULL, 12, '研究生学历', 100056, 1, '普通公民', '123', '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (107, NULL, NULL, NULL, NULL, NULL, NULL, '姓      名', '汉族', 1, '13633636363', '230105198502233015', NULL, NULL, '团员', NULL, 'a阿斯顿sad', '朱殿巍', '工大', 1, '主管', '厅局级干部', NULL, '贪污问题', NULL, 22, '研究生学历', 100056, 1, '政府在职人员', '', '普通来访1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (108, NULL, NULL, NULL, NULL, NULL, NULL, '来信人员', '汉族', 1, '', '', NULL, NULL, '', NULL, '', '阿大使', '阿德萨', 1, '阿萨德', '省级干部', NULL, '贪污问题', NULL, 22, '研究生学历', 100063, 10026, '政府在职人员', NULL, '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (109, NULL, NULL, NULL, NULL, NULL, NULL, '测试来访人员01', '满族', 1, '18611111111', '230102199002189998', NULL, NULL, '团员', NULL, '道里区', '测试被举报人02', '测试单位1', NULL, '省级干部', '省级干部', NULL, '腐败问题', NULL, 26, '大学本科学历', 100001, 10027, '普通公民', NULL, '普通来访', 'Test0011', '上官云海1', '测试工程师1', '测试部1', '会议安排', '1', '道里区1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (110, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', '', NULL, NULL, '', NULL, '', '1', '1', NULL, '省级干部1', '省级干部', NULL, '腐败问题', NULL, NULL, '', 100001, 10027, '普通公民', NULL, '普通来访', '1', '1', '1', '1', '口头交办', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (111, NULL, NULL, NULL, NULL, NULL, NULL, '123', '满族', 1, '18745171299', '230221199211225215', NULL, NULL, '党员', NULL, '123123', '123', '123', 1, '123', '省级干部', NULL, '腐败问题', NULL, 12, '研究生学历', 100001, 10027, '普通公民', '123', '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (112, NULL, NULL, NULL, NULL, NULL, NULL, '123', '汉族', 1, '', '230221199211225215', NULL, NULL, '党员', NULL, '123', '2302211992', '230221199211225215', 1, '123', '省级干部', NULL, '腐败问题', NULL, 12, '研究生学历', 100001, 10027, '普通公民', '123', '普通来访1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (113, NULL, NULL, NULL, NULL, NULL, NULL, '123', '汉族', 1, '', '230221199211225215', NULL, NULL, '党员', NULL, '23', '123', '123', 1, '123', '省级干部', NULL, '腐败问题', NULL, 12, '研究生学历', 100063, 10026, '普通公民', '123', '普通来访1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (139, NULL, NULL, NULL, NULL, NULL, NULL, '朱殿巍', '汉族', 1, '13936648904', '230105198402113111', NULL, NULL, '团员', NULL, '哈尔滨', '3中', '3中', 1, '校长', '省级干部', NULL, '贪污问题', NULL, 33, '大学本科学历', 100056, 1, '普通公民', NULL, '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-12 09:15:47', 0, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (140, NULL, NULL, NULL, NULL, NULL, NULL, '8', '汉族', 1, '13512345678', '123456789123456789', NULL, NULL, '党员', NULL, '10', '15', '16', NULL, '17', '省级干部', NULL, '腐败问题', NULL, 9, '研究生学历', 100056, 1, '普通公民', NULL, '普通来访', '1', '2', '3', '4', '口头交办', '5', '6', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (141, NULL, NULL, NULL, NULL, NULL, NULL, '1231', '汉族', 1, '18745171299', '230221199211225215', NULL, NULL, '党员', NULL, '123', '123', '123', NULL, '市级干部', '市级干部', NULL, '腐败问题', NULL, 23, '研究生学历', 100056, 1, '普通公民', NULL, '普通来访', '1', '2', '3', '4', '电话交办', '', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (142, NULL, NULL, NULL, NULL, NULL, NULL, 'lu', '汉族', 1, '15933334444', '223123705082222', NULL, NULL, '团员', NULL, '哈尔滨', '任务', '132', 1, '职务', '省级干部', NULL, '腐败问题', NULL, 1, '研究生学历', 100063, 10026, '普通公民', '', '普通来访', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_guestbook_reason
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_reason`;
CREATE TABLE `jc_guestbook_reason`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestbook_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jc_guestbook_reason
-- ----------------------------
INSERT INTO `jc_guestbook_reason` VALUES (1, 99, 1, 4, '2018-03-07 15:32:06', '没有');
INSERT INTO `jc_guestbook_reason` VALUES (2, 99, 1, 4, '2018-03-07 15:33:18', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (3, 97, 1, 3, '2018-03-07 16:37:35', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (4, 97, 1, 3, '2018-03-08 08:55:31', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (5, 99, 1, 4, '2018-03-08 09:29:54', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (6, 98, 1, 4, '2018-03-08 10:04:29', 'asdf ');
INSERT INTO `jc_guestbook_reason` VALUES (7, 98, 1, 3, '2018-03-08 10:08:38', 'sdfa ');
INSERT INTO `jc_guestbook_reason` VALUES (8, 99, 1, 3, '2018-03-08 10:08:50', 'asdf ');
INSERT INTO `jc_guestbook_reason` VALUES (9, 97, 1, 5, '2018-03-08 14:25:09', '不再受理');
INSERT INTO `jc_guestbook_reason` VALUES (10, 97, 1, 5, '2018-03-08 14:25:24', '不再受理');
INSERT INTO `jc_guestbook_reason` VALUES (11, 97, 1, 5, '2018-03-08 14:29:50', '答复');
INSERT INTO `jc_guestbook_reason` VALUES (12, 98, 1, 6, '2018-03-08 14:30:19', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (13, 97, 1, 6, '2018-03-08 14:31:15', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (14, 97, 1, 7, '2018-03-08 14:31:53', '士大夫');
INSERT INTO `jc_guestbook_reason` VALUES (15, 97, 1, 8, '2018-03-08 14:32:37', '答复');
INSERT INTO `jc_guestbook_reason` VALUES (16, 97, 1, 9, '2018-03-08 14:32:59', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (17, 97, 1, 10, '2018-03-08 14:33:19', '答复');
INSERT INTO `jc_guestbook_reason` VALUES (18, 97, 1, 10, '2018-03-08 14:40:08', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (19, 97, 1, 9, '2018-03-08 14:41:15', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (20, 97, 1, 10, '2018-03-08 15:06:59', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (21, 97, 1, 10, '2018-03-08 15:27:04', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (22, 97, 1, 10, '2018-03-08 15:32:26', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (23, 97, 1, 10, '2018-03-08 15:36:46', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (24, 97, 1, 3, '2018-03-08 16:54:34', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (25, 98, 1, 3, '2018-03-08 16:54:44', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (26, 99, 1, 3, '2018-03-08 16:54:54', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (27, 97, 1, 10, '2018-03-08 17:06:50', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (28, 101, 1, 3, '2018-03-08 17:19:54', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (29, 97, 1, 3, '2018-03-08 17:20:06', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (30, 104, 1, 3, '2018-03-08 17:21:02', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (31, 97, 1, 10, '2018-03-09 08:44:55', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (32, 108, 1, 3, '2018-03-13 14:01:48', '挨打');
INSERT INTO `jc_guestbook_reason` VALUES (33, 107, 1, 3, '2018-03-13 14:15:19', '阿萨德');
INSERT INTO `jc_guestbook_reason` VALUES (34, 100, 1, 3, '2018-03-15 09:18:30', '原　　因');
INSERT INTO `jc_guestbook_reason` VALUES (35, 100, 1, 9, '2018-03-15 09:20:09', '处理意见');
INSERT INTO `jc_guestbook_reason` VALUES (36, 106, 1, 3, '2018-03-15 13:46:22', 'sadsa');
INSERT INTO `jc_guestbook_reason` VALUES (37, 139, 1, 3, '2018-03-19 09:25:39', '同意');
INSERT INTO `jc_guestbook_reason` VALUES (38, 139, 1, 8, '2018-03-19 09:26:36', '已经退回');
INSERT INTO `jc_guestbook_reason` VALUES (39, 140, 1, 3, '2018-03-19 11:01:57', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (40, 140, 1, 10, '2018-03-19 11:04:23', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (41, 140, 1, 9, '2018-03-19 11:14:53', '阿斯蒂芬');
INSERT INTO `jc_guestbook_reason` VALUES (42, 104, 1, 9, '2018-03-19 16:27:19', '大师傅');
INSERT INTO `jc_guestbook_reason` VALUES (43, 98, 1, 5, '2018-03-20 11:31:11', '阿道夫');
INSERT INTO `jc_guestbook_reason` VALUES (44, 142, 1, 3, '2018-04-23 08:48:12', '159');
INSERT INTO `jc_guestbook_reason` VALUES (45, 113, 1, 3, '2018-04-23 08:52:13', '159');
INSERT INTO `jc_guestbook_reason` VALUES (46, 97, 1, 10, '2018-04-23 08:55:28', '请问');
INSERT INTO `jc_guestbook_reason` VALUES (47, 97, 1, 10, '2018-04-23 09:02:20', '收到');

-- ----------------------------
-- Table structure for jc_guestbook_time
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_time`;
CREATE TABLE `jc_guestbook_time`  (
  `guestbook_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nodeTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for jc_job_apply
-- ----------------------------
DROP TABLE IF EXISTS `jc_job_apply`;
CREATE TABLE `jc_job_apply`  (
  `job_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content_id` int(11) NOT NULL COMMENT '职位id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`job_apply_id`) USING BTREE,
  INDEX `fk_jc_job_apply_user`(`user_id`) USING BTREE,
  INDEX `fk_jc_job_apply_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_keyword
-- ----------------------------
DROP TABLE IF EXISTS `jc_keyword`;
CREATE TABLE `jc_keyword`  (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`) USING BTREE,
  INDEX `fk_jc_keyword_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容关键词表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_keyword
-- ----------------------------
INSERT INTO `jc_keyword` VALUES (1, NULL, '内容管理系统', '<a href=\\\"http://www.jeecms.com/\\\" target=\\\"_blank\\\">内容管理系统</a>', 0);

-- ----------------------------
-- Table structure for jc_log
-- ----------------------------
DROP TABLE IF EXISTS `jc_log`;
CREATE TABLE `jc_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_jc_log_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_log_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1968 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_log
-- ----------------------------
INSERT INTO `jc_log` VALUES (508, NULL, NULL, 2, '2015-12-21 17:09:53', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (509, NULL, NULL, 2, '2015-12-21 17:09:59', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=是倒萨公司电话撒');
INSERT INTO `jc_log` VALUES (511, 1, NULL, 1, '2015-12-21 17:10:18', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (512, 1, NULL, 1, '2015-12-21 18:25:51', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (513, 1, NULL, 1, '2015-12-22 08:38:50', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (514, NULL, NULL, 2, '2015-12-22 08:57:41', '172.31.0.51', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (515, NULL, NULL, 2, '2015-12-22 08:57:54', '172.31.0.51', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (516, 1, NULL, 1, '2015-12-22 08:58:11', '172.31.0.51', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (517, 1, NULL, 1, '2015-12-22 08:59:02', '172.31.0.51', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (518, 1, 1, 3, '2015-12-22 08:59:52', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (519, 1, 1, 3, '2015-12-22 08:59:56', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (520, 1, 1, 3, '2015-12-22 08:59:59', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (521, 1, 1, 3, '2015-12-22 09:00:02', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (522, 1, 1, 3, '2015-12-22 09:00:11', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (523, 1, 1, 3, '2015-12-22 09:00:15', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (524, 1, 1, 3, '2015-12-22 09:00:19', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (525, 1, 1, 3, '2015-12-22 09:00:24', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (526, 1, 1, 3, '2015-12-22 09:02:27', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (527, 1, 1, 3, '2015-12-22 09:02:31', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (528, 1, 1, 3, '2015-12-22 09:02:35', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (529, 1, 1, 3, '2015-12-22 09:02:39', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (530, 1, 1, 3, '2015-12-22 09:04:34', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (531, 1, 1, 3, '2015-12-22 09:04:38', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (532, 1, 1, 3, '2015-12-22 09:04:42', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (533, 1, 1, 3, '2015-12-22 09:04:45', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (534, 1, 1, 3, '2015-12-22 09:05:00', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (535, 1, 1, 3, '2015-12-22 09:05:05', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (536, 1, 1, 3, '2015-12-22 09:05:14', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (537, 1, 1, 3, '2015-12-22 09:05:19', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (538, 1, 1, 3, '2015-12-22 09:06:15', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (539, 1, 1, 3, '2015-12-22 09:06:21', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (540, 1, 1, 3, '2015-12-22 09:06:26', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (541, 1, 1, 3, '2015-12-22 09:06:31', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (542, 1, 1, 3, '2015-12-22 09:06:41', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (543, 1, 1, 3, '2015-12-22 09:06:47', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (544, 1, 1, 3, '2015-12-22 09:06:53', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (545, 1, 1, 3, '2015-12-22 09:06:58', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (546, 1, 1, 3, '2015-12-22 09:07:01', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (547, 1, 1, 3, '2015-12-22 09:07:04', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (548, 1, 1, 3, '2015-12-22 09:07:10', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (549, 1, 1, 3, '2015-12-22 09:07:14', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (550, 1, 1, 3, '2015-12-22 09:07:20', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (551, 1, 1, 3, '2015-12-22 09:07:25', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_member_update.do', '修改会员设置', NULL);
INSERT INTO `jc_log` VALUES (552, 1, 1, 3, '2015-12-22 09:11:14', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (553, 1, 1, 3, '2015-12-22 09:11:18', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (554, 1, 1, 3, '2015-12-22 09:11:22', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (555, 1, 1, 3, '2015-12-22 09:11:26', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (556, 1, 1, 3, '2015-12-22 09:12:44', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (557, 1, 1, 3, '2015-12-22 09:12:47', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (558, 1, 1, 3, '2015-12-22 09:12:52', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (559, 1, 1, 3, '2015-12-22 09:13:34', '172.31.0.51', '/DHT/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (560, 1, 1, 3, '2015-12-22 09:13:40', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (561, 1, 1, 3, '2015-12-22 09:13:44', '172.31.0.51', '/DHT1/jeeadmin/jeecms/config/o_mark_update.do', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (562, 1, 1, 3, '2015-12-22 09:15:24', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (563, 1, 1, 3, '2015-12-22 09:15:48', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (564, 1, 1, 3, '2015-12-22 09:16:09', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (565, 1, 1, 3, '2015-12-22 09:16:23', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (566, 1, 1, 3, '2015-12-22 09:16:34', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (567, 1, 1, 3, '2015-12-22 09:20:41', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (568, 1, 1, 3, '2015-12-22 09:20:44', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (569, 1, 1, 3, '2015-12-22 09:20:57', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (570, 1, 1, 3, '2015-12-22 09:21:30', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (571, 1, 1, 3, '2015-12-22 09:21:36', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (572, 1, 1, 3, '2015-12-22 09:21:50', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (573, 1, 1, 3, '2015-12-22 09:21:57', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (574, 1, 1, 3, '2015-12-22 09:22:01', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (575, 1, 1, 3, '2015-12-22 09:22:18', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (576, 1, 1, 3, '2015-12-22 09:22:22', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (577, 1, 1, 3, '2015-12-22 09:22:26', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (578, 1, 1, 3, '2015-12-22 09:23:53', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (579, 1, 1, 3, '2015-12-22 09:23:57', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (580, 1, 1, 3, '2015-12-22 09:24:02', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (581, 1, 1, 3, '2015-12-22 09:24:09', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (582, 1, 1, 3, '2015-12-22 09:24:13', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (583, 1, 1, 3, '2015-12-22 09:24:21', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (584, 1, 1, 3, '2015-12-22 09:24:25', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (585, 1, 1, 3, '2015-12-22 09:24:29', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (586, 1, 1, 3, '2015-12-22 09:25:09', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (587, 1, 1, 3, '2015-12-22 09:25:12', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (588, 1, 1, 3, '2015-12-22 09:25:16', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (589, 1, 1, 3, '2015-12-22 09:25:20', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (590, 1, 1, 3, '2015-12-22 09:25:23', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (591, 1, NULL, 1, '2015-12-22 09:28:51', '172.31.0.51', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (592, 1, 1, 3, '2015-12-22 09:29:38', '172.31.0.51', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (593, 1, 1, 3, '2015-12-22 09:30:40', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (594, 1, 1, 3, '2015-12-22 09:31:35', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (595, 1, 1, 3, '2015-12-22 09:31:40', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (596, 1, 1, 3, '2015-12-22 09:31:48', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (597, 1, 1, 3, '2015-12-22 09:31:52', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (598, 1, 1, 3, '2015-12-22 09:31:57', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (599, 1, 1, 3, '2015-12-22 09:31:59', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (600, 1, 1, 3, '2015-12-22 09:32:01', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (601, 1, 1, 3, '2015-12-22 09:32:10', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (602, 1, 1, 3, '2015-12-22 09:32:12', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (603, 1, 1, 3, '2015-12-22 09:32:42', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (604, 1, 1, 3, '2015-12-22 09:32:44', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (605, 1, 1, 3, '2015-12-22 09:32:49', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (606, 1, 1, 3, '2015-12-22 09:32:52', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (607, 1, 1, 3, '2015-12-22 09:32:56', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (608, 1, 1, 3, '2015-12-22 09:32:58', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (609, 1, 1, 3, '2015-12-22 09:33:33', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (610, 1, 1, 3, '2015-12-22 09:33:35', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (611, 1, 1, 3, '2015-12-22 09:33:38', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (612, 1, 1, 3, '2015-12-22 09:33:42', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (613, 1, 1, 3, '2015-12-22 09:33:46', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (614, 1, 1, 3, '2015-12-22 09:33:51', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (615, 1, 1, 3, '2015-12-22 09:33:52', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (616, 1, 1, 3, '2015-12-22 09:33:58', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (617, 1, 1, 3, '2015-12-22 09:35:51', '172.31.0.51', '/DHT/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=90;title=添加新闻子栏目');
INSERT INTO `jc_log` VALUES (618, 1, 1, 3, '2015-12-22 09:36:07', '172.31.0.51', '/DHT1/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=91;title=添加新闻子栏目');
INSERT INTO `jc_log` VALUES (619, 1, 1, 3, '2015-12-22 09:37:12', '172.31.0.51', '/DHT1/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=90;name=添加新闻子栏目');
INSERT INTO `jc_log` VALUES (620, 1, 1, 3, '2015-12-22 09:40:27', '172.31.0.51', '/DHT1/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=92;title=子栏目的子栏目');
INSERT INTO `jc_log` VALUES (621, 1, NULL, 1, '2015-12-22 09:43:04', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (622, 1, 1, 3, '2015-12-22 09:44:31', '172.31.0.112', '/DHT1/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=93;title=null');
INSERT INTO `jc_log` VALUES (623, 1, 1, 3, '2015-12-22 09:44:56', '172.31.0.112', '/DHT1/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=94;title=null');
INSERT INTO `jc_log` VALUES (624, 1, 1, 3, '2015-12-22 09:45:16', '172.31.0.112', '/DHT1/jeeadmin/jeecms/channel/o_save.do', '增加栏目', 'id=95;title=null');
INSERT INTO `jc_log` VALUES (625, 1, NULL, 1, '2015-12-22 09:45:45', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (626, 1, NULL, 1, '2015-12-22 10:25:46', '172.31.0.51', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (627, 1, NULL, 1, '2015-12-22 10:26:00', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (628, 1, NULL, 1, '2015-12-22 10:46:09', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (629, 1, NULL, 1, '2015-12-22 11:46:58', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (630, 1, NULL, 1, '2015-12-22 12:20:56', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (631, 1, NULL, 1, '2015-12-22 13:06:35', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (632, 1, NULL, 1, '2015-12-22 13:18:32', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (633, 1, NULL, 1, '2015-12-22 13:29:35', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (634, 1, NULL, 1, '2015-12-22 13:39:42', '172.31.0.223', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (635, 1, NULL, 1, '2015-12-22 14:11:48', '172.31.0.51', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (636, 1, NULL, 1, '2015-12-22 14:12:01', '172.31.0.51', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (637, 1, 1, 3, '2015-12-22 14:13:07', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site_config/o_company_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (638, NULL, NULL, 2, '2015-12-22 15:59:57', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (641, NULL, NULL, 2, '2015-12-23 10:07:44', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (642, 1, NULL, 1, '2015-12-23 10:07:50', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (643, 1, NULL, 1, '2015-12-23 10:23:12', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (644, 1, 1, 3, '2015-12-23 10:58:13', '172.31.0.112', '/DHT/jeeadmin/jeecms/friendlink/o_save.do', '增加友情链接', 'id=50;name=测试');
INSERT INTO `jc_log` VALUES (645, 1, NULL, 1, '2015-12-23 13:18:15', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (646, 1, NULL, 1, '2015-12-23 13:34:54', '172.31.0.51', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (647, 1, NULL, 1, '2015-12-23 13:35:00', '172.31.0.51', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (648, 1, 1, 3, '2015-12-23 13:38:48', '172.31.0.51', '/DHT/jeeadmin/jeecms/model/o_save.do', '增加模型', 'id=666;name=33');
INSERT INTO `jc_log` VALUES (649, 1, 1, 3, '2015-12-23 13:39:24', '172.31.0.51', '/DHT/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=666;name=33');
INSERT INTO `jc_log` VALUES (650, 1, 1, 3, '2015-12-23 13:42:23', '172.31.0.112', '/DHT1/jeeadmin/jeecms/advertising/o_save.do', '增加广告', 'id=6;name=测试');
INSERT INTO `jc_log` VALUES (651, 1, 1, 3, '2015-12-23 13:42:35', '172.31.0.51', '/DHT/jeeadmin/jeecms/model/o_delete.do', '删除模型', 'id=666;name=33');
INSERT INTO `jc_log` VALUES (652, 1, 1, 3, '2015-12-23 13:43:37', '172.31.0.112', '/DHT1/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=6;name=测试');
INSERT INTO `jc_log` VALUES (653, 1, 1, 3, '2015-12-23 13:43:41', '172.31.0.51', '/DHT/jeeadmin/jeecms/type/o_save.do', '增加内容类型', 'id=55;name=测试');
INSERT INTO `jc_log` VALUES (654, 1, 1, 3, '2015-12-23 13:43:44', '172.31.0.112', '/DHT1/jeeadmin/jeecms/advertising/o_update.do', '修改广告', 'id=6;name=测试');
INSERT INTO `jc_log` VALUES (655, 1, 1, 3, '2015-12-23 13:43:55', '172.31.0.51', '/DHT1/jeeadmin/jeecms/type/o_delete.do', '删除内容类型', 'id=55;name=测试');
INSERT INTO `jc_log` VALUES (656, 1, 1, 3, '2015-12-23 13:45:56', '172.31.0.51', '/DHT/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=测试');
INSERT INTO `jc_log` VALUES (657, 1, 1, 3, '2015-12-23 13:47:04', '172.31.0.51', '/DHT1/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=3');
INSERT INTO `jc_log` VALUES (658, 1, 1, 3, '2015-12-23 13:54:13', '172.31.0.51', '/DHT/jeeadmin/jeecms/resource/o_save.do', '保存资源', 'filename=66');
INSERT INTO `jc_log` VALUES (659, 1, 1, 3, '2015-12-23 13:54:48', '172.31.0.51', '/DHT1/jeeadmin/jeecms/resource/o_save.do', '保存资源', 'filename=7');
INSERT INTO `jc_log` VALUES (660, 1, 1, 3, '2015-12-23 13:59:45', '172.31.0.51', '/DHT/jeeadmin/jeecms/directive/o_save.do', '添加标签', 'id=21;name=3');
INSERT INTO `jc_log` VALUES (661, 1, 1, 3, '2015-12-23 14:01:02', '172.31.0.51', '/DHT1/jeeadmin/jeecms/directive/o_save.do', '添加标签', 'id=22;name=4');
INSERT INTO `jc_log` VALUES (662, 1, 1, 3, '2015-12-23 14:01:54', '172.31.0.51', '/DHT1/jeeadmin/jeecms/directive/o_delete.do', '删除标签', 'id=21;name=3');
INSERT INTO `jc_log` VALUES (663, 1, 1, 3, '2015-12-23 14:02:03', '172.31.0.51', '/DHT1/jeeadmin/jeecms/directive/o_delete.do', '删除标签', 'id=22;name=4');
INSERT INTO `jc_log` VALUES (664, 1, 1, 3, '2015-12-23 14:02:27', '172.31.0.51', '/DHT/jeeadmin/jeecms/ftp/o_save.do', '增加FTP', 'id=21;name=6');
INSERT INTO `jc_log` VALUES (665, 1, 1, 3, '2015-12-23 14:03:15', '172.31.0.51', '/DHT1/jeeadmin/jeecms/ftp/o_update.do', '修改FTP', 'id=21;name=6');
INSERT INTO `jc_log` VALUES (666, 1, 1, 3, '2015-12-23 14:03:29', '172.31.0.51', '/DHT/jeeadmin/jeecms/ftp/o_update.do', '修改FTP', 'id=1;name=1');
INSERT INTO `jc_log` VALUES (667, 1, 1, 3, '2015-12-23 14:03:33', '172.31.0.51', '/DHT/jeeadmin/jeecms/ftp/o_update.do', '修改FTP', 'id=1;name=1');
INSERT INTO `jc_log` VALUES (668, 1, 1, 3, '2015-12-23 14:03:35', '172.31.0.51', '/DHT/jeeadmin/jeecms/ftp/o_update.do', '修改FTP', 'id=21;name=6');
INSERT INTO `jc_log` VALUES (669, 1, 1, 3, '2015-12-23 14:04:08', '172.31.0.51', '/DHT1/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/3.html');
INSERT INTO `jc_log` VALUES (670, 1, 1, 3, '2015-12-23 14:10:57', '172.31.0.51', '/DHT/jeeadmin/jeecms/ftp/o_delete.do', '删除FTP', 'id=1;name=1');
INSERT INTO `jc_log` VALUES (671, 1, 1, 3, '2015-12-23 14:11:30', '172.31.0.51', '/DHT1/jeeadmin/jeecms/ftp/o_save.do', '增加FTP', 'id=22;name=3');
INSERT INTO `jc_log` VALUES (672, 1, 1, 3, '2015-12-23 14:11:54', '172.31.0.51', '/DHT/jeeadmin/jeecms/ftp/o_save.do', '增加FTP', 'id=23;name=3');
INSERT INTO `jc_log` VALUES (673, 1, 1, 3, '2015-12-23 14:20:05', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=2;name=3333');
INSERT INTO `jc_log` VALUES (674, 1, 1, 3, '2015-12-23 14:20:06', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=3;name=3333');
INSERT INTO `jc_log` VALUES (675, 1, 1, 3, '2015-12-23 14:20:06', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=4;name=3333');
INSERT INTO `jc_log` VALUES (676, 1, 1, 3, '2015-12-23 14:20:06', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=5;name=3333');
INSERT INTO `jc_log` VALUES (677, 1, 1, 3, '2015-12-23 14:20:49', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site/o_delete.do', '删除站点', 'id=3;name=3333');
INSERT INTO `jc_log` VALUES (678, 1, 1, 3, '2015-12-23 14:20:49', '172.31.0.51', '/DHT1/jeeadmin/jeecms/site/o_delete.do', '删除站点', 'id=5;name=3333');
INSERT INTO `jc_log` VALUES (681, 1, 1, 3, '2015-12-23 14:21:22', '172.31.0.51', '/DHT/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=6;name=3');
INSERT INTO `jc_log` VALUES (682, 1, 1, 3, '2015-12-23 14:21:27', '172.31.0.51', '/DHT/jeeadmin/jeecms/site/o_delete.do', '删除站点', 'id=6;name=3');
INSERT INTO `jc_log` VALUES (683, 1, 1, 3, '2015-12-23 14:21:39', '172.31.0.51', '/DHT/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=7;name=3');
INSERT INTO `jc_log` VALUES (684, 1, 1, 3, '2015-12-23 14:21:43', '172.31.0.51', '/DHT/jeeadmin/jeecms/site/o_delete.do', '删除站点', 'id=7;name=3');
INSERT INTO `jc_log` VALUES (685, 1, 1, 3, '2015-12-23 14:22:25', '172.31.0.51', '/DHT/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=8;name=6');
INSERT INTO `jc_log` VALUES (686, 1, 1, 3, '2015-12-23 14:22:26', '172.31.0.51', '/DHT/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=9;name=6');
INSERT INTO `jc_log` VALUES (689, 1, NULL, 1, '2015-12-23 15:16:50', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (690, 1, NULL, 1, '2015-12-23 17:11:37', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (691, NULL, NULL, 2, '2015-12-24 09:14:04', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (692, 1, NULL, 1, '2015-12-24 09:14:11', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (693, 1, NULL, 1, '2015-12-24 09:20:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (694, 1, NULL, 1, '2015-12-24 09:31:08', '172.31.0.223', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (695, 1, 1, 3, '2015-12-24 09:44:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/ftp/o_update.do', '修改FTP', 'id=22;name=3');
INSERT INTO `jc_log` VALUES (696, 1, 1, 3, '2015-12-24 09:45:39', '127.0.0.1', '/DHT/jeeadmin/jeecms/ftp/o_update.do', '修改FTP', 'id=22;name=3');
INSERT INTO `jc_log` VALUES (697, NULL, NULL, 2, '2015-12-24 09:46:17', '172.31.0.223', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (698, 1, NULL, 1, '2015-12-24 09:46:22', '172.31.0.223', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (699, 1, 1, 3, '2015-12-24 09:46:44', '172.31.0.223', '/DHT/jeeadmin/jeecms/ftp/o_update.do', '修改FTP', 'id=22;name=3');
INSERT INTO `jc_log` VALUES (700, 1, NULL, 1, '2015-12-24 10:34:28', '172.31.0.221', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (701, 1, NULL, 1, '2015-12-24 10:40:50', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (702, 1, NULL, 1, '2015-12-24 10:46:19', '172.31.0.221', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (703, 1, 1, 3, '2015-12-24 10:46:34', '172.31.0.221', '/DHT/jeeadmin/jeecms/friendlink_ctg/o_update.do', '修改友情链接类别', NULL);
INSERT INTO `jc_log` VALUES (704, NULL, NULL, 2, '2015-12-24 10:57:16', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (705, NULL, NULL, 2, '2015-12-24 10:57:24', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (706, NULL, NULL, 2, '2015-12-24 10:57:32', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (707, NULL, NULL, 2, '2015-12-24 10:57:36', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (708, NULL, NULL, 2, '2015-12-24 10:58:22', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (709, NULL, NULL, 2, '2015-12-24 10:58:38', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (710, 1, NULL, 1, '2015-12-24 10:59:15', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (711, 1, 1, 3, '2015-12-24 11:06:18', '172.31.0.112', '/DHT1/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/检察院【非罪行贿档案管理系统】_14.4.30（正）.pptx');
INSERT INTO `jc_log` VALUES (712, 1, 1, 3, '2015-12-24 11:06:23', '172.31.0.112', '/DHT/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/检察院【非罪行贿档案管理系统】_14.4.30（正）.pptx');
INSERT INTO `jc_log` VALUES (713, 1, NULL, 1, '2015-12-24 03:08:31', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (714, 1, NULL, 1, '2015-12-24 11:12:16', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (715, 1, NULL, 1, '2015-12-24 12:46:37', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (716, 1, NULL, 1, '2015-12-24 13:14:59', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (717, NULL, NULL, 2, '2015-12-24 13:43:54', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=ADMIN');
INSERT INTO `jc_log` VALUES (718, 1, NULL, 1, '2015-12-24 13:43:58', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (719, 1, NULL, 1, '2015-12-24 13:53:49', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (720, 1, NULL, 1, '2015-12-24 13:55:44', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (721, 1, NULL, 1, '2015-12-24 14:17:54', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (722, 1, NULL, 1, '2015-12-24 14:21:07', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (723, 1, NULL, 1, '2015-12-24 14:29:47', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (724, 1, NULL, 1, '2015-12-24 14:41:11', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (725, 1, NULL, 1, '2015-12-24 14:43:37', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (726, 1, NULL, 1, '2015-12-24 14:46:44', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (727, 1, 1, 3, '2015-12-24 14:50:47', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (728, 1, 1, 3, '2015-12-24 14:50:50', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (729, 1, 1, 3, '2015-12-24 14:50:56', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (730, 1, 1, 3, '2015-12-24 14:51:11', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (731, 1, 1, 3, '2015-12-24 14:51:34', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (732, 1, 1, 3, '2015-12-24 14:51:44', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (733, 1, 1, 3, '2015-12-24 14:56:34', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (734, 1, 1, 3, '2015-12-24 14:58:19', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (735, 1, 1, 3, '2015-12-24 15:06:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (736, 1, 1, 3, '2015-12-24 15:06:29', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (737, 1, 1, 3, '2015-12-24 15:06:38', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (738, 1, 1, 3, '2015-12-24 15:07:11', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (739, 1, 1, 3, '2015-12-24 15:10:42', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (740, 1, 1, 3, '2015-12-24 15:11:28', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (741, 1, 1, 3, '2015-12-24 15:11:58', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (742, 1, 1, 3, '2015-12-24 15:13:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (743, 1, 1, 3, '2015-12-24 15:15:58', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (744, 1, 1, 3, '2015-12-24 15:16:04', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (745, 1, 1, 3, '2015-12-24 15:16:11', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (746, 1, NULL, 1, '2015-12-24 15:34:17', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (747, 1, NULL, 1, '2015-12-24 15:40:37', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (748, 1, 1, 3, '2015-12-24 15:40:44', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (749, 1, 1, 3, '2015-12-24 15:41:45', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (750, 1, 1, 3, '2015-12-24 15:56:44', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (751, 1, 1, 3, '2015-12-24 15:57:50', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (752, NULL, NULL, 2, '2015-12-24 16:11:50', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (753, 1, NULL, 1, '2015-12-24 16:12:15', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (754, 1, 1, 3, '2015-12-24 16:12:20', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (755, 1, 1, 3, '2015-12-24 16:12:47', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (756, 1, 1, 3, '2015-12-24 16:13:07', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (757, 1, 1, 3, '2015-12-24 16:13:29', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (758, 1, 1, 3, '2015-12-24 16:14:22', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (759, 1, 1, 3, '2015-12-24 16:14:30', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (760, 1, 1, 3, '2015-12-24 16:14:38', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (761, 1, NULL, 1, '2015-12-24 16:48:58', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (762, 1, 1, 3, '2015-12-24 16:49:05', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (763, 1, 1, 3, '2015-12-24 16:49:26', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', 'Site Basic Set', NULL);
INSERT INTO `jc_log` VALUES (764, 1, NULL, 1, '2015-12-24 17:21:00', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (765, 1, 1, 3, '2015-12-24 17:22:54', '127.0.0.1', '/DHT/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/[阳光电影www.ygdy8.com].失忆风云.BD.720p.中英双字幕.rmvb');
INSERT INTO `jc_log` VALUES (766, 1, NULL, 1, '2015-12-24 17:30:16', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (781, 1, NULL, 1, '2015-12-25 09:14:51', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (782, 1, NULL, 1, '2015-12-25 09:23:33', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (783, 1, NULL, 1, '2015-12-25 09:48:45', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (784, 1, NULL, 1, '2015-12-25 10:01:27', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (785, 1, NULL, 1, '2015-12-25 10:23:59', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (786, 1, NULL, 1, '2015-12-25 10:28:13', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (787, NULL, NULL, 2, '2015-12-25 11:40:58', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (788, NULL, NULL, 2, '2015-12-25 11:41:11', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (789, 1, NULL, 1, '2015-12-25 11:41:52', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (790, 1, NULL, 1, '2015-12-25 11:45:49', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (791, 1, 1, 3, '2015-12-25 11:51:35', '172.31.0.61', '/DHT1/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (792, 1, NULL, 1, '2015-12-25 11:51:54', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (793, 1, 1, 3, '2015-12-25 11:52:51', '172.31.0.61', '/DHT1/jeeadmin/jeecms/site_config/o_company_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (794, 1, 1, 3, '2015-12-25 11:53:48', '172.31.0.61', '/DHT1/jeeadmin/jeecms/admin_local/o_update.do', '修改用户', 'id=1;username=admin');
INSERT INTO `jc_log` VALUES (795, 1, 1, 3, '2015-12-25 11:56:10', '172.31.0.61', '/DHT1/jeeadmin/jeecms/friendlink/o_delete.do', '删除友情链接', 'id=1;name=JEECMS官网');
INSERT INTO `jc_log` VALUES (796, 1, 1, 3, '2015-12-25 11:56:10', '172.31.0.61', '/DHT1/jeeadmin/jeecms/friendlink/o_delete.do', '删除友情链接', 'id=2;name=JEEBBS论坛');
INSERT INTO `jc_log` VALUES (797, 1, 1, 3, '2015-12-25 11:56:40', '172.31.0.112', '/DHT1/jeeadmin/jeecms/department/o_save.do', '增加部门', 'id=4;name=测试');
INSERT INTO `jc_log` VALUES (798, 1, NULL, 1, '2015-12-25 13:23:31', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (799, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=22;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (800, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=25;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (801, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=24;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (802, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=26;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (803, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=27;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (804, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=29;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (805, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=28;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (806, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=30;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (807, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=31;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (808, 1, 1, 3, '2015-12-25 13:32:01', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=23;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (809, 1, NULL, 1, '2015-12-25 14:10:47', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (810, 1, 1, 3, '2015-12-25 14:38:56', '172.31.0.112', '/DHT/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=32;username=原网站测试');
INSERT INTO `jc_log` VALUES (811, 1, 1, 3, '2015-12-25 14:38:56', '172.31.0.112', '/DHT/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=33;username=原网站测试');
INSERT INTO `jc_log` VALUES (812, 1, NULL, 1, '2015-12-25 15:31:16', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (813, 1, NULL, 1, '2015-12-25 15:32:36', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (814, 1, 1, 3, '2015-12-25 15:46:19', '172.31.0.112', '/DHT/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=5;name=test1');
INSERT INTO `jc_log` VALUES (815, 1, 1, 3, '2015-12-25 15:47:19', '172.31.0.112', '/DHT/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=5;name=test1');
INSERT INTO `jc_log` VALUES (816, 1, 1, 3, '2015-12-25 15:53:14', '172.31.0.112', '/DHT1/jeeadmin/jeecms/group/o_delete.do', '删除会员组', 'id=7;name=wew');
INSERT INTO `jc_log` VALUES (817, 1, 1, 3, '2015-12-25 15:57:39', '172.31.0.112', '/DHT/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=34;username=1111111111111111111111111111');
INSERT INTO `jc_log` VALUES (818, 1, 1, 3, '2015-12-25 15:57:42', '172.31.0.112', '/DHT/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=35;username=1111111111111111111111111111');
INSERT INTO `jc_log` VALUES (819, NULL, NULL, 2, '2015-12-25 15:58:39', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (820, 1, NULL, 1, '2015-12-25 15:58:44', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (821, 1, 1, 3, '2015-12-25 16:03:41', '172.31.0.61', '/DHT1/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=660;title=345345345');
INSERT INTO `jc_log` VALUES (822, 1, 1, 3, '2015-12-25 16:08:33', '172.31.0.61', '/DHT1/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=660;title=345345345');
INSERT INTO `jc_log` VALUES (823, 1, NULL, 1, '2015-12-25 16:09:55', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (824, 1, NULL, 1, '2015-12-25 16:14:24', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (825, 1, NULL, 1, '2015-12-25 16:16:39', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (826, 1, 1, 3, '2015-12-25 16:26:40', '172.31.0.61', '/DHT1/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=660;title=345345345');
INSERT INTO `jc_log` VALUES (827, 1, NULL, 1, '2015-12-25 16:46:25', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (828, 1, 1, 3, '2015-12-25 16:50:59', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=36;username=22222222222222222222222222222222');
INSERT INTO `jc_log` VALUES (829, 1, 1, 3, '2015-12-25 17:01:59', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=37;username=3333333333333333333333333333333333');
INSERT INTO `jc_log` VALUES (830, 1, 1, 3, '2015-12-25 17:02:24', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=38;username=789555225212112121');
INSERT INTO `jc_log` VALUES (831, 1, 1, 3, '2015-12-25 17:03:15', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=39;username=温泉323');
INSERT INTO `jc_log` VALUES (832, 1, 1, 3, '2015-12-25 17:04:16', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=41;username=提高语文');
INSERT INTO `jc_log` VALUES (833, 1, 1, 3, '2015-12-25 17:04:17', '172.31.0.112', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=40;username=提高语文');
INSERT INTO `jc_log` VALUES (834, 1, 1, 3, '2015-12-25 17:33:07', '172.31.0.112', '/DHT1/jeeadmin/jeecms/admin_global/o_save.do', '增加用户', 'id=42;username=admin1');
INSERT INTO `jc_log` VALUES (835, 1, 1, 3, '2015-12-25 17:40:37', '172.31.0.112', '/DHT1/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=1;name=普通会员');
INSERT INTO `jc_log` VALUES (836, 1, 1, 3, '2015-12-25 17:40:40', '172.31.0.112', '/DHT1/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=2;name=高级组');
INSERT INTO `jc_log` VALUES (837, 1, 1, 3, '2015-12-25 17:41:07', '172.31.0.112', '/DHT1/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (841, NULL, NULL, 2, '2015-12-26 09:59:58', '172.31.0.231', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (842, NULL, NULL, 2, '2015-12-26 10:00:05', '172.31.0.231', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (843, 1, NULL, 1, '2015-12-26 10:05:18', '172.31.0.231', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (844, 1, NULL, 1, '2015-12-26 10:05:27', '172.31.0.231', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (845, 1, NULL, 1, '2015-12-26 10:08:40', '172.31.0.231', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (846, 1, 1, 3, '2015-12-26 10:29:57', '172.31.0.231', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=62;username=test1');
INSERT INTO `jc_log` VALUES (847, 1, 1, 3, '2015-12-26 10:34:39', '172.31.0.231', '/DHT1/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=63;username=test2');
INSERT INTO `jc_log` VALUES (848, 1, 1, 3, '2015-12-26 10:36:09', '172.31.0.231', '/DHT/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=64;username=test3');
INSERT INTO `jc_log` VALUES (849, 1, 1, 3, '2015-12-26 10:55:18', '172.31.0.231', '/DHT/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=680;title=1');
INSERT INTO `jc_log` VALUES (850, 1, 1, 3, '2015-12-26 10:55:23', '172.31.0.231', '/DHT1/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=681;title=1');
INSERT INTO `jc_log` VALUES (861, 1, NULL, 1, '2015-12-28 11:36:31', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (862, 1, NULL, 1, '2015-12-28 14:31:27', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (863, 1, NULL, 1, '2015-12-28 14:34:33', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (864, 1, 1, 3, '2015-12-28 14:37:18', '172.31.0.61', '/DHT1/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=700;title=234234');
INSERT INTO `jc_log` VALUES (865, 1, 1, 3, '2015-12-28 14:38:35', '172.31.0.61', '/DHT1/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=701;title=3123123123');
INSERT INTO `jc_log` VALUES (866, NULL, NULL, 2, '2015-12-28 17:55:13', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (867, 1, NULL, 1, '2015-12-28 17:55:19', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (868, 1, 1, 3, '2015-12-28 17:56:03', '127.0.0.1', '/DHT/jeeadmin/jeecms/topic/o_update.do', '修改专题', 'id=13;name=测试123');
INSERT INTO `jc_log` VALUES (881, 1, NULL, 1, '2015-12-29 13:53:34', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (882, 1, NULL, 1, '2015-12-29 15:34:18', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (883, NULL, NULL, 2, '2015-12-29 16:43:44', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (884, 1, NULL, 1, '2015-12-29 16:43:48', '172.31.0.61', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (901, NULL, NULL, 2, '2015-12-30 09:23:11', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (902, 1, NULL, 1, '2015-12-30 09:23:17', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (903, 1, 1, 3, '2015-12-30 09:35:55', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (904, 1, NULL, 1, '2015-12-30 09:49:28', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (905, 1, NULL, 1, '2015-12-30 10:10:57', '172.31.0.221', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (906, 1, 1, 3, '2015-12-30 10:11:22', '172.31.0.221', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (907, 1, NULL, 1, '2015-12-30 10:26:02', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (908, 1, 1, 3, '2015-12-30 10:26:24', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (909, 1, 1, 3, '2015-12-30 10:30:46', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (910, 1, 1, 3, '2015-12-30 10:35:27', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (911, 1, 1, 3, '2015-12-30 10:36:20', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (912, 1, NULL, 1, '2015-12-30 10:35:09', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (913, 1, 1, 3, '2015-12-30 10:38:25', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (914, 1, 1, 3, '2015-12-30 11:07:25', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/bimgs.dat');
INSERT INTO `jc_log` VALUES (915, 1, 1, 3, '2015-12-30 11:07:25', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/change_wallpaper.zip');
INSERT INTO `jc_log` VALUES (916, 1, 1, 3, '2015-12-30 11:07:25', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/会议室2015-12-11.zip');
INSERT INTO `jc_log` VALUES (917, 1, 1, 3, '2015-12-30 11:07:31', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delete_single.do', '删除资源', 'filename=/u/cms/www/201511');
INSERT INTO `jc_log` VALUES (918, 1, NULL, 1, '2015-12-30 11:45:52', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (919, 1, NULL, 1, '2015-12-30 13:21:17', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (920, 1, 1, 3, '2015-12-30 13:33:23', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/member/o_save.do', '增加会员', 'id=82;username=1111');
INSERT INTO `jc_log` VALUES (921, 1, 1, 3, '2015-12-30 13:34:02', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=64;username=test3');
INSERT INTO `jc_log` VALUES (922, 1, NULL, 1, '2015-12-30 13:55:10', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (923, 1, 1, 3, '2015-12-30 13:55:25', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201309');
INSERT INTO `jc_log` VALUES (924, 1, 1, 3, '2015-12-30 13:55:25', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/201411');
INSERT INTO `jc_log` VALUES (925, 1, 1, 3, '2015-12-30 13:55:25', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delete.do', '删除资源', 'filename=/u/cms/www/会议室2015-12-11.zip');
INSERT INTO `jc_log` VALUES (926, 1, 1, 3, '2015-12-30 13:55:55', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=1/u/cms/www/201512/2315172375fw.jpg');
INSERT INTO `jc_log` VALUES (927, 1, 1, 3, '2015-12-30 13:55:55', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=1/u/cms/www/201512/23151706f43x.jpg');
INSERT INTO `jc_log` VALUES (928, 1, 1, 3, '2015-12-30 13:55:55', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=1/u/cms/www/201512/23134208xvf8.jpg');
INSERT INTO `jc_log` VALUES (929, 1, 1, 3, '2015-12-30 13:55:55', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=1/u/cms/www/201512/16154008ij36.jpg');
INSERT INTO `jc_log` VALUES (930, 1, 1, 3, '2015-12-30 13:55:55', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/25174739toxb.jpg');
INSERT INTO `jc_log` VALUES (931, 1, 1, 3, '2015-12-30 13:55:55', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/241443492qok.png');
INSERT INTO `jc_log` VALUES (932, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24144146jhxy.png');
INSERT INTO `jc_log` VALUES (933, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/2414414052ma.png');
INSERT INTO `jc_log` VALUES (934, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24143827j2md.png');
INSERT INTO `jc_log` VALUES (935, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24143739g4mt.png');
INSERT INTO `jc_log` VALUES (936, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24143546si4n.png');
INSERT INTO `jc_log` VALUES (937, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24143328lrd5.png');
INSERT INTO `jc_log` VALUES (938, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24143119gtfe.png');
INSERT INTO `jc_log` VALUES (939, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/241430116hsh.png');
INSERT INTO `jc_log` VALUES (940, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/241424592d1j.png');
INSERT INTO `jc_log` VALUES (941, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24142410uujz.png');
INSERT INTO `jc_log` VALUES (942, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/2414224574lc.png');
INSERT INTO `jc_log` VALUES (943, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24142133p777.png');
INSERT INTO `jc_log` VALUES (944, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24141811xy7p.png');
INSERT INTO `jc_log` VALUES (945, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24140859t3si.png');
INSERT INTO `jc_log` VALUES (946, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24140601xbwr.png');
INSERT INTO `jc_log` VALUES (947, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24140409zx5j.png');
INSERT INTO `jc_log` VALUES (948, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/241403110sqf.png');
INSERT INTO `jc_log` VALUES (949, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24140221bb3s.png');
INSERT INTO `jc_log` VALUES (950, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24140114dcio.png');
INSERT INTO `jc_log` VALUES (951, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24140007pdey.png');
INSERT INTO `jc_log` VALUES (952, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24135939mw7z.png');
INSERT INTO `jc_log` VALUES (953, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24135856fekf.png');
INSERT INTO `jc_log` VALUES (954, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24135756s44a.png');
INSERT INTO `jc_log` VALUES (955, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24135720tbvk.png');
INSERT INTO `jc_log` VALUES (956, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24135600i5w8.png');
INSERT INTO `jc_log` VALUES (957, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24135402qwya.png');
INSERT INTO `jc_log` VALUES (958, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24135314duov.png');
INSERT INTO `jc_log` VALUES (959, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24134928nw6n.png');
INSERT INTO `jc_log` VALUES (960, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24133658ij8h.png');
INSERT INTO `jc_log` VALUES (961, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24131859nbp3.png');
INSERT INTO `jc_log` VALUES (962, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/2413162350ah.png');
INSERT INTO `jc_log` VALUES (963, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24124957d4fo.png');
INSERT INTO `jc_log` VALUES (964, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24113330qjpq.png');
INSERT INTO `jc_log` VALUES (965, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24113119ihl4.png');
INSERT INTO `jc_log` VALUES (966, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24112744f37m.png');
INSERT INTO `jc_log` VALUES (967, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24112459zxke.png');
INSERT INTO `jc_log` VALUES (968, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/241119234vtg.png');
INSERT INTO `jc_log` VALUES (969, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/24111256a283.png');
INSERT INTO `jc_log` VALUES (970, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/2411123177i7.png');
INSERT INTO `jc_log` VALUES (971, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/18132949bjjc.jpg');
INSERT INTO `jc_log` VALUES (972, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/17142624u58c.jpg');
INSERT INTO `jc_log` VALUES (973, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/161552058ysa.jpg');
INSERT INTO `jc_log` VALUES (974, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/16155025cpty.jpg');
INSERT INTO `jc_log` VALUES (975, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/16154609pio0.gif');
INSERT INTO `jc_log` VALUES (976, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/16154551g4de.gif');
INSERT INTO `jc_log` VALUES (977, 1, 1, 3, '2015-12-30 13:55:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/file/o_delfreefiles.do', '删除资源', 'filename=/u/cms/www/201512/16154032pc0s.jpg');
INSERT INTO `jc_log` VALUES (978, NULL, NULL, 2, '2015-12-30 14:22:56', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (979, 1, NULL, 1, '2015-12-30 14:23:02', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (980, 1, NULL, 1, '2015-12-30 14:36:36', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (981, 1, NULL, 1, '2015-12-30 14:55:08', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (982, 1, NULL, 1, '2015-12-30 14:59:07', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (983, 1, NULL, 1, '2015-12-30 15:03:08', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (984, NULL, NULL, 2, '2015-12-30 15:50:54', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (985, NULL, NULL, 2, '2015-12-30 15:50:59', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (986, 1, NULL, 1, '2015-12-30 15:51:05', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (987, 1, NULL, 1, '2015-12-30 16:26:15', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (988, 1, NULL, 1, '2015-12-30 16:27:30', '172.31.0.221', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (989, 1, 1, 3, '2015-12-30 16:31:12', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=82;username=1111');
INSERT INTO `jc_log` VALUES (990, 1, NULL, 1, '2015-12-30 16:58:30', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1001, 1, NULL, 1, '2016-01-05 15:56:00', '172.31.0.50', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1002, 1, NULL, 1, '2016-01-05 17:05:11', '172.31.0.50', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1021, NULL, NULL, 2, '2016-01-12 09:21:31', '172.31.0.28', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1022, NULL, NULL, 2, '2016-01-12 09:21:38', '172.31.0.28', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1023, 1, NULL, 1, '2016-01-12 09:21:43', '172.31.0.28', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1024, 1, 1, 3, '2016-01-12 09:27:36', '172.31.0.28', '/DHT1/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=720;title=testswf');
INSERT INTO `jc_log` VALUES (1025, NULL, NULL, 2, '2016-01-12 09:28:31', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1026, NULL, NULL, 2, '2016-01-12 09:28:37', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1027, NULL, NULL, 2, '2016-01-12 09:28:43', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1028, NULL, NULL, 2, '2016-01-12 09:29:41', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1029, 1, 1, 3, '2016-01-12 09:29:55', '172.31.0.28', '/DHT1/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=721;title=testswf1');
INSERT INTO `jc_log` VALUES (1030, NULL, NULL, 2, '2016-01-12 09:29:55', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1031, NULL, NULL, 2, '2016-01-12 09:30:41', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1032, NULL, NULL, 2, '2016-01-12 09:30:54', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1033, NULL, NULL, 2, '2016-01-12 09:31:12', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1034, NULL, NULL, 2, '2016-01-12 09:31:32', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1035, NULL, NULL, 2, '2016-01-12 09:31:41', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1036, 1, NULL, 1, '2016-01-12 09:31:58', '172.31.0.112', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1037, 1, NULL, 1, '2016-01-12 09:56:17', '172.31.0.112', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1038, 1, NULL, 1, '2016-01-12 10:01:43', '172.31.0.28', '/DHT1/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1039, 1, 1, 3, '2016-01-12 10:03:04', '172.31.0.112', '/DHT/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=1;name=普通会员');
INSERT INTO `jc_log` VALUES (1040, 1, NULL, 1, '2016-01-12 15:50:52', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1041, 1, 1, 3, '2016-01-12 15:52:25', '127.0.0.1', '/DHT/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1042, 1, 1, 3, '2016-01-12 15:54:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1043, 1, 1, 3, '2016-01-12 16:09:33', '127.0.0.1', '/DHT/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=1;name=普通会员');
INSERT INTO `jc_log` VALUES (1044, 1, NULL, 1, '2016-01-12 16:45:40', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1061, 1, NULL, 1, '2016-01-13 15:47:54', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1062, 1, 1, 3, '2016-01-13 15:48:34', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1063, 1, 1, 3, '2016-01-13 15:49:47', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1064, 1, 1, 3, '2016-01-13 16:02:30', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1065, 1, 1, 3, '2016-01-13 16:38:03', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=1;name=普通会员');
INSERT INTO `jc_log` VALUES (1066, 1, 1, 3, '2016-01-13 16:38:51', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1067, 1, 1, 3, '2016-01-13 16:50:33', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1068, 1, 1, 3, '2016-01-13 16:51:22', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1069, 1, 1, 3, '2016-01-13 16:57:31', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1070, 1, 1, 3, '2016-01-13 17:13:33', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1071, 1, 1, 3, '2016-01-13 17:13:48', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1072, 1, 1, 3, '2016-01-13 17:14:07', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1073, 1, 1, 3, '2016-01-13 17:14:29', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1074, 1, NULL, 1, '2016-01-13 17:37:20', '172.31.0.112', '/jeecmsv7/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1075, 1, 1, 3, '2016-01-13 17:39:15', '172.31.0.112', '/jeecmsv7/jeeadmin/jeecms/role/o_save.do', '增加角色', 'id=4;name= ewq ');
INSERT INTO `jc_log` VALUES (1076, 1, 1, 3, '2016-01-13 17:40:41', '172.31.0.112', '/jeecmsv7/jeeadmin/jeecms/admin_local/o_save.do', '增加用户', 'id=102;username=111');
INSERT INTO `jc_log` VALUES (1077, 102, NULL, 1, '2016-01-13 17:40:53', '172.31.0.112', '/jeecmsv7/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1078, 1, 1, 3, '2016-01-13 17:56:08', '127.0.0.1', '/jeecmsv7/jeeadmin/jeecms/plug/o_upload.do', '上传插件', 'filename=plugFile');
INSERT INTO `jc_log` VALUES (1081, 1, 1, 3, '2016-01-20 10:48:28', '127.0.0.1', '/DHT/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1082, 1, 1, 3, '2016-01-20 10:48:44', '127.0.0.1', '/DHT/jeeadmin/jeecms/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1083, 1, NULL, 1, '2016-01-20 10:51:16', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1084, 1, NULL, 1, '2016-01-20 10:53:15', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1085, 1, 1, 3, '2016-01-20 10:55:06', '127.0.0.1', '/DHT/jeeadmin/jeecms/role/o_update.do', '修改角色', 'id=1;name=管理员');
INSERT INTO `jc_log` VALUES (1086, 1, 1, 3, '2016-01-20 10:57:02', '127.0.0.1', '/DHT/jeeadmin/jeecms/group/o_update.do', '修改会员组', 'id=1;name=普通会员');
INSERT INTO `jc_log` VALUES (1087, 1, NULL, 1, '2016-01-20 16:08:44', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1088, 1, 1, 3, '2016-01-20 16:15:49', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=63;username=test2');
INSERT INTO `jc_log` VALUES (1089, 1, 1, 3, '2016-01-20 16:17:16', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=62;username=test1');
INSERT INTO `jc_log` VALUES (1090, 1, 1, 3, '2016-01-20 16:17:16', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=41;username=提高语文');
INSERT INTO `jc_log` VALUES (1091, 1, 1, 3, '2016-01-20 16:17:16', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=40;username=提高语文');
INSERT INTO `jc_log` VALUES (1092, 1, 1, 3, '2016-01-20 16:17:16', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=39;username=温泉323');
INSERT INTO `jc_log` VALUES (1093, 1, 1, 3, '2016-01-20 16:17:17', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=38;username=789555225212112121');
INSERT INTO `jc_log` VALUES (1094, 1, 1, 3, '2016-01-20 16:17:17', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=37;username=3333333333333333333333333333333333');
INSERT INTO `jc_log` VALUES (1095, 1, 1, 3, '2016-01-20 16:17:17', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=36;username=22222222222222222222222222222222');
INSERT INTO `jc_log` VALUES (1096, 1, 1, 3, '2016-01-20 16:17:17', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=35;username=1111111111111111111111111111');
INSERT INTO `jc_log` VALUES (1097, 1, 1, 3, '2016-01-20 16:17:17', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=34;username=1111111111111111111111111111');
INSERT INTO `jc_log` VALUES (1098, 1, 1, 3, '2016-01-20 16:17:17', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=33;username=原网站测试');
INSERT INTO `jc_log` VALUES (1099, 1, 1, 3, '2016-01-20 16:17:17', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=32;username=原网站测试');
INSERT INTO `jc_log` VALUES (1100, 1, 1, 3, '2016-01-20 16:17:23', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=31;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1101, 1, 1, 3, '2016-01-20 16:17:24', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=30;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1102, 1, 1, 3, '2016-01-20 16:17:24', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=29;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1103, 1, 1, 3, '2016-01-20 16:17:24', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=28;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1104, 1, 1, 3, '2016-01-20 16:17:24', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=27;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1105, 1, 1, 3, '2016-01-20 16:17:25', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=26;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1106, 1, 1, 3, '2016-01-20 16:17:25', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=25;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1107, 1, 1, 3, '2016-01-20 16:17:28', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=24;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1108, 1, 1, 3, '2016-01-20 16:17:28', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=23;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1109, 1, 1, 3, '2016-01-20 16:17:41', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=22;username=测试会员管理添加');
INSERT INTO `jc_log` VALUES (1110, 1, 1, 3, '2016-01-20 16:17:41', '127.0.0.1', '/DHT/jeeadmin/jeecms/member/o_delete.do', '删除会员', 'id=2;username=1');
INSERT INTO `jc_log` VALUES (1111, 1, NULL, 1, '2016-03-01 16:17:39', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1112, 1, 1, 3, '2016-03-01 16:18:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=740;title=这是咋回事啊');
INSERT INTO `jc_log` VALUES (1113, 1, 1, 3, '2016-03-01 16:18:23', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=740;title=这是咋回事啊');
INSERT INTO `jc_log` VALUES (1114, 1, NULL, 1, '2016-03-01 16:45:20', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1115, 1, 1, 3, '2016-03-01 16:46:22', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=740;title=这是咋回事啊');
INSERT INTO `jc_log` VALUES (1116, 1, 1, 3, '2016-03-01 16:48:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=740;title=这是咋回事啊');
INSERT INTO `jc_log` VALUES (1117, 1, NULL, 1, '2016-03-01 17:27:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1118, 1, 1, 3, '2016-03-01 17:28:12', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=740;title=这是咋回事啊');
INSERT INTO `jc_log` VALUES (1131, NULL, NULL, 2, '2016-03-02 09:28:36', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1132, 1, NULL, 1, '2016-03-02 09:28:41', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1133, 1, 1, 3, '2016-03-02 09:30:30', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=740;title=这是咋回事啊');
INSERT INTO `jc_log` VALUES (1151, 1, NULL, 1, '2016-03-08 11:25:42', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1152, 1, 1, 3, '2016-03-08 11:50:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/model/o_update.do', '修改模型', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES (1153, 1, NULL, 1, '2016-03-08 14:43:55', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1154, 1, 1, 3, '2016-03-08 14:44:19', '127.0.0.1', '/DHT/jeeadmin/jeecms/channel/o_update.do', '修改栏目', 'id=11;name=国内新闻');
INSERT INTO `jc_log` VALUES (1171, 1, NULL, 1, '2016-04-14 14:06:28', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1172, 1, NULL, 1, '2016-04-14 15:49:53', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1173, 1, 1, 3, '2016-04-14 15:51:53', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=740;title=这是咋回事啊');
INSERT INTO `jc_log` VALUES (1191, 1, NULL, 1, '2016-04-28 11:25:44', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1192, 1, 1, 3, '2016-04-28 11:26:35', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=721;title=testswf1');
INSERT INTO `jc_log` VALUES (1193, 1, 1, 3, '2016-04-28 11:26:57', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=721;title=testswf1');
INSERT INTO `jc_log` VALUES (1194, 1, 1, 3, '2016-04-28 11:28:10', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=721;title=testswf1');
INSERT INTO `jc_log` VALUES (1195, 1, 1, 3, '2016-04-28 11:44:06', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=721;title=testswf1');
INSERT INTO `jc_log` VALUES (1196, 1, 1, 3, '2016-04-28 11:44:19', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=721;title=testswf1');
INSERT INTO `jc_log` VALUES (1211, 1, NULL, 1, '2016-04-29 09:57:41', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1212, 1, 1, 3, '2016-04-29 09:59:32', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=760;title=7777777');
INSERT INTO `jc_log` VALUES (1213, 1, 1, 3, '2016-04-29 10:00:08', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=760;title=7777777');
INSERT INTO `jc_log` VALUES (1231, 1, NULL, 1, '2016-05-11 15:49:05', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1232, 1, 1, 3, '2016-05-11 15:49:42', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=780;title=ZyyT');
INSERT INTO `jc_log` VALUES (1233, 1, 1, 3, '2016-05-11 15:53:02', '127.0.0.1', '/DHT/jeeadmin/jeecms/topic/o_update.do', '修改专题', 'id=13;name=测试123');
INSERT INTO `jc_log` VALUES (1234, 1, 1, 3, '2016-05-11 15:53:20', '127.0.0.1', '/DHT/jeeadmin/jeecms/topic/o_update.do', '修改专题', 'id=13;name=测试123');
INSERT INTO `jc_log` VALUES (1235, 1, NULL, 1, '2016-05-11 16:20:34', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1236, 1, NULL, 1, '2016-05-11 16:20:49', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1237, 1, 1, 3, '2016-05-11 16:23:14', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/alone/alone.html');
INSERT INTO `jc_log` VALUES (1238, 1, 1, 3, '2016-05-11 16:30:27', '127.0.0.1', '/DHT/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=22;name=测试站点2');
INSERT INTO `jc_log` VALUES (1239, 1, 1, 3, '2016-05-11 16:30:57', '127.0.0.1', '/DHT/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=23;name=测试站点2');
INSERT INTO `jc_log` VALUES (1240, 1, 1, 3, '2016-05-11 16:37:50', '127.0.0.1', '/DHT/jeeadmin/jeecms/site/o_delete.do', '删除站点', 'id=22;name=测试站点2');
INSERT INTO `jc_log` VALUES (1243, 1, 1, 3, '2016-05-11 16:43:02', '127.0.0.1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/topic/topic_default.html');
INSERT INTO `jc_log` VALUES (1244, 1, NULL, 1, '2016-05-11 16:45:41', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1245, 1, 1, 3, '2016-05-11 16:46:10', '127.0.0.1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/topic/topic_default.html');
INSERT INTO `jc_log` VALUES (1246, 1, NULL, 1, '2016-05-11 16:48:30', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1247, 1, 1, 3, '2016-05-11 16:51:50', '127.0.0.1', '/DHT/jeeadmin/jeecms/site/o_delete.do', '删除站点', 'id=25;name=子系统');
INSERT INTO `jc_log` VALUES (1248, 1, 1, 3, '2016-05-11 16:53:12', '127.0.0.1', '/DHT/jeeadmin/jeecms/site/o_save.do', '增加站点', 'id=26;name=23');
INSERT INTO `jc_log` VALUES (1249, 1, 1, 3, '2016-05-11 16:54:38', '127.0.0.1', '/DHT/jeeadmin/jeecms/site/o_update.do', '修改站点', 'id=24;name=后台测试子系统');
INSERT INTO `jc_log` VALUES (1271, 1, NULL, 1, '2016-05-12 08:46:59', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1272, 1, NULL, 1, '2016-05-12 09:27:02', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1273, NULL, NULL, 2, '2016-05-12 09:29:06', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1274, 1, NULL, 1, '2016-05-12 09:29:13', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1275, 1, 1, 3, '2016-05-12 09:29:34', '127.0.0.1', '/DHT/jeeadmin/jeecms/topic/o_update.do', '修改专题', 'id=7;name=“气功大师”王林遭质疑');
INSERT INTO `jc_log` VALUES (1276, 1, NULL, 1, '2016-05-12 09:34:02', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1277, 1, 1, 3, '2016-05-12 09:34:11', '127.0.0.1', '/DHT/jeeadmin/jeecms/topic/o_update.do', '修改专题', 'id=7;name=“气功大师”王林遭质疑');
INSERT INTO `jc_log` VALUES (1278, 1, 1, 3, '2016-05-12 09:35:45', '127.0.0.1', '/DHT/jeeadmin/jeecms/template/o_save.do', '增加模板', 'filename=ttt');
INSERT INTO `jc_log` VALUES (1279, 1, NULL, 1, '2016-05-12 09:51:03', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1280, 1, NULL, 1, '2016-05-12 10:20:52', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1281, 1, 1, 3, '2016-05-12 10:21:43', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_update.do', '修改文章', 'id=780;title=ZyyT');
INSERT INTO `jc_log` VALUES (1282, 1, 1, 3, '2016-05-12 10:22:55', '127.0.0.1', '/DHT/jeeadmin/jeecms/content/o_save.do', '增加文章', 'id=800;title=werwerew');
INSERT INTO `jc_log` VALUES (1291, NULL, NULL, 2, '2016-05-12 13:42:31', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1292, 1, NULL, 1, '2016-05-12 13:42:37', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1293, 1, 1, 3, '2016-05-12 13:51:40', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/dht/include/friend_link.html');
INSERT INTO `jc_log` VALUES (1294, 1, 1, 3, '2016-05-12 13:52:13', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/dht/include/header_register.html');
INSERT INTO `jc_log` VALUES (1295, 1, 1, 3, '2016-05-12 13:52:44', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/dht/include/navi.html');
INSERT INTO `jc_log` VALUES (1296, 1, 1, 3, '2016-05-12 13:52:59', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/dht/include/search_csi.html');
INSERT INTO `jc_log` VALUES (1297, 1, 1, 3, '2016-05-12 13:55:02', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/dht/member/login_input.html');
INSERT INTO `jc_log` VALUES (1298, 1, NULL, 1, '2016-05-12 13:56:36', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1299, 1, NULL, 1, '2016-05-12 15:20:10', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1300, 1, 1, 3, '2016-05-12 15:43:09', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/dht/member/register.html');
INSERT INTO `jc_log` VALUES (1311, 1, NULL, 1, '2016-06-17 10:03:41', '127.0.0.1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1312, 1, 1, 3, '2016-06-17 10:05:29', '127.0.0.1', '/DHT/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (1313, NULL, NULL, 2, '2016-06-17 10:33:19', '172.31.0.61', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1314, NULL, NULL, 2, '2016-06-17 10:33:24', '172.31.0.61', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1315, 1, NULL, 1, '2016-06-17 10:33:35', '172.31.0.61', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1316, 1, 1, 3, '2016-06-17 10:44:10', '172.31.0.61', '/DHT/jeeadmin/jeecms/department/o_save.do', '增加部门', 'id=24;name=子部门');
INSERT INTO `jc_log` VALUES (1317, 1, 1, 3, '2016-06-17 10:44:51', '172.31.0.61', '/DHT/jeeadmin/jeecms/department/o_update.do', '修改部门', 'id=3;name=销售部门1');
INSERT INTO `jc_log` VALUES (1318, 1, 1, 3, '2016-06-17 10:46:42', '172.31.0.61', '/DHT/jeeadmin/jeecms/department/o_save.do', '增加部门', 'id=25;name=test2021');
INSERT INTO `jc_log` VALUES (1319, 1, 1, 3, '2016-06-17 10:46:54', '172.31.0.61', '/DHT/jeeadmin/jeecms/department/o_save.do', '增加部门', 'id=26;name=12');
INSERT INTO `jc_log` VALUES (1325, 1, NULL, 1, '2016-06-17 14:14:34', '172.31.0.61', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1326, NULL, NULL, 2, '2016-06-18 11:44:01', '172.31.0.61', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=ａｄｍｉｎ');
INSERT INTO `jc_log` VALUES (1327, 1, NULL, 1, '2016-06-18 11:44:07', '172.31.0.61', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1328, NULL, NULL, 2, '2016-07-06 17:10:26', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1329, NULL, NULL, 2, '2016-07-06 17:10:31', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1330, NULL, NULL, 2, '2016-07-06 17:10:37', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1331, 1, NULL, 1, '2016-07-06 17:19:26', '0:0:0:0:0:0:0:1', '/DHT/jeeadmin/jeecms/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1332, 1, NULL, 1, '2016-07-07 09:15:00', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1333, 1, 1, 3, '2016-07-07 09:15:28', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (1334, 1, NULL, 1, '2016-07-07 09:21:35', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1335, 1, NULL, 1, '2016-07-07 10:27:21', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1336, 1, NULL, 1, '2016-07-07 15:08:45', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1337, 1, 1, 3, '2016-07-07 15:21:36', '127.0.0.1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=821;title=测试测试');
INSERT INTO `jc_log` VALUES (1338, 1, NULL, 1, '2016-07-07 16:52:24', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1339, 1, NULL, 1, '2016-07-07 17:03:12', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1340, 1, NULL, 1, '2016-07-08 08:23:04', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1341, 1, 1, 3, '2016-07-08 09:14:16', '127.0.0.1', '/DHT/yhtd0451/admin/admin_local/o_save.do', '增加用户', 'id=103;username=test');
INSERT INTO `jc_log` VALUES (1342, 103, NULL, 1, '2016-07-08 09:14:50', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1343, 1, NULL, 1, '2016-07-08 09:16:39', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1344, 1, 1, 3, '2016-07-08 09:18:27', '127.0.0.1', '/DHT/yhtd0451/admin/admin_global/o_update.do', '修改用户', 'id=103;username=test');
INSERT INTO `jc_log` VALUES (1345, 103, NULL, 1, '2016-07-08 09:19:55', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1346, 103, 1, 3, '2016-07-08 09:21:26', '127.0.0.1', '/DHT/yhtd0451/admin/admin_global/o_update.do', '修改用户', 'id=103;username=test');
INSERT INTO `jc_log` VALUES (1347, 103, NULL, 1, '2016-07-08 09:21:38', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1348, 1, NULL, 1, '2016-07-08 09:21:54', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1349, 1, 1, 3, '2016-07-08 09:29:39', '127.0.0.1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=821;title=测试测试');
INSERT INTO `jc_log` VALUES (1350, 1, NULL, 1, '2016-07-08 10:11:21', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1351, 1, NULL, 1, '2016-07-08 10:46:57', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1352, 1, 1, 3, '2016-07-08 11:29:32', '127.0.0.1', '/DHT/yhtd0451/admin/guestbook/o_check_cancel.do', '审核留言', 'id=21;title=222');
INSERT INTO `jc_log` VALUES (1353, 1, 1, 3, '2016-07-08 11:29:36', '127.0.0.1', '/DHT/yhtd0451/admin/guestbook/o_check.do', '审核留言', 'id=21;title=222');
INSERT INTO `jc_log` VALUES (1354, 1, NULL, 1, '2016-07-08 12:46:40', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1355, 1, NULL, 1, '2016-07-08 13:12:43', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1356, 1, NULL, 1, '2016-07-08 13:13:11', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1357, 1, NULL, 1, '2016-07-08 13:18:23', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1358, 1, NULL, 1, '2016-07-08 13:23:00', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1359, 1, NULL, 1, '2016-07-08 13:40:39', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1360, 1, NULL, 1, '2016-07-11 09:12:27', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1361, 1, NULL, 1, '2016-07-11 09:09:06', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1362, 1, NULL, 1, '2016-07-11 09:42:40', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1363, 1, NULL, 1, '2016-07-11 13:01:09', '0:0:0:0:0:0:0:1', '/CRJJYJ/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1364, 1, NULL, 1, '2016-07-11 13:09:23', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1365, 1, NULL, 1, '2016-07-23 11:03:09', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1366, 1, NULL, 1, '2016-07-25 15:28:54', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1367, 1, NULL, 1, '2016-07-25 16:19:18', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1368, 1, NULL, 1, '2016-07-25 16:24:16', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1369, 1, NULL, 1, '2016-09-18 14:24:28', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1370, NULL, NULL, 2, '2016-09-18 16:56:04', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1371, 1, NULL, 1, '2016-09-18 16:56:15', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1372, 1, NULL, 1, '2016-09-23 09:17:11', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1373, 1, NULL, 1, '2016-09-26 09:58:13', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1374, 1, NULL, 1, '2016-09-26 10:07:55', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1375, 1, NULL, 1, '2016-09-26 11:14:51', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1376, 1, 1, 3, '2016-09-26 11:15:34', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=821;title=测试测试');
INSERT INTO `jc_log` VALUES (1377, 1, 1, 3, '2016-09-26 11:35:58', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=447;title=醉酒男子强奸孕妇未遂 持刀返回找手机伤人');
INSERT INTO `jc_log` VALUES (1378, 1, 1, 3, '2016-09-26 11:36:41', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=447;title=醉酒男子强奸孕妇未遂 持刀返回找手机伤人');
INSERT INTO `jc_log` VALUES (1379, 1, 1, 3, '2016-09-26 11:37:45', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES (1380, 1, 1, 3, '2016-09-26 11:39:08', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=11;name=国内新闻');
INSERT INTO `jc_log` VALUES (1381, 1, 1, 3, '2016-09-26 11:39:41', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=12;name=国际新闻');
INSERT INTO `jc_log` VALUES (1382, 1, 1, 3, '2016-09-26 11:39:56', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=12;name=国际新闻');
INSERT INTO `jc_log` VALUES (1383, 1, NULL, 1, '2016-09-26 11:40:25', '127.0.0.1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1384, NULL, NULL, 2, '2016-09-26 13:35:12', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1385, NULL, NULL, 2, '2016-09-26 13:37:25', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1386, 1, NULL, 1, '2016-09-26 13:37:35', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1387, 1, NULL, 1, '2016-09-26 13:41:30', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1388, 1, 1, 3, '2016-09-26 13:41:54', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=821;title=测试测试');
INSERT INTO `jc_log` VALUES (1389, 1, 1, 3, '2016-09-26 13:42:18', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=821;title=测试测试');
INSERT INTO `jc_log` VALUES (1390, 1, 1, 3, '2016-09-26 13:48:49', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/role/o_update.do', '修改角色', 'id=1;name=管理员');
INSERT INTO `jc_log` VALUES (1391, 1, 1, 3, '2016-09-26 13:53:39', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (1392, 1, 1, 3, '2016-09-26 13:54:11', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (1393, 1, 1, 3, '2016-09-26 13:54:56', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=11;name=国内新闻');
INSERT INTO `jc_log` VALUES (1394, 1, 1, 3, '2016-09-26 13:55:29', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=821;title=测试测试');
INSERT INTO `jc_log` VALUES (1395, 1, 1, 3, '2016-09-26 13:55:42', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=821;title=测试测试');
INSERT INTO `jc_log` VALUES (1396, 1, 1, 3, '2016-09-26 14:01:50', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=822;title=水电费水电费');
INSERT INTO `jc_log` VALUES (1397, 1, 1, 3, '2016-09-26 14:02:34', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=60;name=网络调查');
INSERT INTO `jc_log` VALUES (1398, 1, 1, 3, '2016-09-26 14:02:46', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES (1399, 1, 1, 3, '2016-09-26 14:02:49', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES (1400, 1, 1, 3, '2016-09-26 14:03:01', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=13;name=社会热点');
INSERT INTO `jc_log` VALUES (1401, 1, 1, 3, '2016-09-26 14:03:08', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=12;name=国际新闻');
INSERT INTO `jc_log` VALUES (1402, 1, 1, 3, '2016-09-26 14:03:13', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=14;name=时事评论');
INSERT INTO `jc_log` VALUES (1403, 1, 1, 3, '2016-09-26 14:03:20', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=15;name=图片新闻');
INSERT INTO `jc_log` VALUES (1404, 1, 1, 3, '2016-09-26 14:03:26', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=40;name=基金视点');
INSERT INTO `jc_log` VALUES (1405, 1, 1, 3, '2016-09-26 14:03:31', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=41;name=财经报道');
INSERT INTO `jc_log` VALUES (1406, 1, 1, 3, '2016-09-26 14:03:42', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=42;name=图库');
INSERT INTO `jc_log` VALUES (1407, 1, 1, 3, '2016-09-26 14:03:49', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=43;name=文娱体育');
INSERT INTO `jc_log` VALUES (1408, 1, NULL, 1, '2016-09-26 14:40:46', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1409, NULL, NULL, 2, '2016-09-26 14:41:46', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1410, NULL, NULL, 2, '2016-09-26 14:41:46', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1411, NULL, NULL, 2, '2016-09-26 14:41:56', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1412, 1, NULL, 1, '2016-09-26 14:42:11', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1413, 1, 1, 3, '2016-09-26 14:43:56', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/vote_topic/o_save.do', '增加投票', 'id=4;title=13123423dfs');
INSERT INTO `jc_log` VALUES (1414, 1, 1, 3, '2016-09-26 14:45:09', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=93;name=2323232');
INSERT INTO `jc_log` VALUES (1415, 1, 1, 3, '2016-09-26 14:45:51', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=824;title=去去去去去');
INSERT INTO `jc_log` VALUES (1416, 1, 1, 3, '2016-09-26 14:52:43', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_save.do', '增加模板', 'filename=test');
INSERT INTO `jc_log` VALUES (1417, 1, 1, 3, '2016-09-26 14:57:50', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/channel/test.html');
INSERT INTO `jc_log` VALUES (1418, 1, 1, 3, '2016-09-26 15:01:44', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/channel/test.html');
INSERT INTO `jc_log` VALUES (1419, 1, NULL, 1, '2016-09-26 15:09:15', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1420, 1, 1, 3, '2016-09-26 15:15:49', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_save.do', '增加模板', 'filename=test123');
INSERT INTO `jc_log` VALUES (1421, 1, NULL, 1, '2016-09-26 15:15:50', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1422, 1, 1, 3, '2016-09-26 15:16:08', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_delete.do', '删除模板', 'filename=/WEB-INF/t/cms/www/default/channel/test123.html');
INSERT INTO `jc_log` VALUES (1423, 1, 1, 3, '2016-09-26 15:16:21', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_save.do', '增加模板', 'filename=news_1234');
INSERT INTO `jc_log` VALUES (1424, 1, 1, 3, '2016-09-26 15:16:42', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_delete.do', '删除模板', 'filename=/WEB-INF/t/cms/www/default/channel/news_1234.html');
INSERT INTO `jc_log` VALUES (1425, 1, 1, 3, '2016-09-26 15:18:41', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=93;name=2323232');
INSERT INTO `jc_log` VALUES (1426, 1, 1, 3, '2016-09-26 15:19:36', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/channel/news_test.html');
INSERT INTO `jc_log` VALUES (1427, 1, 1, 3, '2016-09-26 15:21:01', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=825;title=12121212');
INSERT INTO `jc_log` VALUES (1428, 1, 1, 3, '2016-09-26 15:21:27', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/channel/news_test.html');
INSERT INTO `jc_log` VALUES (1429, 1, 1, 3, '2016-09-26 15:22:10', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/channel/news_test.html');
INSERT INTO `jc_log` VALUES (1430, 1, 1, 3, '2016-09-26 15:22:13', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/channel/news_test.html');
INSERT INTO `jc_log` VALUES (1431, 1, 1, 3, '2016-09-26 15:22:27', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=825;title=12121212');
INSERT INTO `jc_log` VALUES (1432, 1, 1, 3, '2016-09-26 15:24:33', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=825;title=12121212');
INSERT INTO `jc_log` VALUES (1433, 1, 1, 3, '2016-09-26 15:25:19', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=60;name=网络调查');
INSERT INTO `jc_log` VALUES (1434, 1, NULL, 1, '2016-09-26 15:27:21', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1435, 1, 1, 3, '2016-09-26 15:27:37', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=825;title=12121212');
INSERT INTO `jc_log` VALUES (1436, 1, NULL, 1, '2016-09-26 15:29:47', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1437, 1, 1, 3, '2016-09-26 15:30:56', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_save.do', '增加模板', 'filename=news_test');
INSERT INTO `jc_log` VALUES (1438, 1, 1, 3, '2016-09-26 15:38:46', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/channel/news_test.html');
INSERT INTO `jc_log` VALUES (1439, 1, 1, 3, '2016-09-26 15:39:17', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=93;name=2323232');
INSERT INTO `jc_log` VALUES (1440, 1, 1, 3, '2016-09-26 15:39:50', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=826;title=111111111111');
INSERT INTO `jc_log` VALUES (1441, 1, 1, 3, '2016-09-26 15:44:45', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=96;title=null');
INSERT INTO `jc_log` VALUES (1442, 1, 1, 3, '2016-09-26 15:45:08', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=827;title=111111111');
INSERT INTO `jc_log` VALUES (1443, 1, 1, 3, '2016-09-26 15:48:21', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=96;name=test');
INSERT INTO `jc_log` VALUES (1444, 1, 1, 3, '2016-09-26 15:49:47', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES (1445, 1, 1, 3, '2016-09-26 15:49:57', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=90;name=添加新闻子栏目');
INSERT INTO `jc_log` VALUES (1446, 1, 1, 3, '2016-09-26 15:50:06', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=91;name=添加新闻子栏目');
INSERT INTO `jc_log` VALUES (1447, 1, 1, 3, '2016-09-26 15:50:44', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=827;title=111111111');
INSERT INTO `jc_log` VALUES (1448, 1, 1, 3, '2016-09-26 15:52:01', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=828;title=111111111111');
INSERT INTO `jc_log` VALUES (1449, 1, 1, 3, '2016-09-26 15:57:44', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_save.do', '增加模板', 'filename=news_test');
INSERT INTO `jc_log` VALUES (1450, 1, 1, 3, '2016-09-26 15:58:21', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=828;title=111111111111');
INSERT INTO `jc_log` VALUES (1451, 1, 1, 3, '2016-09-26 16:00:15', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=829;title=111111111111');
INSERT INTO `jc_log` VALUES (1452, 1, 1, 3, '2016-09-26 16:00:49', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=830;title=22222222');
INSERT INTO `jc_log` VALUES (1453, 1, NULL, 1, '2016-09-26 16:04:37', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1454, 1, 1, 3, '2016-09-26 16:04:50', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=830;title=22222222');
INSERT INTO `jc_log` VALUES (1455, 1, NULL, 1, '2016-09-26 16:07:04', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1456, 1, 1, 3, '2016-09-26 16:09:09', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/mobile/channel/news.html');
INSERT INTO `jc_log` VALUES (1457, 1, 1, 3, '2016-09-26 16:09:14', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/mobile/channel/news_child.html');
INSERT INTO `jc_log` VALUES (1458, 1, 1, 3, '2016-09-26 16:09:18', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/mobile/channel/news_wldc.html');
INSERT INTO `jc_log` VALUES (1459, 1, NULL, 1, '2016-09-26 16:13:04', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1460, 1, 1, 3, '2016-09-26 16:13:42', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=96;name=test');
INSERT INTO `jc_log` VALUES (1461, 1, NULL, 1, '2016-09-26 16:32:27', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1462, 1, 1, 3, '2016-09-26 16:34:01', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/content/o_update.do', '修改文章', 'id=830;title=22222222');
INSERT INTO `jc_log` VALUES (1463, 1, NULL, 1, '2016-09-26 17:03:00', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1464, NULL, NULL, 2, '2016-09-27 09:14:26', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=yhtd');
INSERT INTO `jc_log` VALUES (1465, NULL, NULL, 2, '2016-09-27 09:14:35', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1466, NULL, NULL, 2, '2016-09-27 09:14:39', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1467, 1, NULL, 1, '2016-09-27 09:14:51', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1468, 1, 1, 3, '2016-09-27 09:16:40', '172.31.0.42', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=831;title=31233231');
INSERT INTO `jc_log` VALUES (1469, 1, NULL, 1, '2016-09-27 09:43:03', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1470, 1, NULL, 1, '2016-09-27 09:43:14', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1471, 1, NULL, 1, '2016-09-27 10:31:10', '172.31.0.54', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1472, 1, NULL, 1, '2016-09-27 10:49:59', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1473, 1, NULL, 1, '2016-09-27 11:17:44', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1474, 1, 1, 3, '2016-09-27 11:28:18', '172.31.0.42', '/DHT/yhtd0451/admin/content/o_save.do', '增加文章', 'id=832;title=法论功');
INSERT INTO `jc_log` VALUES (1475, NULL, NULL, 2, '2016-09-27 11:45:43', '172.31.0.40', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1476, NULL, NULL, 2, '2016-09-27 11:45:52', '172.31.0.40', '/DHT/yhtd0451/admin/login.do', 'login failure', 'username=admnin');
INSERT INTO `jc_log` VALUES (1477, 1, NULL, 1, '2016-09-27 11:45:58', '172.31.0.40', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1478, 1, NULL, 1, '2016-09-27 13:21:46', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1479, 1, NULL, 1, '2016-09-27 16:36:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1480, 1, NULL, 1, '2016-09-28 10:39:45', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1481, 1, NULL, 1, '2016-09-28 10:40:10', '172.31.0.50', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1482, 1, 1, 3, '2016-09-28 10:48:50', '172.31.0.50', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES (1483, 1, 1, 3, '2016-09-28 10:49:37', '172.31.0.50', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=1;name=新闻');
INSERT INTO `jc_log` VALUES (1484, 1, 1, 3, '2016-09-28 10:49:46', '172.31.0.50', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=91;name=添加新闻子栏目');
INSERT INTO `jc_log` VALUES (1485, 1, 1, 3, '2016-09-28 10:49:51', '172.31.0.50', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=90;name=添加新闻子栏目');
INSERT INTO `jc_log` VALUES (1486, 1, NULL, 1, '2016-09-28 10:50:53', '0:0:0:0:0:0:0:1', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1487, 1, NULL, 1, '2016-09-28 10:57:15', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1488, 1, 1, 3, '2016-09-28 10:58:17', '172.31.0.50', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=96;name=test');
INSERT INTO `jc_log` VALUES (1489, 1, 1, 3, '2016-09-28 10:58:22', '172.31.0.50', '/DHT/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=93;name=2323232');
INSERT INTO `jc_log` VALUES (1490, 1, NULL, 1, '2016-09-28 11:29:57', '172.31.0.25', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1491, 1, NULL, 1, '2016-09-28 11:42:56', '172.31.0.50', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1492, 1, 1, 3, '2016-09-28 11:46:38', '172.31.0.50', '/DHT/yhtd0451/admin/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1493, 1, 1, 3, '2016-09-28 11:47:13', '172.31.0.50', '/DHT/yhtd0451/admin/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1494, 1, NULL, 1, '2016-09-28 14:08:05', '172.31.0.42', '/DHT/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1495, 1, NULL, 1, '2017-02-09 16:26:06', '0:0:0:0:0:0:0:1', '/Expressway/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1496, NULL, NULL, 2, '2017-02-09 17:05:37', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1497, 1, NULL, 1, '2017-02-09 17:05:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1498, 1, NULL, 1, '2017-02-09 17:12:57', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1499, 1, NULL, 1, '2017-02-09 17:15:26', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1500, NULL, NULL, 2, '2018-01-12 10:20:01', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1501, 1, NULL, 1, '2018-01-12 10:20:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1502, 1, NULL, 1, '2018-01-12 10:24:16', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1503, 1, NULL, 1, '2018-01-12 10:33:48', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1504, 1, 1, 3, '2018-01-12 10:35:03', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/site/o_update.do', '修改站点', 'id=1;name=后台测试站点');
INSERT INTO `jc_log` VALUES (1505, 1, 1, 3, '2018-01-12 10:46:52', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/site/o_update.do', '修改站点', 'id=1;name=信访');
INSERT INTO `jc_log` VALUES (1506, 1, 1, 3, '2018-01-12 11:01:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1507, 1, 1, 3, '2018-01-12 11:06:02', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1508, 1, 1, 3, '2018-01-12 11:22:26', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/site/o_update.do', '修改站点', 'id=1;name=智能信访数据处理平台');
INSERT INTO `jc_log` VALUES (1509, NULL, NULL, 2, '2018-01-12 13:22:59', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=yhtd');
INSERT INTO `jc_log` VALUES (1510, NULL, NULL, 2, '2018-01-12 13:23:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1511, NULL, NULL, 2, '2018-01-12 13:23:20', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1512, 1, NULL, 1, '2018-01-12 13:23:28', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1513, 1, NULL, 1, '2018-01-12 14:19:48', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1514, 1, 1, 3, '2018-01-12 14:53:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=2021;name=testt');
INSERT INTO `jc_log` VALUES (1515, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=13;name=测试123');
INSERT INTO `jc_log` VALUES (1516, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=3;name=低碳经济');
INSERT INTO `jc_log` VALUES (1517, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=4;name=习近平中亚之行');
INSERT INTO `jc_log` VALUES (1518, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=2;name=上海世博会专题');
INSERT INTO `jc_log` VALUES (1519, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=1;name=2010年南非世界杯');
INSERT INTO `jc_log` VALUES (1520, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=9;name=12334');
INSERT INTO `jc_log` VALUES (1521, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=6;name=美军准备空袭叙利亚');
INSERT INTO `jc_log` VALUES (1522, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=5;name=广西桂林学校附近发生爆炸');
INSERT INTO `jc_log` VALUES (1523, 1, 1, 3, '2018-01-12 14:58:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/topic/o_delete.do', '删除专题', 'id=7;name=“气功大师”王林遭质疑');
INSERT INTO `jc_log` VALUES (1524, 1, 1, 3, '2018-01-12 15:00:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=241;name=手机');
INSERT INTO `jc_log` VALUES (1525, 1, 1, 3, '2018-01-12 15:00:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=243;name=回收');
INSERT INTO `jc_log` VALUES (1526, 1, 1, 3, '2018-01-12 15:00:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=244;name=车内');
INSERT INTO `jc_log` VALUES (1527, 1, 1, 3, '2018-01-12 15:00:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=245;name=不');
INSERT INTO `jc_log` VALUES (1528, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=246;name=显示');
INSERT INTO `jc_log` VALUES (1529, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=247;name=已');
INSERT INTO `jc_log` VALUES (1530, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=248;name=添加');
INSERT INTO `jc_log` VALUES (1531, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=249;name=商品');
INSERT INTO `jc_log` VALUES (1532, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=250;name=列表');
INSERT INTO `jc_log` VALUES (1533, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=240;name=线上');
INSERT INTO `jc_log` VALUES (1534, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=242;name=端');
INSERT INTO `jc_log` VALUES (1535, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=164;name=股');
INSERT INTO `jc_log` VALUES (1536, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=167;name=创业板');
INSERT INTO `jc_log` VALUES (1537, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=407;name=111111111111');
INSERT INTO `jc_log` VALUES (1538, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=261;name=测试');
INSERT INTO `jc_log` VALUES (1539, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=300;name=1');
INSERT INTO `jc_log` VALUES (1540, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=165;name=基');
INSERT INTO `jc_log` VALUES (1541, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=180;name=持');
INSERT INTO `jc_log` VALUES (1542, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=401;name=哈哈哈哈');
INSERT INTO `jc_log` VALUES (1543, 1, 1, 3, '2018-01-12 15:00:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=166;name=重仓');
INSERT INTO `jc_log` VALUES (1544, 1, 1, 3, '2018-01-12 15:00:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=16;name=基金');
INSERT INTO `jc_log` VALUES (1545, 1, 1, 3, '2018-01-12 15:00:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=403;name=水电费');
INSERT INTO `jc_log` VALUES (1546, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=404;name=去去');
INSERT INTO `jc_log` VALUES (1547, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=198;name=信');
INSERT INTO `jc_log` VALUES (1548, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=187;name=李');
INSERT INTO `jc_log` VALUES (1549, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=186;name=李嘉诚');
INSERT INTO `jc_log` VALUES (1550, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=185;name=居首');
INSERT INTO `jc_log` VALUES (1551, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=184;name=亿元');
INSERT INTO `jc_log` VALUES (1552, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=183;name=20.75');
INSERT INTO `jc_log` VALUES (1553, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=182;name=市值');
INSERT INTO `jc_log` VALUES (1554, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=181;name=3只');
INSERT INTO `jc_log` VALUES (1555, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=188;name=兆');
INSERT INTO `jc_log` VALUES (1556, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=189;name=变身');
INSERT INTO `jc_log` VALUES (1557, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=190;name=淡');
INSERT INTO `jc_log` VALUES (1558, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=191;name=友');
INSERT INTO `jc_log` VALUES (1559, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=192;name=业绩');
INSERT INTO `jc_log` VALUES (1560, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=193;name=后');
INSERT INTO `jc_log` VALUES (1561, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=194;name=未');
INSERT INTO `jc_log` VALUES (1562, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=195;name=增');
INSERT INTO `jc_log` VALUES (1563, 1, 1, 3, '2018-01-12 15:00:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=196;name=爱');
INSERT INTO `jc_log` VALUES (1564, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=146;name=地标');
INSERT INTO `jc_log` VALUES (1565, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=169;name=21');
INSERT INTO `jc_log` VALUES (1566, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=170;name=回报率');
INSERT INTO `jc_log` VALUES (1567, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=171;name=领跑');
INSERT INTO `jc_log` VALUES (1568, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=172;name=指数');
INSERT INTO `jc_log` VALUES (1569, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=173;name=年内');
INSERT INTO `jc_log` VALUES (1570, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=174;name=涨');
INSERT INTO `jc_log` VALUES (1571, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=175;name=83');
INSERT INTO `jc_log` VALUES (1572, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=176;name=潜伏');
INSERT INTO `jc_log` VALUES (1573, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=177;name=四成');
INSERT INTO `jc_log` VALUES (1574, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=178;name=华宝');
INSERT INTO `jc_log` VALUES (1575, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=179;name=行业');
INSERT INTO `jc_log` VALUES (1576, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=197;name=瑞');
INSERT INTO `jc_log` VALUES (1577, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=199;name=轮');
INSERT INTO `jc_log` VALUES (1578, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=200;name=证');
INSERT INTO `jc_log` VALUES (1579, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=201;name=腾讯');
INSERT INTO `jc_log` VALUES (1580, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=168;name=平均');
INSERT INTO `jc_log` VALUES (1581, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=163;name=小规模');
INSERT INTO `jc_log` VALUES (1582, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=162;name=下车');
INSERT INTO `jc_log` VALUES (1583, 1, 1, 3, '2018-01-12 15:00:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=147;name=河豚');
INSERT INTO `jc_log` VALUES (1584, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=136;name=召开');
INSERT INTO `jc_log` VALUES (1585, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=154;name=规定');
INSERT INTO `jc_log` VALUES (1586, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=155;name=公交');
INSERT INTO `jc_log` VALUES (1587, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=156;name=乘客');
INSERT INTO `jc_log` VALUES (1588, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=157;name=拒');
INSERT INTO `jc_log` VALUES (1589, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=158;name=老弱');
INSERT INTO `jc_log` VALUES (1590, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=159;name=让座');
INSERT INTO `jc_log` VALUES (1591, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=160;name=可被');
INSERT INTO `jc_log` VALUES (1592, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=161;name=赶');
INSERT INTO `jc_log` VALUES (1593, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=202;name=十');
INSERT INTO `jc_log` VALUES (1594, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=203;name=天线');
INSERT INTO `jc_log` VALUES (1595, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=204;name=争持');
INSERT INTO `jc_log` VALUES (1596, 1, 1, 3, '2018-01-12 15:00:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=205;name=a股');
INSERT INTO `jc_log` VALUES (1597, 1, 1, 3, '2018-01-12 15:00:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=206;name=假');
INSERT INTO `jc_log` VALUES (1598, 1, 1, 3, '2018-01-12 15:00:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=153;name=拟');
INSERT INTO `jc_log` VALUES (1599, 1, 1, 3, '2018-01-12 15:00:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=152;name=南宁');
INSERT INTO `jc_log` VALUES (1600, 1, 1, 3, '2018-01-12 15:00:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=137;name=民主生活会');
INSERT INTO `jc_log` VALUES (1601, 1, 1, 3, '2018-01-12 15:00:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=138;name=常委');
INSERT INTO `jc_log` VALUES (1602, 1, 1, 3, '2018-01-12 15:00:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=139;name=自己');
INSERT INTO `jc_log` VALUES (1603, 1, 1, 3, '2018-01-12 15:00:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=140;name=写');
INSERT INTO `jc_log` VALUES (1604, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=126;name=路');
INSERT INTO `jc_log` VALUES (1605, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=145;name=建');
INSERT INTO `jc_log` VALUES (1606, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=148;name=塔');
INSERT INTO `jc_log` VALUES (1607, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=149;name=正');
INSERT INTO `jc_log` VALUES (1608, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=150;name=申报');
INSERT INTO `jc_log` VALUES (1609, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=151;name=吉尼斯纪录');
INSERT INTO `jc_log` VALUES (1610, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=207;name=前');
INSERT INTO `jc_log` VALUES (1611, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=208;name=续');
INSERT INTO `jc_log` VALUES (1612, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=209;name=软');
INSERT INTO `jc_log` VALUES (1613, 1, 1, 3, '2018-01-12 15:00:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=260;name=图库');
INSERT INTO `jc_log` VALUES (1614, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=262;name=434342342');
INSERT INTO `jc_log` VALUES (1615, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=144;name=7000万');
INSERT INTO `jc_log` VALUES (1616, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=143;name=扬中');
INSERT INTO `jc_log` VALUES (1617, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=142;name=江苏');
INSERT INTO `jc_log` VALUES (1618, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=127;name=权');
INSERT INTO `jc_log` VALUES (1619, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=128;name=刘');
INSERT INTO `jc_log` VALUES (1620, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=129;name=迎');
INSERT INTO `jc_log` VALUES (1621, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=130;name=秋');
INSERT INTO `jc_log` VALUES (1622, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=131;name=新自由主义');
INSERT INTO `jc_log` VALUES (1623, 1, 1, 3, '2018-01-12 15:00:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=132;name=究竟');
INSERT INTO `jc_log` VALUES (1624, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=116;name=激活');
INSERT INTO `jc_log` VALUES (1625, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=134;name=江苏省委');
INSERT INTO `jc_log` VALUES (1626, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=135;name=常委会');
INSERT INTO `jc_log` VALUES (1627, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=141;name=材料');
INSERT INTO `jc_log` VALUES (1628, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=263;name=策');
INSERT INTO `jc_log` VALUES (1629, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=264;name=尔');
INSERT INTO `jc_log` VALUES (1630, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=265;name=德都');
INSERT INTO `jc_log` VALUES (1631, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=266;name=额');
INSERT INTO `jc_log` VALUES (1632, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=267;name=为');
INSERT INTO `jc_log` VALUES (1633, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=133;name=是什么');
INSERT INTO `jc_log` VALUES (1634, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=125;name=自行车');
INSERT INTO `jc_log` VALUES (1635, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=117;name=批评和自我批评');
INSERT INTO `jc_log` VALUES (1636, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=118;name=这个');
INSERT INTO `jc_log` VALUES (1637, 1, 1, 3, '2018-01-12 15:00:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=119;name=武器');
INSERT INTO `jc_log` VALUES (1638, 1, 1, 3, '2018-01-12 15:00:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=120;name=牛');
INSERT INTO `jc_log` VALUES (1639, 1, 1, 3, '2018-01-12 15:00:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=121;name=新春');
INSERT INTO `jc_log` VALUES (1640, 1, 1, 3, '2018-01-12 15:00:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=122;name=要');
INSERT INTO `jc_log` VALUES (1641, 1, 1, 3, '2018-01-12 15:00:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=123;name=下决心');
INSERT INTO `jc_log` VALUES (1642, 1, 1, 3, '2018-01-12 15:00:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=124;name=恢复');
INSERT INTO `jc_log` VALUES (1643, 1, 1, 3, '2018-01-12 15:00:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=268;name=王');
INSERT INTO `jc_log` VALUES (1644, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=411;name=法论功');
INSERT INTO `jc_log` VALUES (1645, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=272;name=5645654654646');
INSERT INTO `jc_log` VALUES (1646, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=271;name=90780780780890');
INSERT INTO `jc_log` VALUES (1647, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=270;name=q');
INSERT INTO `jc_log` VALUES (1648, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=269;name=企鹅');
INSERT INTO `jc_log` VALUES (1649, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=115;name=文');
INSERT INTO `jc_log` VALUES (1650, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=114;name=聿');
INSERT INTO `jc_log` VALUES (1651, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=113;name=邓');
INSERT INTO `jc_log` VALUES (1652, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=112;name=恩怨');
INSERT INTO `jc_log` VALUES (1653, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=111;name=私人');
INSERT INTO `jc_log` VALUES (1654, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=110;name=变');
INSERT INTO `jc_log` VALUES (1655, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=109;name=规范');
INSERT INTO `jc_log` VALUES (1656, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=108;name=公共');
INSERT INTO `jc_log` VALUES (1657, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=107;name=莫让');
INSERT INTO `jc_log` VALUES (1658, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=273;name=345345435');
INSERT INTO `jc_log` VALUES (1659, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=280;name=345345345');
INSERT INTO `jc_log` VALUES (1660, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=320;name=234234');
INSERT INTO `jc_log` VALUES (1661, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=410;name=31233231');
INSERT INTO `jc_log` VALUES (1662, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=409;name=22222222');
INSERT INTO `jc_log` VALUES (1663, 1, 1, 3, '2018-01-12 15:00:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=408;name=111111111');
INSERT INTO `jc_log` VALUES (1664, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=406;name=12121212');
INSERT INTO `jc_log` VALUES (1665, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=104;name=劝');
INSERT INTO `jc_log` VALUES (1666, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=103;name=寒');
INSERT INTO `jc_log` VALUES (1667, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=102;name=凌');
INSERT INTO `jc_log` VALUES (1668, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=101;name=倒塌');
INSERT INTO `jc_log` VALUES (1669, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=100;name=房屋');
INSERT INTO `jc_log` VALUES (1670, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=99;name=9成');
INSERT INTO `jc_log` VALUES (1671, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=98;name=超');
INSERT INTO `jc_log` VALUES (1672, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=97;name=地区');
INSERT INTO `jc_log` VALUES (1673, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=105;name=禁食');
INSERT INTO `jc_log` VALUES (1674, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=106;name=遭打');
INSERT INTO `jc_log` VALUES (1675, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=321;name=3123123123');
INSERT INTO `jc_log` VALUES (1676, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=405;name=去');
INSERT INTO `jc_log` VALUES (1677, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=402;name=22cesi');
INSERT INTO `jc_log` VALUES (1678, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=400;name=zyyt');
INSERT INTO `jc_log` VALUES (1679, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=380;name=7777777');
INSERT INTO `jc_log` VALUES (1680, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=362;name=啊');
INSERT INTO `jc_log` VALUES (1681, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=361;name=咋回事');
INSERT INTO `jc_log` VALUES (1682, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=360;name=这是');
INSERT INTO `jc_log` VALUES (1683, 1, 1, 3, '2018-01-12 15:00:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=340;name=testswf1');
INSERT INTO `jc_log` VALUES (1684, 1, 1, 3, '2018-01-12 15:00:49', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=1;name=2011');
INSERT INTO `jc_log` VALUES (1685, 1, 1, 3, '2018-01-12 15:00:49', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=87;name=美军');
INSERT INTO `jc_log` VALUES (1686, 1, 1, 3, '2018-01-12 15:00:49', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=88;name=到');
INSERT INTO `jc_log` VALUES (1687, 1, 1, 3, '2018-01-12 15:00:49', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=89;name=世界');
INSERT INTO `jc_log` VALUES (1688, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=90;name=任何');
INSERT INTO `jc_log` VALUES (1689, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=91;name=一个');
INSERT INTO `jc_log` VALUES (1690, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=92;name=角落');
INSERT INTO `jc_log` VALUES (1691, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=93;name=巴基斯坦');
INSERT INTO `jc_log` VALUES (1692, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=94;name=7.7级');
INSERT INTO `jc_log` VALUES (1693, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=95;name=地震');
INSERT INTO `jc_log` VALUES (1694, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=86;name=跟随');
INSERT INTO `jc_log` VALUES (1695, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=85;name=将');
INSERT INTO `jc_log` VALUES (1696, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=84;name=自卫队');
INSERT INTO `jc_log` VALUES (1697, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=2;name=中国');
INSERT INTO `jc_log` VALUES (1698, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=73;name=中级');
INSERT INTO `jc_log` VALUES (1699, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=74;name=java');
INSERT INTO `jc_log` VALUES (1700, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=75;name=工程师');
INSERT INTO `jc_log` VALUES (1701, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=81;name=治近视');
INSERT INTO `jc_log` VALUES (1702, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=82;name=安倍');
INSERT INTO `jc_log` VALUES (1703, 1, 1, 3, '2018-01-12 15:00:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=83;name=日');
INSERT INTO `jc_log` VALUES (1704, 1, 1, 3, '2018-01-12 15:00:54', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=96;name=震中');
INSERT INTO `jc_log` VALUES (1705, 1, 1, 3, '2018-01-12 15:00:54', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=9;name=机构');
INSERT INTO `jc_log` VALUES (1706, 1, 1, 3, '2018-01-12 15:00:54', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/tag/o_delete.do', '删除TAG', 'id=52;name=调控');
INSERT INTO `jc_log` VALUES (1707, 1, 1, 3, '2018-01-12 15:00:59', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/origin/o_delete.do', '删除来源', 'id=21;name=77');
INSERT INTO `jc_log` VALUES (1708, 1, 1, 3, '2018-01-12 15:05:44', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=97;title=null');
INSERT INTO `jc_log` VALUES (1709, 1, 1, 3, '2018-01-12 15:06:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=98;title=null');
INSERT INTO `jc_log` VALUES (1710, 1, 1, 3, '2018-01-12 15:06:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=99;title=null');
INSERT INTO `jc_log` VALUES (1711, 1, 1, 3, '2018-01-12 15:13:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_delete.do', '删除友情链接', 'id=3;name=京东商城');
INSERT INTO `jc_log` VALUES (1712, 1, 1, 3, '2018-01-12 15:13:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_delete.do', '删除友情链接', 'id=4;name=当当网');
INSERT INTO `jc_log` VALUES (1713, 1, 1, 3, '2018-01-12 15:13:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_delete.do', '删除友情链接', 'id=5;name=亚马逊');
INSERT INTO `jc_log` VALUES (1714, 1, 1, 3, '2018-01-12 15:13:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_delete.do', '删除友情链接', 'id=6;name=ihush');
INSERT INTO `jc_log` VALUES (1715, 1, 1, 3, '2018-01-12 15:13:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_delete.do', '删除友情链接', 'id=7;name=名品打折');
INSERT INTO `jc_log` VALUES (1716, 1, 1, 3, '2018-01-12 15:13:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_delete.do', '删除友情链接', 'id=30;name=454');
INSERT INTO `jc_log` VALUES (1717, 1, 1, 3, '2018-01-12 15:13:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_delete.do', '删除友情链接', 'id=50;name=测试');
INSERT INTO `jc_log` VALUES (1718, 1, 1, 3, '2018-01-12 15:13:57', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink_ctg/o_update.do', '修改友情链接类别', NULL);
INSERT INTO `jc_log` VALUES (1719, 1, 1, 3, '2018-01-12 15:14:38', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_save.do', '增加友情链接', 'id=51;name=在线信访服务大厅');
INSERT INTO `jc_log` VALUES (1720, 1, 1, 3, '2018-01-12 15:14:52', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_save.do', '增加友情链接', 'id=52;name=网站背景图');
INSERT INTO `jc_log` VALUES (1721, 1, 1, 3, '2018-01-12 15:15:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=52;name=网站背景图');
INSERT INTO `jc_log` VALUES (1722, 1, 1, 3, '2018-01-12 15:15:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=51;name=在线信访服务大厅');
INSERT INTO `jc_log` VALUES (1723, 1, 1, 3, '2018-01-12 15:15:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=51;name=在线信访服务大厅');
INSERT INTO `jc_log` VALUES (1724, 1, NULL, 1, '2018-01-12 15:39:07', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1725, 1, 1, 3, '2018-01-12 15:40:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=100;title=null');
INSERT INTO `jc_log` VALUES (1726, 1, 1, 3, '2018-01-12 15:40:36', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=101;title=null');
INSERT INTO `jc_log` VALUES (1727, 1, 1, 3, '2018-01-12 15:40:52', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=102;title=null');
INSERT INTO `jc_log` VALUES (1728, 1, NULL, 1, '2018-01-12 15:55:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1729, 1, NULL, 1, '2018-01-13 09:22:08', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1730, 1, NULL, 1, '2018-01-13 09:30:27', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1731, 1, 1, 3, '2018-01-13 09:30:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=100;name=图片新闻');
INSERT INTO `jc_log` VALUES (1732, 1, 1, 3, '2018-01-13 09:30:56', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=101;name=新闻中心');
INSERT INTO `jc_log` VALUES (1733, 1, 1, 3, '2018-01-13 09:31:01', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=102;name=政策法规');
INSERT INTO `jc_log` VALUES (1734, 1, NULL, 1, '2018-01-13 09:54:37', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1735, 1, NULL, 1, '2018-01-13 10:08:20', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1736, 1, 1, 3, '2018-01-13 10:11:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=103;title=null');
INSERT INTO `jc_log` VALUES (1737, 1, 1, 3, '2018-01-13 10:12:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=104;title=null');
INSERT INTO `jc_log` VALUES (1738, 1, 1, 3, '2018-01-13 10:12:37', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=105;title=null');
INSERT INTO `jc_log` VALUES (1739, 1, 1, 3, '2018-01-13 11:02:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_save.do', '增加文章', 'id=833;title=图片新闻测试');
INSERT INTO `jc_log` VALUES (1740, 1, NULL, 1, '2018-01-13 11:09:20', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1741, 1, 1, 3, '2018-01-13 11:09:27', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1742, 1, 1, 3, '2018-01-13 11:19:52', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=103;name=信访须知');
INSERT INTO `jc_log` VALUES (1743, 1, 1, 3, '2018-01-13 11:24:56', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=9;name=文库');
INSERT INTO `jc_log` VALUES (1744, 1, 1, 3, '2018-01-13 11:25:00', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=8;name=招聘');
INSERT INTO `jc_log` VALUES (1745, 1, 1, 3, '2018-01-13 11:25:03', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=7;name=产品');
INSERT INTO `jc_log` VALUES (1746, 1, 1, 3, '2018-01-13 11:25:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=6;name=视频');
INSERT INTO `jc_log` VALUES (1747, 1, 1, 3, '2018-01-13 11:25:08', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=5;name=图库');
INSERT INTO `jc_log` VALUES (1748, 1, 1, 3, '2018-01-13 11:25:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=4;name=下载');
INSERT INTO `jc_log` VALUES (1749, 1, 1, 3, '2018-01-13 11:25:13', '127.0.0.1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=3;name=作品');
INSERT INTO `jc_log` VALUES (1750, 1, 1, 3, '2018-01-13 11:25:48', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=104;name=网上信访');
INSERT INTO `jc_log` VALUES (1751, 1, NULL, 1, '2018-01-13 11:28:58', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1752, 1, 1, 3, '2018-01-13 11:29:15', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=105;name=信访查询');
INSERT INTO `jc_log` VALUES (1753, 1, NULL, 1, '2018-01-13 11:51:39', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1754, 1, 1, 3, '2018-01-13 12:36:21', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_save.do', '增加文章', 'id=836;title=新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心');
INSERT INTO `jc_log` VALUES (1755, 1, 1, 3, '2018-01-13 12:37:47', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_save.do', '增加文章', 'id=837;title=政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规');
INSERT INTO `jc_log` VALUES (1756, NULL, NULL, 2, '2018-01-15 08:41:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1757, 1, NULL, 1, '2018-01-15 08:41:48', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1758, NULL, NULL, 2, '2018-01-15 08:57:17', '127.0.0.1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1759, 1, NULL, 1, '2018-01-15 08:57:21', '127.0.0.1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1760, 1, 1, 3, '2018-01-15 08:57:59', '127.0.0.1', '/yhtd0451/admin/content/o_update.do', '修改文章', 'id=837;title=政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规政策法规');
INSERT INTO `jc_log` VALUES (1761, 1, NULL, 1, '2018-01-15 09:32:20', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1762, 1, 1, 3, '2018-01-15 09:44:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=103;name=信访须知');
INSERT INTO `jc_log` VALUES (1763, 1, 1, 3, '2018-01-15 09:45:16', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=103;name=信访须知');
INSERT INTO `jc_log` VALUES (1764, 1, 1, 3, '2018-01-15 09:45:51', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=103;name=信访须知');
INSERT INTO `jc_log` VALUES (1765, 1, 1, 3, '2018-01-15 09:46:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=104;name=网上信访');
INSERT INTO `jc_log` VALUES (1766, 1, NULL, 1, '2018-01-15 10:37:38', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1767, 1, NULL, 1, '2018-01-15 11:20:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1768, 1, 1, 3, '2018-01-15 12:01:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/member/o_update.do', '更新会员', 'id=104;username=123456');
INSERT INTO `jc_log` VALUES (1769, 1, NULL, 1, '2018-01-15 14:12:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1770, 1, NULL, 1, '2018-01-15 14:25:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1771, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=1;name=1-20人');
INSERT INTO `jc_log` VALUES (1772, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=2;name=20-50人');
INSERT INTO `jc_log` VALUES (1773, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=3;name=50-10人');
INSERT INTO `jc_log` VALUES (1774, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=4;name=100人以上');
INSERT INTO `jc_log` VALUES (1775, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=5;name=私企');
INSERT INTO `jc_log` VALUES (1776, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=6;name=股份制');
INSERT INTO `jc_log` VALUES (1777, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=7;name=国企');
INSERT INTO `jc_log` VALUES (1778, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=8;name=互联网');
INSERT INTO `jc_log` VALUES (1779, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=9;name=房地产');
INSERT INTO `jc_log` VALUES (1780, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=10;name=加工制造');
INSERT INTO `jc_log` VALUES (1781, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=11;name=服务行业');
INSERT INTO `jc_log` VALUES (1782, 1, 1, 3, '2018-01-15 14:37:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_delete.do', '删除字典值', 'id=35;name=1');
INSERT INTO `jc_log` VALUES (1783, NULL, NULL, 2, '2018-01-15 14:37:55', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1784, 1, NULL, 1, '2018-01-15 14:37:59', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1785, 1, 1, 3, '2018-01-15 14:39:01', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=36;name=民族');
INSERT INTO `jc_log` VALUES (1786, 1, 1, 3, '2018-01-15 14:40:12', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_update.do', '修改字典值', 'id=36;name=民族');
INSERT INTO `jc_log` VALUES (1787, 1, 1, 3, '2018-01-15 14:40:57', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=37;name=民族');
INSERT INTO `jc_log` VALUES (1788, 1, 1, 3, '2018-01-15 14:41:59', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=38;name=政治面貌');
INSERT INTO `jc_log` VALUES (1789, 1, 1, 3, '2018-01-15 14:42:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=39;name=政治面貌');
INSERT INTO `jc_log` VALUES (1790, 1, 1, 3, '2018-01-15 14:42:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=40;name=级别');
INSERT INTO `jc_log` VALUES (1791, 1, 1, 3, '2018-01-15 14:42:56', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=41;name=级别');
INSERT INTO `jc_log` VALUES (1792, 1, 1, 3, '2018-01-15 14:43:08', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=42;name=级别');
INSERT INTO `jc_log` VALUES (1793, 1, 1, 3, '2018-01-15 14:44:12', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=43;name=举报事项');
INSERT INTO `jc_log` VALUES (1794, 1, 1, 3, '2018-01-15 14:44:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=44;name=举报事项');
INSERT INTO `jc_log` VALUES (1795, 1, 1, 3, '2018-01-15 14:51:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=45;name=问题类别');
INSERT INTO `jc_log` VALUES (1796, 1, 1, 3, '2018-01-15 14:52:37', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=46;name=问题类别');
INSERT INTO `jc_log` VALUES (1797, 1, 1, 3, '2018-01-15 14:54:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=47;name=问题细类');
INSERT INTO `jc_log` VALUES (1798, 1, 1, 3, '2018-01-15 14:55:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/dictionary/o_save.do', '添加字典值', 'id=48;name=问题细类');
INSERT INTO `jc_log` VALUES (1799, 1, NULL, 1, '2018-01-15 15:27:40', '127.0.0.1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1800, 1, NULL, 1, '2018-01-16 09:12:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1801, 1, NULL, 1, '2018-01-16 09:36:20', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1802, 1, NULL, 1, '2018-01-16 14:46:41', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1803, 1, 1, 3, '2018-01-16 14:52:07', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_update.do', '修改文章', 'id=833;title=图片新闻测试');
INSERT INTO `jc_log` VALUES (1804, 1, 1, 3, '2018-01-16 15:28:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_update.do', '修改文章', 'id=833;title=图片新闻测试');
INSERT INTO `jc_log` VALUES (1805, 1, NULL, 1, '2018-01-16 15:41:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1806, 1, NULL, 1, '2018-01-16 16:53:56', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1807, 1, NULL, 1, '2018-01-16 17:06:19', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1808, 1, NULL, 1, '2018-01-17 08:51:31', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1809, 1, NULL, 1, '2018-01-17 09:10:04', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1810, 1, 1, 3, '2018-01-17 09:10:26', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=51;name=在线信访服务大厅');
INSERT INTO `jc_log` VALUES (1811, 1, 1, 3, '2018-01-17 09:10:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=51;name=在线信访服务大厅');
INSERT INTO `jc_log` VALUES (1812, 1, 1, 3, '2018-01-17 09:10:48', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=52;name=网站背景图');
INSERT INTO `jc_log` VALUES (1813, 1, NULL, 1, '2018-01-17 09:47:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1814, 1, 1, 3, '2018-01-17 09:54:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=52;name=网站背景图');
INSERT INTO `jc_log` VALUES (1815, 1, NULL, 1, '2018-01-17 09:59:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1816, 1, NULL, 1, '2018-01-17 10:13:08', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1817, 1, NULL, 1, '2018-01-17 10:30:07', '127.0.0.1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1818, 1, NULL, 1, '2018-01-17 10:31:57', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1819, 1, NULL, 1, '2018-01-17 11:06:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1820, 1, NULL, 1, '2018-01-17 11:39:12', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1821, 1, NULL, 1, '2018-01-17 11:59:57', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1822, 1, NULL, 1, '2018-01-17 13:33:43', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1823, 1, NULL, 1, '2018-01-17 13:37:21', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1824, 1, NULL, 1, '2018-01-17 13:40:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1825, 1, NULL, 1, '2018-01-17 13:50:56', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1826, 1, NULL, 1, '2018-01-17 15:25:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1827, 1, NULL, 1, '2018-01-17 15:27:36', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1828, 1, NULL, 1, '2018-01-17 16:06:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1829, 1, NULL, 1, '2018-01-17 16:16:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1830, 1, NULL, 1, '2018-01-17 16:31:02', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1831, 1, NULL, 1, '2018-01-17 16:56:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1832, 1, NULL, 1, '2018-01-17 17:48:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1833, 1, NULL, 1, '2018-01-17 18:48:26', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1834, 1, 1, 3, '2018-01-17 18:48:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_login_update.do', '修改登录设置', NULL);
INSERT INTO `jc_log` VALUES (1835, 1, NULL, 1, '2018-01-18 08:52:33', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1836, 1, NULL, 1, '2018-01-18 09:25:01', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1837, 1, NULL, 1, '2018-01-18 09:30:37', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1838, NULL, NULL, 2, '2018-01-18 10:33:58', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1839, 1, NULL, 1, '2018-01-18 10:34:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1840, 1, NULL, 1, '2018-01-18 10:39:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1841, 1, NULL, 1, '2018-01-18 10:53:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1842, 1, 1, 3, '2018-01-18 11:26:13', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/member/o_update.do', '更新会员', 'id=104;username=123456');
INSERT INTO `jc_log` VALUES (1843, 1, NULL, 1, '2018-01-18 11:39:13', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1844, 1, NULL, 1, '2018-01-18 11:39:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1845, 1, NULL, 1, '2018-01-18 11:40:12', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1846, 1, NULL, 1, '2018-01-18 11:40:44', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1847, 1, 1, 3, '2018-01-18 11:45:13', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/member/o_update.do', '更新会员', 'id=104;username=123456');
INSERT INTO `jc_log` VALUES (1848, 1, NULL, 1, '2018-01-18 11:51:58', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1849, 1, NULL, 1, '2018-01-18 11:53:28', '127.0.0.1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1850, 1, NULL, 1, '2018-01-18 11:57:38', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1851, 1, 1, 3, '2018-01-18 11:58:59', '127.0.0.1', '/yhtd0451/admin/member/o_save.do', '增加会员', 'id=105;username=zys');
INSERT INTO `jc_log` VALUES (1852, 1, NULL, 1, '2018-01-18 12:46:33', '127.0.0.1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1853, 1, NULL, 1, '2018-01-18 13:44:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1854, 1, NULL, 1, '2018-01-18 13:59:26', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1855, 1, NULL, 1, '2018-01-18 14:23:09', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1856, 1, NULL, 1, '2018-01-18 14:45:03', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1857, 1, NULL, 1, '2018-01-18 15:02:31', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1858, 1, NULL, 1, '2018-01-18 16:22:58', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1859, 1, NULL, 1, '2018-01-18 17:24:47', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1860, 1, NULL, 1, '2018-01-19 09:15:33', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1861, 1, NULL, 1, '2018-01-19 10:12:02', '127.0.0.1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1862, 1, NULL, 1, '2018-01-19 10:25:57', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1863, 1, 1, 3, '2018-01-19 10:30:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/guestbook_ctg/o_delete.do', '删除留言类别', 'id=2;name=投诉');
INSERT INTO `jc_log` VALUES (1864, 1, 1, 3, '2018-01-19 10:31:07', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/guestbook_ctg/o_update.do', '修改留言类别', 'id=1;name=举报');
INSERT INTO `jc_log` VALUES (1865, 1, 1, 3, '2018-01-19 10:31:31', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/guestbook/o_check.do', '审核留言', 'id=24;title=标题');
INSERT INTO `jc_log` VALUES (1866, 1, 1, 3, '2018-01-19 10:31:33', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/guestbook/o_check_cancel.do', '审核留言', 'id=24;title=标题');
INSERT INTO `jc_log` VALUES (1867, NULL, NULL, 2, '2018-01-19 11:47:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1868, 1, NULL, 1, '2018-01-19 11:47:28', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1869, 1, NULL, 1, '2018-01-19 14:09:27', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1870, 1, 1, 3, '2018-01-19 14:18:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=105;name=信访查询');
INSERT INTO `jc_log` VALUES (1871, 1, 1, 3, '2018-01-19 14:25:52', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=105;name=信访查询');
INSERT INTO `jc_log` VALUES (1872, 1, 1, 3, '2018-01-19 14:26:03', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=105;name=信访查询');
INSERT INTO `jc_log` VALUES (1873, 1, 1, 3, '2018-01-19 14:41:55', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_save.do', '增加模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1874, 1, 1, 3, '2018-01-19 14:42:14', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=105;name=信访查询');
INSERT INTO `jc_log` VALUES (1875, 1, 1, 3, '2018-01-19 14:42:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1876, 1, 1, 3, '2018-01-19 14:51:59', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1877, 1, 1, 3, '2018-01-19 14:53:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_save.do', '增加模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1878, 1, 1, 3, '2018-01-19 14:54:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1879, 1, NULL, 1, '2018-01-19 15:10:27', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1880, 1, 1, 3, '2018-01-19 15:14:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1881, 1, 1, 3, '2018-01-19 15:15:57', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_delete.do', '删除模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1882, 1, NULL, 1, '2018-01-19 15:17:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1883, 1, 1, 3, '2018-01-19 15:20:03', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_save.do', '增加模型', 'id=3;name=Letter');
INSERT INTO `jc_log` VALUES (1884, 1, NULL, 1, '2018-01-19 15:22:19', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1885, 1, 1, 3, '2018-01-19 15:23:22', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=Letter');
INSERT INTO `jc_log` VALUES (1886, 1, 1, 3, '2018-01-19 15:26:25', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=回家看');
INSERT INTO `jc_log` VALUES (1887, 1, NULL, 1, '2018-01-19 15:31:25', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1888, 1, 1, 3, '2018-01-19 15:31:49', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1889, 1, NULL, 1, '2018-01-19 15:32:54', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1890, 1, 1, 3, '2018-01-19 15:33:16', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1891, 1, 1, 3, '2018-01-19 15:33:51', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=106;title=null');
INSERT INTO `jc_log` VALUES (1892, 1, 1, 3, '2018-01-19 15:36:01', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=106;name=信访查询');
INSERT INTO `jc_log` VALUES (1893, 1, NULL, 1, '2018-01-19 15:49:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1894, 1, 1, 3, '2018-01-19 15:51:41', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=106;name=信访查询');
INSERT INTO `jc_log` VALUES (1895, 1, 1, 3, '2018-01-19 15:53:15', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=106;name=信访查询');
INSERT INTO `jc_log` VALUES (1896, 1, NULL, 1, '2018-01-19 15:57:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1897, 1, 1, 3, '2018-01-19 15:57:42', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=106;name=信访查询');
INSERT INTO `jc_log` VALUES (1898, 1, 1, 3, '2018-01-19 15:57:49', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=106;name=信访查询');
INSERT INTO `jc_log` VALUES (1899, 1, 1, 3, '2018-01-19 15:58:26', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_delete.do', '删除栏目', 'id=106;title=null');
INSERT INTO `jc_log` VALUES (1900, 1, 1, 3, '2018-01-19 15:58:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=107;title=null');
INSERT INTO `jc_log` VALUES (1901, 1, 1, 3, '2018-01-19 15:59:32', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');
INSERT INTO `jc_log` VALUES (1902, 1, NULL, 1, '2018-01-19 16:01:31', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1903, 1, NULL, 1, '2018-01-19 16:15:19', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1904, 1, 1, 3, '2018-01-19 16:15:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=108;title=null');
INSERT INTO `jc_log` VALUES (1905, 1, 1, 3, '2018-01-19 16:16:50', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_system_update.do', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (1906, 1, 1, 3, '2018-01-19 16:17:19', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_delete.do', '删除栏目', 'id=108;title=null');
INSERT INTO `jc_log` VALUES (1907, 1, NULL, 1, '2018-01-19 16:21:16', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1908, 1, 1, 3, '2018-01-19 16:23:01', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/model/o_update.do', '修改模型', 'id=3;name=信访查询');
INSERT INTO `jc_log` VALUES (1909, 1, 1, 3, '2018-01-19 16:31:37', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');
INSERT INTO `jc_log` VALUES (1910, 1, 1, 3, '2018-01-19 16:31:45', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');
INSERT INTO `jc_log` VALUES (1911, 1, 1, 3, '2018-01-19 16:32:58', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_save.do', '增加栏目', 'id=109;title=null');
INSERT INTO `jc_log` VALUES (1912, 1, 1, 3, '2018-01-19 16:41:31', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (1913, 1, 1, 3, '2018-01-19 16:42:12', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/site_config/o_base_update.do', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (1914, 1, 1, 3, '2018-01-19 16:48:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_delete.do', '删除栏目', 'id=109;title=null');
INSERT INTO `jc_log` VALUES (1915, 1, 1, 3, '2018-01-19 16:53:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');
INSERT INTO `jc_log` VALUES (1916, 1, NULL, 1, '2018-01-19 17:02:52', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1917, 1, 1, 3, '2018-01-19 17:03:30', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');
INSERT INTO `jc_log` VALUES (1918, NULL, NULL, 2, '2018-01-20 08:30:02', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1919, 1, NULL, 1, '2018-01-20 08:30:09', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1920, 1, 1, 3, '2018-01-20 08:30:41', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');
INSERT INTO `jc_log` VALUES (1921, 1, 1, 3, '2018-01-20 08:35:27', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');
INSERT INTO `jc_log` VALUES (1922, 1, NULL, 1, '2018-01-20 08:59:22', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1923, 1, NULL, 1, '2018-01-20 09:17:16', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1924, 1, NULL, 1, '2018-01-20 10:12:47', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1925, 1, NULL, 1, '2018-01-20 10:20:40', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1926, 1, 1, 3, '2018-01-20 10:21:00', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=51;name=在线信访服务大厅');
INSERT INTO `jc_log` VALUES (1927, 1, 1, 3, '2018-01-20 10:21:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=52;name=网站背景图');
INSERT INTO `jc_log` VALUES (1928, 1, NULL, 1, '2018-01-20 10:23:06', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1929, 1, 1, 3, '2018-01-20 10:23:34', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink_ctg/o_update.do', '修改友情链接类别', NULL);
INSERT INTO `jc_log` VALUES (1930, 1, 1, 3, '2018-01-20 10:24:53', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink_ctg/o_save.do', '增加友情链接类别', 'id=3;name=登陆背景图');
INSERT INTO `jc_log` VALUES (1931, 1, 1, 3, '2018-01-20 10:25:07', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=52;name=网站背景图');
INSERT INTO `jc_log` VALUES (1932, 1, 1, 3, '2018-01-20 10:25:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_save.do', '增加友情链接', 'id=53;name=登陆背景图');
INSERT INTO `jc_log` VALUES (1933, 1, 1, 3, '2018-01-20 10:25:37', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/friendlink/o_update.do', '修改友情链接', 'id=53;name=登陆背景图');
INSERT INTO `jc_log` VALUES (1934, 1, NULL, 1, '2018-01-20 10:31:51', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1935, 1, NULL, 1, '2018-01-20 11:17:01', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1936, 1, NULL, 1, '2018-01-20 11:21:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1937, 1, NULL, 1, '2018-01-22 08:46:48', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1938, 1, NULL, 1, '2018-01-22 08:52:00', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1939, 1, NULL, 1, '2018-01-22 08:57:25', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1940, 1, NULL, 1, '2018-01-22 09:13:31', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1941, 1, NULL, 1, '2018-01-22 09:36:41', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1942, 1, NULL, 1, '2018-01-22 09:46:39', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1943, 1, NULL, 1, '2018-01-23 16:29:02', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1944, 1, NULL, 1, '2018-01-23 16:45:33', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1945, 1, 1, 3, '2018-01-23 16:47:16', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/member/o_update.do', '更新会员', 'id=105;username=zys');
INSERT INTO `jc_log` VALUES (1946, 1, 1, 3, '2018-01-23 16:54:23', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_login_update.do', '修改登录设置', NULL);
INSERT INTO `jc_log` VALUES (1947, 1, 1, 3, '2018-01-23 16:56:11', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_login_update.do', '修改登录设置', NULL);
INSERT INTO `jc_log` VALUES (1948, 1, 1, 3, '2018-01-23 16:59:00', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_login_update.do', '修改登录设置', NULL);
INSERT INTO `jc_log` VALUES (1949, 1, 1, 3, '2018-01-23 17:01:03', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/config/o_login_update.do', '修改登录设置', NULL);
INSERT INTO `jc_log` VALUES (1950, 1, NULL, 1, '2018-01-24 09:16:38', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1951, 1, 1, 3, '2018-01-24 09:43:39', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_update.do', '修改文章', 'id=836;title=新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心');
INSERT INTO `jc_log` VALUES (1952, 1, 1, 3, '2018-01-24 09:44:05', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_update.do', '修改文章', 'id=836;title=新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心');
INSERT INTO `jc_log` VALUES (1953, 1, 1, 3, '2018-01-24 09:44:39', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/content/o_update.do', '修改文章', 'id=836;title=新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心新闻中心');
INSERT INTO `jc_log` VALUES (1954, 1, NULL, 1, '2018-01-24 15:36:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1955, 1, NULL, 1, '2018-01-24 16:05:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1956, NULL, NULL, 2, '2018-01-31 16:38:59', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1957, NULL, NULL, 2, '2018-01-31 16:39:08', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES (1958, 1, NULL, 1, '2018-01-31 16:39:16', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1959, 1, NULL, 1, '2018-04-18 13:25:26', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1960, 1, NULL, 1, '2018-04-18 13:54:53', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1961, 1, NULL, 1, '2018-04-19 09:17:20', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/login.do', 'login success', NULL);
INSERT INTO `jc_log` VALUES (1962, 1, 1, 3, '2018-04-19 09:25:10', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=100;name=图片新闻');
INSERT INTO `jc_log` VALUES (1963, 1, 1, 3, '2018-04-19 09:26:17', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=101;name=新闻中心');
INSERT INTO `jc_log` VALUES (1964, 1, 1, 3, '2018-04-19 09:26:24', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=102;name=政策法规');
INSERT INTO `jc_log` VALUES (1965, 1, 1, 3, '2018-04-19 09:26:29', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=103;name=信访须知');
INSERT INTO `jc_log` VALUES (1966, 1, 1, 3, '2018-04-19 09:26:35', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=104;name=网上信访');
INSERT INTO `jc_log` VALUES (1967, 1, 1, 3, '2018-04-19 09:27:22', '0:0:0:0:0:0:0:1', '/yhtd0451/admin/channel/o_update.do', '修改栏目', 'id=107;name=信访查询');

-- ----------------------------
-- Table structure for jc_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_message`;
CREATE TABLE `jc_message`  (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '站内信息内容',
  `send_time` timestamp DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT 1 COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT 0 COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT 1 COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT 1 COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY (`msg_id`) USING BTREE,
  INDEX `fk_jc_message_user_send`(`msg_send_user`) USING BTREE,
  INDEX `fk_jc_message_user_receiver`(`msg_receiver_user`) USING BTREE,
  INDEX `fk_jc_message_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内信' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_message
-- ----------------------------
INSERT INTO `jc_message` VALUES (1, 'w3e2', NULL, '2015-12-21 15:59:42', 1, 1, 1, 0, 1);
INSERT INTO `jc_message` VALUES (3, 'e wq ewq', NULL, '2015-12-21 16:01:27', 1, 1, 1, 0, 1);
INSERT INTO `jc_message` VALUES (5, '测试', NULL, '2015-12-21 16:06:53', 1, 1, 1, 0, 1);
INSERT INTO `jc_message` VALUES (6, '钱2', NULL, '2015-12-21 16:08:13', 1, 1, 1, 0, 1);

-- ----------------------------
-- Table structure for jc_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_model`;
CREATE TABLE `jc_model`  (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `model_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT 139 COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT 139 COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT 310 COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT 310 COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认模型',
  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_model
-- ----------------------------
INSERT INTO `jc_model` VALUES (1, '新闻', '1', 'news', 'news', 139, 139, 310, 310, 1, 1, 0, 0);
INSERT INTO `jc_model` VALUES (2, '单页', '2', 'alone', NULL, 139, 139, 310, 310, 2, 0, 0, 0);
INSERT INTO `jc_model` VALUES (3, '信访查询', '3', 'Letter', 'Letter', 139, 139, 310, 310, 10, 1, 0, 0);

-- ----------------------------
-- Table structure for jc_model_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_model_item`;
CREATE TABLE `jc_model_item`  (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段',
  `item_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 70 COMMENT '排列顺序',
  `def_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT 1 COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  PRIMARY KEY (`modelitem_id`) USING BTREE,
  INDEX `fk_jc_item_model`(`model_id`) USING BTREE,
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 452 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS模型项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_model_item
-- ----------------------------
INSERT INTO `jc_model_item` VALUES (1, 1, 'name', '栏目名称', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (2, 1, 'path', '访问路径', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (3, 1, 'title', 'meta标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (4, 1, 'keywords', 'meta关键字', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (5, 1, 'description', 'meta描述', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (6, 1, 'tplChannel', '栏目模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (7, 1, 'tplContent', '选择模型模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (8, 1, 'channelStatic', '栏目静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (9, 1, 'contentStatic', '内容静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (10, 1, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (11, 1, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (12, 1, 'docImg', '文档图片', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (14, 1, 'afterCheck', '审核后', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (15, 1, 'commentControl', '评论', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (16, 1, 'allowUpdown', '顶踩', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (17, 1, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (18, 1, 'contriGroupIds', '投稿权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (19, 1, 'userIds', '管理权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (20, 1, 'link', '外部链接', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (21, 1, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (23, 1, 'title', '标题', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (24, 1, 'shortTitle', '简短标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (25, 1, 'titleColor', '标题颜色', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (26, 1, 'tagStr', 'Tag标签', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (27, 1, 'description', '摘要', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (28, 1, 'author', '作者', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (29, 1, 'origin', '来源', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (30, 1, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (31, 1, 'topLevel', '固顶级别', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (32, 1, 'releaseDate', '发布时间', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (33, 1, 'typeId', '内容类型', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (34, 1, 'tplContent', '指定模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (35, 1, 'typeImg', '类型图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0);
INSERT INTO `jc_model_item` VALUES (36, 1, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (37, 1, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (38, 1, 'attachments', '附件', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (39, 1, 'media', '多媒体', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (40, 1, 'txt', '内容', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (42, 2, 'name', '栏目名称', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (43, 2, 'path', '访问路径', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (44, 2, 'title', 'meta标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (45, 2, 'keywords', 'meta关键字', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (46, 2, 'description', 'meta描述', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (47, 2, 'tplChannel', '栏目模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (48, 2, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (49, 2, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (50, 2, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (51, 2, 'link', '外部链接', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (52, 2, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (53, 2, 'txt', '内容', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (247, 1, 'pictures', '图片集', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (335, 1, 'workflowId', '工作流', 11, NULL, NULL, NULL, NULL, NULL, '留空则继承上级栏目设置，顶层为空无需审核', NULL, 6, 0, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (336, 2, 'workflowId', '工作流', 10, NULL, NULL, NULL, NULL, NULL, '留空则继承上级栏目设置，顶层为空无需审核', NULL, 6, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (344, 1, 'channelId', '栏目', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1);
INSERT INTO `jc_model_item` VALUES (408, 1, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (413, 1, 'txt', '内容', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (432, 3, 'name', '栏目名称', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (433, 3, 'path', '访问路径', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (434, 3, 'title', 'meta标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (435, 3, 'keywords', 'meta关键字', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (436, 3, 'description', 'meta描述', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (437, 3, 'tplChannel', '栏目模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (438, 3, 'tplContent', '内容模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (439, 3, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (440, 3, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (441, 3, 'docImg', '文档图片', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (442, 3, 'afterCheck', '审核后', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (443, 3, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (444, 3, 'contriGroupIds', '投稿权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (445, 3, 'workflowId', '工作流', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (446, 3, 'link', '外部链接', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (447, 3, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (448, 3, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (449, 3, 'txt', '内容', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (450, 3, 'channelStatic', '栏目静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);
INSERT INTO `jc_model_item` VALUES (451, 3, 'contentStatic', '内容静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1);

-- ----------------------------
-- Table structure for jc_origin
-- ----------------------------
DROP TABLE IF EXISTS `jc_origin`;
CREATE TABLE `jc_origin`  (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源名称',
  `ref_count` int(11) NOT NULL DEFAULT 0 COMMENT '来源文章总数',
  PRIMARY KEY (`origin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '来源' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_plug
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug`;
CREATE TABLE `jc_plug`  (
  `plug_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '作者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `install_time` datetime DEFAULT NULL COMMENT '安装时间',
  `uninstall_time` datetime DEFAULT NULL COMMENT '卸载时间',
  `file_conflict` tinyint(1) NOT NULL DEFAULT 0 COMMENT '包含文件是否冲突',
  `is_used` tinyint(1) NOT NULL DEFAULT 0 COMMENT '使用状态(0未使用,1使用中)',
  `plug_perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '插件权限（,分隔各个权限配置）',
  PRIMARY KEY (`plug_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '插件' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_plug
-- ----------------------------
INSERT INTO `jc_plug` VALUES (21, 'ss', '/WEB-INF/plug/bbs_webservice.zip', 'sss', 'ss', '2016-01-13 16:57:38', NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_plug` VALUES (22, 'ceshi ', '/WEB-INF/plug/bbs_webservice.zip', NULL, '111', '2016-01-13 17:13:34', NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_plug` VALUES (23, 'ceshi', '/WEB-INF/plug/sport.zip', '1', '1', '2016-01-13 17:13:55', NULL, NULL, 0, 0, NULL);
INSERT INTO `jc_plug` VALUES (24, '2', '/WEB-INF/plug/sport.zip', NULL, NULL, '2016-01-13 17:14:32', NULL, NULL, 0, 0, NULL);

-- ----------------------------
-- Table structure for jc_receiver_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_receiver_message`;
CREATE TABLE `jc_receiver_message`  (
  `msg_re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '站内信息内容',
  `send_time` timestamp DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT 1 COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT 0 COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT 1 COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT 1 COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) DEFAULT NULL COMMENT '发信的信件id',
  PRIMARY KEY (`msg_re_id`) USING BTREE,
  INDEX `jc_receiver_message_user_send`(`msg_send_user`) USING BTREE,
  INDEX `jc_receiver_message_user_receiver`(`msg_receiver_user`) USING BTREE,
  INDEX `jc_receiver_message_site`(`site_id`) USING BTREE,
  INDEX `jc_receiver_message_message`(`msg_re_id`) USING BTREE,
  INDEX `fk_jc_receiver_message_message`(`msg_id`) USING BTREE,
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内信收信表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_receiver_message
-- ----------------------------
INSERT INTO `jc_receiver_message` VALUES (1, 'w3e2', NULL, '2015-12-21 15:59:42', 1, 1, 1, 0, 0, 1);
INSERT INTO `jc_receiver_message` VALUES (3, 'e wq ewq', NULL, '2015-12-21 16:01:27', 1, 1, 1, 1, 0, 3);
INSERT INTO `jc_receiver_message` VALUES (5, '测试', NULL, '2015-12-21 16:06:53', 1, 1, 1, 0, 0, 5);
INSERT INTO `jc_receiver_message` VALUES (6, '钱2', NULL, '2015-12-21 16:08:13', 1, 1, 1, 1, 0, 6);

-- ----------------------------
-- Table structure for jc_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_role`;
CREATE TABLE `jc_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `is_super` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `fk_jc_role_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_role
-- ----------------------------
INSERT INTO `jc_role` VALUES (1, 1, '管理员', 10, '1');
INSERT INTO `jc_role` VALUES (2, 1, '信息录入员', 10, '0');
INSERT INTO `jc_role` VALUES (3, 1, '初审', 10, '0');
INSERT INTO `jc_role` VALUES (4, NULL, ' ewq ', 10, '0');

-- ----------------------------
-- Table structure for jc_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `jc_role_permission`;
CREATE TABLE `jc_role_permission`  (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `fk_jc_permission_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS角色授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_role_permission
-- ----------------------------
INSERT INTO `jc_role_permission` VALUES (2, '/top.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (2, '/right.do');
INSERT INTO `jc_role_permission` VALUES (2, '/left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (2, '/map.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (2, '/main.do');
INSERT INTO `jc_role_permission` VALUES (2, '/index.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (2, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (2, '/personal/');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/top.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (3, '/right.do');
INSERT INTO `jc_role_permission` VALUES (3, '/left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (3, '/map.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (3, '/main.do');
INSERT INTO `jc_role_permission` VALUES (3, '/index.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (3, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (3, '/personal/');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (4, 'index');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_list');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_save');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_update');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:channel_main');
INSERT INTO `jc_role_permission` VALUES (4, 'main');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_tree');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_edit');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_check_path');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_main');
INSERT INTO `jc_role_permission` VALUES (4, 'map');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_delete');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_priority');
INSERT INTO `jc_role_permission` VALUES (4, 'left');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_right');
INSERT INTO `jc_role_permission` VALUES (4, 'right');
INSERT INTO `jc_role_permission` VALUES (4, 'message:v_countUnreadMsg');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_add');
INSERT INTO `jc_role_permission` VALUES (4, 'top');
INSERT INTO `jc_role_permission` VALUES (2, '/top.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (2, '/right.do');
INSERT INTO `jc_role_permission` VALUES (2, '/left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (2, '/map.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (2, '/main.do');
INSERT INTO `jc_role_permission` VALUES (2, '/index.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (2, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (2, '/personal/');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/top.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (3, '/right.do');
INSERT INTO `jc_role_permission` VALUES (3, '/left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (3, '/map.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (3, '/main.do');
INSERT INTO `jc_role_permission` VALUES (3, '/index.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (3, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (3, '/personal/');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (4, 'index');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_list');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_save');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_update');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:channel_main');
INSERT INTO `jc_role_permission` VALUES (4, 'main');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_tree');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_edit');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_check_path');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_main');
INSERT INTO `jc_role_permission` VALUES (4, 'map');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_delete');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_priority');
INSERT INTO `jc_role_permission` VALUES (4, 'left');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_right');
INSERT INTO `jc_role_permission` VALUES (4, 'right');
INSERT INTO `jc_role_permission` VALUES (4, 'message:v_countUnreadMsg');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_add');
INSERT INTO `jc_role_permission` VALUES (4, 'top');
INSERT INTO `jc_role_permission` VALUES (2, '/top.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (2, '/right.do');
INSERT INTO `jc_role_permission` VALUES (2, '/left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (2, '/map.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (2, '/main.do');
INSERT INTO `jc_role_permission` VALUES (2, '/index.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (2, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (2, '/personal/');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/top.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (3, '/right.do');
INSERT INTO `jc_role_permission` VALUES (3, '/left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (3, '/map.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (3, '/main.do');
INSERT INTO `jc_role_permission` VALUES (3, '/index.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (3, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (3, '/personal/');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (4, 'index');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_list');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_save');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_update');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:channel_main');
INSERT INTO `jc_role_permission` VALUES (4, 'main');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_tree');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_edit');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_check_path');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_main');
INSERT INTO `jc_role_permission` VALUES (4, 'map');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_delete');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_priority');
INSERT INTO `jc_role_permission` VALUES (4, 'left');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_right');
INSERT INTO `jc_role_permission` VALUES (4, 'right');
INSERT INTO `jc_role_permission` VALUES (4, 'message:v_countUnreadMsg');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_add');
INSERT INTO `jc_role_permission` VALUES (4, 'top');
INSERT INTO `jc_role_permission` VALUES (2, '/top.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (2, '/right.do');
INSERT INTO `jc_role_permission` VALUES (2, '/left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (2, '/map.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (2, '/main.do');
INSERT INTO `jc_role_permission` VALUES (2, '/index.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (2, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (2, '/personal/');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/top.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (3, '/right.do');
INSERT INTO `jc_role_permission` VALUES (3, '/left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (3, '/map.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (3, '/main.do');
INSERT INTO `jc_role_permission` VALUES (3, '/index.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (3, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (3, '/personal/');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (4, 'index');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_list');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_save');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_update');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:channel_main');
INSERT INTO `jc_role_permission` VALUES (4, 'main');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_tree');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_edit');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_check_path');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_main');
INSERT INTO `jc_role_permission` VALUES (4, 'map');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_delete');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_priority');
INSERT INTO `jc_role_permission` VALUES (4, 'left');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_right');
INSERT INTO `jc_role_permission` VALUES (4, 'right');
INSERT INTO `jc_role_permission` VALUES (4, 'message:v_countUnreadMsg');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_add');
INSERT INTO `jc_role_permission` VALUES (4, 'top');
INSERT INTO `jc_role_permission` VALUES (2, '/top.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (2, '/right.do');
INSERT INTO `jc_role_permission` VALUES (2, '/left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (2, '/map.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (2, '/main.do');
INSERT INTO `jc_role_permission` VALUES (2, '/index.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (2, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (2, '/personal/');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/top.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (3, '/right.do');
INSERT INTO `jc_role_permission` VALUES (3, '/left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (3, '/map.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (3, '/main.do');
INSERT INTO `jc_role_permission` VALUES (3, '/index.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (3, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (3, '/personal/');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (4, 'index');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_list');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_save');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_update');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:channel_main');
INSERT INTO `jc_role_permission` VALUES (4, 'main');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_tree');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_edit');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_check_path');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_main');
INSERT INTO `jc_role_permission` VALUES (4, 'map');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_delete');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_priority');
INSERT INTO `jc_role_permission` VALUES (4, 'left');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_right');
INSERT INTO `jc_role_permission` VALUES (4, 'right');
INSERT INTO `jc_role_permission` VALUES (4, 'message:v_countUnreadMsg');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_add');
INSERT INTO `jc_role_permission` VALUES (4, 'top');
INSERT INTO `jc_role_permission` VALUES (2, '/top.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (2, '/right.do');
INSERT INTO `jc_role_permission` VALUES (2, '/left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (2, '/map.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (2, '/main.do');
INSERT INTO `jc_role_permission` VALUES (2, '/index.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (2, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (2, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (2, '/personal/');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (2, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/top.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_channels.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_attachment.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_add.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/v_image_area_select.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/content');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_check_records.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_move.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree_share.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_reject.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_static.do');
INSERT INTO `jc_role_permission` VALUES (3, '/right.do');
INSERT INTO `jc_role_permission` VALUES (3, '/left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_upload_image.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_upload_media.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/frame/channel');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_check.do');
INSERT INTO `jc_role_permission` VALUES (3, '/map.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_edit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/common/o_image_cut.do');
INSERT INTO `jc_role_permission` VALUES (3, '/main.do');
INSERT INTO `jc_role_permission` VALUES (3, '/index.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/import_docs.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_view.do');
INSERT INTO `jc_role_permission` VALUES (3, '/fck/upload.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_left.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_list.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_tree.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_save.do');
INSERT INTO `jc_role_permission` VALUES (3, '/channel/o_priority.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_push.do');
INSERT INTO `jc_role_permission` VALUES (3, '/personal/');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_delete.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_update.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_submit.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/o_generateTags.do');
INSERT INTO `jc_role_permission` VALUES (3, '/content/v_add.do');
INSERT INTO `jc_role_permission` VALUES (4, 'index');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_list');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_save');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_update');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_left');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:channel_main');
INSERT INTO `jc_role_permission` VALUES (4, 'main');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_tree');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_edit');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_check_path');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_main');
INSERT INTO `jc_role_permission` VALUES (4, 'map');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_delete');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:o_priority');
INSERT INTO `jc_role_permission` VALUES (4, 'left');
INSERT INTO `jc_role_permission` VALUES (4, 'frame:config_right');
INSERT INTO `jc_role_permission` VALUES (4, 'right');
INSERT INTO `jc_role_permission` VALUES (4, 'message:v_countUnreadMsg');
INSERT INTO `jc_role_permission` VALUES (4, 'channel:v_add');
INSERT INTO `jc_role_permission` VALUES (4, 'top');

-- ----------------------------
-- Table structure for jc_score_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_group`;
CREATE TABLE `jc_score_group`  (
  `score_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  `def` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否默认',
  `site_id` int(11) NOT NULL COMMENT '站点',
  PRIMARY KEY (`score_group_id`) USING BTREE,
  INDEX `fk_jc_score_group_site`(`site_id`) USING BTREE,
  INDEX `FKB55408C1A691AE5`(`site_id`) USING BTREE,
  CONSTRAINT `FKB55408C1A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'FComment' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_score_group
-- ----------------------------
INSERT INTO `jc_score_group` VALUES (1, '心情组', '心情组', 0, 0, 1);
INSERT INTO `jc_score_group` VALUES (2, '星级评分', '星级评分', 1, 1, 1);
INSERT INTO `jc_score_group` VALUES (3, '测试一一向', NULL, 0, 0, 1);

-- ----------------------------
-- Table structure for jc_score_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_item`;
CREATE TABLE `jc_score_item`  (
  `score_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_group_id` int(11) NOT NULL COMMENT '评分组',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评分名',
  `score` int(11) NOT NULL COMMENT '分值',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评分图标路径',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排序',
  PRIMARY KEY (`score_item_id`) USING BTREE,
  INDEX `fk_jc_score_item_group`(`score_group_id`) USING BTREE,
  CONSTRAINT `fk_jc_score_item_group` FOREIGN KEY (`score_group_id`) REFERENCES `jc_score_group` (`score_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评分项' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_score_item
-- ----------------------------
INSERT INTO `jc_score_item` VALUES (1, 1, '开心', 1, '/r/cms/smilies/m1.gif', 1);
INSERT INTO `jc_score_item` VALUES (2, 1, '板砖', 1, '/r/cms/smilies/m2.gif', 2);
INSERT INTO `jc_score_item` VALUES (3, 1, '感动', 1, '/r/cms/smilies/m3.gif', 3);
INSERT INTO `jc_score_item` VALUES (4, 1, '有用', 1, '/r/cms/smilies/m4.gif', 4);
INSERT INTO `jc_score_item` VALUES (5, 1, '疑问', 1, '/r/cms/smilies/m5.gif', 5);
INSERT INTO `jc_score_item` VALUES (6, 1, '难过', 1, '/r/cms/smilies/m6.gif', 6);
INSERT INTO `jc_score_item` VALUES (7, 1, '无聊', 1, '/r/cms/smilies/m7.gif', 7);
INSERT INTO `jc_score_item` VALUES (8, 1, '震惊', 1, '/r/cms/smilies/m8.gif', 8);
INSERT INTO `jc_score_item` VALUES (9, 2, '非常差', 1, NULL, 1);
INSERT INTO `jc_score_item` VALUES (10, 2, '差', 2, NULL, 2);
INSERT INTO `jc_score_item` VALUES (11, 2, '一般', 3, NULL, 3);
INSERT INTO `jc_score_item` VALUES (12, 2, '好', 4, NULL, 4);
INSERT INTO `jc_score_item` VALUES (13, 2, '非常好', 5, NULL, 5);

-- ----------------------------
-- Table structure for jc_score_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_record`;
CREATE TABLE `jc_score_record`  (
  `score_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_item_id` int(11) NOT NULL COMMENT '评分项',
  `content_id` int(11) NOT NULL COMMENT '内容',
  `score_count` int(11) NOT NULL COMMENT '评分次数',
  PRIMARY KEY (`score_record_id`) USING BTREE,
  INDEX `fk_jc_record_score_item`(`score_item_id`) USING BTREE,
  INDEX `index_score_record_content`(`content_id`) USING BTREE,
  INDEX `FK715B63E456F11B69`(`content_id`) USING BTREE,
  CONSTRAINT `FK715B63E456F11B69` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_record_score_item` FOREIGN KEY (`score_item_id`) REFERENCES `jc_score_item` (`score_item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评分纪录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_search_words
-- ----------------------------
DROP TABLE IF EXISTS `jc_search_words`;
CREATE TABLE `jc_search_words`  (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '搜索词汇',
  `hit_count` int(11) NOT NULL DEFAULT 0 COMMENT '搜索次数',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '优先级',
  `name_initial` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '拼音首字母',
  PRIMARY KEY (`word_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索热词' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_search_words
-- ----------------------------
INSERT INTO `jc_search_words` VALUES (21, 'qwewqe', 0, 1, 'qwewqe');
INSERT INTO `jc_search_words` VALUES (41, '1', 1, 10, '1');
INSERT INTO `jc_search_words` VALUES (42, 'gfd', 1, 10, 'gfd');
INSERT INTO `jc_search_words` VALUES (43, '12', 2, 10, '12');
INSERT INTO `jc_search_words` VALUES (44, '新闻中心', 6, 10, 'xwzx');

-- ----------------------------
-- Table structure for jc_sensitivity
-- ----------------------------
DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity`  (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS敏感词表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------
INSERT INTO `jc_sensitivity` VALUES (1, '法论功', '***');

-- ----------------------------
-- Table structure for jc_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_site`;
CREATE TABLE `jc_site`  (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '域名',
  `site_path` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `site_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT 2 COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT 2 COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '域名重定向',
  `tpl_index` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '首页模板',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '站点关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '站点描述',
  `access_path` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问路径',
  `ftp_sync_page_id` int(11) DEFAULT NULL COMMENT '静态页同步FTP',
  `is_master` int(11) DEFAULT 0 COMMENT '是否主站',
  `mobile_static_dir` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/wap' COMMENT '手机站静态页存放目录',
  `mobile_static_sync` int(11) DEFAULT 0 COMMENT '手机站静态页同步生成',
  `page_is_sync_ftp` int(11) DEFAULT 0 COMMENT '静态页同步发布FTP',
  `parent_id` int(11) DEFAULT NULL COMMENT '父站点id',
  `resouce_is_sync_ftp` int(11) DEFAULT 0 COMMENT '资源同步发布FTP',
  `tpl_mobile_solution` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'mobile' COMMENT '手机站模板方案',
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`site_id`) USING BTREE,
  UNIQUE INDEX `ak_domain_path`(`domain`) USING BTREE,
  INDEX `fk_jc_site_config`(`config_id`) USING BTREE,
  INDEX `fk_jc_site_upload_ftp`(`ftp_upload_id`) USING BTREE,
  INDEX `FK95B4E68D79843AE8`(`ftp_sync_page_id`) USING BTREE,
  INDEX `FK95B4E68D18A452A2`(`parent_id`) USING BTREE,
  CONSTRAINT `FK95B4E68D18A452A2` FOREIGN KEY (`parent_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK95B4E68D79843AE8` FOREIGN KEY (`ftp_sync_page_id`) REFERENCES `jo_ftp` (`ftp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site
-- ----------------------------
INSERT INTO `jc_site` VALUES (1, 1, NULL, 'localhost', 'www', '智能信访数据处理平台', '智能信访数据处理平台', 'http://', '.jhtml', '.html', '/zhuzhan', '0', '1', 'zh_CN', 'zh_CN', 'dht', 3, 2, '1', '1', '', '', '', '', '', '/', NULL, 1, '', 0, 0, NULL, 0, 'dht', 10);

-- ----------------------------
-- Table structure for jc_site_access
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access`;
CREATE TABLE `jc_site_access`  (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `access_time` time NOT NULL COMMENT '访问时间',
  `access_date` date NOT NULL COMMENT '访问日期',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问地区',
  `access_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问来源',
  `external_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '外部链接网址',
  `engine` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '搜索引擎',
  `entry_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '入口页面',
  `last_stop_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最后停留页面',
  `visit_second` int(11) DEFAULT NULL COMMENT '访问时长(秒)',
  `visit_page_count` int(11) DEFAULT NULL COMMENT '访问页面数',
  `operating_system` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浏览器',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来访关键字',
  PRIMARY KEY (`access_id`) USING BTREE,
  INDEX `fk_jc_access_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_access_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点访问表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_access_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_count`;
CREATE TABLE `jc_site_access_count`  (
  `access_count` int(11) NOT NULL AUTO_INCREMENT,
  `page_count` int(11) NOT NULL DEFAULT 1 COMMENT '访问页数',
  `visitors` int(11) NOT NULL DEFAULT 0 COMMENT '用户数',
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `site_id` int(11) NOT NULL COMMENT '统计站点',
  PRIMARY KEY (`access_count`) USING BTREE,
  INDEX `fk_jc_access_count_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_access_count_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 426 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每日统计页数访问情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_access_count
-- ----------------------------
INSERT INTO `jc_site_access_count` VALUES (161, 2, 3, '2015-12-16', 1);
INSERT INTO `jc_site_access_count` VALUES (181, 2, 3, '2015-12-17', 1);
INSERT INTO `jc_site_access_count` VALUES (182, 12, 1, '2015-12-17', 1);
INSERT INTO `jc_site_access_count` VALUES (183, 3, 1, '2015-12-17', 1);
INSERT INTO `jc_site_access_count` VALUES (201, 1, 4, '2015-12-18', 1);
INSERT INTO `jc_site_access_count` VALUES (221, 2, 1, '2015-12-19', 1);
INSERT INTO `jc_site_access_count` VALUES (222, 1, 1, '2015-12-19', 1);
INSERT INTO `jc_site_access_count` VALUES (223, 1, 1, '2015-12-21', 1);
INSERT INTO `jc_site_access_count` VALUES (241, 2, 1, '2015-12-22', 1);
INSERT INTO `jc_site_access_count` VALUES (261, 1, 2, '2015-12-24', 1);
INSERT INTO `jc_site_access_count` VALUES (281, 1, 2, '2015-12-25', 1);
INSERT INTO `jc_site_access_count` VALUES (301, 1, 1, '2015-12-26', 1);
INSERT INTO `jc_site_access_count` VALUES (321, 2, 1, '2015-12-30', 1);
INSERT INTO `jc_site_access_count` VALUES (322, 1, 1, '2015-12-30', 1);
INSERT INTO `jc_site_access_count` VALUES (341, 1, 2, '2016-01-05', 1);
INSERT INTO `jc_site_access_count` VALUES (361, 2, 1, '2016-01-12', 1);
INSERT INTO `jc_site_access_count` VALUES (381, 1, 1, '2016-01-13', 1);
INSERT INTO `jc_site_access_count` VALUES (382, 11, 1, '2016-04-28', 1);
INSERT INTO `jc_site_access_count` VALUES (402, 3, 1, '2016-05-11', 1);
INSERT INTO `jc_site_access_count` VALUES (403, 2, 1, '2016-05-11', 1);
INSERT INTO `jc_site_access_count` VALUES (422, 2, 2, '2016-05-12', 1);
INSERT INTO `jc_site_access_count` VALUES (423, 2, 1, '2016-06-17', 1);
INSERT INTO `jc_site_access_count` VALUES (424, 1, 1, '2016-07-11', 1);
INSERT INTO `jc_site_access_count` VALUES (425, 1, 1, '2016-09-27', 1);

-- ----------------------------
-- Table structure for jc_site_access_pages
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_pages`;
CREATE TABLE `jc_site_access_pages`  (
  `access_pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问页面',
  `session_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `access_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '访问日期',
  `access_time` time NOT NULL COMMENT '访问时间',
  `visit_second` int(11) NOT NULL DEFAULT 0 COMMENT '停留时长（秒）',
  `page_index` int(11) NOT NULL DEFAULT 0 COMMENT '用户访问页面的索引',
  `site_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`access_pages_id`) USING BTREE,
  INDEX `fk_jc_access_pages_access`(`session_id`) USING BTREE,
  INDEX `FK7E7BD9B1A691AE5`(`site_id`) USING BTREE,
  CONSTRAINT `FK7E7BD9B1A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访问详细页面表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_access_statistic
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_statistic`;
CREATE TABLE `jc_site_access_statistic`  (
  `access_statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `pv` int(11) NOT NULL DEFAULT 0 COMMENT 'pv量',
  `ip` int(11) NOT NULL DEFAULT 0 COMMENT 'ip量',
  `visitors` int(11) NOT NULL DEFAULT 0 COMMENT '访客数量',
  `pages_aver` int(11) NOT NULL DEFAULT 0 COMMENT '人均浏览次数',
  `visit_second_aver` int(11) NOT NULL DEFAULT 0 COMMENT '人均访问时长（秒）',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `statisitc_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'all' COMMENT '统计分类（all代表当天所有访问量的统计）',
  `statistic_column_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '统计列值',
  PRIMARY KEY (`access_statistic_id`) USING BTREE,
  INDEX `fk_jc_access_statistic_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_access_statistic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 431 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访问统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_access_statistic
-- ----------------------------
INSERT INTO `jc_site_access_statistic` VALUES (161, '2015-12-16', 6, 1, 3, 2, 41, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (162, '2015-12-16', 6, 1, 3, 2, 41, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (181, '2015-12-17', 21, 2, 5, 4, 468, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (182, '2015-12-17', 21, 2, 5, 4, 468, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (201, '2015-12-18', 4, 3, 4, 1, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (202, '2015-12-18', 4, 3, 4, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (221, '2015-12-19', 3, 2, 2, 1, 59, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (222, '2015-12-19', 3, 2, 2, 1, 59, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (223, '2015-12-21', 1, 1, 1, 1, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (224, '2015-12-21', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (241, '2015-12-22', 2, 1, 1, 2, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (242, '2015-12-22', 2, 1, 1, 2, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (261, '2015-12-24', 2, 2, 2, 1, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (262, '2015-12-24', 2, 2, 2, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (281, '2015-12-25', 2, 2, 2, 1, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (282, '2015-12-25', 2, 2, 2, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (301, '2015-12-26', 1, 1, 1, 1, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (302, '2015-12-26', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (321, '2015-12-30', 3, 2, 2, 1, 12, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (322, '2015-12-30', 3, 2, 2, 1, 12, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (341, '2016-01-05', 2, 2, 2, 1, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (342, '2016-01-05', 2, 2, 2, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (361, '2016-01-12', 2, 1, 1, 2, 1242, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (362, '2016-01-12', 2, 1, 1, 2, 1242, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (381, '2016-01-13', 1, 1, 1, 1, 0, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (382, '2016-01-13', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (383, '2016-04-28', 11, 1, 1, 11, 37, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (384, '2016-04-28', 11, 1, 1, 11, 37, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (403, '2016-05-11', 5, 2, 2, 2, 712, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (404, '2016-05-11', 5, 2, 2, 2, 712, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (423, '2016-05-12', 4, 2, 2, 2, 314, 1, 'all', NULL);
INSERT INTO `jc_site_access_statistic` VALUES (424, '2016-05-12', 4, 2, 2, 2, 314, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (425, '2016-06-17', 2, 1, 1, 2, 4499, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (426, '2016-06-17', 2, 1, 1, 2, 4499, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (427, '2016-07-11', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (428, '2016-07-11', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (429, '2016-09-27', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (430, '2016-09-27', 1, 1, 1, 1, 0, 1, 'source', '直接访问');

-- ----------------------------
-- Table structure for jc_site_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_attr`;
CREATE TABLE `jc_site_attr`  (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_attr
-- ----------------------------
INSERT INTO `jc_site_attr` VALUES (1, 'pvTotal', '33');
INSERT INTO `jc_site_attr` VALUES (1, 'visitors', '27');
INSERT INTO `jc_site_attr` VALUES (1, 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'pvTotal', '33');
INSERT INTO `jc_site_attr` VALUES (1, 'visitors', '27');
INSERT INTO `jc_site_attr` VALUES (1, 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'pvTotal', '33');
INSERT INTO `jc_site_attr` VALUES (1, 'visitors', '27');
INSERT INTO `jc_site_attr` VALUES (1, 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'pvTotal', '33');
INSERT INTO `jc_site_attr` VALUES (1, 'visitors', '27');
INSERT INTO `jc_site_attr` VALUES (1, 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'pvTotal', '33');
INSERT INTO `jc_site_attr` VALUES (1, 'visitors', '27');
INSERT INTO `jc_site_attr` VALUES (1, 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'dayVisitors', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'pvTotal', '33');
INSERT INTO `jc_site_attr` VALUES (1, 'visitors', '27');
INSERT INTO `jc_site_attr` VALUES (1, 'dayPvTotal', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'dayVisitors', '0');

-- ----------------------------
-- Table structure for jc_site_cfg
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_cfg`;
CREATE TABLE `jc_site_cfg`  (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_cfg_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_company
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_company`;
CREATE TABLE `jc_site_company`  (
  `site_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `scale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司规模',
  `nature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司性质',
  `industry` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司行业',
  `contact` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '公司简介',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司地址',
  `longitude` float(5, 2) DEFAULT NULL COMMENT '经度',
  `latitude` float(4, 2) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_company
-- ----------------------------
INSERT INTO `jc_site_company` VALUES (1, '后台测试站点', '20-50人', '股份制', '房地产', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_site_flow
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_flow`;
CREATE TABLE `jc_site_flow`  (
  `flow_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `access_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '127.0.0.1' COMMENT '访问者ip',
  `access_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问日期',
  `access_time` date DEFAULT NULL COMMENT '访问时间',
  `access_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '访问页面',
  `referer_website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来访网站',
  `referer_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来访页面',
  `referer_keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来访关键字',
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地区',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cookie信息',
  PRIMARY KEY (`flow_id`) USING BTREE,
  INDEX `site_id`(`site_id`) USING BTREE,
  CONSTRAINT `jc_site_flow_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点流量统计表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_model`;
CREATE TABLE `jc_site_model`  (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段',
  `model_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `upload_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) DEFAULT 1 COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) DEFAULT 1 COMMENT '是否独占一行',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE INDEX `ak_field`(`field`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点信息模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_refer
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_refer`;
CREATE TABLE `jc_site_refer`  (
  `from_site_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`from_site_id`, `site_id`) USING BTREE,
  INDEX `site_id`(`site_id`) USING BTREE,
  CONSTRAINT `jc_site_refer_ibfk_1` FOREIGN KEY (`from_site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_site_refer_ibfk_2` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点转载权限' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_txt`;
CREATE TABLE `jc_site_txt`  (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `txt_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '值',
  INDEX `fk_jc_txt_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点文本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_static_site_channel_task
-- ----------------------------
DROP TABLE IF EXISTS `jc_static_site_channel_task`;
CREATE TABLE `jc_static_site_channel_task`  (
  `STATIC_SITE_CHANNEL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`STATIC_SITE_CHANNEL_ID`) USING BTREE,
  INDEX `FK25262A0E1A691AE5`(`site_id`) USING BTREE,
  INDEX `FK25262A0EC76AD729`(`channel_id`) USING BTREE,
  CONSTRAINT `FK25262A0E1A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK25262A0EC76AD729` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_static_site_channel_task
-- ----------------------------
INSERT INTO `jc_static_site_channel_task` VALUES (1, 1, 101, 0, NULL, NULL);
INSERT INTO `jc_static_site_channel_task` VALUES (2, 1, 102, 0, NULL, NULL);
INSERT INTO `jc_static_site_channel_task` VALUES (5, 1, 100, 0, NULL, NULL);

-- ----------------------------
-- Table structure for jc_task
-- ----------------------------
DROP TABLE IF EXISTS `jc_task`;
CREATE TABLE `jc_task`  (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务执行代码',
  `task_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务类型(1首页静态化、2栏目页静态化、3内容页静态化、4采集、5分发)',
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务类',
  `execycle` tinyint(1) NOT NULL DEFAULT 1 COMMENT '执行周期分类(1非表达式 2 cron表达式)',
  `day_of_month` int(11) DEFAULT NULL COMMENT '每月的哪天',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT '周几',
  `hour` int(11) DEFAULT NULL COMMENT '小时',
  `minute` int(11) DEFAULT NULL COMMENT '分钟',
  `interval_hour` int(11) DEFAULT NULL COMMENT '间隔小时',
  `interval_minute` int(11) DEFAULT NULL COMMENT '间隔分钟',
  `task_interval_unit` tinyint(1) DEFAULT NULL COMMENT '1分钟、2小时、3日、4周、5月',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '规则表达式',
  `is_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `task_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务说明',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`) USING BTREE,
  INDEX `fk_jc_task_site`(`site_id`) USING BTREE,
  INDEX `FK95B53CCB94799C65`(`user_id`) USING BTREE,
  CONSTRAINT `FK95B53CCB94799C65` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_task_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_task_attr`;
CREATE TABLE `jc_task_attr`  (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名称',
  `param_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数值',
  INDEX `fk_jc_attr_task`(`task_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_test
-- ----------------------------
DROP TABLE IF EXISTS `jc_test`;
CREATE TABLE `jc_test`  (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `test_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_id`) USING BTREE,
  INDEX `fk_jc_test_user`(`user_id`) USING BTREE,
  INDEX `fk_jc_test_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_test_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_test_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_third_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_third_account`;
CREATE TABLE `jc_third_account`  (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方账号key',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联用户名',
  `source` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方登录平台账号' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic`;
CREATE TABLE `jc_topic`  (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `short_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推??',
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `fk_jc_topic_channel`(`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS专题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_user`;
CREATE TABLE `jc_user`  (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT 0 COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT 0 COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT 0 COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否只管理自己的数据',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `depart_id` int(11) DEFAULT NULL COMMENT '部门',
  `file_total` int(11) DEFAULT NULL COMMENT '上传文库文档个数',
  `grain` int(11) DEFAULT NULL COMMENT '文库财富值',
  `is_viewonly_admin` int(11) DEFAULT NULL COMMENT '是否只读管理员',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `ak_username`(`username`) USING BTREE,
  INDEX `fk_jc_user_group`(`group_id`) USING BTREE,
  INDEX `depart_id`(`depart_id`) USING BTREE,
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_user_ibfk_1` FOREIGN KEY (`depart_id`) REFERENCES `jc_department` (`depart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user
-- ----------------------------
INSERT INTO `jc_user` VALUES (1, 1, 'admin', NULL, '2011-01-03 00:00:00', '127.0.0.1', '2018-04-19 09:17:20', '0:0:0:0:0:0:0:1', 522, 9, 23719, 3168, '2018-01-24', 1, 0, 0, NULL, 0, 103, 0, 'D82FCF1BBDF40D07C032D38630470E68');
INSERT INTO `jc_user` VALUES (42, 1, 'admin1', NULL, '2015-12-25 17:33:07', '172.31.0.112', '2015-12-25 17:33:07', '172.31.0.112', 0, 8, 0, 0, '2015-12-25', 1, 0, 0, 4, 0, 0, 0, NULL);
INSERT INTO `jc_user` VALUES (102, 1, '111', NULL, '2016-01-13 17:40:40', '172.31.0.112', '2016-01-13 17:40:53', '172.31.0.112', 1, 8, 0, 0, '2016-01-13', 1, 0, 0, NULL, 0, 0, 0, '41A9844221056248048B1CFCEBEAFA51');
INSERT INTO `jc_user` VALUES (103, 1, 'test', '', '2016-07-08 09:14:03', '127.0.0.1', '2016-07-08 09:21:37', '127.0.0.1', 3, 8, 0, 0, '2016-07-08', 1, 0, 0, 1, 0, 0, 0, 'DAAB4A1597150A59AB56DD3E7D4D0569');
INSERT INTO `jc_user` VALUES (104, 1, '123456', '974523065@qq.com', '2018-01-15 11:19:23', '0:0:0:0:0:0:0:1', '2018-01-19 08:56:17', '0:0:0:0:0:0:0:1', 23, 0, 0, 0, '2018-01-15', 0, 0, 0, NULL, 0, 0, 0, '538D35BF0BF598FF7FF74FCA4586A002');
INSERT INTO `jc_user` VALUES (105, 1, 'zys', '974523065@qq.com', '2018-01-18 11:58:59', '127.0.0.1', '2018-01-18 13:01:59', '0:0:0:0:0:0:0:1', 4, 0, 0, 0, '2018-01-18', 0, 0, 0, NULL, 0, 0, 0, '8D362AACEF053C862B6ADAC9F0C159B3');
INSERT INTO `jc_user` VALUES (106, 1, 'zys2', NULL, '2018-01-18 13:35:27', '0:0:0:0:0:0:0:1', '2018-01-18 13:35:27', '0:0:0:0:0:0:0:1', 0, 0, 0, 0, '2018-01-18', 0, 0, 0, NULL, 0, 0, 0, NULL);
INSERT INTO `jc_user` VALUES (107, 1, 'zys4', NULL, '2018-01-18 13:45:11', '0:0:0:0:0:0:0:1', '2018-01-18 13:45:11', '0:0:0:0:0:0:0:1', 0, 0, 0, 0, '2018-01-18', 0, 0, 0, NULL, 0, 0, 0, NULL);
INSERT INTO `jc_user` VALUES (108, 1, 'zys5', NULL, '2018-01-18 13:51:00', '0:0:0:0:0:0:0:1', '2018-01-18 13:51:00', '0:0:0:0:0:0:0:1', 0, 0, 0, 0, '2018-01-18', 0, 0, 0, NULL, 0, 0, 0, NULL);
INSERT INTO `jc_user` VALUES (109, 1, 'zys6', NULL, '2018-01-18 13:52:34', '0:0:0:0:0:0:0:1', '2018-01-18 13:52:34', '0:0:0:0:0:0:0:1', 0, 0, 0, 0, '2018-01-18', 0, 0, 0, NULL, 0, 0, 0, NULL);
INSERT INTO `jc_user` VALUES (110, 1, 'zys7', NULL, '2018-01-18 13:53:02', '0:0:0:0:0:0:0:1', '2018-01-18 13:53:02', '0:0:0:0:0:0:0:1', 0, 0, 0, 0, '2018-01-18', 0, 0, 0, NULL, 0, 0, 0, NULL);
INSERT INTO `jc_user` VALUES (111, 1, 'zhangyongsheng', NULL, '2018-01-19 09:12:49', '0:0:0:0:0:0:0:1', '2018-01-19 09:13:11', '0:0:0:0:0:0:0:1', 1, 0, 0, 0, '2018-01-19', 0, 0, 0, NULL, 0, 0, 0, '2A33CBFC352FD6C10EC35CB1D9609C81');

-- ----------------------------
-- Table structure for jc_user_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_attr`;
CREATE TABLE `jc_user_attr`  (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  INDEX `fk_jc_attr_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_collection`;
CREATE TABLE `jc_user_collection`  (
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `content_id` int(11) NOT NULL DEFAULT 0 COMMENT '内容id',
  PRIMARY KEY (`user_id`, `content_id`) USING BTREE,
  INDEX `fk_jc_user_collection_con`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收藏关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_ext`;
CREATE TABLE `jc_user_ext`  (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户头像',
  `user_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户个性签名',
  `interest` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `academy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stuno` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nation` int(5) DEFAULT NULL,
  `zzmm` int(5) DEFAULT NULL,
  `jb` int(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS用户扩展信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_ext
-- ----------------------------
INSERT INTO `jc_user_ext` VALUES (1, '后台测试', 0, NULL, NULL, '39', NULL, NULL, '1110', '110', '/user/images/201801/17142024tbwm.png', '', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (103, '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (104, '姓名', 0, NULL, '现居住地址', '38', '身份证号', '40', '其他联系方式', '手机', '/user/images/201801/171745370cnn.png', '23', NULL, NULL, NULL, 37, 39, 40);
INSERT INTO `jc_user_ext` VALUES (105, '张永生', 1, '1994-07-12 00:00:00', '哈尔滨', '哈尔滨', '232306199407123509', NULL, '18686733356', '13039940018', NULL, NULL, NULL, NULL, NULL, 37, 39, 42);
INSERT INTO `jc_user_ext` VALUES (106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `jc_user_ext` VALUES (111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_menu`;
CREATE TABLE `jc_user_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单地址',
  `priority` int(11) NOT NULL DEFAULT 10,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `fk_jc_menu_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_menu_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户常用菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user_resume
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_resume`;
CREATE TABLE `jc_user_resume`  (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简历名称',
  `target_worknature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '期望工作性质',
  `target_workplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '期望工作地点',
  `target_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '期望职位类别',
  `target_salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '期望月薪',
  `edu_school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '毕业学校',
  `edu_graduation` datetime DEFAULT NULL COMMENT '毕业时间',
  `edu_back` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学历',
  `edu_discipline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专业',
  `recent_company` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最近工作公司名称',
  `company_industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最近公司所属行业',
  `company_scale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司规模',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位名称',
  `job_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位类别',
  `job_start` datetime DEFAULT NULL COMMENT '工作起始时间',
  `subordinates` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '下属人数',
  `job_description` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '工作描述',
  `self_evaluation` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户简历' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_resume
-- ----------------------------
INSERT INTO `jc_user_resume` VALUES (1, '程序员', '全职', '上海', 'java工程师', NULL, '家里蹲大学', NULL, '本科', '吃饭', '111', NULL, NULL, '11', NULL, NULL, NULL, '111', '111');

-- ----------------------------
-- Table structure for jc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_role`;
CREATE TABLE `jc_user_role`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `fk_jc_role_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS用户角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_role
-- ----------------------------
INSERT INTO `jc_user_role` VALUES (1, 1);
INSERT INTO `jc_user_role` VALUES (1, 42);
INSERT INTO `jc_user_role` VALUES (4, 102);
INSERT INTO `jc_user_role` VALUES (2, 103);

-- ----------------------------
-- Table structure for jc_user_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_site`;
CREATE TABLE `jc_user_site`  (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT 1 COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否拥有所有栏目的权限',
  `is_all_channel_control` int(11) DEFAULT 1 COMMENT '所有栏目控制权限',
  PRIMARY KEY (`usersite_id`) USING BTREE,
  INDEX `fk_jc_site_user`(`user_id`) USING BTREE,
  INDEX `fk_jc_user_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS管理员站点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_site
-- ----------------------------
INSERT INTO `jc_user_site` VALUES (1, 1, 1, 3, 1, 1);
INSERT INTO `jc_user_site` VALUES (22, 42, 1, 3, 1, 1);
INSERT INTO `jc_user_site` VALUES (42, 102, 1, 3, 0, 0);
INSERT INTO `jc_user_site` VALUES (65, 103, 1, 3, 1, 1);

-- ----------------------------
-- Table structure for jc_vote_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_item`;
CREATE TABLE `jc_vote_item`  (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT 0 COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`voteitem_id`) USING BTREE,
  INDEX `fk_jc_vote_item_topic`(`votetopic_id`) USING BTREE,
  INDEX `FK_jc_vote_item_subtopic`(`subtopic_id`) USING BTREE,
  CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS投票项' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_item
-- ----------------------------
INSERT INTO `jc_vote_item` VALUES (20, 2, '喜欢', 0, 2, 7);
INSERT INTO `jc_vote_item` VALUES (21, 2, '不喜欢', 0, 3, 7);
INSERT INTO `jc_vote_item` VALUES (22, 2, '很喜欢', 9, 1, 7);
INSERT INTO `jc_vote_item` VALUES (23, 2, '有改进', 8, 5, 8);
INSERT INTO `jc_vote_item` VALUES (24, 2, '没有改进', 0, 7, 8);
INSERT INTO `jc_vote_item` VALUES (25, 2, '差不多', 0, 6, 8);
INSERT INTO `jc_vote_item` VALUES (26, 2, '改进很大', 1, 4, 8);
INSERT INTO `jc_vote_item` VALUES (27, 2, '新闻', 9, 8, 6);
INSERT INTO `jc_vote_item` VALUES (28, 2, '视频', 1, 10, 6);
INSERT INTO `jc_vote_item` VALUES (29, 2, '下载', 1, 11, 6);
INSERT INTO `jc_vote_item` VALUES (30, 2, '图库', 9, 9, 6);
INSERT INTO `jc_vote_item` VALUES (31, 4, '1', 0, 1, 16);
INSERT INTO `jc_vote_item` VALUES (32, 4, '2', 0, 2, 16);
INSERT INTO `jc_vote_item` VALUES (33, 4, '3', 0, 3, 16);
INSERT INTO `jc_vote_item` VALUES (34, 4, '4', 1, 4, 16);
INSERT INTO `jc_vote_item` VALUES (35, 4, 'q', 0, 5, 17);
INSERT INTO `jc_vote_item` VALUES (36, 4, 'w', 1, 6, 17);
INSERT INTO `jc_vote_item` VALUES (37, 4, 'e', 0, 7, 17);
INSERT INTO `jc_vote_item` VALUES (38, 4, 'r', 0, 8, 17);

-- ----------------------------
-- Table structure for jc_vote_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_record`;
CREATE TABLE `jc_vote_record`  (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票COOKIE',
  PRIMARY KEY (`voterecored_id`) USING BTREE,
  INDEX `fk_jc_vote_record_topic`(`votetopic_id`) USING BTREE,
  INDEX `fk_jc_voterecord_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS投票记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_record
-- ----------------------------
INSERT INTO `jc_vote_record` VALUES (1, NULL, 4, '2016-09-26 14:44:56', '0:0:0:0:0:0:0:1', '57689230742a42018a8cc9a90dcfae99');

-- ----------------------------
-- Table structure for jc_vote_reply
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_reply`;
CREATE TABLE `jc_vote_reply`  (
  `votereply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '回复内容',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`votereply_id`) USING BTREE,
  INDEX `FK_jc_vote_reply_sub`(`subtopic_id`) USING BTREE,
  CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票文本题目回复表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_reply
-- ----------------------------
INSERT INTO `jc_vote_reply` VALUES (1, '1', 5);
INSERT INTO `jc_vote_reply` VALUES (2, '发反反复复', 5);
INSERT INTO `jc_vote_reply` VALUES (3, '发反反复复', 5);
INSERT INTO `jc_vote_reply` VALUES (4, 'qw', 5);
INSERT INTO `jc_vote_reply` VALUES (5, 'qw', 5);
INSERT INTO `jc_vote_reply` VALUES (6, 'qw', 5);
INSERT INTO `jc_vote_reply` VALUES (7, 'qw', 5);
INSERT INTO `jc_vote_reply` VALUES (8, '12', 5);
INSERT INTO `jc_vote_reply` VALUES (9, '12', 5);

-- ----------------------------
-- Table structure for jc_vote_subtopic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_subtopic`;
CREATE TABLE `jc_vote_subtopic`  (
  `subtopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `votetopic_id` int(11) NOT NULL DEFAULT 0 COMMENT '投票（调查）',
  `subtopic_type` int(2) NOT NULL DEFAULT 1 COMMENT '类型（1单选，2多选，3文本）',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`subtopic_id`) USING BTREE,
  INDEX `FK_jc_vote_subtopic_vote`(`votetopic_id`) USING BTREE,
  CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票子题目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_subtopic
-- ----------------------------
INSERT INTO `jc_vote_subtopic` VALUES (5, '我觉得这里完善一下：', 2, 3, 3);
INSERT INTO `jc_vote_subtopic` VALUES (6, '您觉得V5演示站哪些模块做的比较好', 2, 2, 4);
INSERT INTO `jc_vote_subtopic` VALUES (7, 'V5版本演示站网页的设计风格您喜欢吗？', 2, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (8, 'V5版本比V2012sp1版的设计风格有改进吗？', 2, 1, 2);
INSERT INTO `jc_vote_subtopic` VALUES (13, '321', 3, 3, 3);
INSERT INTO `jc_vote_subtopic` VALUES (14, '2222', 3, 1, 5);
INSERT INTO `jc_vote_subtopic` VALUES (15, '123', 3, 3, 4);
INSERT INTO `jc_vote_subtopic` VALUES (16, '1111111111', 4, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (17, '222222222222222', 4, 1, 2);

-- ----------------------------
-- Table structure for jc_vote_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_topic`;
CREATE TABLE `jc_vote_topic`  (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT 0 COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT 1 COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认主题',
  PRIMARY KEY (`votetopic_id`) USING BTREE,
  INDEX `fk_jc_votetopic_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS投票主题' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_topic
-- ----------------------------
INSERT INTO `jc_vote_topic` VALUES (2, 1, 'JEECMS演示站改版用户问卷调查', 'JEECMSv5版正式发布了，伴随着系统的完善，jeecms演示站的模板也一直在不断的改版，针对此次改版，jeecms美工团队特邀您参与“JEECMS演示站改版用户问卷调查”，希望大家能提出宝贵的意见，我们一定认真改进，谢谢大家的支持！', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 1);
INSERT INTO `jc_vote_topic` VALUES (3, 1, 'y', 'y', NULL, NULL, 111, 0, 1, 0, 0, 1, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (4, 1, '13123423dfs', 'sdfsdfsdf', NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, 0);

-- ----------------------------
-- Table structure for jc_webservice
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice`;
CREATE TABLE `jc_webservice`  (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_address` varchar(510) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接口地址',
  `target_namespace` varchar(510) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `success_result` varchar(510) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '正确返回值',
  `service_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接口类型',
  `service_operate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '接口操作',
  PRIMARY KEY (`service_id`) USING HASH
) ENGINE = MEMORY AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for jc_webservice_auth
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_auth`;
CREATE TABLE `jc_webservice_auth`  (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `system` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '系统',
  `is_enable` int(11) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'webservices认证表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_webservice_auth
-- ----------------------------
INSERT INTO `jc_webservice_auth` VALUES (1, 'test', '098f6bcd4621d373cade4e832627b4f6', 'bbs', 1);

-- ----------------------------
-- Table structure for jc_webservice_call_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_call_record`;
CREATE TABLE `jc_webservice_call_record`  (
  `record_id` int(11) NOT NULL,
  `service_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `auth_id` int(11) DEFAULT NULL,
  `record_time` date DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE,
  CONSTRAINT `jc_webservice_call_record_ibfk_1` FOREIGN KEY (`auth_id`) REFERENCES `jc_webservice_auth` (`auth_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口调用记录;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_webservice_call_record
-- ----------------------------
INSERT INTO `jc_webservice_call_record` VALUES (16, 'user_add', 1, '2015-04-02');

-- ----------------------------
-- Table structure for jc_webservice_param
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_param`;
CREATE TABLE `jc_webservice_param`  (
  `service_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `param_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名',
  `default_value` varchar(510) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '默认值'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口参数表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_webservice_param
-- ----------------------------
INSERT INTO `jc_webservice_param` VALUES (1, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 5, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 6, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 5, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 6, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (3, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 5, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 6, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 5, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 6, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (3, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 5, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 6, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 5, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 6, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (3, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 5, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 6, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 5, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 6, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (3, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (1, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 5, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 6, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (1, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (2, 2, 'username', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 3, 'password', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 4, 'email', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 5, 'sex', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 6, 'realname', NULL);
INSERT INTO `jc_webservice_param` VALUES (2, 7, 'tel', NULL);
INSERT INTO `jc_webservice_param` VALUES (3, 0, 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 1, 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES (3, 2, 'username', NULL);

-- ----------------------------
-- Table structure for jc_workflow
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow`;
CREATE TABLE `jc_workflow`  (
  `workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `priority` int(11) DEFAULT 10 COMMENT '排序',
  `is_disabled` int(11) DEFAULT 0 COMMENT '是否禁用',
  PRIMARY KEY (`workflow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_workflow
-- ----------------------------
INSERT INTO `jc_workflow` VALUES (22, 23, '12', '111', 11, 0);
INSERT INTO `jc_workflow` VALUES (23, 23, '11', '111', 2, 0);

-- ----------------------------
-- Table structure for jc_workflow_event
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_event`;
CREATE TABLE `jc_workflow_event`  (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) DEFAULT NULL,
  `date_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `next_step` int(11) DEFAULT NULL,
  `date_type` int(11) DEFAULT NULL,
  `is_finish` int(11) DEFAULT NULL,
  `pass_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE,
  INDEX `workflow_id`(`workflow_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `FK3772C9E09D339814`(`date_id`) USING BTREE,
  CONSTRAINT `FK3772C9E09D339814` FOREIGN KEY (`date_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_workflow_event_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `jc_workflow` (`workflow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_workflow_event_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流轨迹;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_workflow_event_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_event_user`;
CREATE TABLE `jc_workflow_event_user`  (
  `event_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL COMMENT '工作流转id',
  `user_id` int(11) DEFAULT NULL COMMENT '流转用户',
  PRIMARY KEY (`event_user_id`) USING BTREE,
  INDEX `event_id`(`event_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `jc_workflow_event_user_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `jc_workflow_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_workflow_event_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流轨迹用户表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_workflow_node
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_node`;
CREATE TABLE `jc_workflow_node`  (
  `workflow_id` int(11) NOT NULL COMMENT '工作流',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排序',
  `is_countersign` int(11) DEFAULT 0 COMMENT '1 会签 0普通流转',
  PRIMARY KEY (`workflow_id`, `priority`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `jc_workflow_node_ibfk_1` FOREIGN KEY (`workflow_id`) REFERENCES `jc_workflow` (`workflow_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_workflow_node_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_workflow_node
-- ----------------------------
INSERT INTO `jc_workflow_node` VALUES (22, 1, 0, 0);
INSERT INTO `jc_workflow_node` VALUES (23, 3, 0, 1);

-- ----------------------------
-- Table structure for jc_workflow_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_record`;
CREATE TABLE `jc_workflow_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '操作人',
  `site_id` int(11) DEFAULT NULL COMMENT '站点',
  `event_id` int(11) DEFAULT NULL COMMENT '轨迹',
  `record_time` date DEFAULT NULL COMMENT '创建时间',
  `opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '意见',
  `type` int(11) DEFAULT NULL COMMENT '类型(1:通过  2退回 3保持)',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `event_id`(`event_id`) USING BTREE,
  INDEX `site_id`(`site_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `jc_workflow_record_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `jc_workflow_event` (`event_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_workflow_record_ibfk_2` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jc_workflow_record_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作流日志记录;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jg_weixin
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixin`;
CREATE TABLE `jg_weixin`  (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `wx_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信二维码',
  `wx_welcome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '关注欢迎语',
  PRIMARY KEY (`site_id`) USING BTREE,
  INDEX `FKA23083A41A691AE5`(`site_id`) USING BTREE,
  CONSTRAINT `FKA23083A41A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jg_weixin
-- ----------------------------
INSERT INTO `jg_weixin` VALUES (1, '/u/cms/www/201510/08105041f9xd.jpg', '江西金磊科技有限公司欢迎您!');

-- ----------------------------
-- Table structure for jg_weixinmenu
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmenu`;
CREATE TABLE `jg_weixinmenu`  (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT 0 COMMENT '站点ID',
  `wm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信菜单名称',
  `wm_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '微信菜单类别',
  `wm_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
  `wm_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '点击key',
  `wm_parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  PRIMARY KEY (`wm_id`) USING BTREE,
  INDEX `FK49712703AECDBD85`(`wm_parent_id`) USING BTREE,
  INDEX `FK497127031A691AE5`(`site_id`) USING BTREE,
  CONSTRAINT `FK497127031A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK49712703AECDBD85` FOREIGN KEY (`wm_parent_id`) REFERENCES `jg_weixinmenu` (`wm_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jg_weixinmenu
-- ----------------------------
INSERT INTO `jg_weixinmenu` VALUES (1, 1, '找官方', 'view', 'http://demo.jeecms.com/html/news/', '1', NULL);
INSERT INTO `jg_weixinmenu` VALUES (2, 1, '演示站', 'view', 'http://demo.jeecms.com/html/picture/', '2', NULL);
INSERT INTO `jg_weixinmenu` VALUES (3, 1, '新闻资讯', 'view', 'http://demo.jeecms.com/html/veido/', '3', NULL);
INSERT INTO `jg_weixinmenu` VALUES (4, 1, '论坛', 'view', 'http://bbs.jeecms.com', '4', 1);
INSERT INTO `jg_weixinmenu` VALUES (5, 1, '官网', 'view', 'http://www.jeecms.com/', '5', 1);
INSERT INTO `jg_weixinmenu` VALUES (6, 1, 'JSPGOU', 'view', 'http://demo3.jeecms.com', '6', 2);
INSERT INTO `jg_weixinmenu` VALUES (7, 1, 'JEEBBS', 'view', 'http://bbs.jeecms.com', '7', 2);
INSERT INTO `jg_weixinmenu` VALUES (8, 1, '图库', 'view', 'http://demo.jeecms.com/news/index.jhtml', '8', 3);
INSERT INTO `jg_weixinmenu` VALUES (9, 1, '新闻', 'click', NULL, 'news', 3);
INSERT INTO `jg_weixinmenu` VALUES (10, 1, 'JEECMS', 'view', 'http://demo.jeecms.com/', NULL, 2);
INSERT INTO `jg_weixinmenu` VALUES (11, 1, '视频', 'view', 'http://demo.jeecms.com/veido/index.jhtml', NULL, 3);
INSERT INTO `jg_weixinmenu` VALUES (12, 1, '下载', 'view', 'http://demo.jeecms.com/download/index.jhtml', 'http://demo.jeecms.com/download/index.jhtml', 3);
INSERT INTO `jg_weixinmenu` VALUES (13, 1, '调查', 'view', 'http://demo.jeecms.com/wldc/index.jhtml', 'http://demo.jeecms.com/wldc/index.jhtml', 3);
INSERT INTO `jg_weixinmenu` VALUES (14, 1, 'JSPGOU店中店', 'view', 'http://dzd.jeecms.com/', 'http://dzd.jeecms.com/', 2);

-- ----------------------------
-- Table structure for jg_weixinmessage
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmessage`;
CREATE TABLE `jg_weixinmessage`  (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `wm_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '序号',
  `wm_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `wm_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图片地址',
  `wm_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '链接地址',
  `wm_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `is_welcome` int(11) DEFAULT 0 COMMENT '是否关注消息',
  `wm_msg_type` int(11) DEFAULT 0 COMMENT '消息类型(0带图文链接 1内容加关键字提示 2仅有内容)',
  PRIMARY KEY (`wm_id`) USING BTREE,
  INDEX `FK86F1DBE31A691AE5`(`site_id`) USING BTREE,
  CONSTRAINT `FK86F1DBE31A691AE5` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信消息配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jg_weixinmessage
-- ----------------------------
INSERT INTO `jg_weixinmessage` VALUES (1, 1, NULL, '留言2', '/u/cms/www/201510/08172019lz4w.png', 'http://demo.jeecms.com/guestbook.jspx', '金磊科技欢迎您!', 1, 0);
INSERT INTO `jg_weixinmessage` VALUES (2, 1, 'news', '新闻', '/u/cms/www/201510/27142936gt6k.jpg', 'http://demo.jeecms.com/news/index.jhtml', '新闻', 0, 0);

-- ----------------------------
-- Table structure for jo_authentication
-- ----------------------------
DROP TABLE IF EXISTS `jo_authentication`;
CREATE TABLE `jo_authentication`  (
  `authentication_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '认证信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jo_config
-- ----------------------------
DROP TABLE IF EXISTS `jo_config`;
CREATE TABLE `jo_config`  (
  `cfg_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jo_config
-- ----------------------------
INSERT INTO `jo_config` VALUES ('email_encoding', '');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.163.com');
INSERT INTO `jo_config` VALUES ('email_password', 'zhangyongsheng');
INSERT INTO `jo_config` VALUES ('email_personal', '');
INSERT INTO `jo_config` VALUES ('email_port', NULL);
INSERT INTO `jo_config` VALUES ('email_username', '18745163068@163.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', '找回JEECMS密码');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用智能信访数据处理平台会员密码找回功能，请记住以下找回信息：\\r\\n用户ID：${uid}\\r\\n用户名：${username}\\r\\n您的新密码为：${resetPwd}\\r\\n请访问如下链接新密码才能生效：\\r\\nhttp://172.31.0.41:18080/member/password_reset.jspx?uid=${uid}&key=${resetKey}');
INSERT INTO `jo_config` VALUES ('message_register_subject', '欢迎您注册JEECMS用户');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\\r\\n欢迎您注册JEECMS系统会员\\r\\n请点击以下链接进行激活\\r\\nhttp://demo.jeecms.com/active.jspx?username=${username}=${activationCode}');
INSERT INTO `jo_config` VALUES ('message_subject', 'JEECMS会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\\r\\n用户ID：${uid}\\r\\n用户名：${username}\\r\\n您的新密码为：${resetPwd}\\r\\n请访问如下链接新密码才能生效：\\r\\nhttp://localhost/member/password_reset.jspx?uid=${uid}=${resetKey}\\r\\n');

-- ----------------------------
-- Table structure for jo_ftp
-- ----------------------------
DROP TABLE IF EXISTS `jo_ftp`;
CREATE TABLE `jo_ftp`  (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT 21 COMMENT '端口号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'FTP表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jo_ftp
-- ----------------------------
INSERT INTO `jo_ftp` VALUES (21, '6', '22', 21, '2', '3', 'UTF-8', 33, '2', '2');
INSERT INTO `jo_ftp` VALUES (22, '3', '3', 21, '3', '3', 'UTF-8', 0, NULL, '3');
INSERT INTO `jo_ftp` VALUES (23, '3', '3', 21, '3', '3', 'UTF-8', 0, '3', '3');

-- ----------------------------
-- Table structure for jo_template
-- ----------------------------
DROP TABLE IF EXISTS `jo_template`;
CREATE TABLE `jo_template`  (
  `tpl_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `tpl_source` longtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jo_upload
-- ----------------------------
DROP TABLE IF EXISTS `jo_upload`;
CREATE TABLE `jo_upload`  (
  `filename` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jo_user
-- ----------------------------
DROP TABLE IF EXISTS `jo_user`;
CREATE TABLE `jo_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `reset_key` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '重置密码VALUE',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录错误次数',
  `error_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL DEFAULT 1 COMMENT '激活状态',
  `activation_code` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `ak_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES (1, 'admin', NULL, '5f4dcc3b5aa765d61d8327deb882cf99', '2011-01-03 00:00:00', '127.0.0.1', '2018-04-19 09:17:20', '0:0:0:0:0:0:0:1', 520, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (42, 'admin1', NULL, '96e79218965eb72c92a549dd5a330112', '2015-12-25 17:33:07', '172.31.0.112', '2015-12-25 17:33:07', '172.31.0.112', 0, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (102, '111', NULL, '96e79218965eb72c92a549dd5a330112', '2016-01-13 17:40:40', '172.31.0.112', '2016-01-13 17:40:53', '172.31.0.112', 1, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (103, 'test', NULL, '098f6bcd4621d373cade4e832627b4f6', '2016-07-08 09:14:03', '127.0.0.1', '2016-07-08 09:21:38', '127.0.0.1', 3, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (104, '123456', '974523065@qq.com', 'c20ad4d76fe97759aa27a0c99bff6710', '2018-01-15 11:19:23', '0:0:0:0:0:0:0:1', '2018-01-19 08:56:17', '0:0:0:0:0:0:0:1', 23, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (105, 'zys', '974523065@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2018-01-18 11:58:59', '127.0.0.1', '2018-01-18 13:02:06', '0:0:0:0:0:0:0:1', 4, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (106, 'zys2', NULL, '04bd1956f75abc5658fb7f48cef0f7a0', '2018-01-18 13:35:27', '0:0:0:0:0:0:0:1', '2018-01-18 13:35:27', '0:0:0:0:0:0:0:1', 0, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (107, 'zys4', NULL, '9a06bdcf9481e713f6c51948574f903e', '2018-01-18 13:45:11', '0:0:0:0:0:0:0:1', '2018-01-18 13:45:11', '0:0:0:0:0:0:0:1', 0, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (108, 'zys5', NULL, '52384daf3b9bb19ac43827d2155224ad', '2018-01-18 13:51:00', '0:0:0:0:0:0:0:1', '2018-01-18 13:51:00', '0:0:0:0:0:0:0:1', 0, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (109, 'zys6', NULL, 'dbc20267111927316e500d1d57872fdc', '2018-01-18 13:52:34', '0:0:0:0:0:0:0:1', '2018-01-18 13:52:34', '0:0:0:0:0:0:0:1', 0, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (110, 'zys7', NULL, '156aca50ea0015a1756230b2f3fc3bc1', '2018-01-18 13:53:02', '0:0:0:0:0:0:0:1', '2018-01-18 13:53:02', '0:0:0:0:0:0:0:1', 0, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (111, 'zhangyongsheng', NULL, 'e10adc3949ba59abbe56e057f20f883e', '2018-01-19 09:12:49', '0:0:0:0:0:0:0:1', '2018-01-19 09:13:11', '0:0:0:0:0:0:0:1', 1, NULL, NULL, NULL, 0, NULL, 1, NULL);

-- ----------------------------
-- Table structure for r_camera_organization
-- ----------------------------
DROP TABLE IF EXISTS `r_camera_organization`;
CREATE TABLE `r_camera_organization`  (
  `camera_id` bigint(20) NOT NULL,
  `organization_id` bigint(20) NOT NULL,
  INDEX `FK4ie6leswsm4kn16bmekr7sk4o`(`organization_id`) USING BTREE,
  INDEX `FKblyie2asfrnclfeh5f70dy2g4`(`camera_id`) USING BTREE,
  CONSTRAINT `FKblyie2asfrnclfeh5f70dy2g4` FOREIGN KEY (`camera_id`) REFERENCES `t_camera` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_camera_organization
-- ----------------------------
INSERT INTO `r_camera_organization` VALUES (10001, 100001);
INSERT INTO `r_camera_organization` VALUES (10002, 100001);
INSERT INTO `r_camera_organization` VALUES (10103, 100001);
INSERT INTO `r_camera_organization` VALUES (10102, 100001);

-- ----------------------------
-- Table structure for r_result_alarm
-- ----------------------------
DROP TABLE IF EXISTS `r_result_alarm`;
CREATE TABLE `r_result_alarm`  (
  `result_id` bigint(20) NOT NULL,
  `ref_alarm_id` bigint(20) NOT NULL,
  INDEX `FK2f2bo57my6jg6jaca4ok31jni`(`ref_alarm_id`) USING BTREE,
  INDEX `FKjphnpi5w093rvy8ydb1fxcfaq`(`result_id`) USING BTREE,
  CONSTRAINT `FK2f2bo57my6jg6jaca4ok31jni` FOREIGN KEY (`ref_alarm_id`) REFERENCES `t_alarm` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKjphnpi5w093rvy8ydb1fxcfaq` FOREIGN KEY (`result_id`) REFERENCES `t_rule_result` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_roles_permission
-- ----------------------------
DROP TABLE IF EXISTS `r_roles_permission`;
CREATE TABLE `r_roles_permission`  (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  INDEX `FKdoq4wnf22424y4ioktkbqpxfs`(`permission_id`) USING BTREE,
  INDEX `FKcbmvq7nr4ta8x9n0yuwba481`(`role_id`) USING BTREE,
  CONSTRAINT `FKcbmvq7nr4ta8x9n0yuwba481` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdoq4wnf22424y4ioktkbqpxfs` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_roles_permission
-- ----------------------------
INSERT INTO `r_roles_permission` VALUES (1, 10003);
INSERT INTO `r_roles_permission` VALUES (1, 10004);
INSERT INTO `r_roles_permission` VALUES (1, 10001);
INSERT INTO `r_roles_permission` VALUES (1, 10002);
INSERT INTO `r_roles_permission` VALUES (1, 10005);
INSERT INTO `r_roles_permission` VALUES (1, 10006);
INSERT INTO `r_roles_permission` VALUES (1, 10007);
INSERT INTO `r_roles_permission` VALUES (1, 10008);
INSERT INTO `r_roles_permission` VALUES (1, 10009);
INSERT INTO `r_roles_permission` VALUES (1, 10010);
INSERT INTO `r_roles_permission` VALUES (1, 10012);
INSERT INTO `r_roles_permission` VALUES (1, 10011);
INSERT INTO `r_roles_permission` VALUES (1, 10013);
INSERT INTO `r_roles_permission` VALUES (1, 10014);
INSERT INTO `r_roles_permission` VALUES (1, 10015);
INSERT INTO `r_roles_permission` VALUES (1, 10016);

-- ----------------------------
-- Table structure for r_surveillance_camera
-- ----------------------------
DROP TABLE IF EXISTS `r_surveillance_camera`;
CREATE TABLE `r_surveillance_camera`  (
  `surveillance_id` bigint(20) NOT NULL,
  `camera_id` bigint(20) NOT NULL,
  INDEX `FKt1ns9g0f8od9py18vw0gensqn`(`camera_id`) USING BTREE,
  INDEX `FKleni6llk04ibc6wor3861565a`(`surveillance_id`) USING BTREE,
  CONSTRAINT `FKleni6llk04ibc6wor3861565a` FOREIGN KEY (`surveillance_id`) REFERENCES `t_surveillance` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt1ns9g0f8od9py18vw0gensqn` FOREIGN KEY (`camera_id`) REFERENCES `t_camera` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_surveillance_camera
-- ----------------------------
INSERT INTO `r_surveillance_camera` VALUES (10003, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10004, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10005, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10006, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10007, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10008, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10009, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10010, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10011, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10012, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10013, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10014, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10015, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10016, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10001, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10001, 10002);
INSERT INTO `r_surveillance_camera` VALUES (10001, 10102);
INSERT INTO `r_surveillance_camera` VALUES (10002, 10001);
INSERT INTO `r_surveillance_camera` VALUES (10002, 10002);
INSERT INTO `r_surveillance_camera` VALUES (10002, 10102);

-- ----------------------------
-- Table structure for r_surveillance_facedb
-- ----------------------------
DROP TABLE IF EXISTS `r_surveillance_facedb`;
CREATE TABLE `r_surveillance_facedb`  (
  `surveillance_id` bigint(20) NOT NULL,
  `facedb_id` bigint(20) NOT NULL,
  INDEX `FKcm4f8r7k4feko0fe3ku1d1tt9`(`facedb_id`) USING BTREE,
  INDEX `FKiw6j9rmrp3cuaptfgqm6iwlvu`(`surveillance_id`) USING BTREE,
  CONSTRAINT `FKcm4f8r7k4feko0fe3ku1d1tt9` FOREIGN KEY (`facedb_id`) REFERENCES `t_facedb` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKiw6j9rmrp3cuaptfgqm6iwlvu` FOREIGN KEY (`surveillance_id`) REFERENCES `t_surveillance` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for r_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `r_users_roles`;
CREATE TABLE `r_users_roles`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  INDEX `FK5l3366rdv8pdvft408cye78hu`(`role_id`) USING BTREE,
  CONSTRAINT `FK5l3366rdv8pdvft408cye78hu` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of r_users_roles
-- ----------------------------
INSERT INTO `r_users_roles` VALUES (10001, 1);
INSERT INTO `r_users_roles` VALUES (10003, 1);
INSERT INTO `r_users_roles` VALUES (10014, 1);
INSERT INTO `r_users_roles` VALUES (10015, 1);
INSERT INTO `r_users_roles` VALUES (10021, 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `describes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '0:0:0:0:0:0:0:1', '2018-03-14 09:22:26', '超级管理员');
INSERT INTO `role` VALUES (2, '录入人员', '0:0:0:0:0:0:0:1', '2018-03-09 14:13:27', '录入人员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modular_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `modular_qx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modular_id` int(11) DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKBD40D53835ABF234`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int(20) NOT NULL,
  `supplier_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商名',
  `supplier_rank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商等级',
  `supplier_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商类别',
  `supplier_delivery` int(255) DEFAULT NULL COMMENT '交货及时率评分',
  `supplier_servicequality` int(255) DEFAULT NULL COMMENT '服务质量评分',
  `supplier_productquality` int(255) DEFAULT NULL COMMENT '产品质量评分',
  `supplier_accountperiod` int(255) DEFAULT NULL COMMENT '供应商账期评分',
  `supplier_totalscore` int(255) DEFAULT NULL COMMENT '供应商总分',
  `supplier_rating` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商评分等级',
  `supplier_evaluate` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商评价',
  `supplier_imageid` int(255) DEFAULT NULL COMMENT '资质图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '东亚', 'A', '4', 80, 90, 80, 90, 90, '一级', '萨顶顶撒撒搭搭撒撒大东莞市房是梵蒂冈梵蒂冈', NULL);
INSERT INTO `supplier` VALUES (2, '联想', 'B', '2', 70, 80, 90, 99, 95, '二级', '双方的看法那棵树的南方科技能够离开电脑房速度快今年分数考虑能否考虑是南方老师看见你lskdnjflkfnlskNF ljnkljsdnlSDFNsJNdldsnfLKJNLSDNJFSLkjvndkjndvn', NULL);
INSERT INTO `supplier` VALUES (3, '中兴', 'A', '1', 50, 60, 90, 80, 40, '三级', '都能积极克服了JKD发表了坚实的第三方来缴纳罚款就是了男方了开始就能立刻介绍DS妇女节LSDKJN发KLNSDF立刻就能福克斯L你发房管局不服GV冀东装备是鼓励大家准备是管理自己的不能等级考试南方科技斯诺伐克lZ是否能', NULL);
INSERT INTO `supplier` VALUES (4, '华为', 'C', '1', 50, 8, 98, 95, 82, '四级', '的地方你姐夫大V女第三方可能的看法你举得费脑子副队长GV尽可能再发你地址GV那就在发动机你的这个你知道工作的烦恼招待费哪知道的做法个卡扎菲的中老年福利工作的分涨幅达了待字闺中大幅度质量GV召开东方女人看着你的发来你等着', NULL);

-- ----------------------------
-- Table structure for supplier_image
-- ----------------------------
DROP TABLE IF EXISTS `supplier_image`;
CREATE TABLE `supplier_image`  (
  `id` int(11) NOT NULL,
  `imagename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `imagepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supp_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier_image
-- ----------------------------
INSERT INTO `supplier_image` VALUES (1, '啊啊啊', NULL, '1');

-- ----------------------------
-- Table structure for supplier_scope
-- ----------------------------
DROP TABLE IF EXISTS `supplier_scope`;
CREATE TABLE `supplier_scope`  (
  `id` int(20) NOT NULL,
  `supplier_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '供应商等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supplier_scope
-- ----------------------------
INSERT INTO `supplier_scope` VALUES (1, '电子产品');
INSERT INTO `supplier_scope` VALUES (2, '计算机软硬件及配件');
INSERT INTO `supplier_scope` VALUES (3, '通讯设备及相关产品');
INSERT INTO `supplier_scope` VALUES (4, '仪器仪表');

-- ----------------------------
-- Table structure for t_alarm
-- ----------------------------
DROP TABLE IF EXISTS `t_alarm`;
CREATE TABLE `t_alarm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `age_range` int(11) DEFAULT NULL,
  `alarm_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `alarm_type` int(11) DEFAULT NULL,
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `camera_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `camera_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `db_id` int(11) DEFAULT NULL,
  `db_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `face_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `geohash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `org_paths` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `person_gender` int(11) DEFAULT NULL,
  `person_id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scene_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `server_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `server_mac` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `similarity` double DEFAULT NULL,
  `sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `camera_id` bigint(20) DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhw8yngae3yi1ps3v0uy6cgiu4`(`camera_id`) USING BTREE,
  INDEX `FKt8yflhi1tfrel5idoat99bi1h`(`person_id`) USING BTREE,
  INDEX `index_alarm_org_path`(`org_paths`) USING BTREE,
  INDEX `index_alarm_id`(`alarm_id`) USING BTREE,
  CONSTRAINT `FKhw8yngae3yi1ps3v0uy6cgiu4` FOREIGN KEY (`camera_id`) REFERENCES `t_camera` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt8yflhi1tfrel5idoat99bi1h` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_alarm_dispose
-- ----------------------------
DROP TABLE IF EXISTS `t_alarm_dispose`;
CREATE TABLE `t_alarm_dispose`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `reporter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  `alarm_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7720r4txv5s3reer017pj7co3`(`alarm_id`) USING BTREE,
  CONSTRAINT `FK7720r4txv5s3reer017pj7co3` FOREIGN KEY (`alarm_id`) REFERENCES `t_alarm` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_area
-- ----------------------------
DROP TABLE IF EXISTS `t_area`;
CREATE TABLE `t_area`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_area_t_area_id_fk`(`parent_id`) USING BTREE,
  CONSTRAINT `t_area_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `t_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_area_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `t_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_area_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `t_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_building
-- ----------------------------
DROP TABLE IF EXISTS `t_building`;
CREATE TABLE `t_building`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `administrator` bigint(20) DEFAULT NULL,
  `building_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `property` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_building
-- ----------------------------
INSERT INTO `t_building` VALUES (1, 10002, 'A04', 5, '2017-11-08 15:59:40', 'A04', '东门', '女寝', '');
INSERT INTO `t_building` VALUES (10, 10001, 'A2', 6, '2017-11-08 10:34:08', '测试', '测试', '男寝', '');

-- ----------------------------
-- Table structure for t_building_history
-- ----------------------------
DROP TABLE IF EXISTS `t_building_history`;
CREATE TABLE `t_building_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `building_id` bigint(20) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `modified_user` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_building_history
-- ----------------------------
INSERT INTO `t_building_history` VALUES (11, 10, '2017-11-08 10:34:08', NULL, '');
INSERT INTO `t_building_history` VALUES (12, 1, '2017-11-08 10:36:03', NULL, '');
INSERT INTO `t_building_history` VALUES (13, 1, '2017-11-08 15:59:33', NULL, '');
INSERT INTO `t_building_history` VALUES (14, 1, '2017-11-08 15:59:40', NULL, '');

-- ----------------------------
-- Table structure for t_camera
-- ----------------------------
DROP TABLE IF EXISTS `t_camera`;
CREATE TABLE `t_camera`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `camera_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connection_type` int(11) DEFAULT NULL,
  `ext` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `geohash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `max_return` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `save_scene` bit(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  `building_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK2jmofe8exwqn6ninqy03pvsh`(`company_id`) USING BTREE,
  INDEX `FKdso3t3b8g4hrqnu9qtv0emnds`(`server_id`) USING BTREE,
  CONSTRAINT `FK2jmofe8exwqn6ninqy03pvsh` FOREIGN KEY (`company_id`) REFERENCES `t_company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdso3t3b8g4hrqnu9qtv0emnds` FOREIGN KEY (`server_id`) REFERENCES `t_server` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_camera
-- ----------------------------
INSERT INTO `t_camera` VALUES (10001, '2017-10-25 15:56:54', '2017-11-29 02:30:25', '', '706661', 3, '{}', NULL, '', NULL, NULL, NULL, '246', NULL, NULL, b'0', 3, 5, NULL, 'rtsp://admin:yhtd0451@172.31.0.74', 10001, NULL, NULL, 1, NULL);
INSERT INTO `t_camera` VALUES (10002, '2017-10-25 15:57:40', '2017-11-24 02:50:25', '', '706875', 3, '{}', NULL, '', NULL, NULL, NULL, '245', NULL, NULL, b'0', 3, 5, NULL, 'rtsp://admin:yhtd0451@172.31.0.165', 10001, NULL, NULL, 1, NULL);
INSERT INTO `t_camera` VALUES (10102, '2017-10-25 17:01:19', '2017-11-24 02:50:25', '', '714640', 3, '{}', NULL, '', NULL, NULL, NULL, '243', NULL, NULL, b'0', 3, 5, NULL, 'rtsp://admin:admin@172.31.0.243:554/av0_0', 10001, NULL, NULL, 1, NULL);
INSERT INTO `t_camera` VALUES (10103, '2017-10-25 17:02:09', '2017-11-29 02:30:25', '', '714634', 3, '{}', NULL, '', NULL, NULL, NULL, '244', NULL, NULL, b'0', 3, 5, NULL, 'rtsp://admin:admin@172.31.0.244:554/av0_0', 10001, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for t_cameras
-- ----------------------------
DROP TABLE IF EXISTS `t_cameras`;
CREATE TABLE `t_cameras`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `camera_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `connection_type` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `ext` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `geohash` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `max_return` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `plan_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK3F892D0363A00037`(`room_id`) USING BTREE,
  INDEX `FKDC50952363A00037`(`room_id`) USING BTREE,
  INDEX `FK3F892D03A189A99`(`plan_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cameras
-- ----------------------------
INSERT INTO `t_cameras` VALUES (1, '大师傅士大夫', 'S10001', 0, '2018-01-10 17:18:01', 'rtsp://admin:admin@172.31.0.244:554/av0_0', '手动阀手动阀', '172.31.0.57', '2018-01-17 18:16:07', NULL, '摄像头一', '123456', 8001, NULL, 'admin', 2, 584.40625, 372, 3);

-- ----------------------------
-- Table structure for t_camerasplan
-- ----------------------------
DROP TABLE IF EXISTS `t_camerasplan`;
CREATE TABLE `t_camerasplan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bz` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `imhUrl` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_camerasplan
-- ----------------------------
INSERT INTO `t_camerasplan` VALUES (1, '', '一楼', '/static/upload/portraitImages/1516585569748.png', '平面图一');
INSERT INTO `t_camerasplan` VALUES (3, '的风格的是法国撒地方收到发', '二楼', '/static/upload/portraitImages/1516585563221.png', '平面图二');

-- ----------------------------
-- Table structure for t_casereview
-- ----------------------------
DROP TABLE IF EXISTS `t_casereview`;
CREATE TABLE `t_casereview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problemDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `problemTime` datetime DEFAULT NULL,
  `problem_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `suspect_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK7E627F53A98C700B`(`problem_id`) USING BTREE,
  INDEX `FK7E627F53C824E8A0`(`booking_id`) USING BTREE,
  INDEX `FK7E627F53A8FCFBE0`(`suspect_id`) USING BTREE,
  INDEX `FKB4FD9333C824E8A0`(`booking_id`) USING BTREE,
  INDEX `FKB4FD9333A98C700B`(`problem_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_casereview
-- ----------------------------
INSERT INTO `t_casereview` VALUES (1, '士大夫似的我师傅色粉是否撒地方撒地方收到', '2018-01-03 10:36:02', 103, 30, NULL);
INSERT INTO `t_casereview` VALUES (2, '士大夫似的我师傅色粉是否撒地方撒地方收到', '2018-01-03 17:27:36', 103, 30, NULL);

-- ----------------------------
-- Table structure for t_change_room_history
-- ----------------------------
DROP TABLE IF EXISTS `t_change_room_history`;
CREATE TABLE `t_change_room_history`  (
  `id` bigint(20) NOT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `old_room` bigint(20) DEFAULT NULL,
  `new_room` bigint(20) DEFAULT NULL,
  `change_time` datetime DEFAULT NULL,
  `change_cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `person_id`(`person_id`) USING BTREE,
  INDEX `old_room`(`old_room`) USING BTREE,
  INDEX `new_room`(`new_room`) USING BTREE,
  CONSTRAINT `t_change_room_history_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_change_room_history_ibfk_2` FOREIGN KEY (`old_room`) REFERENCES `t_room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_change_room_history_ibfk_3` FOREIGN KEY (`new_room`) REFERENCES `t_room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_check_work
-- ----------------------------
DROP TABLE IF EXISTS `t_check_work`;
CREATE TABLE `t_check_work`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `face_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sign_date` datetime DEFAULT NULL,
  `sign_out_date` datetime DEFAULT NULL,
  `sing_out_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sing_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `work_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contact_people` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `police_station_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `police_station_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  `area_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK64jrnn1rs5l71j2fgrvs43nyh`(`area_id`) USING BTREE,
  CONSTRAINT `FK64jrnn1rs5l71j2fgrvs43nyh` FOREIGN KEY (`area_id`) REFERENCES `t_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_config
-- ----------------------------
DROP TABLE IF EXISTS `t_config`;
CREATE TABLE `t_config`  (
  `id` bigint(20) NOT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enable_http_callback` bit(1) DEFAULT b'0',
  `enable_mqtt` bit(1) DEFAULT b'0',
  `enable_websocket` bit(1) DEFAULT b'0',
  `http_callback_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `save_origin` bit(1) DEFAULT NULL,
  `storage_time` int(11) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `version` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_image` bigint(20) DEFAULT NULL,
  `login_logo` bigint(20) DEFAULT NULL,
  `logo` bigint(20) DEFAULT NULL,
  `enable_white_list_alarm` bit(1) DEFAULT b'0',
  `push_alarm_only` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhird7l5thda9h5v7csowdcljp`(`login_image`) USING BTREE,
  INDEX `FKpdexxa6ohq3rj5d31qn1ciang`(`login_logo`) USING BTREE,
  INDEX `FKt8o1djw6c2xf1ma1e9ixh8arb`(`logo`) USING BTREE,
  CONSTRAINT `FKhird7l5thda9h5v7csowdcljp` FOREIGN KEY (`login_image`) REFERENCES `t_ui` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpdexxa6ohq3rj5d31qn1ciang` FOREIGN KEY (`login_logo`) REFERENCES `t_ui` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt8o1djw6c2xf1ma1e9ixh8arb` FOREIGN KEY (`logo`) REFERENCES `t_ui` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_config_ibfk_1` FOREIGN KEY (`login_image`) REFERENCES `t_ui` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_config_ibfk_2` FOREIGN KEY (`login_logo`) REFERENCES `t_ui` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_config_ibfk_3` FOREIGN KEY (`logo`) REFERENCES `t_ui` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_config
-- ----------------------------
INSERT INTO `t_config` VALUES (1, '', b'0', b'0', b'0', '', b'1', 60, '人脸轨迹分析系统,人脸轨迹分析系统,人脸轨迹分析系统,人脸轨迹分析系统', 'V1.4.6_r8133', 6, 7, 5, b'0', b'0');

-- ----------------------------
-- Table structure for t_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `t_dictionary`;
CREATE TABLE `t_dictionary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_dictionary
-- ----------------------------
INSERT INTO `t_dictionary` VALUES (116, 10, '男', 'gender', NULL, '1');
INSERT INTO `t_dictionary` VALUES (117, 10, '女', 'gender', NULL, '0');
INSERT INTO `t_dictionary` VALUES (122, 10, '汉族', 'nation', NULL, 'hanzu');
INSERT INTO `t_dictionary` VALUES (123, 10, '满族', 'nation', NULL, 'manzu');
INSERT INTO `t_dictionary` VALUES (124, 10, '党员', 'political_face', NULL, 'dangyuan');
INSERT INTO `t_dictionary` VALUES (125, 10, '团员', 'political_face', NULL, 'tuanyuan');
INSERT INTO `t_dictionary` VALUES (126, 10, '省级干部', 'level', NULL, 'shengji');
INSERT INTO `t_dictionary` VALUES (127, 10, '市级干部', 'level', NULL, 'shiji');
INSERT INTO `t_dictionary` VALUES (128, 10, '厅局级干部', 'level', NULL, 'tingjuji');
INSERT INTO `t_dictionary` VALUES (129, 10, '贪污', 'reportingMatter', NULL, 'tanwu');
INSERT INTO `t_dictionary` VALUES (130, 10, '受贿', 'reportingMatter', NULL, 'shouhui');
INSERT INTO `t_dictionary` VALUES (131, 10, '腐败问题', 'matterCategory', NULL, 'fubaiwenti');
INSERT INTO `t_dictionary` VALUES (132, 10, '贪污问题', 'matterCategory', NULL, 'tanwuwenti');
INSERT INTO `t_dictionary` VALUES (133, 10, '不做为', 'matterDetailed', NULL, 'buzuowei');
INSERT INTO `t_dictionary` VALUES (134, 10, '乱做为', 'matterDetailed', NULL, 'luanzuowei');
INSERT INTO `t_dictionary` VALUES (135, 10, '研究生学历', 'education', NULL, 'yjs');
INSERT INTO `t_dictionary` VALUES (136, 10, '大学本科学历', 'education', NULL, 'dxbk');
INSERT INTO `t_dictionary` VALUES (137, 10, '高中学历', 'education', NULL, 'gzxl');
INSERT INTO `t_dictionary` VALUES (138, 10, '普通来访', 'matterProperty', NULL, 'ptlf');
INSERT INTO `t_dictionary` VALUES (139, 10, '普通公民', 'informantGrade', NULL, 'ptgm');
INSERT INTO `t_dictionary` VALUES (140, 10, '政府在职人员', 'informantGrade', NULL, 'zfzzry');
INSERT INTO `t_dictionary` VALUES (141, 10, '口头交办', 'superior_assign_modality', '交办形式', 'ktjb');
INSERT INTO `t_dictionary` VALUES (142, 10, '电话交办', 'superior_assign_modality', '交办形式', 'dhjb');
INSERT INTO `t_dictionary` VALUES (143, 10, '专题布置', 'superior_assign_modality', '交办形式', 'ztbz');
INSERT INTO `t_dictionary` VALUES (144, 10, '会议安排', 'superior_assign_modality', '交办形式', 'hyap');
INSERT INTO `t_dictionary` VALUES (145, 10, '文件通知', 'superior_assign_modality', '交办形式', 'wjtz');
INSERT INTO `t_dictionary` VALUES (146, 10, '网上交办', 'superior_assign_modality', '交办形式', 'wsjb');
INSERT INTO `t_dictionary` VALUES (147, 10, '普通来访1', 'matterProperty', NULL, 'ptlf1');
INSERT INTO `t_dictionary` VALUES (148, 10, '普通来访2', 'matterProperty', NULL, 'ptlf2');

-- ----------------------------
-- Table structure for t_distribution
-- ----------------------------
DROP TABLE IF EXISTS `t_distribution`;
CREATE TABLE `t_distribution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `arraignment1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `arraignment2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dregion` int(11) DEFAULT NULL,
  `dtime` datetime DEFAULT NULL,
  `dtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dwatch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `intodate` datetime DEFAULT NULL,
  `outdate` datetime DEFAULT NULL,
  `outstate` int(11) DEFAULT NULL,
  `purpose` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `suspect_id` int(11) DEFAULT NULL,
  `dfunctional` int(11) DEFAULT NULL,
  `dfunctionalname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `suspectId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK7CE7146F63A00037`(`room_id`) USING BTREE,
  INDEX `FK7CE7146FA8FCFBE0`(`suspect_id`) USING BTREE,
  CONSTRAINT `FK7CE7146F63A00037` FOREIGN KEY (`room_id`) REFERENCES `t_functionalroom` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_distribution
-- ----------------------------
INSERT INTO `t_distribution` VALUES (4, '豆腐干士大夫阿斯蒂芬撒犯得上地方士大夫撒地方撒地方', NULL, NULL, 4, '2017-12-26 16:27:48', '0', '2', NULL, NULL, 0, NULL, 3, 16, NULL, NULL, NULL);
INSERT INTO `t_distribution` VALUES (5, NULL, '2', '2', 4, '2017-12-27 09:27:39', '1', '2', NULL, NULL, 0, '风格恢复恢复回家复合弓', 5, 16, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_face
-- ----------------------------
DROP TABLE IF EXISTS `t_face`;
CREATE TABLE `t_face`  (
  `id` bigint(20) NOT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_facedb
-- ----------------------------
DROP TABLE IF EXISTS `t_facedb`;
CREATE TABLE `t_facedb`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_public` bit(1) DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  `icon_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK670C11C6BA55488A`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10209 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_facedb
-- ----------------------------
INSERT INTO `t_facedb` VALUES (10207, '2018-01-15 14:50:38', NULL, '民警库', b'1', '民警库', 10, 109, 1, NULL, NULL);
INSERT INTO `t_facedb` VALUES (10208, '2018-01-15 14:50:59', NULL, '涉案人员、嫌疑人', b'1', '涉案人员', 10, 109, 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_feature
-- ----------------------------
DROP TABLE IF EXISTS `t_feature`;
CREATE TABLE `t_feature`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `db_id` bigint(20) NOT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  `person_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKfl85qgnl1t69y31s069qjj4mj`(`person_id`) USING BTREE,
  CONSTRAINT `FKfl85qgnl1t69y31s069qjj4mj` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_fun_modular
-- ----------------------------
DROP TABLE IF EXISTS `t_fun_modular`;
CREATE TABLE `t_fun_modular`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `module_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `permissions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK721BBCFF7A389468`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_fun_modular
-- ----------------------------
INSERT INTO `t_fun_modular` VALUES (1, 'top_nav_02', 'petitionRegister', '信访登记', '/cm_petition_manage', 'ALL', 1, NULL);
INSERT INTO `t_fun_modular` VALUES (2, 'top_nav_03', 'petitionHandle', '信访处理', '/cm_petition_handle', 'ALL', 2, NULL);
INSERT INTO `t_fun_modular` VALUES (3, 'top_nav_04', 'petitionQuery', '信访查询', '/cm_petition_query', 'ALL', 3, NULL);
INSERT INTO `t_fun_modular` VALUES (4, 'top_nav_05', 'statisticalReport', '统计报表', '/cm_statistical_report', 'ALL', 4, NULL);
INSERT INTO `t_fun_modular` VALUES (5, 'top_nav_06', 'taskManagement', '任务管理', '/cm_task_management', 'ALL', 5, NULL);
INSERT INTO `t_fun_modular` VALUES (6, 'top_nav_07', 'systemSetup', '系统设置', '/cm_system_setup', 'ALL', 6, NULL);
INSERT INTO `t_fun_modular` VALUES (7, NULL, 'visitingRegistration', '来访登记', '/cm_visitingRegistration_list', NULL, 1, 1);
INSERT INTO `t_fun_modular` VALUES (8, NULL, 'incomingLetter', '来信登记', '/cm_incomingLetter_list', NULL, 2, 1);
INSERT INTO `t_fun_modular` VALUES (9, NULL, 'superiorAssign', '上级交办', '/cm_superior_assign_list', NULL, 3, 1);
INSERT INTO `t_fun_modular` VALUES (10, NULL, 'onlinePetition', '网上信访', '/cm_online_petition_list', NULL, 4, 1);
INSERT INTO `t_fun_modular` VALUES (11, NULL, 'caseAssociation', '案件关联', '/cm_case_association', NULL, 1, 2);
INSERT INTO `t_fun_modular` VALUES (12, NULL, 'shuntManagement', '分流管理', '/cm_shunt_management_list', NULL, 2, 2);
INSERT INTO `t_fun_modular` VALUES (13, NULL, 'eventHandling', '事件处理', '/cm_event_handling_list', NULL, 3, 2);
INSERT INTO `t_fun_modular` VALUES (14, NULL, 'petitionhandle', '办结存档', '/cm_petitionhandle_filelist', NULL, 4, 2);
INSERT INTO `t_fun_modular` VALUES (15, NULL, 'xfQuery', '信访查询', '/cm_xf_list', NULL, 1, 3);
INSERT INTO `t_fun_modular` VALUES (16, NULL, 'reportYear', '年度统计', '/cm_report_year', NULL, 1, 4);
INSERT INTO `t_fun_modular` VALUES (17, NULL, 'reportCompany', '处理单位统计', '/cm_report_company', NULL, 2, 4);
INSERT INTO `t_fun_modular` VALUES (18, NULL, 'reportProcesstime', '处理时间统计', '/cm_report_processtime', NULL, 3, 4);
INSERT INTO `t_fun_modular` VALUES (19, NULL, 'reportComprehensive', '综合统计', '/cm_report_comprehensive', NULL, 4, 4);
INSERT INTO `t_fun_modular` VALUES (20, NULL, 'taskListRemind', '任务提醒', '/cm_task_listRemind', NULL, 1, 5);
INSERT INTO `t_fun_modular` VALUES (21, NULL, 'taskList', '任务管理', '/cm_task_list', NULL, 2, 5);
INSERT INTO `t_fun_modular` VALUES (22, NULL, 'userList', '用户管理', '/cm_user_list', NULL, 1, 6);
INSERT INTO `t_fun_modular` VALUES (23, NULL, 'organizationList', '部门管理', '/cm_organization_list', NULL, 2, 6);
INSERT INTO `t_fun_modular` VALUES (24, NULL, 'roleList', '角色权限管理', '/cm_role_list', NULL, 3, 6);
INSERT INTO `t_fun_modular` VALUES (25, NULL, 'workflow', '工作流管理', '/cm_workflow_list', NULL, 4, 6);
INSERT INTO `t_fun_modular` VALUES (26, NULL, 'dictionaryList', '字典管理', '/cm_dictionary_list', NULL, 5, 6);
INSERT INTO `t_fun_modular` VALUES (27, NULL, 'helpList', '帮助中心管理', '/cm_help_list', NULL, 6, 6);
INSERT INTO `t_fun_modular` VALUES (28, NULL, 'operationLogList', '日志管理', '/cm_operationLog_list', NULL, 7, 6);
INSERT INTO `t_fun_modular` VALUES (29, NULL, 'editPassWord', '修改密码', '/cm_user_editPassWord', NULL, 8, 6);
INSERT INTO `t_fun_modular` VALUES (30, NULL, 'resetPassWord', '重置密码', '/cm_user_resetPassWord', NULL, 9, 6);

-- ----------------------------
-- Table structure for t_functional
-- ----------------------------
DROP TABLE IF EXISTS `t_functional`;
CREATE TABLE `t_functional`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endtime` datetime DEFAULT NULL,
  `personnelNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `region` int(11) DEFAULT NULL,
  `roomNumber` int(11) DEFAULT NULL,
  `startime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_functionalregion
-- ----------------------------
DROP TABLE IF EXISTS `t_functionalregion`;
CREATE TABLE `t_functionalregion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDel` int(11) DEFAULT NULL,
  `qdescribes` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qhead` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qnumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qregion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_functionalregion
-- ----------------------------
INSERT INTO `t_functionalregion` VALUES (4, 0, '墙角', '张永生', '一区', '10001', '墙角');
INSERT INTO `t_functionalregion` VALUES (5, 0, '墙角1', '樊志鑫', '二区', '10002', '墙角');

-- ----------------------------
-- Table structure for t_functionalroom
-- ----------------------------
DROP TABLE IF EXISTS `t_functionalroom`;
CREATE TABLE `t_functionalroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isDel` int(11) DEFAULT NULL,
  `rcapacity` int(11) DEFAULT NULL,
  `rcategory` int(11) DEFAULT NULL,
  `rcategorycn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rdescribes` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `risgreet` int(11) DEFAULT NULL,
  `rname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rnumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rposition` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rregion` int(11) DEFAULT NULL,
  `rstate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_functionalroom
-- ----------------------------
INSERT INTO `t_functionalroom` VALUES (1, 0, 3, 0, NULL, '走廊第一间', '0:0:0:0:0:0:0:1', 1, '功能室一', '10001', '走廊第一间', 4, 1);
INSERT INTO `t_functionalroom` VALUES (2, 0, 3, 0, NULL, '走廊第二间', '0:0:0:0:0:0:0:1', 0, '侯问室一', '10002', '走廊第二间', 4, 1);
INSERT INTO `t_functionalroom` VALUES (3, 0, 3, 0, NULL, '走廊第三间', '0:0:0:0:0:0:0:1', 0, '侯问室二', '10003', '走廊第三间', 4, 1);
INSERT INTO `t_functionalroom` VALUES (4, 0, 3, 0, NULL, '走廊第三间', '0:0:0:0:0:0:0:1', 1, '功能室二', '10004', '走廊第三间', 4, 1);
INSERT INTO `t_functionalroom` VALUES (5, 0, 3, 0, NULL, '走廊第五间', '0:0:0:0:0:0:0:1', 1, '功能室三', '10005', '走廊第五间', 4, 1);
INSERT INTO `t_functionalroom` VALUES (6, 0, 3, 0, NULL, '走廊第五间', '0:0:0:0:0:0:0:1', 0, '侯问室三', '10006', '走廊第五间', 4, 1);

-- ----------------------------
-- Table structure for t_help
-- ----------------------------
DROP TABLE IF EXISTS `t_help`;
CREATE TABLE `t_help`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标题',
  `detail` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详细能容',
  `cuserid` int(10) DEFAULT NULL COMMENT '创建人ID',
  `cusername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建用户名',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `type1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '筛选类型',
  `type2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `readcount` int(10) DEFAULT NULL COMMENT '阅读量，排行用',
  `edituserid` int(10) DEFAULT NULL COMMENT '修改人id',
  `editusername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `edittime` datetime DEFAULT NULL COMMENT '修改时间',
  `spare1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
  `spare2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备用字段',
  `123123` float DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_help
-- ----------------------------
INSERT INTO `t_help` VALUES (1, 'adsf', '123123', 1, 'admin', '2018-01-31 09:17:47', '4', '6', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_help` VALUES (2, '123123', '123123123123123', 1, 'admin', '2018-01-31 10:04:49', '4', '7', '8', NULL, NULL, NULL, 1, 'admin', '2018-01-31 18:22:03', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_helptype
-- ----------------------------
DROP TABLE IF EXISTS `t_helptype`;
CREATE TABLE `t_helptype`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fid` int(10) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `data2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_helptype
-- ----------------------------
INSERT INTO `t_helptype` VALUES (1, NULL, '父类1', 'test1', NULL);
INSERT INTO `t_helptype` VALUES (2, NULL, '父类2', 'test2', NULL);
INSERT INTO `t_helptype` VALUES (3, NULL, '父类3', 'test3', NULL);
INSERT INTO `t_helptype` VALUES (4, 1, '子类1', NULL, NULL);
INSERT INTO `t_helptype` VALUES (5, 1, '子类1', NULL, NULL);
INSERT INTO `t_helptype` VALUES (6, 2, '子类2', NULL, NULL);
INSERT INTO `t_helptype` VALUES (7, 2, '子类2', NULL, NULL);
INSERT INTO `t_helptype` VALUES (8, 3, '子类3', NULL, NULL);

-- ----------------------------
-- Table structure for t_match_result
-- ----------------------------
DROP TABLE IF EXISTS `t_match_result`;
CREATE TABLE `t_match_result`  (
  `id` bigint(20) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `db_id` bigint(20) DEFAULT NULL,
  `db_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  `person_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `similarity` double DEFAULT NULL,
  `alarm_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpbmlse43d1y05jl4dcrluthp6`(`alarm_id`) USING BTREE,
  CONSTRAINT `FKpbmlse43d1y05jl4dcrluthp6` FOREIGN KEY (`alarm_id`) REFERENCES `t_alarm` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_modular
-- ----------------------------
DROP TABLE IF EXISTS `t_modular`;
CREATE TABLE `t_modular`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Modulecode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Modulename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Moduleurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `permissions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `Imageurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_modular
-- ----------------------------
INSERT INTO `t_modular` VALUES (1, 'appointment', '预约管理', NULL, 0, 'ALL', 1, '/static/images/index-logo_03.png');
INSERT INTO `t_modular` VALUES (2, 'access', '出入区管理', NULL, 0, 'ALL', 2, '/static/images/index-logo_05.png');
INSERT INTO `t_modular` VALUES (3, 'examination', '人身检查管理', NULL, 0, 'ALL', 3, '/static/images/index-logo_07.png');
INSERT INTO `t_modular` VALUES (4, 'goods', '物品处置管理', NULL, 0, 'ALL', 4, '/static/images/index-logo_09.png');
INSERT INTO `t_modular` VALUES (5, 'distribution', '侯问分配管理', NULL, 0, 'ALL', 5, '/static/images/index-logo_11.png');
INSERT INTO `t_modular` VALUES (6, 'Interrogation', '询问讯问管理', NULL, 0, 'ALL', 6, '/static/images/index-logo_18.png');
INSERT INTO `t_modular` VALUES (7, 'caseHandling', '案件办理', NULL, 0, 'ALL', 7, '/static/images/index-logo_19.png');
INSERT INTO `t_modular` VALUES (8, 'integrated', '综合管理', NULL, 0, 'ALL', 8, '/static/images/index-logo_20.png');
INSERT INTO `t_modular` VALUES (9, 'fight', '合成作战', NULL, 0, 'ALL', 9, '/static/images/index-logo_21.png');
INSERT INTO `t_modular` VALUES (10, 'system', '系统管理', '/cm_user_list', 0, 'ALL', 10, '/static/images/index-logo_22.png');
INSERT INTO `t_modular` VALUES (11, 'user', '用户设置', '/cm_user_list', 10, 'ALL', 1, NULL);
INSERT INTO `t_modular` VALUES (12, 'room', '功能室管理', NULL, 10, 'ALL', 2, NULL);
INSERT INTO `t_modular` VALUES (13, 'camera', '摄像头管理', NULL, 10, 'ALL', 3, NULL);
INSERT INTO `t_modular` VALUES (14, 'portrait', '人像管理', NULL, 10, 'ALL', 4, NULL);
INSERT INTO `t_modular` VALUES (15, 'region', '区域预警规则', NULL, 10, 'ALL', 5, NULL);
INSERT INTO `t_modular` VALUES (16, 'searchHistory', '搜索历史', NULL, 10, 'ALL', 6, NULL);
INSERT INTO `t_modular` VALUES (17, 'manualPositioning', '手动定位', NULL, 10, 'ALL', 7, NULL);
INSERT INTO `t_modular` VALUES (18, 'systemSetup', '系统设置', NULL, 10, 'ALL', 8, NULL);
INSERT INTO `t_modular` VALUES (19, 'userList', '用户管理', '/cm_user_list', 11, 'ALL', 1, NULL);
INSERT INTO `t_modular` VALUES (20, 'userCompany', '机构管理', NULL, 11, 'ALL', 2, NULL);
INSERT INTO `t_modular` VALUES (21, 'userRole', '角色管理', '/cm_role_list', 11, 'ALL', 3, NULL);
INSERT INTO `t_modular` VALUES (22, 'userLog', '日志管理', NULL, 11, 'ALL', 4, NULL);

-- ----------------------------
-- Table structure for t_operationlog
-- ----------------------------
DROP TABLE IF EXISTS `t_operationlog`;
CREATE TABLE `t_operationlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `classification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ModifyTime` datetime DEFAULT NULL,
  `modular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `submodule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `describes` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKCAC7CE48DAD6B614`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 321 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_operationlog
-- ----------------------------
INSERT INTO `t_operationlog` VALUES (227, '新增用户', '错误日志', '0:0:0:0:0:0:0:1', '2018-01-27 11:42:36', '', '', 'username=yhm;错误:org.hibernate.exception.GenericJDBCException: Incorrect integer value: \'è�Œä½�\' for column \'position\' at row 1', 1);
INSERT INTO `t_operationlog` VALUES (228, '新增用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-27 11:46:25', '', '', 'id=10026;username=yhm', NULL);
INSERT INTO `t_operationlog` VALUES (229, '修改用户', '错误日志', '0:0:0:0:0:0:0:1', '2018-01-29 13:35:43', '', '', 'id=10026;username=null;错误:org.springframework.dao.DataIntegrityViolationException: Column \'username\' cannot be null; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: Column \'username\' cannot be null', 1);
INSERT INTO `t_operationlog` VALUES (230, '修改用户', '错误日志', '0:0:0:0:0:0:0:1', '2018-01-29 13:37:25', '', '', 'id=10026;username=null;错误:org.springframework.dao.DataIntegrityViolationException: Column \'username\' cannot be null; SQL [n/a]; constraint [null]; nested exception is org.hibernate.exception.ConstraintViolationException: Column \'username\' cannot be null', 1);
INSERT INTO `t_operationlog` VALUES (231, '修改用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-29 13:42:26', '', '', 'id=10026;username=yhm', 1);
INSERT INTO `t_operationlog` VALUES (232, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-29 13:43:31', '', '', 'id=2;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (233, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 14:56:16', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (234, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 14:56:22', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (235, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 14:56:22', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (236, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 14:56:22', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (237, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 14:57:37', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (238, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 14:59:31', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (239, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 15:01:49', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (240, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 15:03:17', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (241, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 15:03:49', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (242, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 15:08:09', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (243, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 15:08:40', '', '', 'id=100058;name=12345修改成功', 1);
INSERT INTO `t_operationlog` VALUES (244, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 15:08:51', '', '', 'id=100058;name=123456修改成功', 1);
INSERT INTO `t_operationlog` VALUES (245, '新增机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-30 15:13:44', '', '', 'id=100059;name=测试增加成功', 1);
INSERT INTO `t_operationlog` VALUES (246, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 10:49:04', '', '', 'id=100059;name=测试修改成功', NULL);
INSERT INTO `t_operationlog` VALUES (247, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 10:49:14', '', '', 'id=100059;name=测试2222修改成功', NULL);
INSERT INTO `t_operationlog` VALUES (248, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 10:56:15', '', '', 'id=100059;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (249, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 10:56:39', '', '', 'id=100058;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (250, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 10:56:43', '', '', 'id=100054;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (251, '新增机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:01:50', '', '', 'id=100060;name=下属增加成功', 1);
INSERT INTO `t_operationlog` VALUES (252, '新增机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:02:09', '', '', 'id=100061;name=下属2增加成功', 1);
INSERT INTO `t_operationlog` VALUES (253, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:02:15', '', '', 'id=100060;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (254, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:02:18', '', '', 'id=100061;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (255, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:02:21', '', '', 'id=100057;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (256, '新增机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:02:59', '', '', 'id=100062;name=下属2增加成功', 1);
INSERT INTO `t_operationlog` VALUES (257, '删除用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:03:22', '', '', 'id=100062;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (258, '修改机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:04:37', '', '', 'id=100056;name=程序部修改成功', 1);
INSERT INTO `t_operationlog` VALUES (259, '新增机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:05:01', '', '', 'id=100063;name=设计部增加成功', 1);
INSERT INTO `t_operationlog` VALUES (260, '新增机构', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:05:23', '', '', 'id=100064;name=测试部增加成功', 1);
INSERT INTO `t_operationlog` VALUES (261, '修改用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:43:50', '', '', 'id=1;username=admin', 1);
INSERT INTO `t_operationlog` VALUES (262, '修改用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-01-31 11:44:29', '', '', 'id=1;username=admin', 1);
INSERT INTO `t_operationlog` VALUES (263, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 10:35:21', '', '', 'id=1;name=null', 1);
INSERT INTO `t_operationlog` VALUES (264, '新增用户', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 10:46:21', '', '', 'id=10027;username=admin1', 1);
INSERT INTO `t_operationlog` VALUES (265, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:20:34', '', '', 'id=2;name=null', 1);
INSERT INTO `t_operationlog` VALUES (266, '删除任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:21:58', '', '', 'id=2;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (267, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:39:07', '', '', 'id=3;name=null', 1);
INSERT INTO `t_operationlog` VALUES (268, '删除任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:40:34', '', '', 'id=3;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (269, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:44:03', '', '', 'id=4;name=null', 1);
INSERT INTO `t_operationlog` VALUES (270, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:44:25', '', '', 'id=5;name=null', 1);
INSERT INTO `t_operationlog` VALUES (271, '删除任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:44:32', '', '', 'id=5;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (272, '删除任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:44:34', '', '', 'id=4;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (273, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:46:23', '', '', 'id=6;name=null', 1);
INSERT INTO `t_operationlog` VALUES (274, '删除任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:52:30', '', '', 'id=6;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (275, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 11:52:54', '', '', 'id=7;name=任务一', 1);
INSERT INTO `t_operationlog` VALUES (276, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 14:06:37', '', '', 'id=8;name=任务二', 1);
INSERT INTO `t_operationlog` VALUES (277, '修改任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-05 14:06:52', '', '', 'id=8;username=任务二', 1);
INSERT INTO `t_operationlog` VALUES (278, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-06 08:51:37', '', '', 'id=11;name=dfsd', 1);
INSERT INTO `t_operationlog` VALUES (279, '修改任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-06 08:51:45', '', '', 'id=9;username=任务三', 1);
INSERT INTO `t_operationlog` VALUES (280, '删除任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-06 08:51:56', '', '', 'id=9;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (281, '修改任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-06 08:52:09', '', '', 'id=11;username=dfsd', 1);
INSERT INTO `t_operationlog` VALUES (282, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-02-28 17:02:35', '', '', 'id=12;name=admin1的今日工作', 10027);
INSERT INTO `t_operationlog` VALUES (283, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-09 11:12:23', '', '', 'id=1;RoleName=超级管理员', 1);
INSERT INTO `t_operationlog` VALUES (284, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-09 11:18:05', '', '', 'id=1;RoleName=超级管理员', 1);
INSERT INTO `t_operationlog` VALUES (285, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-09 14:13:01', '', '', 'id=1;RoleName=超级管理员', 1);
INSERT INTO `t_operationlog` VALUES (286, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-09 14:13:28', '', '', 'id=2;RoleName=录入人员', 1);
INSERT INTO `t_operationlog` VALUES (287, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-09 15:30:01', '', '', 'id=1;RoleName=超级管理员', 1);
INSERT INTO `t_operationlog` VALUES (288, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-09 15:38:30', '', '', 'id=1;RoleName=超级管理员', 1);
INSERT INTO `t_operationlog` VALUES (289, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-09 16:31:15', '', '', 'id=1;RoleName=超级管理员', 1);
INSERT INTO `t_operationlog` VALUES (290, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-10 08:37:31', '', '', 'id=13;name=55', 1);
INSERT INTO `t_operationlog` VALUES (291, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-10 08:37:36', '', '', 'id=14;name=55', 1);
INSERT INTO `t_operationlog` VALUES (292, '修改任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-10 08:38:59', '', '', 'id=14;username=55', 1);
INSERT INTO `t_operationlog` VALUES (293, '修改角色', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-14 09:22:26', '', '', 'id=1;RoleName=超级管理员', 1);
INSERT INTO `t_operationlog` VALUES (294, '来访登记状态变更', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-14 16:38:05', '', '', 'id=100 状态变更为:2', 1);
INSERT INTO `t_operationlog` VALUES (295, '新增来信登记', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 09:22:42', '', '', 'id=139 增加成功', 1);
INSERT INTO `t_operationlog` VALUES (296, '来信登记状态变更', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 09:24:41', '', '', 'id=139 状态变更为:2', 1);
INSERT INTO `t_operationlog` VALUES (297, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 16:18:03', '', '', 'id=15;name=dfs', 1);
INSERT INTO `t_operationlog` VALUES (298, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 16:20:05', '', '', 'id=16;name=手动阀手动阀', 1);
INSERT INTO `t_operationlog` VALUES (299, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 16:29:09', '', '', 'id=17;name=风格豆腐干豆腐干', 1);
INSERT INTO `t_operationlog` VALUES (300, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 16:29:17', '', '', 'id=18;name=为人体微软微软为', 1);
INSERT INTO `t_operationlog` VALUES (301, '新增任务', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 16:29:28', '', '', 'id=19;name=让他格瑞特热特瑞特儿童儿童额', 1);
INSERT INTO `t_operationlog` VALUES (302, '重置密码', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 16:46:11', '', '', 'id=10027;username=admin1', 1);
INSERT INTO `t_operationlog` VALUES (303, '重置密码', '操作日志', '0:0:0:0:0:0:0:1', '2018-03-19 16:46:57', '', '', 'id=10027;username=admin1', 1);
INSERT INTO `t_operationlog` VALUES (304, '来访登记状态变更', '操作日志', '127.0.0.1', '2018-04-21 10:55:17', '', '', 'id=113 状态变更为:2', 1);
INSERT INTO `t_operationlog` VALUES (305, '修改任务', '操作日志', '127.0.0.1', '2018-04-21 11:02:47', '', '', 'id=16;username=手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手手动阀手动阀动阀手动阀手动阀手动阀手动阀手动阀', 1);
INSERT INTO `t_operationlog` VALUES (306, '新增机构', '操作日志', '127.0.0.1', '2018-04-21 11:11:56', '', '', 'id=100065;name=123增加成功', 1);
INSERT INTO `t_operationlog` VALUES (307, '删除用户', '操作日志', '127.0.0.1', '2018-04-21 11:12:16', '', '', 'id=100065;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (308, '新增来访登记', '操作日志', '127.0.0.1', '2018-04-23 08:39:53', '', '', 'id=142 增加成功', 1);
INSERT INTO `t_operationlog` VALUES (309, '来访登记修改', '操作日志', '127.0.0.1', '2018-04-23 08:43:22', '', '', 'id=142 修改成功', 1);
INSERT INTO `t_operationlog` VALUES (310, '来访登记修改', '操作日志', '127.0.0.1', '2018-04-23 08:45:51', '', '', 'id=142 修改成功', 1);
INSERT INTO `t_operationlog` VALUES (311, '来访登记修改', '操作日志', '127.0.0.1', '2018-04-23 08:46:10', '', '', 'id=142 修改成功', 1);
INSERT INTO `t_operationlog` VALUES (312, '来访登记状态变更', '操作日志', '127.0.0.1', '2018-04-23 08:46:23', '', '', 'id=142 状态变更为:2', 1);
INSERT INTO `t_operationlog` VALUES (313, '新增机构', '操作日志', '127.0.0.1', '2018-04-23 11:54:34', '', '', 'id=100066;name=123增加成功', 1);
INSERT INTO `t_operationlog` VALUES (314, '删除用户', '操作日志', '127.0.0.1', '2018-04-23 11:54:59', '', '', 'id=100066;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (315, '新增机构', '操作日志', '127.0.0.1', '2018-04-23 11:55:30', '', '', 'id=100067;name=123增加成功', 1);
INSERT INTO `t_operationlog` VALUES (316, '新增机构', '操作日志', '127.0.0.1', '2018-04-23 11:55:51', '', '', 'id=100068;name=453增加成功', 1);
INSERT INTO `t_operationlog` VALUES (317, '新增任务', '操作日志', '127.0.0.1', '2018-04-23 15:14:37', '', '', 'id=20;name=东方闪电', 1);
INSERT INTO `t_operationlog` VALUES (318, '删除任务', '操作日志', '127.0.0.1', '2018-04-23 15:14:49', '', '', 'id=20;删除成功', 1);
INSERT INTO `t_operationlog` VALUES (319, '新增角色', '操作日志', '127.0.0.1', '2018-04-23 15:31:03', '', '', 'id=3;RoleName=否', 1);
INSERT INTO `t_operationlog` VALUES (320, '删除角色', '操作日志', '127.0.0.1', '2018-04-23 15:31:13', '', '', 'id=3;删除成功', 1);

-- ----------------------------
-- Table structure for t_oplog
-- ----------------------------
DROP TABLE IF EXISTS `t_oplog`;
CREATE TABLE `t_oplog`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_oplog
-- ----------------------------
INSERT INTO `t_oplog` VALUES (1, NULL, 'update_person', 100739);
INSERT INTO `t_oplog` VALUES (2, NULL, 'update_person', 100741);
INSERT INTO `t_oplog` VALUES (3, NULL, 'update_person', 100742);
INSERT INTO `t_oplog` VALUES (4, NULL, 'update_person', 100742);
INSERT INTO `t_oplog` VALUES (5, NULL, 'update_person', 100739);
INSERT INTO `t_oplog` VALUES (6, NULL, 'update_person', 100739);
INSERT INTO `t_oplog` VALUES (7, NULL, 'update_person', 100742);
INSERT INTO `t_oplog` VALUES (8, NULL, 'update_person', 100742);
INSERT INTO `t_oplog` VALUES (9, NULL, 'update_person', 100742);
INSERT INTO `t_oplog` VALUES (10, NULL, 'update_person', 100739);
INSERT INTO `t_oplog` VALUES (11, NULL, 'update_person', 100739);
INSERT INTO `t_oplog` VALUES (12, NULL, 'update_person', 100739);
INSERT INTO `t_oplog` VALUES (13, NULL, 'del_person', 100740);
INSERT INTO `t_oplog` VALUES (14, NULL, 'del_person', 100740);
INSERT INTO `t_oplog` VALUES (15, NULL, 'del_person', 100741);
INSERT INTO `t_oplog` VALUES (16, NULL, 'del_person', 100742);
INSERT INTO `t_oplog` VALUES (17, NULL, 'del_person', 100740);
INSERT INTO `t_oplog` VALUES (18, NULL, 'del_person', 100741);
INSERT INTO `t_oplog` VALUES (19, NULL, 'del_person', 100742);
INSERT INTO `t_oplog` VALUES (20, NULL, 'del_person', 100740);
INSERT INTO `t_oplog` VALUES (21, NULL, 'del_person', 100741);
INSERT INTO `t_oplog` VALUES (22, NULL, 'del_person', 100742);
INSERT INTO `t_oplog` VALUES (23, NULL, 'del_person', 100740);
INSERT INTO `t_oplog` VALUES (24, NULL, 'del_person', 100741);
INSERT INTO `t_oplog` VALUES (25, NULL, 'del_person', 100742);
INSERT INTO `t_oplog` VALUES (26, NULL, 'update_person', 100744);
INSERT INTO `t_oplog` VALUES (27, NULL, 'update_person', 100748);
INSERT INTO `t_oplog` VALUES (28, NULL, 'update_person', 100746);
INSERT INTO `t_oplog` VALUES (29, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (30, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (31, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (32, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (33, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (34, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (35, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (36, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (37, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (38, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (39, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (40, NULL, 'update_person', 100749);
INSERT INTO `t_oplog` VALUES (41, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (42, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (43, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (44, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (45, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (46, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (47, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (48, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (49, NULL, 'update_person', 100755);
INSERT INTO `t_oplog` VALUES (50, NULL, 'update_person', 100755);
INSERT INTO `t_oplog` VALUES (51, NULL, 'update_person', 100755);
INSERT INTO `t_oplog` VALUES (52, NULL, 'update_person', 100758);
INSERT INTO `t_oplog` VALUES (53, NULL, 'update_person', 100758);
INSERT INTO `t_oplog` VALUES (54, NULL, 'update_person', 100758);
INSERT INTO `t_oplog` VALUES (55, NULL, 'update_person', 100759);
INSERT INTO `t_oplog` VALUES (56, NULL, 'update_person', 100762);
INSERT INTO `t_oplog` VALUES (57, NULL, 'update_person', 100762);
INSERT INTO `t_oplog` VALUES (58, NULL, 'update_person', 100762);
INSERT INTO `t_oplog` VALUES (59, NULL, 'update_person', 100762);
INSERT INTO `t_oplog` VALUES (60, NULL, 'update_person', 100762);
INSERT INTO `t_oplog` VALUES (61, NULL, 'update_person', 100762);
INSERT INTO `t_oplog` VALUES (62, NULL, 'update_person', 100762);
INSERT INTO `t_oplog` VALUES (63, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (64, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (65, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (66, NULL, 'update_person', 100754);
INSERT INTO `t_oplog` VALUES (67, NULL, 'update_person', 100765);
INSERT INTO `t_oplog` VALUES (68, NULL, 'update_person', 100765);
INSERT INTO `t_oplog` VALUES (69, NULL, 'update_person', 100802);
INSERT INTO `t_oplog` VALUES (70, NULL, 'update_person', 100802);
INSERT INTO `t_oplog` VALUES (71, NULL, 'update_person', 100802);
INSERT INTO `t_oplog` VALUES (72, NULL, 'update_person', 100802);
INSERT INTO `t_oplog` VALUES (73, NULL, 'update_person', 100803);
INSERT INTO `t_oplog` VALUES (74, NULL, 'update_person', 100767);
INSERT INTO `t_oplog` VALUES (75, NULL, 'update_person', 100810);
INSERT INTO `t_oplog` VALUES (76, NULL, 'update_person', 100816);
INSERT INTO `t_oplog` VALUES (77, NULL, 'update_person', 100890);
INSERT INTO `t_oplog` VALUES (78, NULL, 'update_person', 100809);
INSERT INTO `t_oplog` VALUES (79, NULL, 'update_person', 100893);
INSERT INTO `t_oplog` VALUES (80, NULL, 'update_person', 100901);
INSERT INTO `t_oplog` VALUES (81, NULL, 'update_person', 100052);
INSERT INTO `t_oplog` VALUES (82, NULL, 'update_person', 100052);
INSERT INTO `t_oplog` VALUES (83, NULL, 'update_person', 100901);
INSERT INTO `t_oplog` VALUES (84, NULL, 'update_person', 100952);
INSERT INTO `t_oplog` VALUES (85, NULL, 'update_person', 100746);

-- ----------------------------
-- Table structure for t_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ext` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `insystem` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKek1x02uw2s7yti5b17khbr418`(`parent_id`) USING BTREE,
  CONSTRAINT `t_organization_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `t_organization` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100069 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_organization
-- ----------------------------
INSERT INTO `t_organization` VALUES (100001, 1, '100001,', '000000000000', '', '', '', '机构单位', NULL, NULL, 1);
INSERT INTO `t_organization` VALUES (100056, 1, '100001,100056,', '000001', '13666666666', '程序部', '朱', '程序部', 100001, NULL, 1);
INSERT INTO `t_organization` VALUES (100063, 1, '100001,100063,', '000002', '1366666666', '设计部', '赵', '设计部', 100001, '2018-01-31 11:05:01', 1);
INSERT INTO `t_organization` VALUES (100064, 1, '100001,100064,', '000003', '13666666666', '测试部', '梁', '测试部', 100001, '2018-01-31 11:05:23', 1);
INSERT INTO `t_organization` VALUES (100067, 1, '100001,100056,100067,', '456', '453', '453', '453', '123', 100056, '2018-04-23 11:55:30', 1);
INSERT INTO `t_organization` VALUES (100068, 1, '100001,100056,100068,', '453', '453', '543', '453', '453', 100056, '2018-04-23 11:55:51', 0);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `scree_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (10001, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'BLACKLIST', NULL, 'FACEDB.READ', '查看人脸库', NULL, NULL);
INSERT INTO `t_permission` VALUES (10002, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'BLACKLIST', NULL, 'FACEDB.WRITE', '修改人脸库', NULL, NULL);
INSERT INTO `t_permission` VALUES (10003, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'ALARM', NULL, 'ALARM.READ', '查询告警和处警信息', NULL, NULL);
INSERT INTO `t_permission` VALUES (10004, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'ALARM', NULL, 'ALARM.WRITE', '编辑告警和处警信息', NULL, NULL);
INSERT INTO `t_permission` VALUES (10005, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'CONFIG', NULL, 'CONFIG.READ', '查看系统设置', NULL, NULL);
INSERT INTO `t_permission` VALUES (10006, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'CONFIG', NULL, 'CONFIG.WRITE', '修改系统设置', NULL, NULL);
INSERT INTO `t_permission` VALUES (10007, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'SECURITY', NULL, 'SECURITY.WRITE', '系统权限设置', NULL, NULL);
INSERT INTO `t_permission` VALUES (10008, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'SECURITY', NULL, 'SECURITY.READ', '系统权限读取', NULL, NULL);
INSERT INTO `t_permission` VALUES (10009, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'CAMERA', NULL, 'CAMERA.READ', '查看相机', NULL, NULL);
INSERT INTO `t_permission` VALUES (10010, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'CAMERA', NULL, 'CAMERA.WRITE', '相机设置', NULL, NULL);
INSERT INTO `t_permission` VALUES (10013, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'SURVEILLANCE', NULL, 'SURVEILLANCE.READ', '布控设置', NULL, NULL);
INSERT INTO `t_permission` VALUES (10014, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'SURVEILLANCE', NULL, 'SURVEILLANCE.WRITE', '查看布控', NULL, NULL);
INSERT INTO `t_permission` VALUES (10015, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'RULE', NULL, 'RULE.WRITE', '设置研判规则', NULL, NULL);
INSERT INTO `t_permission` VALUES (10016, '2017-04-28 13:45:30', '2017-04-28 13:45:30', 'RULE', NULL, 'RULE.READ', '查看研判规则和结果', NULL, NULL);

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `description` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  `face_id` bigint(20) DEFAULT NULL,
  `db_id` bigint(20) DEFAULT NULL,
  `db_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_card_type` int(11) DEFAULT NULL,
  `id_import` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `student_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_import` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `building_id` bigint(20) DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `suspect_id` int(11) DEFAULT NULL,
  `entrance_exit_user_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKre69lsuiqlxuclu2qiuygp2fx`(`face_id`) USING BTREE,
  INDEX `FKgni2e9j5y1mocpi5duoyipav1`(`db_id`) USING BTREE,
  INDEX `FK785BED806FA4AC11`(`gender`) USING BTREE,
  INDEX `FK785BED8035D9DC14`(`room_id`) USING BTREE,
  INDEX `FK785BED8070A3474`(`building_id`) USING BTREE,
  INDEX `FK785BED80A8FCFBE0`(`suspect_id`) USING BTREE,
  INDEX `FK785BED80DAD6B614`(`user_id`) USING BTREE,
  INDEX `FK785BED80EAEF4EF0`(`entrance_exit_user_id`) USING BTREE,
  CONSTRAINT `FK785BED8035D9DC14` FOREIGN KEY (`room_id`) REFERENCES `t_room` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK785BED8070A3474` FOREIGN KEY (`building_id`) REFERENCES `t_building` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKgni2e9j5y1mocpi5duoyipav1` FOREIGN KEY (`db_id`) REFERENCES `t_facedb` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKre69lsuiqlxuclu2qiuygp2fx` FOREIGN KEY (`face_id`) REFERENCES `t_face` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES (12, '2018-01-15 16:45:38', NULL, NULL, NULL, '啊啊啊', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516005877875.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516005877875.png');
INSERT INTO `t_person` VALUES (13, '2018-01-15 17:11:19', '2018-01-15 17:11:35', NULL, NULL, '啊啊', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516007485804.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516007485804.png');
INSERT INTO `t_person` VALUES (14, '2018-01-15 17:34:18', NULL, NULL, NULL, '12121', NULL, NULL, NULL, 10208, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_person` VALUES (15, '2018-01-19 15:53:00', NULL, NULL, NULL, '阿斯蒂芬', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516348347627.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516348347627.jpg');
INSERT INTO `t_person` VALUES (16, '2018-01-19 15:54:34', NULL, NULL, NULL, '阿斯蒂芬', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516348347627.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516348347627.jpg');
INSERT INTO `t_person` VALUES (17, '2018-01-19 15:55:56', NULL, NULL, NULL, '阿斯蒂芬', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516348347627.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516348347627.jpg');
INSERT INTO `t_person` VALUES (18, '2018-01-19 15:58:01', NULL, NULL, NULL, '阿斯蒂芬', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516348347627.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516348347627.jpg');
INSERT INTO `t_person` VALUES (19, '2018-01-19 15:58:39', NULL, NULL, NULL, '阿斯蒂芬', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516348347627.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516348347627.jpg');
INSERT INTO `t_person` VALUES (20, '2018-01-19 16:02:26', NULL, NULL, NULL, '阿斯蒂芬', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516348347627.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516348347627.jpg');
INSERT INTO `t_person` VALUES (21, '2018-01-19 16:06:05', NULL, NULL, NULL, '阿斯蒂芬', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516348347627.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516348347627.jpg');
INSERT INTO `t_person` VALUES (22, '2018-01-19 16:09:51', NULL, NULL, NULL, '123', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516349362774.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516349362774.jpg');
INSERT INTO `t_person` VALUES (23, '2018-01-19 16:25:55', NULL, NULL, NULL, '123', NULL, NULL, NULL, 10208, NULL, NULL, '/static/upload/portraitImages/1516350322228.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1516350322228.jpg');
INSERT INTO `t_person` VALUES (24, '2018-01-27 11:41:37', NULL, NULL, NULL, 'yhm', NULL, NULL, NULL, NULL, NULL, NULL, '/static/upload/portraitImages/1517024373773.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1517024373773.png');

-- ----------------------------
-- Table structure for t_person_status
-- ----------------------------
DROP TABLE IF EXISTS `t_person_status`;
CREATE TABLE `t_person_status`  (
  `id` bigint(20) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKm3duddf79wdp7vqmmkydwodjx`(`person_id`) USING BTREE,
  CONSTRAINT `FKm3duddf79wdp7vqmmkydwodjx` FOREIGN KEY (`person_id`) REFERENCES `t_person` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_personnelhandle
-- ----------------------------
DROP TABLE IF EXISTS `t_personnelhandle`;
CREATE TABLE `t_personnelhandle`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handleTime` datetime DEFAULT NULL,
  `subpoenasTime` datetime DEFAULT NULL,
  `result_id` int(11) DEFAULT NULL,
  `subpoenas_id` int(11) DEFAULT NULL,
  `suspect_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `suspect_id`(`suspect_id`) USING BTREE,
  INDEX `FK633E029D4DAA91CD`(`result_id`) USING BTREE,
  INDEX `FK633E029D48391D70`(`subpoenas_id`) USING BTREE,
  INDEX `FK633E029DA8FCFBE0`(`suspect_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource`  (
  `id` bigint(20) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKthdadj0kvn89oexxur6d6gyyq`(`parent_id`) USING BTREE,
  CONSTRAINT `FKthdadj0kvn89oexxur6d6gyyq` FOREIGN KEY (`parent_id`) REFERENCES `t_resource` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES (704, NULL, NULL, 'FACEDB.10152', '11', NULL);
INSERT INTO `t_resource` VALUES (705, NULL, NULL, 'FACEDB.10153', '11', NULL);
INSERT INTO `t_resource` VALUES (706, NULL, NULL, 'FACEDB.10154', '教师', NULL);
INSERT INTO `t_resource` VALUES (707, NULL, NULL, 'FACEDB.10155', '宿舍管理人员', NULL);
INSERT INTO `t_resource` VALUES (708, NULL, NULL, 'FACEDB.10156', '11', NULL);
INSERT INTO `t_resource` VALUES (709, NULL, NULL, 'FACEDB.10157', '宿管', NULL);
INSERT INTO `t_resource` VALUES (728, NULL, NULL, 'FACEDB.10158', '宿舍管理员', NULL);
INSERT INTO `t_resource` VALUES (731, NULL, NULL, 'FACEDB.10159', '宿舍管理人员', NULL);
INSERT INTO `t_resource` VALUES (736, NULL, NULL, 'FACEDB.10160', '宿舍管理人员', NULL);
INSERT INTO `t_resource` VALUES (770, NULL, NULL, 'FACEDB.10161', '31', NULL);
INSERT INTO `t_resource` VALUES (783, NULL, NULL, 'FACEDB.10202', '白名单测试', NULL);
INSERT INTO `t_resource` VALUES (784, NULL, NULL, 'FACEDB.10203', '白名单测试1', NULL);
INSERT INTO `t_resource` VALUES (785, NULL, NULL, 'FACEDB.10204', '测试', NULL);
INSERT INTO `t_resource` VALUES (795, NULL, NULL, 'FACEDB.10205', '灰名单敏感人员', NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `system_role` bit(1) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `screen_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '2017-04-28 13:45:30', '2017-04-28 13:45:30', b'1', 'ADMIN', '超级管理员', NULL, NULL);
INSERT INTO `t_role` VALUES (2, '2017-04-28 13:45:30', '2017-04-28 13:45:30', b'1', NULL, '普通管理员', NULL, NULL);

-- ----------------------------
-- Table structure for t_role_modular
-- ----------------------------
DROP TABLE IF EXISTS `t_role_modular`;
CREATE TABLE `t_role_modular`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isuse` int(11) DEFAULT NULL,
  `mouid` int(11) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK3B183E2CAC71A4C1`(`roleid`) USING BTREE,
  INDEX `FK3B183E2C5061F06`(`mouid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 445 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of t_role_modular
-- ----------------------------
INSERT INTO `t_role_modular` VALUES (439, NULL, 27, 1);
INSERT INTO `t_role_modular` VALUES (438, NULL, 26, 1);
INSERT INTO `t_role_modular` VALUES (437, NULL, 25, 1);
INSERT INTO `t_role_modular` VALUES (436, NULL, 24, 1);
INSERT INTO `t_role_modular` VALUES (435, NULL, 23, 1);
INSERT INTO `t_role_modular` VALUES (434, NULL, 22, 1);
INSERT INTO `t_role_modular` VALUES (433, NULL, 21, 1);
INSERT INTO `t_role_modular` VALUES (432, NULL, 20, 1);
INSERT INTO `t_role_modular` VALUES (431, NULL, 19, 1);
INSERT INTO `t_role_modular` VALUES (430, NULL, 18, 1);
INSERT INTO `t_role_modular` VALUES (429, NULL, 17, 1);
INSERT INTO `t_role_modular` VALUES (428, NULL, 16, 1);
INSERT INTO `t_role_modular` VALUES (427, NULL, 15, 1);
INSERT INTO `t_role_modular` VALUES (426, NULL, 14, 1);
INSERT INTO `t_role_modular` VALUES (425, NULL, 13, 1);
INSERT INTO `t_role_modular` VALUES (424, NULL, 12, 1);
INSERT INTO `t_role_modular` VALUES (423, NULL, 11, 1);
INSERT INTO `t_role_modular` VALUES (422, NULL, 10, 1);
INSERT INTO `t_role_modular` VALUES (421, NULL, 9, 1);
INSERT INTO `t_role_modular` VALUES (420, NULL, 8, 1);
INSERT INTO `t_role_modular` VALUES (419, NULL, 7, 1);
INSERT INTO `t_role_modular` VALUES (418, NULL, 6, 1);
INSERT INTO `t_role_modular` VALUES (417, NULL, 5, 1);
INSERT INTO `t_role_modular` VALUES (416, NULL, 4, 1);
INSERT INTO `t_role_modular` VALUES (415, NULL, 3, 1);
INSERT INTO `t_role_modular` VALUES (414, NULL, 2, 1);
INSERT INTO `t_role_modular` VALUES (413, NULL, 1, 1);
INSERT INTO `t_role_modular` VALUES (307, NULL, 1, 2);
INSERT INTO `t_role_modular` VALUES (308, NULL, 2, 2);
INSERT INTO `t_role_modular` VALUES (309, NULL, 3, 2);
INSERT INTO `t_role_modular` VALUES (310, NULL, 4, 2);
INSERT INTO `t_role_modular` VALUES (311, NULL, 5, 2);
INSERT INTO `t_role_modular` VALUES (312, NULL, 6, 2);
INSERT INTO `t_role_modular` VALUES (313, NULL, 7, 2);
INSERT INTO `t_role_modular` VALUES (314, NULL, 8, 2);
INSERT INTO `t_role_modular` VALUES (315, NULL, 9, 2);
INSERT INTO `t_role_modular` VALUES (316, NULL, 10, 2);
INSERT INTO `t_role_modular` VALUES (317, NULL, 11, 2);
INSERT INTO `t_role_modular` VALUES (318, NULL, 12, 2);
INSERT INTO `t_role_modular` VALUES (319, NULL, 13, 2);
INSERT INTO `t_role_modular` VALUES (320, NULL, 14, 2);
INSERT INTO `t_role_modular` VALUES (321, NULL, 15, 2);
INSERT INTO `t_role_modular` VALUES (322, NULL, 16, 2);
INSERT INTO `t_role_modular` VALUES (323, NULL, 17, 2);
INSERT INTO `t_role_modular` VALUES (324, NULL, 18, 2);
INSERT INTO `t_role_modular` VALUES (325, NULL, 19, 2);
INSERT INTO `t_role_modular` VALUES (326, NULL, 20, 2);
INSERT INTO `t_role_modular` VALUES (327, NULL, 21, 2);
INSERT INTO `t_role_modular` VALUES (328, NULL, 22, 2);
INSERT INTO `t_role_modular` VALUES (329, NULL, 23, 2);
INSERT INTO `t_role_modular` VALUES (330, NULL, 24, 2);
INSERT INTO `t_role_modular` VALUES (331, NULL, 25, 2);
INSERT INTO `t_role_modular` VALUES (332, NULL, 26, 2);
INSERT INTO `t_role_modular` VALUES (333, NULL, 27, 2);
INSERT INTO `t_role_modular` VALUES (440, NULL, 28, 1);
INSERT INTO `t_role_modular` VALUES (441, NULL, 29, 1);
INSERT INTO `t_role_modular` VALUES (442, NULL, 30, 1);
INSERT INTO `t_role_modular` VALUES (443, NULL, 1, 3);
INSERT INTO `t_role_modular` VALUES (444, NULL, 7, 3);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKFF5AC36D35ABF234`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `building_id` bigint(20) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_room_history
-- ----------------------------
DROP TABLE IF EXISTS `t_room_history`;
CREATE TABLE `t_room_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modified_time` datetime DEFAULT NULL,
  `modified_user` bigint(20) DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_rule`;
CREATE TABLE `t_rule`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `camera_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `interval_time` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `org_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `server_id` bigint(20) DEFAULT NULL,
  `similarity` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_rule_result
-- ----------------------------
DROP TABLE IF EXISTS `t_rule_result`;
CREATE TABLE `t_rule_result`  (
  `id` bigint(20) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `alarm_id` bigint(20) DEFAULT NULL,
  `rule_id` bigint(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKk68hrr4ltooe4lbdiftcei0ci`(`alarm_id`) USING BTREE,
  INDEX `FKtrko32i439o91djsxj85nxqdo`(`rule_id`) USING BTREE,
  CONSTRAINT `FKk68hrr4ltooe4lbdiftcei0ci` FOREIGN KEY (`alarm_id`) REFERENCES `t_alarm` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKtrko32i439o91djsxj85nxqdo` FOREIGN KEY (`rule_id`) REFERENCES `t_rule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_rule_result_dispose
-- ----------------------------
DROP TABLE IF EXISTS `t_rule_result_dispose`;
CREATE TABLE `t_rule_result_dispose`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `report_date` datetime DEFAULT NULL,
  `reporter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  `rule_result_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK7720r4txv5s3reer017pj7co3`(`rule_result_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_server
-- ----------------------------
DROP TABLE IF EXISTS `t_server`;
CREATE TABLE `t_server`  (
  `id` bigint(20) NOT NULL,
  `ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mac` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `os_version` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_server
-- ----------------------------
INSERT INTO `t_server` VALUES (1, '172.31.0.174', '00:0C:29:F2:1A:70', 'localhost.localdomain', 'Linux2.6.32-431.el6.x86_64', 1);
INSERT INTO `t_server` VALUES (2, '172.31.0.247', '00:0C:29:2C:D1:63', 'root', 'Linux2.6.32-431.el6.x86_64', 1);

-- ----------------------------
-- Table structure for t_surveillance
-- ----------------------------
DROP TABLE IF EXISTS `t_surveillance`;
CREATE TABLE `t_surveillance`  (
  `id` bigint(20) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `last_modify_date` datetime DEFAULT NULL,
  `max_return` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `similarity` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `create_by_id` bigint(20) DEFAULT NULL,
  `last_modify_by_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_surveillance
-- ----------------------------
INSERT INTO `t_surveillance` VALUES (10001, '2017-10-25 15:59:54', '2017-11-24 10:40:23', NULL, '黑名单布控', 80, 3, 1, '2017-10-10 00:00:00', '2039-10-25 23:59:59', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10002, '2017-10-25 16:01:47', '2017-11-24 10:35:43', NULL, '白布控', 80, 2, 2, '2017-10-17 00:00:00', '2069-10-25 23:59:59', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10003, '2017-11-02 09:19:30', '2017-11-24 10:40:26', NULL, '11布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10004, '2017-11-02 09:20:18', '2017-11-24 10:40:28', NULL, '11布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10005, '2017-11-02 09:28:41', '2017-11-24 10:40:30', NULL, '教师布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10006, '2017-11-02 09:45:45', '2017-11-24 10:40:32', NULL, '宿舍管理人员布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10007, '2017-11-02 09:56:41', '2017-11-24 10:40:35', NULL, '11布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10008, '2017-11-02 10:17:52', '2017-11-24 10:40:37', NULL, '宿管布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10009, '2017-11-02 14:05:19', '2017-11-24 10:40:40', NULL, '宿舍管理员布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10010, '2017-11-02 15:27:01', '2017-11-24 10:40:42', NULL, '宿舍管理人员布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10011, '2017-11-03 10:41:10', '2017-11-24 10:40:45', NULL, '宿舍管理人员布控', 80, 3, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10012, '2017-11-08 10:49:30', '2017-11-08 10:49:30', NULL, '31布控', 80, 2, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10013, '2017-11-13 15:56:54', '2017-11-13 15:56:54', NULL, '白名单测试布控', 80, 2, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10014, '2017-11-13 15:57:54', '2017-11-13 15:57:54', NULL, '白名单测试1布控', 80, 2, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10015, '2017-11-13 16:22:48', '2017-11-13 16:22:48', NULL, '测试布控', 80, 2, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);
INSERT INTO `t_surveillance` VALUES (10016, '2017-11-13 18:49:01', '2017-11-13 18:49:01', NULL, '灰名单敏感人员布控', 80, 2, 1, '2017-08-24 00:00:00', '2118-01-01 00:00:00', 10001, 10001);

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contents` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remindTime` date DEFAULT NULL,
  `isDel` int(1) DEFAULT NULL,
  `user_id` int(20) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `handle` int(20) DEFAULT NULL,
  `handleDate` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES (7, '任务一', '任务一任务一任务一任务一任务一任务一任务一任务一任务一任务一任务一任务一任务一任务一任务一任务一', '2018-02-06', NULL, 1, '2018-02-05', 0, '2018-02-06');
INSERT INTO `t_task` VALUES (8, '任务二', '任务二任务二任务二任务二任务二任务二任务二任务二任务二任务二任务二任务二任务二任务二任务二', '2018-02-06', NULL, 1, '2018-02-05', 1, '2018-02-06');
INSERT INTO `t_task` VALUES (10, '任务四', '是豆腐干豆腐干', '2018-02-06', NULL, 1, '2018-02-05', 1, '2018-02-06');
INSERT INTO `t_task` VALUES (11, 'dfsd', 'sdfsdfhjh', '2018-02-07', NULL, 1, '2018-02-06', 0, '2018-02-06');
INSERT INTO `t_task` VALUES (12, 'admin1的今日工作', 'admin1的今日工作', '2018-02-28', NULL, 10027, '2018-02-28', 0, '2018-02-28');
INSERT INTO `t_task` VALUES (13, '55', '55', '2018-03-12', NULL, 1, '2018-03-10', 0, '2018-03-10');
INSERT INTO `t_task` VALUES (14, '55', '55', '2018-03-15', NULL, 1, '2018-03-10', 0, '2018-03-10');
INSERT INTO `t_task` VALUES (15, 'dfs', '十分的告诉对方', '2018-03-20', NULL, 1, '2018-03-19', 0, '2018-03-19');
INSERT INTO `t_task` VALUES (16, '手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手手动阀手动阀动阀手动阀手动阀手动阀手动阀手动阀', '手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀手动阀', '2018-04-21', NULL, 1, '2018-03-19', 1, '2018-04-21');
INSERT INTO `t_task` VALUES (17, '风格豆腐干豆腐干', '地方官大使馆撒旦个撒地方', '2018-03-20', NULL, 1, '2018-03-19', 0, '2018-03-19');
INSERT INTO `t_task` VALUES (18, '为人体微软微软为', ' 微软微软微软微软', '2018-03-20', NULL, 1, '2018-03-19', 0, '2018-03-19');
INSERT INTO `t_task` VALUES (19, '让他格瑞特热特瑞特儿童儿童额', '儿童二二特瑞二', '2018-03-20', NULL, 1, '2018-03-19', 0, '2018-03-19');

-- ----------------------------
-- Table structure for t_ui
-- ----------------------------
DROP TABLE IF EXISTS `t_ui`;
CREATE TABLE `t_ui`  (
  `id` bigint(20) NOT NULL,
  `data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postfix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_ui
-- ----------------------------
INSERT INTO `t_ui` VALUES (1, 'iVBORw0KGgoAAAANSUhEUgAAAGgAAABoCAIAAACSfiL2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0Q2ODFGRUU0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0Q2ODFGRUQ0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmQ3ZWMzMzAwLWUwYzQtZjU0My1iNWVmLWM2ODczM2MwNTI4NyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz5M/y3uAAAIeElEQVR42uydaXBTVRTH35a8bC9Jd0qtdKGlC1srtqCltBSogIoIiCOLC+I24Kgj6ggujMtYRVE/oOgwHVQGUEatsswgCiJYFMG2Kkgr0AWL0DVJX9K8vPfiaaMoiliat6R590w/dfJubn8595zzv/fcFL/m+bMYsks3AiFA4BA4BA6BQ4bAIXAIHAKHwCFD4BA4BA6BU8IYI16QQQ8dRIXaxEJuQlEMkRxDpcRRqXFUciyVEEkSOMYL2APrO46f4RG4f1rWZbqJw+ncJH18BHmBWZLY+Ey6KIsenaR/bx/7TR2n+oRx1Tcyhw2mlpQy/7sYm9qExKgepqIfW77JUVWvMjtCdWovzrP3JYQFqPXMGMceuZ6xGgntgsNxDHxNT+GX+mCEmbhnskW74Aoz+58ui7Pp3GS9RsHNyjMF8/jiEjOOaw8cZM+0+KByelIMNTHboDlwo4boJPDZfKPmwA2JlqCEhAo51kpoC5zdLM1bD7KT2gLn90szDq3DtQWukxUlGeesQ9QWuFPtEij2VpfY2MprC1x1gy/4QUC3DomhtAWuxSlyfLBxDlLq3ZPM2gIXZyP6oVL/bSlxGvM4h9sfUuMMGHBOj3isWYK4fvA4py1wYFsOuIMcgRewrYc9mgO3/5g3yNy65Rv36Q5Bc+AgOL2+w9W/Z91e//JNjg37WM2J/IBdFtVPpWmi8VaXwAuYRsGNTaP7/exV6bSKM1cTnFGPF2X1/48vHWXAtQmuZLgB2PX78UF2Mm+oXnPgbCZi/nhTkIMsmmjR1raSjsQfm8EAuyDHSYwil5ZaVDmyUUHoxUeQD01nhifqpFnvIwzgdGt2dnWwYjh7HDjHwkKzVNQCdnUGfWOe0qc26vSOjM+gF000x9kkOC6ob+HX7mKVbyVRremGIrBx6fSELDo7UWe/9GDX4hRrGrk9R7yHTnB+NfZHVGvz4kWsstbr4fw+ASvIoKlLQcfx/h+bfF/86AVH86uzq6SGx5lp/IoUPZRgeak0YwwqI3a6xW/ruAO/cEAQPoOwBTdssG52vjE/TQ/liLQjgw/uP8Z9cMB98iwfVuBAky8pZYqyaVlLLli226s8b+1igz/NCIlyBArd1QsjimWmhvU23E3PMa6ab1eg7VD2N4BVuXKO9fJo5RoV0uKpJ2ZZCXyAg5uZZ4TQpnD+gQL72lx5S2LZY5xRj5NqCGJBxGTNs7LXcQpXCWG+OxIGJpfHQWg2q7lB+4ex3XIpC+nBJcdSi4rNo5L0VAh4Mwi76npu3W5W8sJYYnBDoqlXFtoNOjxUFhSBgbzLTtQ9uL6zvkVKdhJ7xe3FZooMFWrnVit8kLcVSdzUJDG4kZfrvD7/sWZexRPPc9bUJlQ3+Iy9gkWSJncZwUHVZqZxqN2/rvVW1nrVqkScHnH9l+zpDgF4BSSE5NFDlgAOcy3MpKMY8uWtrp9/9SmJDOrerYc9L3zsmjTCIOvhoYyZLz2eWlJq2VnTXVbhPOtU4iSlqp67b107BIqnZlsTIuVVx/IqB1gg909lYM0+/G5HUZZh7jiTTMVdc4ew7gv24HHunsmWaTlK3FNSYut8XDoNOh+W7R1vti8oNE0dbZRQvYKk27jf/dFBd6SFfHmBPcj7YaEFDizSQjx7s63ioOftz9lPD3kWl1jGpAQbgEATfFbTvX4v294lwmjLlL39q9xhDSzRG640jk7SlVW4ntjsgHwH+FL72/oMOWfNZ111p3kcx+YVmOYVKH0FU+lTrqQY6rXb7OV7WPC+peUdk0cabi00gz/2fQTIM+W7u7480lPrgIstu44Zk6pC640Kx4N6Cr97kuXKVD1EvZ3V3V8d9c4ZawJn/N/OJY73f/it5/1Kd2CrCsLZipnWWJvGLsHlJuvfuDMCShag8M5e9s617QDxIlsZe496F69th7I2QA3qREgFalHD1P3ekdpm/sSfmxYQ4Fdvd31yyHPXJAvotr+/7PgZ/q1dXTWN5xXStad5h9sfzaimi1XzuMMnuWc+dIKkBZkxe6wpqfdKFjB6dEPnyi2OxlYhoJxe3e6CUBigFmMlHpthTYnteeVvnQJkGFY1UYeRQ0uWSTjc/PF92oQAEE9vcULMspmIJ2dbp+UYp4w0dPfuDmA9FwuFHVWe+hbhzV1dR3/9wyVBPz071wb1YMkIA4jQhlah0y0eOeWbkEn3cT9mwz73wAb30ynfk5sdXp8/I0FXdos9cBmLJHCoxYYl6KrqfUAQgh04na8XGkVgdxSb753CBIQ6YCrIoCHD1DT4zjjE+ha+MNPQl1pEWnBKL1Wov5563wFoZowxvjTfHsWcNwFgBxkjP+2v8iLWSsDLZuWb8PNLwpvGmVbOsYGAO1DHvb7D5Q/vpVr3G798k0P0Y8uuswKLC54Zg1tNyDJEmInqRl/eUPq5ufbB/yHX4ffgeiDsD5/0+QQsJ0mvpMcpl1UhgS7f1AkutuJGW+JF74UAz+m5xrHpNBTGF1+CgyPIV2+NWPWpC4o7YA3FYLiVIxCJHt/ogJW49Bqmjy36UX2TEzDailnWjfvcb3/eBammOJsOH3BNbQLEtVsKTNdfIYtHwOcAg4PsfWWby2bClfnOJdnBNXcIq7e5Hp9plbuDBFLKqgX2sgqnmcYV6FaRN6tCmbq50v30HKsyfTcQOsvm2bd9332qTRjA4Npc4g+NvgemKrpNBu724DQGCmx494EE7lyLDagC+Jk80qD8tRd4x2k5PTpEEC8wsRAFV9XAnds7uuDXhCpmCZHk3zfoJb8IITG48t0s2x1yfV0wpfI9Et+lllg5OD3+yjpvtJWIZkhdCPRCwAr97gT3QoWzSep0gaP/yzUwRD4Ch8AhQ+AQOAQOgUOGwCFwCBwCh8AhQ+AQOAQuLOx3AQYAChwGRNSWFVwAAAAASUVORK5CYII=', '上访人员人脸库图标', 'png', 2);
INSERT INTO `t_ui` VALUES (2, 'iVBORw0KGgoAAAANSUhEUgAAAGgAAABoCAIAAACSfiL2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0Q2ODFGRUE0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0Q2ODFGRTk0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmQ3ZWMzMzAwLWUwYzQtZjU0My1iNWVmLWM2ODczM2MwNTI4NyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4O37TnAAAI6UlEQVR42uyce1BU1x3H72vvvtglC4KYooI8xGdEQwCjpk4cNUGmNtW0kxonaf/o1DZtanSmk/6Raewknb6HtElTbW00tZkm1cS2JgbRRohBiCgPMQFBUSwiILCv+9x7+4NNwaiwe3fP3d1rz2/2j32e3f2c3zm/7+93zrnk2heuEdi0G4URYHAYHAaHwWHD4DA4DA6Dw+CwYXAYHAaHwWFw2DA4DA6Dw+CwYXAIjLkj/9WCGaaV8yz3z2YpkmzsEk00+dN33JyoIvwK8s5b5dpYYtv8gJ35/Fg6fk548W03HqqTmayoxC2+tWKOuTiXxeAms6MtgqLeZlRuWZ2UnkxjcBPahmIry5C3Pg/UvrXKjsFNEOwoomyxdaJX753FrlpgKcxibyJLkURRjraBrHtUnZtpWjjDVNXC97mVGICbP4O1suRErwKvZ9Y54M6gT9lX4/9nAwf3pzio7z/kSHVQ9R1iQoCzW8hHimwbS62gBi70yX1uUb/vIknia0ttgOzhQms473fZqS1rklqvSD2DgR+UORZns+09cpw9LjOVBucSJPX+fPNjy2zBJ9cVWhs6JSmg6gRueYF58wpt8xe45a8ev4uiCOhXeNh9PRBPcGlOquIJF0jNI808dOP45JLD7t6S8mqlt/oTQQ9wqxdaIviU2TQ+qPs92sAhDg7fWe2A8ZKSRD1aasvN+FyvpCZRywrMuqSNJHFPVrQaTdU4GBB4HBBZPsc85FP6PUpx3mR/oCSPhagnow4SMME1dIodvTLMXG+d9H93TdIi7RyV2IP78n22rxSHNSVDUEu2UQNexOQCCvHcm8PB+0kW8s1aLn+ayWYmw2/BL6gtl6VYg7OYwn0n/Djk1G50/E3L7WsXaZ7sXjjgjmDmpVCAC7dvwd3mTzeR+oD70SPOCKiNhoVI+jJaj8tKY4rCTp6np9I/33TXsF+pbOL313GgQpEgm5dpenyFfc4XTJF9HHCfuyLFGtxDiyxOqza3Bb/bUGKbN920be+QEqmwA6G/ZBbb71agM76x0n7b5DRMy8tg9PI4hiZSkmiI+leHAgtmmCDdy5nKDHiUaS4a5G5kPxcc5LkNyWOTumbdsyapNA+NuPmoXdQF3Kx05vlHk6GH4X5bjwzqjBrt3Zyp0f7ie2aawPtg5Ebw2c7eQGkegnD8erXv5PlIwIUeZQ8vtgSpgeVP+4waEgPhXr7EGtlnG7sQZL57jvveOOG/cE3WxeOKc3WR+0GDZBb8rqtPbuwaUSo+Xr3mDoRcHIAMZHu5I8qvFmX17XouctUdcs0B5v5t5Q6t5aqIDbRoVQv/p2M+XhrHB5Ppstlm8HenjTLRMEsw0USDV494DzfyZoYc8kce1kN7nJtT6BiWO0Hxw/h9cL6l4j0PpHFuTgWvBGqo2u8dDhz8mINoHuWiV2hwK+aYI5ZI0eD74Zec0bcDgFq7JVDdY8/s/rdPQVHcCu1LIKwVhTCovVPPQQQYewiq+4NWNHWt0OCgxw7U+41I7V+nub3VvmAt6+ApbtNLAzurvKgaD0sAX/caz+Wgv3/7njdYkulzK7uqfGjrz2FN+8fPCTX6VG71MJ8wojN+fcgTfAhReMf+YeRVezr3we0h3yQFIC8RBIkozGITH5wcIP5S4+sZDIjyyMLCuSvyFY3rCWh03PhbSeLg9jSGNobfQVq9dc/Q1jLHwpmm+g6xs1fe96E/1kM1aKpKnO2WjDJgQdC8+FjyvTkja8+g3r0C4qGqraKSmUIbBRwkPMF616BPAdcDB0TbvracILJiaRwNtO7vK73IqWnzuIonXRnJtLHAQc4LkkCPljWAu9tF282kgaiJstp0SYSYpuqwgYDS9DuM5W4QFiqecD273qlH4xrAgRAXJIOxA1s62zxVhxlGA7gTbcLOoz7DgaNIIjs9ruDA3j3NtfXIhhuzG0tsk2ya0zHlGtfABFHbJkImKCvEjUWuBLc0Jw0h4sxFKW4eBzbkV+D22ge+2nbRQE5XvsQKqiCe4MbsN4c87zfxRgFHUyObDhIC3LBf+UOVV4/Cgx7WclmKZmkGJTgwH68+tXvwP4MGYLc4m922zpEo4MA4Uf3enwf313GJn8Y6bSgX6xAMe/C7nVXeXVXeuZmm4jy2KIeF2eRSf2CaiwruS04QuzYcSCxwY0rlbLcEt+6BQEk++/xbbqeVeroM2daY6Mske6tRFjK16bhwrKNXDi7BCbJ64lMxK42ensqM9fkfj/l+9g8PSGiGJl8+7H1gniU2PlnXIb5e7UtEj7utSQF1z3F/djpz3auAdgGgwY0N+2r8cIM7h05zZYXWGIB79wyHtkHdjyRd7JOffOX6RK82dEoxAOcT1FOdiOV6nA/B5WTE4oj2gTq/jFoyxRNcupNaNT8WoaNvVCpBcr3jq8mosv24nclnKOKXm11THLr3XFuPfLSZt4/u4kl1UFOTaZg9DAxu1QJLDKi1dku/e98rK8TSWWxwX6mHV4ztcV5BFSTVbNJRjUA2/ZP97uChgLFjZF4eTTExbnNczSfC+l/0R7ZxORzzcOqzfx0eO0oRXK+5PBBAVf2Pc1Q9fIbX4xArCOxn9g523rArum30HG/deWRLhXG+YMvJkX8yYdGiqoU/f1VeXmCGLDjMBrv65Y/axMom/qaaDSgSl51s7ZbvEHDgbB93iKX5n01ADRfE+g4RxhfkuTCsmrpEyDFr28Xd306ZvJFTo8cu23vkDz8VJspVdx01TsoVGpxK7Pi7e1u5A5TwzCnM4Ub+1oX33qHAkWb+i3MtDD2yheum7VJNlyR4tTLmtehEuUQQy5BPrU1644R/opIy+GBuBnPmoliYzW4tc8DDymb+2Fm++VJ8NlAZ8tpK31xpX3+f7esVA24ubtVT412wBVKO9qvy6Qvi7LuZOBZKDXYZNBihP97oLBg9d5GZQj/92pDEqdjjQltRLlvwv9Mqf6v146EartWfFxu7RrQ/BF9URz3+j4JDIhi+RiYGh8FhcBgcNgwOg8PgMDgMDhsGh8FhcBgcBocNg4ud/VeAAQDE63kFUWraWQAAAABJRU5ErkJggg==', '全国在逃人员库图标', 'png', 2);
INSERT INTO `t_ui` VALUES (3, 'iVBORw0KGgoAAAANSUhEUgAAAGgAAABoCAIAAACSfiL2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0Q4QUVBQTk0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0Q4QUVBQTg0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmQ3ZWMzMzAwLWUwYzQtZjU0My1iNWVmLWM2ODczM2MwNTI4NyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6qXHdBAAAIPklEQVR42uyceUwUVxzH59qdPdmV5VABOQRPFE88qqiVqA1GrFptrdWYJq1Jb9vGmjS2iU1tY9L+1cZW0xqNiTVqWhtLqUet4oFRAS8uK4ICFjkE9pyZnelvHRwOd4Fd92J8vz/Issw+5n34Hd/fe2/AF33ZgCHz3giEAIFD4BA4BA4ZAofAIXAIHAKHDIFD4BA4BA6BQ+a9UWF4T1oaT09QpA6mEkyUSU/o1TiO4Q5OaLfxjW18TRNXUc+V1rKcE4ETnR/HpqfRCzJUk5OVFNnHxTZGuHybyS+xw1chFHeLh8MKMI5hc8bQa7O0QwaR3n721n1u10lzSTX7zIEz6Yj3c/RTUpQ+jwAe98cV2w/HLaxTeFZCdcQQassKA7B7SofNmaROjKa2HGi1BStwQ1lVx8Qrtr1ifEpqkkE9+WyFgSIxmYODdPb5CoOGxv04ZkaiYv1cnZzBkQS2OTcCdIbfR35xqhp0jGzBLZ2qSRsSkOmB5Fs9SyNPcBCeq2YEcG7TU+koPSFDcPPGqgIRpF2dbuYIWobgstMDPqtxiQq5gQNfGznU91k5eTfqt7yuZ9uQYCLlBi4lhsJ9DdOz5Y7TpY6u75TVshv3PNz+e3uPK6N0AQcX7M4hPtKX39jQ6vz+mDlKT761sEOm1TQ6d5+ynK90cVRSOOfEukpf/8rDsACnU/U2paoG7kEbn5na2be2Wvn956z5JfZ1c7S5U9QixL1nrCeu24XHzRXDCbfus6PiOjOAgxPkBk5BuQdXUs3u/scC4L5ZaxTfsdiFg4XW3y7ZYg3kV6uN0NXWtzh/Oe9C9uRK3OWqbuAsDtmBa7f1TO9AYccx89EiGzjj1pUGSIINbfyRS7a8Yhv41KqZmuWZmrI6dtuvbQVlDt4DkPMVjle76F5ALDdwbd3BAYevj7iIQIsO+Qsy15YDrZdvM1BA5o9TLcpQ3bjLvru7BTyx92H//Y+71+SMf1xM7zbJDlxdSzdwhwttQA2it9nMv/1Ti6Q2kqOp0nvsXyX2/o8MheIlU4fT3bjHyg3cnQcc6xQUJC5msX0FFtHv6roHV58u9qSV1XKSF5fcYeSm4xysUF7XMcNj1+x+XHeU0FfUsY3tvNw8zlUBbzOQ0eDFmTKXCotQE55kF88LUCjE19ERBEm4v8zOCA+tPAS7+G0PkSwfcMXV7LpH4quingVq+94x9bJsu+uk+VChbc4Y+pPcCE/XQKl9fUdzi4UXX5+6KVNwt+pZoAYFFISInRV6X+yePYqOi6SG9rr7BY5IEpjojcV3GMn15LY6wvGuPT0xJQFBKRjdmoYmUgdTBk1v/QakSUhqaqXrmoIyR3BmEZpdrrI6TspXNY1cTIT7vUEQwB/tfQjSD6rwwY0mpYeuo7bJCTUnSk/A9RcqmeBMITRL59BaSi3E9RqPmguSoCiYQcH0suVcXM2IjX1pLStmOtmCq7zPtdo6hMjfNx2eToGcvNEZd9CTeYrT/Ec6WUcThbeYoE0hNOBqm50P2pzSktF3+e1mu9ADx7kKR15RZ+dQWMkcvGDtsZAJMnDnCTNkTHht1OIXgwguZEcgILKsXdYwIH8Nj6XETRYotbcbuCZ3InaQlkiOobSPdB9EJSCDi8UfzRpJF5Q7gnb/ITsCYe2+8gPlFTJUn58CWC1V7t2q4j4XzPuXz8FCCHkErjN+obVwxQWBedIioTIqbKktnapeP1cLvCrruaQYEsfxI5dsu06YhfC4vTD1uIlJyjeydaKXpQ2hQACD0y3LVC+frsEQuB4WE0FIpfPjJXopMruW13VZ2pTYjijR0jgC57INC3RiXvsgRw/spDL63u6Wq4+7C4rEPlysF7fKXsvShjDx4eHzXyC2rjIkRbs0mtiuuwplG//F4VbIcVAiNi/VT0hSSssErVYeBM2bPzYLCBzwWpihykhUQv/fZOavVjNny5mux3qnDldOT6NjDASIPqCZV2wHfMjjBpihJ2sQOAQOgeuXjYlXRPp6Yh/qyeSneLJkoLZcw2OptVnazFQlSNyth1ul/dZ+WryJ3LLckGAiS2vZn09ZrtUE9amk0FRV8LLl09QzRnRqf1AYMHnoRvl+CDP4VPZ41YZsXdcN2eI7zP5z1qA91BVUcNByzhihzJ2iBnBuL6hq4PYVWM9XeDyVBJxABq+ZrfE0QkU9d/CCawSOlwU4CKgXJqifT6cNmr7TGajfs+WOq9VsTSMHLZfwaD8BRkgfppg1ko6L7PuYarOZ/7PEnldkC9xZiMCCg+Q9axS9KEPlyUECarxrt9Bx9Iq9qMr/j8YFBBwE1NgExYLxKqAmNZ4htLoWJ/Rnx6/aH/qvRfMzOGjRF01Q5UxU+/DIbqAN2t5z5cyhi1boc8MInJLCl2WqV87QhIOL9W5Xqpg9py3eqp+A6LhRcYpNS/SDjSQ2EGxSsnJikvJokW3nCQvj6/l0P3QOWaPp7WuMA4VaR6Dh2OJJ6m/XGqVl52CDA92/KTeCGpgtb0ostW21sT8Kyc/gBmmJjTl6AscGrg0dRH66LMKHKTwVOOg0fftzhZWlJygWZqiCBy5SR2SPU2GysJdnakgiWODmp6soUh7csBgD+dxIOkjgpqUpMRnZvLGqYIDTqvDRcQo5gctIVHgVQD6CS4mhBnQxdbseMSyKCji45GgKk52BNwQcXEIUKT9wSdFkwMFJZzvkZFBbEThfzOiNmPdx/kY5gvPKG3zf0JQfOK0KDzi4cDuR6xfzalK+rkbJkJt3k0Kh6uOk0Pk4X90TIUDgEDgEDoFDhsAhcAgcAofAIUPgEDgEDoFD4JB5b/8LMAC14zH/X+D0sQAAAABJRU5ErkJggg==', '临时布控人员人脸库图标', 'png', 2);
INSERT INTO `t_ui` VALUES (4, 'iVBORw0KGgoAAAANSUhEUgAAAGgAAABoCAIAAACSfiL2AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0Q4QUVBQjE0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0Q4QUVBQjA0QTZGMTFFNjk3QjFDNERCNkEyMTg0MjMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmQ3ZWMzMzAwLWUwYzQtZjU0My1iNWVmLWM2ODczM2MwNTI4NyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4oIybbAAAKP0lEQVR42uydC1AU9xnAb1/3fnEgARV8gahoQSQqTaOAeYht1IQm2kwmMUpNMtNqOlM7SbRppkm0HTtDm/ShNElNxlg1Gm2tkcZoRRMR3yBCAoSACFF535vbvdt+SOa428d53GNPnf83DjPucbvf/7ff/3vtt4ot3HhDhmTkgiMECBwCh8AhcEgQOAQOgUPgEDgkCBwCh8AhcAgcEgQOgUPgEDgkCBwCh8AhcAgcEgQOgUPg7nwhI3KW6SnUsjx1ZgrFsrKzza53j1pvmD0xX1uiHl9VqM2dKMcw2eU2elelvbaNjtTJsfCHbuZNVby8VO97xOZkS7b29Nljyc6oxt95zqRRYr4HN+03H68fuC22aoIO51ADAXVX5Gtia26gAIcaCKgKCt8W4B6ZpRI8njWOii04MQXEFJbax6UlCZ+BJLDQTqikMJ0Kg58Ejjlp1j7Amh2hbHkxBcQUlhpce487Z4LA8dZOZkT+KGeifEYKNSGRTI7D9arhfeBi2Gt9nvZe5nIbc7HF9fX1YE8LCiTo5IIKxx5cehJpUAtvdghhwZxh5nj5opnK2WlyOSlsIHA8NYGAP3npCnCeX3XQh2sG/lvjYG61fFBg1kQBcKAwqN14jQkTXIhRFVzsLx/RC/oR2F9bP7OWX3QGPsOUMdTT89QALoSrd5o9Oz63lVff4hIPZynXFukwoTtS3Ur/4YC5yxJ63A8lOKjk2J9WxIl5X9hcNa23SJdWFmhKnzaGRg1klB5fu0j35nJDfMAQSeAyVjx0wBJgISGDI9IWrBvpd1YVaGdOEF2zgsKW5A5GrktXBPCpFdimJ43505The5nkOGJhlqruKs1PtseYiFeLDRBAMSzQ7QdVzzW7pLO4+dMUt/ydp+7X/PEZ47gEPx8KXv8vK+Myx0YsU4HbsPkpY47/XSzKVpatNkExE5GFRBKcUR3UtzJGU1t+Grc4V+W1RECZZCQinrLBnh26Q5DxvvKofk2RDvcxtG6rp0kkFAS5kIhFVUisBIPp+p39EP6ee0Dre/CFB7Xgy8qOWFfM18DmilK6u/4x/c6T9pJCTZzGT7FTja7NB8xg6f94wSS4EEl9nFaF8zfChRbX9hP2LzsYKPJTE8hR+mFGY+MJsLvxo0hZ1ARu5H0ZCl9n32vzvF1u2VZho90yq5OdNpbi37Z/nXVcbKGlA1fdQk/11wOi+6u7zZ6bMazb4vm0xmlxsDNSKW/6jskklYPnHa/tMfsmayfqXcDO11Gc/8ZVetASg+5I/jQFeGXGIzvztauyQaDlYNLiJYXagkyFZLxYVtbwLf3e/2w1V4TtCLLo3ElyihikdqwurDYJFu13ueaky39TbMAkMTm4i0+UdjlcrATXinoHuK3LLdlGJXFZ9ji5NNeKOrgf5qikdHCz0+8WcBMTCQm5yVLjJbocGe0L+OYlvtL4LfNNJ3OPgRhpy7O2je7odUPGmzGaFIxIYODsnQ6OIjCoivjH3zlq21v1Xd8JUkKoK3VBbGgnzb6+1wwBceivUBE//6CWX4FSJOZi2Dt7q0IwxXlAIEP2UhuyoF980MsEkcP/6sM+L7Wh9LWCl1KwUvmE6IKjGZafHHzE63G297j/+YUt8Kn2Vjlgd3MO7jvDPZV9gJXA3KIODlbQY/WzJagurnQJdG/3nwnU1AV79DVSr1ztcdNuP0ycy93BUZWDCWzQI2QQYCm1baKtsZYbDNSeQhYt41h0axdzl4CrueKHQ05ilEjC0NIpanLX+oQ/UlIQfPyWcDlyz+pjDA4qWZb1CxfjRNokbvFNRosgTU0gSP8VnGu+W8BZneypJr/Yt2C6cNmfZBRVRuzxe0Gm0p+aK5wW2+0FDmR3pcNvtdOViXqB6+aIP8dITyZhV3IOxmvxomw/cB+fdkhWokgB7st2uu7q8A4CABt/YuQkxqsKNAGeOQE1Tq4LO/S3T/g1XSCn8c3yoi2hNDJDYddB+w5t6FV4Yaay2+qBjRynwR/PUz8+Vx34DGlJpFGDX+93kzh27yT5hmJDqv+ToN/tt4jFkKjk9pL920rFc1SrCrScxhwEBGKERi/4laom12sf9UvZTZBuIvN0k4vhpXDEyK/P/wrUsBJTkwgcGNkz8zV/LTFRRFRacySBvbxUnxIvaf8q6lt1dpp89QLtGJMUq3q/wrbzpF0acKEHh4JMRfEc9b2TFDiOXe0W8MomLf7zhbpn8zW+Y1sQ+3ZX2qeMpigyAtZX2TCQEj8cIrLHy78/WQHKXO8Xzuby0hWPzlb/IEOhoLAAhUq0LA4c/JvLDb4jM9Wt9K939fvW24tnqZ4t0HCSr88uOd86ZIVfSzQQv3/SEOZT/c0HLEdrnZPuIdct1nFmLQ5ecLx71OZbxoKXeH2ZwbdpeqHFtX5nP8tKaHEr8jUPzFD6J/3ElDHkkdrBCiFjNPnKUv2imSrfmUhYQ+lBy44v7EPhwTbALslV6VRhedh9px2dZg8U//8574RTgRV7P5qcTD2Upeyxerxm9cZyQ7b/cFSykQANJX0g/dISPT+PBz3q25k56fINjxk47fKqRteGXf117cN9i7np8h+FPYubHEccvvTdiNzZ5sFhTdgEXsUgnb4vQ5GWREGxHK8j+L1iEIgne6pCLDZCaZ3rRSwF9i//4N8OW/991hG4xgxNZqRSUMN6hwNPNbpKtvasKdLdP0Xhe4fKVpt6RZp0+jBMPpRvBvkCw1cd9PN/7+VTk5PYXN5DPNhWn1Y7j9cPcBqTQw4UfFaz0PQvx2NAHbJxn/mtQxbffBFKWrGB6XDexAgFXEUQwwPbT9hefL9PsK0I1PgTv/XtdOknlk37zeD+OB9tOWz9c7n1wDmBPfXQ9wQs99BF5+qynmBeoqkIYwoiFHAfHLcF6FCbHZ6VW3o+/Fw0nyqcLrBaxU2UJCHwcMd4c3JLo8QF3dzkZAFrgqRn3fa+t8stHvGgCUuAhUgKDkLkmm291SKDvmBNAR6VqhVYrtAw+NCYBC40Y4Jjwz/58nCWKkBVK5YrgvJrt/WGM2US4nPVbovnpR196Unkj+eq501VcFpAa4t0cM8FZ4AhLAjWp95qTMHbxUPIxKpaSDvKjlgHaJYfOl5cpOP/PrjRPafs4Y/rh5VJweX7RfzrsjzhNpFY+9crbBBHOI25fKFRXjEFQOHwqcnCf5IvVoRymmVegcrBw7KcfB12qMM1eAMgpP7svd7BMXt2uEq5cbN++uSCs7LB5WH5/ZXBN5f4FxJ7shGpqjlccE3XGMGWt1vELbcEfFUJsIi9MgQxZ0TPExg3K6bwbdFWEswShryvLKYipoCYwlKDg8Qdki/OQZuT3XbMFltwoACowTkIqobzGlJk2kpeae1yw+01afA4LU4zspMNrjc+7u+2xvjVcnB8x+qcUKVC4cx4Bge+IcGGujVS58fQ/+cQm62KwCFB4BA4BA6BQ4LAIXAIHAKHwCFB4BA4BA6BQ+CQIHAIHAKHwCFB4BA4BO6Okf8LMAC2KO6vrcahHAAAAABJRU5ErkJggg==', '吸毒人员库图标', 'png', 2);
INSERT INTO `t_ui` VALUES (5, 'iVBORw0KGgoAAAANSUhEUgAAAeIAAAAoCAYAAAAi7fnFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6Q0NEOUM3ODc1MjQ4MTFFNkJEOTNFMzI3RjgwNDk4MUUiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Q0NEOUM3ODY1MjQ4MTFFNkJEOTNFMzI3RjgwNDk4MUUiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjljYjZiNjgwLTQ4YzYtNTI0NC05NWFhLWE5MTZiYWUwYzlkYSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6cZJ8ZAAAKsUlEQVR42uydjXHiPBeFlXe2AacEU4JTglOCKQFKgBKgBLsEKAGXgEuAEnAJ+cLMvePDXcmSgWw2355nRrNALFmSvTq6V38vHx8fjhBCCCHfw3+sAkIIIYRCTAghhFCICSGEEEIhJoQQQijEhBBCCKEQE0IIIRRiQgghhFCICSGEEArxHyR7MH71GfLINfkT7kO+7/3gsyOE/HNCXD0oXte4i0QxvF533fbr9BnqO+65kbjXUASuuf7tIvfZJaZ7zctqJE2llLQPCR2Ce7jm/SjlvIeDlPsi5ZnyDjyrTJmkd4RnXSTG3Unej4G81JLmcUKahBDyx3mZuMXlQQTmSv8Zms+wnnjPD4jbi+BeG9L9Z5ibhraSz+fP8C7/TrlPLO4JGvFXyU+MUupB054l1tc1D+0Tn52mPZe6uze+LUMmddJ5yl0b0ZtaplyeaSHphTpXraQ9xgXih54DXnNvPRFCyF9lEVu2D1hCzjSMhWmY0YrpJ1pgJXzegwiPWdV9YtotiE8+wZosI99jcSvz2x7y8EwKsSIvYm3XI5b9wVMOrZOd/F09DmrxbqQsGdR7L88I63bM0l9A/GakM9TdWd+EEPIjhLifIF4+zsZKbSG9DBr9RgR/N0F0SpOuA1FYBPIyNe8pDXwfEIWDhDrxfips6Lpt5N/qye9EC89gIWWdi9j5Quupm714Spaf4Q2unZv7zMQT8Sqf3yGsI0Ks91om1n9rntmU4QhCCPkyfk28PvdYtV+Br6FdiKW2dGEXY+0Rx8oNY7q9WFpn95ibuIU87iVNnzu3g3KopZhD/jSNZaRTUUL9H0W0tAylpNM8UJ5M0l2buu3v9HqcA+WojeW9AXFeJd6rgM7IEj6XAYs4M/WP9V5JnpZsCggh38Z1jHhCOH0MXD9nE+M7iL8wadae+1TwW/4ZLvL7Ub6H7qHX7RLLc5DvtcStEsoxVvYayllKWW25U8PR1DmWu5TfL5H60PyuIJwg7tHkD+/nnhA2Js1FoL6ueSkiae3M+3KAZ4jPZPVxy+ZJZWFgYGB4anh0jPiecbczWHc+V7POzG6MdXYGd2XhbmcNZyZ+BpbrCu6Ti0t4524nHuXyXePuXHw28r1u+SlucJyd3bvfJ521YPXFZgf3Up/q6scx2qv7+EVCMyGPWeTd0PHhFeR/Zqz3HVioWo7FiMejkjIv5Xq0iA8er4p6LbbsdhNC/kamCnFuROArJsCsJG2fu9DO0lY3pRViFL0NiLbOoJ6b9LVh7zyin4qKe+ZxY99DDp2Bs4ilTyCXRsRWkU6ATnx7dGhBx9yrEfd9ZkRb4xzl88nEvwrm64ibvfJ0qHDS1hvkTd/VuYQcOlg5/+sTQn6iEGceC+uRiUJnj7Cs5D6+pSu6rrgD8Wk9VmIZEMBmxGLsTUcjxSK0QlBIHi+RDkrl0mZaH6CTMBvJU2eESzsei0geUp/5wROOUMaxSXSd+31WdOeG5Us5PKtXEcwxT0Nnnhc+6yV0Rkqotz3EXUu9aMeMgkwI+VFCXHhENHPPm7WbSQO6B+sSw0Ya4B003O8eq9S3NErzf5Tg6xSkcHTDJiG6pOhiLMx9xAreQ7xqxLrWtdVvkTyVUrbWWNO6ocXJ04kqTL0f3e9rhFXwdBbz3g0Tx673eoEQqr83dzsr2naGdOb0uxsmTo11YuZyv5l5du9QpwXUgS7DOrlhlnoPdXBgE0AI+W6mzJq2QtyBFfuMjRJ6d7u8xZIys7UDcSs9+W/But7fYRGjKH6Apa2C1ovVtTHp+sR4I4K7NBatitEcxOLsbjfAwPq3lmVpntMsIN5Yds1PlSD8Uzou6M3AsXpd3nQ2Hotayqv12AQ8FwspQw+dsb18z4wHx2eRq+s6lzru2BQQQn6iRdzB78+0in2WIaJjjL57bsHCmpuGvAHrrvGU5xFU2NbgKRgTYmz4N0aEcze4VNeSXxwHztywRnfpsYRxLHkeyGsWyI+uHX60XnRpkm5dqWPnWze4oEPj3Xu5tnZ+93oB3hGbzh68NTps8Srf8T3tPO8xIYT8KCFuTYN2z37HC7FMUBRW7nataetux/JUiAoR6V3AWotNkMrc7xPPioBQpgpxC8KfT0gHLbitiIdPwHNP/fs6Ijo2Ogvc3yduuJlK6x6fyOXbjzuT33CnLV+oTDqIjk+r92HlhnHrnXRQZuAZOEAnALfV1Alcb2wCCCE/RYgLEAJ1ZTp3u81iPfHea4/obEUodpC+ThjydQbmE4Vfx3jxZKaU7S9j5G5wkeKyrNCSGSt8Wq/nhE7QmLj3CdasdhqsmOsuV88Q4iaQt17y30FZltBx0DHnNtABKczvJdQzTvTKjZWNeejg3erZBBBCfooQr4xY4mcct1tMuHcbaKzPbpi4gw3rxjTEW49lqdaRnqp0MA237kuMrunO03ifTbwsIsJzj8W5j4gmbut4jzfCJ1R9wnPsA/dUocwTxDxFiLWj9e5ut7J8A6FWd7HthKhIbs3vOGta3dxjB0+c+V+cEPL/IMR44EDrEUCc9FS7+NKcPLGBtKJegSD53M+9u10Wk3ks8MYjbvuIZbmKCBwuw9JtFHVrTs1H/qBQLAL1bS35NuFZzh4Q/SlsJf4GOka+ddbq9dDZ6LUb1hOvPdcu4W99pAwp9bthM0AI+duFuIZGzWdJLU2DqLOBx0gdg7UzgO2BB2Pp7kesTT29B93sIfdv6lm2ujxKre5e8n9y08779dVBMWJlT1kLm2J949GTj86Gx3Fire8s0CHRtdK6Ftu3zrcZefbaYcRO2DmhrHRPE0L+aiHWWct9pBGfexo430lH5YgVaq1RtXp1N6gt5GU7IsQ4MzdmYTYRa3gXaKjtjlGliM7M3Y5JNsaqvOewCdxdy1fPqaIzRfidm76zmC+djRHadSSfuDmLdmx8HpVK0sZjFis3rNF2Ce+Zvgd0XxNCvpVfEUtY9/WNzS7VnY1qI1ALaVCX0LjGxOjN3bqvZ8ZSa6ARbU1DmiIeJeRj7bEsdaw5g+usuOD+z5UbNiLxncDUyG+6tAZnfuskuGVA8GvIw7t8Vtd3bjwGz1iGozubNQ9awyV4RbYTRX3phrF9rSct28X5l17NoW5X8E62kbKW7jlr4Akh5H4Cp/Qc5ZSccuIpEitz6pD9+0F+z82JP/b0pdAJPhf5vIDTesbyWHpOPToGTo46fIQpPacI6Wk+BZz2dA9V4ilDGBYmjZTTl1ygvBdzulXoxKrUE6RKSceehlRLvdu6WkRO+SpGnlHodK7dyLO9mDxcePoLAwPDd4ZfHgssFwvmnok6W7BM2oDruAXL9+Rul0WNLYHSNDWPLVg2qXldGSvb5j0Hi1VnEeOWlbq8ag9Wnq7bPbj08WQ34j4tpIyduNh9lnLjhp2qfBtbTEEnkx2cfzerqZbwyvkPqFCviN1ysw88i9oNO2Gh50WXX+lypQy8N+q+bz0em9IzrBC6PyGE/DFermr8jaxAYNsvSF/XN/eQfvNgmtWIO1MPfsgTRfnscftXie7SKQdUpLhmY+tqVWRjW5HG0B2zujs6fFqvmueD6SzF8o+ndek7wfXEhJB/WogJIYSQf5r/WAWEEEIIhZgQQgihEBNCCCGEQkwIIYRQiAkhhBBCISaEEEIoxIQQQgj5Gv4nwACfD74CwtQTQQAAAABJRU5ErkJggg==', '主页面标题logo', 'png', 2);
INSERT INTO `t_ui` VALUES (6, 'iVBORw0KGgoAAAANSUhEUgAAAfwAAAHDCAYAAADBfqhrAAAACXBIWXMAAAsTAAALEwEAmpwYAAA5omlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS41LWMwMTQgNzkuMTUxNDgxLCAyMDEzLzAzLzEzLTEyOjA5OjE1ICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiCiAgICAgICAgICAgIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiCiAgICAgICAgICAgIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIKICAgICAgICAgICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgICAgICAgICB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIgogICAgICAgICAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyI+CiAgICAgICAgIDx4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+eG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQ8L3htcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+eG1wLmRpZDo0QkU0RDEwNjRENzUxMUU2OTUzMzhCNkZCOTM0MUVGNjwveG1wTU06RG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOkluc3RhbmNlSUQ+eG1wLmlpZDplYzE1MzU2Yi0yMDJmLWUzNGMtOTUzMi03ZGIxODQ3MGY5NDk8L3htcE1NOkluc3RhbmNlSUQ+CiAgICAgICAgIDx4bXBNTTpEZXJpdmVkRnJvbSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgIDxzdFJlZjppbnN0YW5jZUlEPnhtcC5paWQ6YjFjMDM5MTktOTE5ZS02ZTQ3LTg4N2UtN2IwNGNkMjM4NmFmPC9zdFJlZjppbnN0YW5jZUlEPgogICAgICAgICAgICA8c3RSZWY6ZG9jdW1lbnRJRD54bXAuZGlkOjhlNGZkZDQxLWM4ZjYtOTk0NC05MTVlLWFiZDE4NTRhZGQ5ZDwvc3RSZWY6ZG9jdW1lbnRJRD4KICAgICAgICAgPC94bXBNTTpEZXJpdmVkRnJvbT4KICAgICAgICAgPHhtcE1NOkhpc3Rvcnk+CiAgICAgICAgICAgIDxyZGY6U2VxPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmFjdGlvbj5zYXZlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6aW5zdGFuY2VJRD54bXAuaWlkOmVjMTUzNTZiLTIwMmYtZTM0Yy05NTMyLTdkYjE4NDcwZjk0OTwvc3RFdnQ6aW5zdGFuY2VJRD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OndoZW4+MjAxNi0wOC0wOVQxODowMjo1NCswODowMDwvc3RFdnQ6d2hlbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OnNvZnR3YXJlQWdlbnQ+QWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmNoYW5nZWQ+Lzwvc3RFdnQ6Y2hhbmdlZD4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgIDwvcmRmOlNlcT4KICAgICAgICAgPC94bXBNTTpIaXN0b3J5PgogICAgICAgICA8eG1wOkNyZWF0b3JUb29sPkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cyk8L3htcDpDcmVhdG9yVG9vbD4KICAgICAgICAgPHhtcDpDcmVhdGVEYXRlPjIwMTYtMDgtMDlUMTg6MDI6NDYrMDg6MDA8L3htcDpDcmVhdGVEYXRlPgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAxNi0wOC0wOVQxODowMjo1NCswODowMDwveG1wOk1vZGlmeURhdGU+CiAgICAgICAgIDx4bXA6TWV0YWRhdGFEYXRlPjIwMTYtMDgtMDlUMTg6MDI6NTQrMDg6MDA8L3htcDpNZXRhZGF0YURhdGU+CiAgICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2UvcG5nPC9kYzpmb3JtYXQ+CiAgICAgICAgIDxwaG90b3Nob3A6Q29sb3JNb2RlPjM8L3Bob3Rvc2hvcDpDb2xvck1vZGU+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgICAgIDx0aWZmOlhSZXNvbHV0aW9uPjcyMDAwMC8xMDAwMDwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6WVJlc29sdXRpb24+NzIwMDAwLzEwMDAwPC90aWZmOllSZXNvbHV0aW9uPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8ZXhpZjpDb2xvclNwYWNlPjY1NTM1PC9leGlmOkNvbG9yU3BhY2U+CiAgICAgICAgIDxleGlmOlBpeGVsWERpbWVuc2lvbj41MDg8L2V4aWY6UGl4ZWxYRGltZW5zaW9uPgogICAgICAgICA8ZXhpZjpQaXhlbFlEaW1lbnNpb24+NDUxPC9leGlmOlBpeGVsWURpbWVuc2lvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgCjw/eHBhY2tldCBlbmQ9InciPz5maXT7AAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAXPSURBVHja7NUxAQAACMMwwL/n4QMSCX3aSQoAuG0kAADDBwAMHwAwfADA8AEAwwcADB8AMHwAwPABwPABAMMHAAwfADB8AMDwAQDDBwAMHwAwfAAwfADA8AEAwwcADB8AMHwAwPABAMMHAAwfAAwfADB8AMDwAQDDBwAMHwAwfADA8AEAwwcADB8ADB8AMHwAwPABAMMHAAwfADB8AMDwAQDDBwDDBwAMHwAwfADA8AEAwwcADB8AMHwAwPABwPABAMMHAAwfADB8AMDwAQDDBwAMHwAwfADA8AHA8AEAwwcADB8AMHwAwPABAMMHAAwfADB8ADB8AMDwAQDDBwAMHwAwfADA8AEAwwcADB8ADB8AMHwAwPABAMMHAAwfADB8AMDwAQDDBwAMHwAMHwAwfADA8AEAwwcADB8AMHwAwPABAMMHAMMHAAwfADB8AMDwAQDDBwAMHwAwfADA8AHA8AEAwwcADB8AMHwAwPABAMMHAAwfADB8AMDwAcDwAQDDBwAMHwAwfADA8AEAwwcADB8AMHwAMHwAwPABAMMHAAwfADB8AMDwAQDDBwAMHwAMHwAwfADA8AEAwwcADB8AMHwAwPABAMMHAAwfAAwfADB8AMDwAQDDBwAMHwAwfADA8AEAwwcAwwcADB8AMHwAwPABAMMHAAwfADB8AMDwAcDwAQDDBwAMHwAwfADA8AEAwwcADB8AMHwAwPABwPABAMMHAAwfADB8AMDwAQDDBwAMHwAwfAAwfADA8AEAwwcADB8AMHwAwPABAMMHAAwfAAwfADB8AMDwAQDDBwAMHwAwfADA8AEAwwcADB8ADB8AMHwAwPABAMMHAAwfADB8AMDwAQDDBwDDBwAMHwAwfADA8AEAwwcADB8AMHwAwPABwPABAMMHAAwfADB8AMDwAQDDBwAMHwAwfADA8AHA8AEAwwcADB8AMHwAwPABAMMHAAwfADB8ADB8AMDwAQDDBwAMHwAwfADA8AEAwwcADB8ADB8AMHwAwPABAMMHAAwfADB8AMDwAQDDBwAMHwAMHwAwfADA8AEAwwcADB8AMHwAwPABAMMHAMMHAAwfADB8AMDwAQDDBwAMHwAwfADA8AHA8AEAwwcADB8AMHwAwPABAMMHAAwfADB8ADB8CQDA8AEAwwcADB8AMHwAwPABAMMHAAwfADB8ADB8AMDwAQDDBwAMHwAwfADA8AEAwwcADB8ADB8AMHwAwPABAMMHAAwfADB8AMDwAQDDBwDDBwAMHwAwfADA8AEAwwcADB8AMHwAwPABAMMHAMMHAAwfADB8AMDwAQDDBwAMHwAwfADA8AHA8AEAwwcADB8AMHwAwPABAMMHAAwfADB8ADB8AMDwAQDDBwAMHwAwfADA8AEAwwcADB8AMHwAMHwAwPABAMMHAAwfADB8AMDwAQDDBwAMHwAMHwAwfADA8AEAwwcADB8AMHwAwPABAMMHAMMHAAwfADB8AMDwAQDDBwAMHwAwfADA8AEAwwcAwwcADB8AMHwAwPABAMMHAAwfADB8AMDwAcDwAQDDBwAMHwAwfADA8AEAwwcADB8AMHwAMHwAwPABAMMHAAwfADB8AMDwAQDDBwAMHwAwfAAwfADA8AEAwwcADB8AMHwAwPABAMMHAAwfAAwfADB8AMDwAQDDBwAMHwAwfADA8AEAwwcAwwcADB8AMHwAwPABAMMHAAwfADB8AMDwAQDDBwDDBwAMHwAwfADA8AEAwwcADB8AMHwAwPABwPABAMMHAAwfADB8AMDwAQDDBwAMHwAwfAAwfADA8AEAwwcADB8AMHwAwPABAMMHAAwfADB8ADB8AMDwAQDDBwAMHwAwfADA8AEAwwcADB8ADB8AMHwAwPABAMMHAAwfADB8AMDwAQDDBwDDBwAMHwAwfADA8AEAwwcADB8AMHwAwPABAMMHAMMHAAwfADB8AMDwAQDDBwAMHwAwfADA8AHgmQUAAP//AwBXswaDnQOSbAAAAABJRU5ErkJggg==', '登录表单左侧图片(透明)', 'png', 2);
INSERT INTO `t_ui` VALUES (7, 'iVBORw0KGgoAAAANSUhEUgAAAmkAAAA7CAYAAAAgqB0HAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3FpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RjAyNDJGRUY1MjRCMTFFNkE4MThFRTUxRjA5MTY4MzEiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RjAyNDJGRUU1MjRCMTFFNkE4MThFRTUxRjA5MTY4MzEiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOmUwZjE2MDk5LTE4NTYtYzk0MS05MTAzLWNjMDkwNDY0ZjJhZCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo4ZTRmZGQ0MS1jOGY2LTk5NDQtOTE1ZS1hYmQxODU0YWRkOWQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz6VZJ5xAAAUEElEQVR42uyd3XHbOhOG19+cBnhucs+UwJRAl0CXQKUDqQSxg0glmCWIJVglhPe5CUvQZ2awRyt4QQLgjxX7fWY0tmWJBAGQ+2KxWDxcLhcCAAAAAAD3xf9QBQAAAAAAEGkAAAAAAAAiDQAAAAAAIg0AAAAAAECkAQAAAABApAEAAAAAAIg0AAAAAACINAAAAAAAAJEGAAAAAAAg0gAAAAAAINIAAAAAAMAc/BP6hYcv3z9L3WSvr/MK59man/Xrqw34XmLKSKacHboz+IDk5mczx717+fUDNQoA+Gv4iJ60dKbjvPTPdPNz//oqFirv3rx+vr6ehVHyMUQn8/otyrqdQZzmE4+RmLL013SY4XhLCGN+laa8S3EybXMxvx+EuJ5LxOwXvgYfCnNtF9Pu5YxtxX384Hl/56IczzOWBQAAVuXhcrmEfSHck8aGsBWvhpbzUp3Mz0oZfafmQd+/fyS39yk1D3ibvuyPFObxGhOU2nkePTwHubhWyc5ceyylMPqdKQfXV6jYexF/98d4ovvw+J0s4diXq17pXJ1p36n9PzHtxAKkP96G1vH+ct/NxUsTiY3jPgzhEtnH99aApb9nny6/fpwJAAD+EtbypPEDnQXAixkZ7xc6HwuYkxnhsyF5Fp6HodG+a7R+nFGgkcOjsptg1JqJAo2vcSOEAHtIXgKPc7auwyUq34Paut56xXNXA0Iq87yXtP7LntVyofu3MKLn2dy77CUtyO3F4zY/UJynrxgY+GUe/di+htPrIDMlAACASPM25EvC4iwzr8TyRLimnrT3lvAApco5fEWWJuTmEpC1YuSyGQTAHFOpc4u0ezLaPEW8VcpVGIHE/9dED/fpMrIv8kCKxRhP1fK04X5ElLkozTGyiPtXG8T86/HsaJX7IaHlwhYAAGB2/nnHcz/RtGmQEIPciId+aj3wzx7GoTXiiadK5xKX+YjwYsPpO9U4p5evUYx9SFmGhJrW7lt6632bIn5Ppn1rh+BuhIi/F86mfjhOkftaaNzcwVyjy0NYiIFLOkGo2gtWmpEBWOhAp1Du5RBPcXtnIhwAAP4akXYvRtFHPG2MAdobj8I3msezlg2ItMSci71PG1o3nqvzMJqx4k8TaHshnKdO2bIn6tmcTxPjjWjncgbxuUSd5zQ8hX2O6NtSXDUB/XQvyljRcEznHNjCtKPrNPzs9/zDl+/sgdxdfv2oCAAAPrlIu9cRbqEYczZmlTFWvZfmiaZ5ruzpV1vA7IWIK0x9PQrDuLQHqPEUbkMcrevU4rGkAODrTicY5JRuPYB9Pb2Yc+/E+7U47/ZORJrGEoKhDei7Gd0G4POCha0pW7XSffgU2f/kfVK9CrBGEWil6DP7Pm7t9XMbAgCATyzSlkoZMHXKLx8YvVd0nSp6Mf+rA65XBlBr139wlEOKmU2k9yRWqOXW9bOR9q1nFmrsvdmOGGP2opwjhdN25P2d6Cd8fakQHWvBKzN34jrbO3s+FOQO+m9N3cn8fgldvZJTvGyZ0u8aIcJb017tyHn4/uWVyu2rAMsd9+VN/+tXsUOoAQA+g0jLHA/4bKHzTTF0Cd16YSrleBsj0Hg6sjaGduy8nfEGMPZKxzmm+WwDm5ljxhrMJ7pN8cCGshaGTxMfmSUcd45rbgdEZxfZ10rHsSpFUNdCDOxpvpi4MUohGg9CzN6TSJNT0LZwd6XV4NWeJV1DBGLrR/aRSgi0n6adahr2xhfKM8a1MGcHUwAA+KwiLVlZpE01nlJcaA90Fh17YQxyCo/TGVs0MFUYH4TojI0hchm1ZuQ7thByfX4z83XvHeVx5SU70u1KymeKz2GWOc6fKX0sUcTNvewYkZs6yZW6Og7UDQs0FlOnyIFHbt2HcpqzEHXKC1A2pK/i3DqeRcnl1w+IMgAARNoADS2XI20OkTYWpFzR7cpAGadTjwgTaWykaD2PlKsdOQa/x6IjscpW0ryJeO8NTVj4JI7lVbtcV6dIoaaJ+tQhxmvHwOU94jQTIRxzRVQeSfco2wKtdIjmnPzjyTIjlBl7wYe22lgLO9BSlLi8qQAA8KlFWjIyal56emkvDEQ2IoRSh3HQeDIGPVMMXikMsmagNMPN00ss2HhKh4O8fTyPNV1jvy6Kkfqo+3umiufEN7P/ka7eUCnUYlLENCPtzGJsqT5fmn6yC2jrjtx519hzljpEGk/5uxaxtKJ9zh5lPwyI3lIRsWdlQFQqfeG/3RiwdycAACLt7ehY8zrw/5YWaTKD/2nAoMjAcp+Adfa2nRwGrh4wltoK0k4YNM7wnojyawKgdIgErc6/zVyvvIODj+dwaZ7pbbqGEG9YZfULFmpT4wTXnNLn6dbE/B6y+rgm3RNWKn3+LH5qwonFWUVhCz9a5Xp+0zVOsHTcf2elDmyh+d99+PDlu1zA0xjh9p59FwAAnLzXjgOtQ6y8FzxFePQ0yrw599khBo4DRlLL2F47hOwuok6J9KmeKcbfJTbYc9gLmphNtROavsrXXqgQszemKxfZnqZtFh6aJiW2nRJLqPLqY1+ReA44T2768J70HTN2ZkAQujK3GTifdi5NoMkBE4u4m/yCr4KM32/Ncfuton6+vrZGwAEAwKcRadmIoMjo/RcQ8Ohb7lk5BO8/ujcjchZqtTB4mwDDXY8Y7MxTzLYzGGGtbk7G4NteSNtophSXu433doz5Lge5y+v8Gnm9rinu1JSPxVoaWL5QsWVz8Xj9VsrlCp4fEkic4Ja9wParHeirO1P3U1YTN6Ivcxm0cAE7tmxrCbTzkFDshZpJr1GLNv6zp7CSogMAAN6Npac7k5EHMScenTMfUaiBONA1/UEx8n022FKw8aj+yRjloe8XpE91Dp2PjY+djDWJEMe+gqcR5U3E/3NRjkQRiRyn5ysQOS0JCyDXaj1X3cgg85tprQgxuqXrqt1spO15um9oc/Z8QORzjFbtUd4H5bgnRbRMWbHYKuexz+nynNkrhzl58TmiLTbKgGNv9bVaXOue9FjE2jWw6fOfDQxseBP2b68ibul9hQEA4N1F2tBG5SzSignG1WVwQsrHqQVyT3Gz8/AE+IgKaXSGBGQivAWJMGRpgBjyqRNXypHMs21d5fJpr6MRL7xab2y60p7eqyZ4cPhY3BcrD6HL8Ux1hFDm3GwcKD+l7D59cgq8IKP0EGfyfwdz/ewR880B1zrEs+yjG+t+2ypt47tynMW23VZbus1pCAAAH1KkpQ4xwD9zus3ltZQwHBImjXjgLxlAzJ4mKbw6IdwS5Trs5KqpeN8lfmNFms9ejo0QBKklPJpIkcbHLUU9DKXB4P9nwmi35r3O+pwrkbKWV0sa6HbIG2POORZzVQzUcyXafWvK+XhHzwWOOwsRZ7J+H0UbcfxmjKfzYJ37kd5u6O6buqQT99OfFdSXXz9aE4f2e6A/AADAhxVp2YBg6CzDuPSGzTFlT0e8JWzQG8+ys5jhGCwpROxprHOg4W4jherUth3LKdd41ovmDXl0CLSU3q68/KaIpGdFlGurXLV4u5ZukxYzPqt/05E2qBVRlEWK6znbk6fjU6UcIas1O0uoEV09pU/kFzO4t/rYo+MeOypt9EaQ0XWRStuLM/5gH5/2KtTs7c8+aqoaAMBfxnssHGgU451Q/Aq6OcqojZzPRoQdRgzJsxmJP5OeTV4zYL2h+pem7bWpbXnj8gTMbXSkQZOr5/IJ5+1GhAsLNBZaY57XNFIwSiHVn+OrJU58hErMquVkZZHG+cROpv++0O3uC1wHj0od+LanHfTPU/5j9wh736RAO48MfHZisMB5BlvxkwdB/UrOy+urXyRQOPpFRQAAcAcs6UnLHcKns35PhOBpaP5NwuUDP3MYx5/kTqVxEGJkyKiyF2JvjNrSo/EkQIDMbewzYSDrAWEUIorOSp9JrHPuAo45RfS0dLvp+YauudR82tVHpNnTqWtvlVbQ+OrTguZPk8OLhSqlvThWL7fuwYRukw1rQpJhL7U8xpOjD/85zuXXj0osKGiwaAAA8FlFWqMYqtJ6wM6ddFU+wLVktiwMOXnpURFppSLUXEl6pwaBDxm3XJQrGxAfSxv7gvTN0bMJIs3ljYk9VubR/1yfbUeE29h55TRdR7pXr6Lr9l07Wn+7rori0p74CNzWqu+90n8q5b3DyCBL9gvfBQk8kLCPsevFGf8hfwcAgHthyelObfryOGI0XZtUz2Hkxx7kCel7EDbieraWaNIM31x7A/LKOp6O+knXHRrk3pxaPSYeomNKuVIa3+7KV9RIgWv/Ped0cDtQD3MGihfWAKEduN5+QPJV9Jk1c3Q1gf3irHynMkK9v44H8/pqrvuRritXzx73pY8I54HBV3qbzNbFkQAA4C9lKU+aFpuljXp5b8rUGjmHGnhfwz9ksJjDwMN9L8qsCaEQgZYLMZEoBjoVgrWy6q8IvM525rbVEr9mVjuGeibYm8RTilM8G9pOBiGeuHbCeaXXdeq02dLbFXHQfSdEcSfKrQnbreiXW/G5IUFaW6L56KjzjtxbrB096iOZMFADAIBPI9K06YlqxFCQJZSmelJCaJXzuzwNW2OA88ARO2+8HjIVydtUjU1nNgP/c8HTp6FiuHa0S2mVJ0ZkH2cS5z5T7UOGPVak8eBkE3kd6coC4ygGHbJ/dwH3nhRoOelJbI909cAOJQBuxACkE/3Btz2yCQO1G/rUHGYLKQAAeDeWmO7Uts6pBh60rtQbJ5oeW9VMvI4hAZAq4mXMmGWBZXdl3y8sIzS0b6er3mMDws+OOimFcX3vRKDaKtM6wLDHwF60p0iBltC0hRcxdFb/4C3P+pWev81gpfDo162od14paqfQ2NDt9mmuvsWpT75SeKxe5tn3RwUazRt2AQAAdyHStIfb2KblLi8bp1yYkppjzpgm6e2wDarPaL+Z+H9ZrjTge+2ACJ1DBPTleRb1zStbOZ6OA7+fV+rTqdJnqpE+61tnY/XwRPExiblDsKyFfe+y6Ozb7Sf5JYzlvTY5nvLFfHfv+f0jTdv/M51DpNF1YQwAAHwokXawjN6Z/LascYkcDubfk39wdx4pfEKMp/15X8OsBVDLjaljjPkx4FqkQEtmMES8ATuvUPwmjCvvJ8lpSYqV+rQ21X4MMOwUKRCmpo/JRtp1jXpLHMJrE9BXOCVGJ+p3a8TaYeQ+7iLqbDtQh7GDkILWC7UAAIBVRNqW3k7DPXo+eMey1vOo3Gf1WxoonMYElZY2JLM+52sMGoc4CxFLduzX2HddcXVTjVBpBFo9IDLPNDz1uUT+NtuLthnpg/kK5fIVBrLe1hRppSJuOdasihA7rnu/JH+vnHZfF3S74vlZtJW2DVhwH3/48p1jNRGPBgB4d+ZaOMDekhiBJgWHtg2PfEif6BqUrokwOQ0Zmv5Besik92VnPAAc9FzR7fZNx8BrnLJyMbcMnI+XUludl3oKkUxpA95vtX99ixSJXPa5xdBBOcfYJuj3INLsrZg2K55bS3tTe4hbn3uqUo6d0HXxjes+5221WHhpu4JwTsNOEbnchjGetD9iFQltAQAfRaRllnE8TjAynOCzHBEqOV1zJmkrG2M2S38UAkR6qLT9HjNhCI6WgWlHRNqUOLCtZaTOHsKKhUgmDCQNeDN4c+1CMYwslM8UttdqLeqSg/i7kT6Vkt+m78ye3qZ5qMTxtGvZD5R1TUpLoK0lEOR0Nffn3Yx1UJG+kCh1CFWfuMVG6fsJvfUEjj2D3pTh4cv3/xbAYHUnAOAjiLRSCLS5HvAbxXDZo/OxlXqVImo0ASPpPMsuDX6l1MUUkUoe4tQWIKR4KmzjVziM1NY6zrPjs5x2oxCejQNdU5U0on00jg4Rlljek1QYz5AN5u29Hu2dIxIhPsem2pqV78Gt1a7HyL4RsyPDyerLMmBf9vNG1GPoalgtxU4eUe+dKKPd30/01hM5drzciDKXaN/Tuh5NAACYTaQlwjDywzPEsxIj1HzED283I0XDlubN5J4LUXoUBu0gypxR+HTvGAchmHYzXktlieBCaYujMORby5jlNH+m/C6g/uQuEa60JY3wwGzJPaUem98tFhn4vpS4d7U7b3TuqrOErvt7phPOpYm0ztHmZ4cIdE2/8obtmaO/DsFeYecA9FXE9ft4vodnFQAAokWaDDKOTdrpK9Raumb5952+qBTjfHIICW2aZIzCEoBEusfuNFGo2bswpJ6GvAkQTUflb7nKT2tfFsHPE4332DV0HvXDBroh/wD3iq4eQbIE6pr53RIhvJe8j7T79+BRZ9JDOiRsfQT30RpwuYSPvShHC2mQ94Tsq9o0qN2+MWUHAID7F2lm1dPePDifaJ24Gd73z+dcGbmDnbXNpM/GKKSBYkMryxzG3RW3k9M10ProWWcdXePrXB6LWvGesFd0T2+nDO06+GY+Vy7Q7mPtvaVrnreYGC7bY3M017uEUc4cAu1EV49hSPmTiX2sL89XClsc4Yot8xUyFV2nuIc8wWfrO3a+NM7dJsvCi4h88hC6PHVqWS6/fqw99Q0AALfa63K5hH3hy/e/8TrZs8UJQnmq8p5GyjK+rxNegS0tsxJySAQ8k388GC/0yGm+7P07csfclcI4T+kPvPhk6aSx0ovL3p6S4tNs9GV/scTMboV+sadbj/ESYQ5krm1niS65mKUVgquO6NsFvU0Ibcf0/Zn2xsIBAABEGrAFDwnRkNHfl1Qz1DOpejEIU00+Ym3NvpELcRmSG3CuAUw7xzlfhRd6DgDg44o0AAAAAACwPP9DFQAAAAAAQKQBAAAAAACINAAAAAAAiDQAAAAAAACRBgAAAAAAkQYAAAAAACDSAAAAAAAg0gAAAAAAwJ3xfwEGABbCK/WuAyDDAAAAAElFTkSuQmCC', '登陆页标题logo', 'png', 2);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `is_system_account` bit(1) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `IDNumber` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `person_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKik2khmnq9xqoiqa77a7qakxjp`(`organization_id`) USING BTREE,
  INDEX `t_user_ibfk_1`(`role_id`) USING BTREE,
  INDEX `FKCB63CCB6955CEB54`(`person_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10028 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, '系统管理员', '', b'1', b'0', '2017-12-03 22:39:47', 'e10adc3949ba59abbe56e057f20f883e', '15604516942', 'admin', 100056, 1, '12', '1', 116, '/static/upload/portraitImages/1513992973050.png', NULL);
INSERT INTO `t_user` VALUES (10026, '姓名1', 'dsaas1@qq.com', b'1', b'0', NULL, 'e10adc3949ba59abbe56e057f20f883e', '13666666661', 'yhm', 100063, 2, '231', '职位1', 117, '/static/upload/portraitImages/1517204540934.png', NULL);
INSERT INTO `t_user` VALUES (10027, 'admin1', '', b'1', b'0', NULL, 'e10adc3949ba59abbe56e057f20f883e', '15604516942', 'admin1', 100001, 2, '123456', 'asdfas', 116, '', NULL);

-- ----------------------------
-- Table structure for t_user_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_operation_log`;
CREATE TABLE `t_user_operation_log`  (
  `id` bigint(20) NOT NULL,
  `execution_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `handle_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `handle_method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `handle_page_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `request_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trigger_date` datetime DEFAULT NULL,
  `user_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for worktime
-- ----------------------------
DROP TABLE IF EXISTS `worktime`;
CREATE TABLE `worktime`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endtime` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `starttime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wxenttime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wxstarttime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
