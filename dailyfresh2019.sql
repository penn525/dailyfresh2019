/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : dailyfresh2019

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 13/05/2019 09:52:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add user info', 7, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (20, 'Can change user info', 7, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (21, 'Can delete user info', 7, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can add goods info', 8, 'add_goodsinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can change goods info', 8, 'change_goodsinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can delete goods info', 8, 'delete_goodsinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add type info', 9, 'add_typeinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change type info', 9, 'change_typeinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete type info', 9, 'delete_typeinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can add cart', 10, 'add_cart');
INSERT INTO `auth_permission` VALUES (29, 'Can change cart', 10, 'change_cart');
INSERT INTO `auth_permission` VALUES (30, 'Can delete cart', 10, 'delete_cart');
INSERT INTO `auth_permission` VALUES (31, 'Can add cart info', 10, 'add_cartinfo');
INSERT INTO `auth_permission` VALUES (32, 'Can change cart info', 10, 'change_cartinfo');
INSERT INTO `auth_permission` VALUES (33, 'Can delete cart info', 10, 'delete_cartinfo');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$36000$8yz5oyI0cEUr$ePlRMnLTp4iQqq3Qy4JDknvgs5yaZJEvywhToU3AIKQ=', '2019-05-12 09:46:27.926762', 1, 'penn', '', '', 'pengwu525@163.com', 1, 1, '2019-04-30 15:42:45.919877');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for df_cart_cartinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_cart_cartinfo`;
CREATE TABLE `df_cart_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_cart_cart_goods_id_3eba2d28_fk_df_goods_goodsinfo_id` (`goods_id`),
  KEY `df_cart_cart_user_id_5345f783_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_cart_cart_goods_id_3eba2d28_fk_df_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_cart_cart_user_id_5345f783_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_cart_cartinfo
-- ----------------------------
BEGIN;
INSERT INTO `df_cart_cartinfo` VALUES (33, 1, 19, 1);
INSERT INTO `df_cart_cartinfo` VALUES (35, 1, 21, 1);
INSERT INTO `df_cart_cartinfo` VALUES (36, 1, 16, 1);
INSERT INTO `df_cart_cartinfo` VALUES (37, 1, 15, 1);
COMMIT;

-- ----------------------------
-- Table structure for df_goods_goodsinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_goodsinfo`;
CREATE TABLE `df_goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(20) NOT NULL,
  `gprice` decimal(5,2) NOT NULL,
  `gpicture` varchar(100) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gintroduction` varchar(100) NOT NULL,
  `gdetail` longtext NOT NULL,
  `gstock` int(11) NOT NULL,
  `gclick` int(11) NOT NULL,
  `gtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` (`gtype_id`),
  CONSTRAINT `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_typeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_goodsinfo
-- ----------------------------
BEGIN;
INSERT INTO `df_goods_goodsinfo` VALUES (1, '葡萄', 20.00, 'df_goods/goods002.jpg', 0, '500g', '吐鲁番生产的新鲜葡萄, 个大味甜仔小', '<p><span style=\"font-size: 10px;\">吐鲁番生产的新鲜葡萄, 个大味甜仔小, 你值得拥有</span></p>', 500, 26, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (2, '草莓', 34.00, 'df_goods/goods003.jpg', 0, '500g', '大圩草莓', '<p>3,4 月份, 大圩新鲜采摘的草莓, 全国空运</p>', 1000, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (3, '柠檬', 10.00, 'df_goods/goods001.jpg', 0, '500g', '柠檬', '<p>酸得很</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (4, '猕猴桃', 24.00, 'df_goods/goods012.jpg', 0, '500g', '猕猴桃', '<p>猕猴桃详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (5, '杏子', 3.00, 'df_goods/goods004.jpg', 0, '500g', '杏子简介', '<p>杏子详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (6, '桃子', 11.00, 'df_goods/goods005.jpg', 0, '500g', '桃子简介', '<p>桃子详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (7, '李子', 13.00, 'df_goods/goods006.jpg', 0, '500g', '李子简介', '<p>李子详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (8, '梨子', 15.00, 'df_goods/goods007.jpg', 0, '500g', '梨子简介', '<p>梨子详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (9, '板栗', 44.00, 'df_goods/goods008.jpg', 0, '500g', '板栗简介', '<p>板栗详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (10, '香蕉', 8.00, 'df_goods/goods009.jpg', 0, '500g', '香蕉简介', '<p>香蕉详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (11, '青苹果', 22.40, 'df_goods/goods010.jpg', 0, '500g', '青苹果简介', '<p>青苹果详情</p>', 500, 1, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (12, '西梅', 25.10, 'df_goods/goods011.jpg', 0, '500g', '西梅简介', '<p>西梅详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (13, '橘子', 9.00, 'df_goods/goods013.jpg', 0, '500g', '橘子简介', '<p>橘子详情</p>', 500, 0, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (14, '橙子', 33.90, 'df_goods/goods014.jpg', 0, '500g', '橙子简介', '<p>橙子详情</p>', 500, 1, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (15, '奇异果', 55.50, 'df_goods/goods015.jpg', 0, '500g', '奇异果简介', '<p>奇异果详情</p>', 500, 4, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (16, '黄肉桃', 55.50, 'df_goods/goods016.jpg', 0, '500g', '黄肉桃', '<p><span style=\"font-size: 10px;\">黄肉桃</span></p>', 500, 9, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (17, '樱桃', 60.00, 'df_goods/goods017.jpg', 0, '500g', '樱桃简介', '<p>樱桃详情</p>', 500, 41, 1);
INSERT INTO `df_goods_goodsinfo` VALUES (18, '青岛野生大虾', 66.90, 'df_goods/goods018.jpg', 0, '500g', '青岛野生大虾简介', '<p><span style=\"font-size: 10px;\">青岛野生大虾详情</span></p>', 500, 1, 2);
INSERT INTO `df_goods_goodsinfo` VALUES (19, '扇贝', 88.90, 'df_goods/goods019.jpg', 0, '500g', '扇贝简介', '<p>扇贝详情</p>', 500, 4, 2);
INSERT INTO `df_goods_goodsinfo` VALUES (20, '秋刀鱼', 120.99, 'df_goods/goods020.jpg', 0, '500g', '秋刀鱼简介', '<p>冷冻秋刀鱼</p>', 500, 4, 2);
INSERT INTO `df_goods_goodsinfo` VALUES (21, '基围虾', 99.00, 'df_goods/goods021.jpg', 0, '500g', '基围虾简介', '<p>基围虾详情</p>', 500, 6, 2);
INSERT INTO `df_goods_goodsinfo` VALUES (22, '肉1', 50.10, 'df_goods/goods.jpg', 0, '500g', '无简介', '<p>11111</p>', 500, 0, 5);
INSERT INTO `df_goods_goodsinfo` VALUES (23, '肉2', 50.10, 'df_goods/goods_O7xY7Aw.jpg', 0, '500g', '无简介', '<p>22222</p>', 500, 0, 5);
INSERT INTO `df_goods_goodsinfo` VALUES (24, '肉3', 50.10, 'df_goods/goods_CoFziZj.jpg', 0, '500g', '无简介', '<p>333</p>', 500, 0, 5);
INSERT INTO `df_goods_goodsinfo` VALUES (25, '肉4', 50.10, 'df_goods/goods_VPGrM16.jpg', 0, '500g', '无简介', '<p>444</p>', 500, 0, 5);
INSERT INTO `df_goods_goodsinfo` VALUES (26, '肉5', 50.10, 'df_goods/goods_hGkfT0d.jpg', 0, '500g', '无简介', '<p>5</p>', 500, 0, 5);
INSERT INTO `df_goods_goodsinfo` VALUES (27, '禽1', 50.10, 'df_goods/goods_f96gs76.jpg', 0, '500g', '无简介', '<p>1111</p>', 500, 0, 4);
INSERT INTO `df_goods_goodsinfo` VALUES (28, '禽2', 50.10, 'df_goods/goods_cOkMWqJ.jpg', 0, '500g', '无简介', '<p>222</p>', 500, 0, 4);
INSERT INTO `df_goods_goodsinfo` VALUES (29, '禽3', 50.10, 'df_goods/goods_Wv6hRxt.jpg', 0, '500g', '无简介', '<p>333</p>', 500, 0, 4);
INSERT INTO `df_goods_goodsinfo` VALUES (30, '禽4', 50.10, 'df_goods/goods_2ibrj2f.jpg', 0, '500g', '无简介', '<p>444</p>', 500, 0, 4);
INSERT INTO `df_goods_goodsinfo` VALUES (31, '禽5', 50.10, 'df_goods/goods_aPPyQnH.jpg', 0, '500g', '无简介', '<p>55</p>', 500, 0, 4);
INSERT INTO `df_goods_goodsinfo` VALUES (32, '菜1', 50.10, 'df_goods/goods_mX9RGyF.jpg', 0, '500g', '无简介', '<p>11</p>', 500, 0, 3);
INSERT INTO `df_goods_goodsinfo` VALUES (33, '菜2', 50.10, 'df_goods/goods_XDBNG0m.jpg', 0, '500g', '无简介', '<p>222</p>', 500, 0, 3);
INSERT INTO `df_goods_goodsinfo` VALUES (34, '菜3', 50.10, 'df_goods/goods_liX2xsP.jpg', 0, '500g', '无简介', '<p>333</p>', 500, 0, 3);
INSERT INTO `df_goods_goodsinfo` VALUES (35, '菜4', 50.10, 'df_goods/goods_NqV1GMW.jpg', 0, '500g', '无简介', '<p>4</p>', 500, 4, 3);
INSERT INTO `df_goods_goodsinfo` VALUES (36, '菜5', 50.10, 'df_goods/goods_41ys5L0.jpg', 0, '500g', '无简介', '<p>55</p>', 500, 5, 3);
INSERT INTO `df_goods_goodsinfo` VALUES (37, '冻1', 50.10, 'df_goods/goods_C4KMRXG.jpg', 0, '500g', '无简介', '<p>11</p>', 500, 0, 6);
INSERT INTO `df_goods_goodsinfo` VALUES (38, '冻2', 50.10, 'df_goods/goods_1oSdUBd.jpg', 0, '500g', '无简介', '<p>222</p>', 500, 0, 6);
INSERT INTO `df_goods_goodsinfo` VALUES (39, '冻3', 50.10, 'df_goods/goods_gfNAXZo.jpg', 0, '500g', '无简介', '<p>333</p>', 500, 0, 6);
INSERT INTO `df_goods_goodsinfo` VALUES (40, '冻4', 50.10, 'df_goods/goods_xDPCgkf.jpg', 0, '500g', '无简介', '<p>444</p>', 500, 0, 6);
INSERT INTO `df_goods_goodsinfo` VALUES (41, '冻5', 50.10, 'df_goods/goods_C4mSZ7C.jpg', 0, '500g', '无简介', '<p>5</p>', 500, 0, 6);
COMMIT;

-- ----------------------------
-- Table structure for df_goods_typeinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_goods_typeinfo`;
CREATE TABLE `df_goods_typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ttitle` varchar(20) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_goods_typeinfo
-- ----------------------------
BEGIN;
INSERT INTO `df_goods_typeinfo` VALUES (1, '新鲜水果', 0);
INSERT INTO `df_goods_typeinfo` VALUES (2, '海鲜水产', 0);
INSERT INTO `df_goods_typeinfo` VALUES (3, '猪牛羊肉', 0);
INSERT INTO `df_goods_typeinfo` VALUES (4, '禽类食品', 0);
INSERT INTO `df_goods_typeinfo` VALUES (5, '速冻食品', 0);
INSERT INTO `df_goods_typeinfo` VALUES (6, '新鲜蔬菜', 0);
COMMIT;

-- ----------------------------
-- Table structure for df_user_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `df_user_userinfo`;
CREATE TABLE `df_user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  `uconsignee_address` varchar(30) NOT NULL,
  `udetail_address` varchar(100) NOT NULL,
  `upostcode` varchar(6) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of df_user_userinfo
-- ----------------------------
BEGIN;
INSERT INTO `df_user_userinfo` VALUES (1, 'penn11', '7c222fb2927d828af22f592134e8932480637c0d', '123456@163.com', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES (2, 'zhangsan', '7c222fb2927d828af22f592134e8932480637c0d', '123456@163.com', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES (4, 'penn12', '7c222fb2927d828af22f592134e8932480637c0d', '1234@123.com', '', '', '', '');
INSERT INTO `df_user_userinfo` VALUES (5, 'penn123', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'penn123', '', '123132123131', '12312', '4324');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (1, '2019-04-30 15:52:00.044488', '2', '速冻食品', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (2, '2019-04-30 15:52:24.694231', '3', '新鲜蔬菜', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (3, '2019-04-30 15:52:35.395173', '4', '禽类食品', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (4, '2019-04-30 15:52:57.349830', '5', '猪牛羊肉', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (5, '2019-04-30 15:53:04.756519', '6', '海鲜水产', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (6, '2019-04-30 15:53:11.153825', '7', '新鲜水果', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (7, '2019-04-30 15:57:29.007484', '1', '葡萄', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2019-05-01 00:28:31.041027', '2', '草莓', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2019-05-01 00:30:57.954565', '3', '柠檬', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2019-05-01 00:31:59.261209', '4', '猕猴桃', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (11, '2019-05-01 00:33:29.579041', '5', '杏子', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (12, '2019-05-01 00:34:08.010586', '6', '桃子', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (13, '2019-05-01 00:35:31.892004', '7', '李子', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2019-05-01 00:36:10.639627', '8', '梨子', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (15, '2019-05-01 00:36:42.564285', '9', '板栗', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (16, '2019-05-01 00:37:13.567307', '10', '香蕉', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (17, '2019-05-01 00:37:45.595698', '11', '青苹果', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (18, '2019-05-01 00:39:02.214281', '12', '西梅', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (19, '2019-05-01 00:39:29.300138', '13', '橘子', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (20, '2019-05-01 00:40:00.691180', '14', '橙子', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2019-05-01 00:40:26.099265', '15', '奇异果', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2019-05-01 00:40:55.866161', '16', '黄肉桃', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (23, '2019-05-01 00:41:40.370540', '17', '樱桃', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (24, '2019-05-01 00:42:49.275779', '18', '青岛野生大虾', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (25, '2019-05-01 00:43:16.049175', '19', '扇贝', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (26, '2019-05-01 00:44:16.926501', '20', '秋刀鱼', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (27, '2019-05-01 00:44:53.325323', '21', '基围虾', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (28, '2019-05-01 02:28:46.243873', '18', '青岛野生大虾', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (29, '2019-05-02 01:46:49.431561', '5', '猪牛羊肉', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (30, '2019-05-02 01:51:24.874597', '22', '肉1', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (31, '2019-05-02 01:51:48.814046', '23', '肉2', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (32, '2019-05-02 01:52:04.332778', '24', '肉3', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (33, '2019-05-02 01:52:19.293098', '25', '肉4', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (34, '2019-05-02 01:52:36.094235', '26', '肉5', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (35, '2019-05-02 01:53:21.823394', '27', '禽1', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (36, '2019-05-02 01:53:36.256136', '28', '禽2', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (37, '2019-05-02 01:53:50.983882', '29', '禽3', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (38, '2019-05-02 01:54:05.604823', '30', '禽4', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (39, '2019-05-02 01:54:18.127394', '31', '禽5', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (40, '2019-05-02 01:54:53.067683', '32', '菜1', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (41, '2019-05-02 01:55:06.916703', '33', '菜2', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (42, '2019-05-02 01:55:24.081799', '34', '菜3', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (43, '2019-05-02 01:55:37.289550', '35', '菜4', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (44, '2019-05-02 01:55:55.889578', '36', '菜5', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (45, '2019-05-02 01:56:09.086690', '37', '冻1', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (46, '2019-05-02 01:56:20.446735', '38', '冻2', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (47, '2019-05-02 01:56:33.396169', '39', '冻3', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (48, '2019-05-02 01:56:44.874988', '40', '冻4', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (49, '2019-05-02 01:56:56.167793', '41', '冻5', 1, '[{\"added\": {}}]', 8, 1);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (10, 'df_cart', 'cartinfo');
INSERT INTO `django_content_type` VALUES (8, 'df_goods', 'goodsinfo');
INSERT INTO `django_content_type` VALUES (9, 'df_goods', 'typeinfo');
INSERT INTO `django_content_type` VALUES (7, 'df_user', 'userinfo');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-04-26 04:51:32.334199');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-04-26 04:51:32.657320');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-04-26 04:51:32.733004');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-04-26 04:51:32.757206');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-26 04:51:32.784800');
INSERT INTO `django_migrations` VALUES (6, 'admin', '0004_auto_20190426_0451', '2019-04-26 04:51:32.801329');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2019-04-26 04:51:32.848871');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2019-04-26 04:51:32.869262');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2019-04-26 04:51:32.894143');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2019-04-26 04:51:32.906336');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2019-04-26 04:51:32.930209');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2019-04-26 04:51:32.932779');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2019-04-26 04:51:32.941063');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2019-04-26 04:51:32.964442');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2019-04-26 04:51:32.988586');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_auto_20190426_0451', '2019-04-26 04:51:33.011963');
INSERT INTO `django_migrations` VALUES (17, 'df_user', '0001_initial', '2019-04-26 04:51:33.033751');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-04-26 04:51:33.061929');
INSERT INTO `django_migrations` VALUES (19, 'df_goods', '0001_initial', '2019-04-30 15:27:19.830384');
INSERT INTO `django_migrations` VALUES (20, 'df_user', '0002_auto_20190430_1527', '2019-04-30 15:27:19.897403');
INSERT INTO `django_migrations` VALUES (21, 'df_goods', '0002_auto_20190510_1114', '2019-05-10 03:14:32.356665');
INSERT INTO `django_migrations` VALUES (22, 'df_cart', '0001_initial', '2019-05-10 03:14:32.445537');
INSERT INTO `django_migrations` VALUES (23, 'df_cart', '0002_auto_20190510_1233', '2019-05-10 04:33:41.788155');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('37vs6h9mdhg4h0h9o8lmmhevrcuytt6c', 'ODMxMjQ2YWIwNWNiNWQwZGFkMjVhNWQ3YjY4ZWFjODk5YjkzMjc5Mjp7InVzZXJfaWQiOiIiLCJ1c2VyX25hbWUiOiIifQ==', '2019-05-23 10:02:01.529961');
INSERT INTO `django_session` VALUES ('3gc0crm456aempopv2xb8opk7h2z6zda', 'ZTg3MjIwYjAwOTlmZWViMjA1NDcxMDA2YmM3YzAzZWIzNWZkNmU0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTQ1OWZhNGIyMDdhNjE2YmI3YTFkMWIxOWVlZDljOGU5YWJkY2UyIiwidXNlcl9pZCI6MSwidXNlcl9uYW1lIjoicGVubjExIn0=', '2019-05-20 04:23:35.425932');
INSERT INTO `django_session` VALUES ('3rcz0fzo9ft82p3jla70jai72vqeuqr4', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-15 10:30:32.412318');
INSERT INTO `django_session` VALUES ('3xi7ucdfvqeisawwpsyhsihv9fvfo40q', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-26 13:12:32.810160');
INSERT INTO `django_session` VALUES ('44nhrnbwsmzln7mgcvhbnxj3bu1f5x0y', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 09:43:55.726170');
INSERT INTO `django_session` VALUES ('4tmgyj1w193r75pmwzvco3xoj8jsehia', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 08:58:26.063191');
INSERT INTO `django_session` VALUES ('7vxkvzg0wr75lxr3bkm8pr8mpemdl3qw', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 09:43:02.209995');
INSERT INTO `django_session` VALUES ('7zi2bvt9wgigxwbbwfvx0zwgixwaazt7', 'ODMxMjQ2YWIwNWNiNWQwZGFkMjVhNWQ3YjY4ZWFjODk5YjkzMjc5Mjp7InVzZXJfaWQiOiIiLCJ1c2VyX25hbWUiOiIifQ==', '2019-05-23 10:07:28.887807');
INSERT INTO `django_session` VALUES ('8agsflr00305cafthpsdulffn9u9w8si', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 09:49:17.082052');
INSERT INTO `django_session` VALUES ('9ru35o66id9wdyvsjbf1t60irb70v6a6', 'MjkyYmMwYmZjOGMzZDU1ZjMzODA1YWJkOGZjMTE3MDQwNmI1OGZmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTQ1OWZhNGIyMDdhNjE2YmI3YTFkMWIxOWVlZDljOGU5YWJkY2UyIn0=', '2019-05-14 15:43:24.240149');
INSERT INTO `django_session` VALUES ('9ryero0wi6xvej5j9653zgu5g3lxqwhu', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-25 07:30:21.176716');
INSERT INTO `django_session` VALUES ('axrd2dwuns7hipecqf8ya86i09njt95e', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-24 05:44:59.634426');
INSERT INTO `django_session` VALUES ('dly9xlxtmxidz8kvz13un8429gg7vkgz', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-26 09:08:39.525627');
INSERT INTO `django_session` VALUES ('f72vohiz038iecbr4dlusw6okv3uef0r', 'MjkyYmMwYmZjOGMzZDU1ZjMzODA1YWJkOGZjMTE3MDQwNmI1OGZmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTQ1OWZhNGIyMDdhNjE2YmI3YTFkMWIxOWVlZDljOGU5YWJkY2UyIn0=', '2019-05-19 08:19:28.809430');
INSERT INTO `django_session` VALUES ('fflmycsahi0d5mqj59874l1jtofx4l5w', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-26 15:30:19.526929');
INSERT INTO `django_session` VALUES ('fkery4oj4187wfob8tz5mt621nhq1rzd', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-24 09:54:20.112413');
INSERT INTO `django_session` VALUES ('fm8a3cytcrmuamly3ifcsv1a0bc1d21f', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 09:21:57.132820');
INSERT INTO `django_session` VALUES ('fui6b15x2oe1q3wiz40uk75hzgd95npp', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-26 02:31:58.020944');
INSERT INTO `django_session` VALUES ('ibgaspw1oax85btvq5zqvzu5waud3r3u', 'MjkyYmMwYmZjOGMzZDU1ZjMzODA1YWJkOGZjMTE3MDQwNmI1OGZmMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTQ1OWZhNGIyMDdhNjE2YmI3YTFkMWIxOWVlZDljOGU5YWJkY2UyIn0=', '2019-05-16 01:43:12.815797');
INSERT INTO `django_session` VALUES ('jro5c1inymmpz65lmdqc1hyllndxm5ak', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 10:16:09.820653');
INSERT INTO `django_session` VALUES ('k9isxmfiter0qi50quptyl70edie8r2y', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-20 13:36:01.601758');
INSERT INTO `django_session` VALUES ('kh0cxuy8edbot0hynd317e5qbkawhojl', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-26 08:42:31.046180');
INSERT INTO `django_session` VALUES ('lzveiimpgku5pqpsdsj337xmjon361vv', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-26 13:06:03.891459');
INSERT INTO `django_session` VALUES ('pfe65j8cxguqgynpuxb2t3u7w2dybkiw', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-26 13:37:18.897600');
INSERT INTO `django_session` VALUES ('tg4tbtuii66heiencpgd5j549h96ao71', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 09:29:05.130971');
INSERT INTO `django_session` VALUES ('tuf80w3kqjxt7u4a4mt88dh6tfqzvm59', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 10:05:06.410791');
INSERT INTO `django_session` VALUES ('u80i4yj1i6lgbfllnpfn093royktoxpj', 'YTgxMGNmOGI5N2RiNGQxZDE0NjEyYWYyNjc2NWY5MzUwZjQ3YzRhZDp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MTQ1OWZhNGIyMDdhNjE2YmI3YTFkMWIxOWVlZDljOGU5YWJkY2UyIn0=', '2019-05-26 09:46:27.930672');
INSERT INTO `django_session` VALUES ('v5ydo8qlqrfbinzmsl7s8249zlfj71l2', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-23 05:02:33.648324');
INSERT INTO `django_session` VALUES ('zbgt2ztf0eq3t5ygxca7kxm57zffb53x', 'ZjdjMTVlMzBmMWY0MTg3NTY0M2JjZmNiOTI2NThmOGY4NTU5MGVjZTp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6InBlbm4xMSJ9', '2019-05-15 12:15:16.791096');
INSERT INTO `django_session` VALUES ('zps0eo2bfp9ygr7xsj68wqm10ndmebng', 'Y2ExNzMzNGYxOGViODIxZGRkZDNhN2M1OTU2ZGQ5YWRjMDIzYjQxZjp7InVzZXJfaWQiOjUsInVzZXJfbmFtZSI6InBlbm4xMjMifQ==', '2019-05-13 15:07:26.595124');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
