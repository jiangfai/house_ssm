/*
Navicat MySQL Data Transfer

Source Server         : qwer
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : house

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-08-04 21:03:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_district
-- ----------------------------
DROP TABLE IF EXISTS `tb_district`;
CREATE TABLE `tb_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_district
-- ----------------------------
INSERT INTO `tb_district` VALUES ('8', '其他');
INSERT INTO `tb_district` VALUES ('4', '成华');
INSERT INTO `tb_district` VALUES ('6', '新都');
INSERT INTO `tb_district` VALUES ('1', '武侯');
INSERT INTO `tb_district` VALUES ('7', '温江');
INSERT INTO `tb_district` VALUES ('2', '金牛');
INSERT INTO `tb_district` VALUES ('5', '锦江');
INSERT INTO `tb_district` VALUES ('3', '青羊');

-- ----------------------------
-- Table structure for tb_house
-- ----------------------------
DROP TABLE IF EXISTS `tb_house`;
CREATE TABLE `tb_house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` int(11) DEFAULT NULL,
  `contacterEmail` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `contacterName` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `contacterQQ` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `contacterTel` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `mainPhoto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `price` double DEFAULT NULL,
  `street` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `totalFloor` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `house_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFA352E0FB54F4942` (`house_type_id`),
  KEY `FKFA352E0F1B780D73` (`district_id`),
  CONSTRAINT `FKFA352E0F1B780D73` FOREIGN KEY (`district_id`) REFERENCES `tb_district` (`id`),
  CONSTRAINT `FKFA352E0FB54F4942` FOREIGN KEY (`house_type_id`) REFERENCES `tb_house_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_house
-- ----------------------------
INSERT INTO `tb_house` VALUES ('1', '20', 'jackfrued@126.com', '王小锤', '123456', '13548041193', '堆空间发了康师傅简历看得释放旧 ', '12', '5875c33b-959e-48e5-8fdd-9cd3665eefa1.png', '3500', '四川省成都市一环路西二段17号四川省旅游学院', '二环地铁精装拎包入住好房', '20', '4', '6');

-- ----------------------------
-- Table structure for tb_house_photo
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_photo`;
CREATE TABLE `tb_house_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDF0FC80283FDE9E1` (`house_id`),
  CONSTRAINT `FKDF0FC80283FDE9E1` FOREIGN KEY (`house_id`) REFERENCES `tb_house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_house_photo
-- ----------------------------
INSERT INTO `tb_house_photo` VALUES ('1', '5875c33b-959e-48e5-8fdd-9cd3665eefa1.png', '1');
INSERT INTO `tb_house_photo` VALUES ('2', '83fe2bdb-8bf7-4861-963c-fe8d105e92ba.png', '1');

-- ----------------------------
-- Table structure for tb_house_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_house_type`;
CREATE TABLE `tb_house_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_house_type
-- ----------------------------
INSERT INTO `tb_house_type` VALUES ('1', '单间');
INSERT INTO `tb_house_type` VALUES ('2', '一室一厅');
INSERT INTO `tb_house_type` VALUES ('3', '两室一厅');
INSERT INTO `tb_house_type` VALUES ('4', '两室两厅');
INSERT INTO `tb_house_type` VALUES ('5', '三室一厅');
INSERT INTO `tb_house_type` VALUES ('6', '三室两厅');
INSERT INTO `tb_house_type` VALUES ('7', '四室两厅');
INSERT INTO `tb_house_type` VALUES ('8', '其他');

-- ----------------------------
-- Table structure for tb_street
-- ----------------------------
DROP TABLE IF EXISTS `tb_street`;
CREATE TABLE `tb_street` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `districtid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5F7AC6F4739AB730` (`districtid`),
  CONSTRAINT `FK5F7AC6F4739AB730` FOREIGN KEY (`districtid`) REFERENCES `tb_district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_street
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` char(32) COLLATE utf8_bin NOT NULL,
  `realname` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `tel` char(11) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '王大锤', '13812345678');
INSERT INTO `tb_user` VALUES ('2', 'hellokitty', '4297f44b13955235245b2497399d7a93', '骆昊', '13548041193');
