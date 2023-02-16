/*
 Navicat Premium Data Transfer

 Source Server         : zwy.mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : template

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 16/02/2023 21:35:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(0) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29266 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `parent_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL,类型：1.普通页面（如用户管理， /sys/user） 2.嵌套完整外部页面，以http(s)开头的链接 3.嵌套服务器页面，使用iframe:前缀+目标URL(如SQL监控， iframe:/druid/login.html, iframe:前缀会替换成服务器地址)',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:add,sys:user:edit)',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页图标颜色',
  `order_num` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` tinyint(0) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '首页', 0, '顶级菜单', '/index', '/index/Index', NULL, 1, 'house', NULL, 1, NULL, NULL, NULL, '2023-02-14 01:11:19', 0);
INSERT INTO `sys_menu` VALUES (2, '系统管理', 0, '顶级菜单', '/system', NULL, NULL, 0, 'Setting', NULL, 2, NULL, NULL, NULL, '2023-02-14 11:33:34', 0);
INSERT INTO `sys_menu` VALUES (3, '用户管理', 2, '系统管理', '/system/user', '/user/User', NULL, 1, 'User', '#69c0ff', 1, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (4, '角色管理', 2, '系统管理', '/system/role', '/role/Role', NULL, 1, 'Avatar', '#b37feb', 2, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (5, '菜单管理', 2, '系统管理', '/system/menu', '/menu/Menu', NULL, 1, 'Menu', '#ffd666', 3, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (6, '日志管理', 2, '系统管理', '/system/log', '/log/Log', NULL, 1, 'Monitor', '#ff85c0', 4, NULL, NULL, NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (7, '查看用户', 3, '用户管理', NULL, NULL, 'sys:user:view', 2, NULL, NULL, NULL, NULL, NULL, '超管', '2023-02-16 15:12:44', 0);
INSERT INTO `sys_menu` VALUES (8, '新增用户', 3, '用户管理', NULL, NULL, 'sys:user:add', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:14', 0);
INSERT INTO `sys_menu` VALUES (9, '修改用户', 3, '用户管理', NULL, NULL, 'sys:user:update', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:16', 0);
INSERT INTO `sys_menu` VALUES (10, '删除用户', 3, '用户管理', NULL, NULL, 'sys:user:delete', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (11, '查看角色', 4, '角色管理', NULL, NULL, 'sys:role:view', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (12, '新增角色', 4, '角色管理', NULL, NULL, 'sys:role:add', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (13, '修改角色', 4, '角色管理', NULL, NULL, 'sys:role:update', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (14, '删除角色', 4, '角色管理', NULL, NULL, 'sys:role:delete', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (15, '查看菜单', 5, '菜单管理', NULL, NULL, 'sys:menu:view', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (16, '新增菜单', 5, '菜单管理', NULL, NULL, 'sys:menu:add', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (17, '修改菜单', 5, '菜单管理', NULL, NULL, 'sys:menu:update', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (18, '删除菜单', 5, '菜单管理', NULL, NULL, 'sys:menu:delete', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (19, '查看日志', 6, '日志管理', NULL, NULL, 'sys:log:view', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (20, '删除日志', 6, '日志管理', NULL, NULL, 'sys:log:delete', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 23:42:24', 0);
INSERT INTO `sys_menu` VALUES (21, '建筑管理', 0, '顶级菜单', '/architecture', NULL, NULL, 0, 'Histogram', NULL, 3, '管理员', '2023-02-14 22:56:47', '管理员', '2023-02-15 01:53:39', 0);
INSERT INTO `sys_menu` VALUES (22, '楼栋管理', 21, '建筑管理', '/architecture/building', '/building/Building', NULL, 1, 'OfficeBuilding', '#00FFF7', 1, '管理员', '2023-02-14 23:03:20', '管理员', '2023-02-15 01:49:52', 0);
INSERT INTO `sys_menu` VALUES (160, '查看楼栋', 22, '楼栋管理', NULL, NULL, 'sys:building:view', 2, NULL, NULL, NULL, '管理员', '2023-02-14 23:36:46', '管理员', '2023-02-14 23:37:20', 0);
INSERT INTO `sys_menu` VALUES (162, '授权角色', 4, '角色管理', NULL, NULL, 'sys:role:author', 2, NULL, NULL, NULL, '管理员', '2023-02-16 19:28:32', '管理员', '2023-02-16 19:28:32', 0);
INSERT INTO `sys_menu` VALUES (163, '导出用户', 3, '用户管理', NULL, NULL, 'sys:user:export', 2, NULL, NULL, NULL, '管理员', '2023-02-16 19:31:10', '管理员', '2023-02-16 19:31:10', 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_exist_flag` int(0) NULL DEFAULT NULL COMMENT '是否有用户为这个角色 （1有 0无）',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` tinyint(0) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '超级管理员', 1, 'admin', '2019-01-19 11:11:11', 'admin', '2023-02-16 15:46:33', 0);
INSERT INTO `sys_role` VALUES (2, '管理员', '普通管理员', 1, 'admin', '2023-02-01 10:38:39', '超管', '2023-02-13 15:29:10', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NULL DEFAULT NULL COMMENT '菜单ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2028, 1, 1, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2029, 1, 2, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2030, 1, 3, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2031, 1, 7, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2032, 1, 8, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2033, 1, 9, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2034, 1, 10, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2035, 1, 163, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2036, 1, 4, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2037, 1, 11, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2038, 1, 12, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2039, 1, 13, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2040, 1, 14, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2041, 1, 162, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2042, 1, 5, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2043, 1, 15, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2044, 1, 16, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2045, 1, 17, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2046, 1, 18, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2047, 1, 6, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2048, 1, 19, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2049, 1, 20, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2050, 1, 21, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2051, 1, 22, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2052, 1, 160, '管理员', '2023-02-16 19:34:07', '管理员', '2023-02-16 19:34:07');
INSERT INTO `sys_role_menu` VALUES (2160, 2, 1, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2161, 2, 7, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2162, 2, 8, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2163, 2, 9, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2164, 2, 10, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2165, 2, 4, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2166, 2, 11, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2167, 2, 12, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2168, 2, 13, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2169, 2, 14, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2170, 2, 162, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2171, 2, 5, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2172, 2, 15, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2173, 2, 16, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2174, 2, 17, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2175, 2, 18, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2176, 2, 19, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2177, 2, 2, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2178, 2, 3, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');
INSERT INTO `sys_role_menu` VALUES (2179, 2, 6, '超管', '2023-02-16 21:25:11', '超管', '2023-02-16 21:25:11');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nick_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `identity` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `home_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `onboarding_time` date NULL DEFAULT NULL COMMENT '入职时间',
  `departure_time` date NULL DEFAULT NULL COMMENT '离职时间',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `status` int(0) UNSIGNED NULL DEFAULT 1 COMMENT '状态 (1在职，0离职)',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超管', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F08%2F20200408223320_qmwoc.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1678767111&t=0349894ec346297b8b5548cefb05a7f8', '女', 20, '13557405254', '450322200012121314', '广西桂林电子科技大学', NULL, NULL, 'c4fe4423a7d9fbf057738dd1ffafb129', '1b8d65371b174f01a4fb', 1, 'admin', '2021-08-13 18:11:11', 'admin', '2023-02-15 23:53:32');
INSERT INTO `sys_user` VALUES (2, 'test', '测试', 'https://img2.baidu.com/it/u=2163376523,3420048957&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200', '男', 21, '13557405254', '450322200012121314', '广西南宁', NULL, NULL, '25a8f5416ef8a4c72d68e07170010030', '53caae756e414182914a', 1, 'admin', '2021-08-13 18:11:11', '超管', '2023-02-16 13:47:35');
INSERT INTO `sys_user` VALUES (3, 'manager', '管理员', 'http://localhost:8888/static/images/c81b83311a6143d887e78ee4daa3c71a.jpg', '男', 27, '13557405254', '450102111122223333', '桂林电子科技大学', NULL, NULL, '25a8f5416ef8a4c72d68e07170010030', '53caae756e414182914a', 1, '超管', '2023-02-12 11:10:04', '1313', '2023-02-16 11:55:53');
INSERT INTO `sys_user` VALUES (30, '3232', '1313', 'http://localhost:8888/static/images/4fc7ac67cc5e4ed684c227b17c986324.jpg', '男', 23, '12345678912', '123456789123456789', '234567', NULL, NULL, '8eb0a7b75f52a908b81e27b9191469a1', '1db6f2053d3446efbf83', 1, '管理员', '2023-02-16 11:17:00', '1313', '2023-02-16 11:44:58');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
  `create_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `last_update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (2, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (163, 30, 1, NULL, '2023-02-16 11:17:00', NULL, '2023-02-16 11:17:00');
INSERT INTO `sys_user_role` VALUES (166, 3, 2, NULL, '2023-02-16 11:55:53', NULL, '2023-02-16 11:55:53');

-- ----------------------------
-- View structure for user_role_view
-- ----------------------------
DROP VIEW IF EXISTS `user_role_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_role_view` AS select `ur`.`user_id` AS `user_id`,`ur`.`role_id` AS `role_id`,`s`.`name` AS `name` from (`sys_user_role` `ur` join `sys_role` `s`) where (`ur`.`role_id` = `s`.`id`);

SET FOREIGN_KEY_CHECKS = 1;
