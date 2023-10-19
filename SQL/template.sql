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

 Date: 19/10/2023 22:51:13
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
) ENGINE = InnoDB AUTO_INCREMENT = 31811 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (31514, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 570, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:17', '超管', '2023-10-19 19:56:17');
INSERT INTO `sys_log` VALUES (31515, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 7, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:17', '超管', '2023-10-19 19:56:17');
INSERT INTO `sys_log` VALUES (31516, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 6, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:17', '超管', '2023-10-19 19:56:17');
INSERT INTO `sys_log` VALUES (31517, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:17', '超管', '2023-10-19 19:56:17');
INSERT INTO `sys_log` VALUES (31518, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 20, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:23', '超管', '2023-10-19 19:56:23');
INSERT INTO `sys_log` VALUES (31519, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:23', '超管', '2023-10-19 19:56:23');
INSERT INTO `sys_log` VALUES (31520, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:23', '超管', '2023-10-19 19:56:23');
INSERT INTO `sys_log` VALUES (31521, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:23', '超管', '2023-10-19 19:56:23');
INSERT INTO `sys_log` VALUES (31522, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 10, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:26', '超管', '2023-10-19 19:56:26');
INSERT INTO `sys_log` VALUES (31523, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:26', '超管', '2023-10-19 19:56:26');
INSERT INTO `sys_log` VALUES (31524, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:26', '超管', '2023-10-19 19:56:26');
INSERT INTO `sys_log` VALUES (31525, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:26', '超管', '2023-10-19 19:56:26');
INSERT INTO `sys_log` VALUES (31526, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:39', '超管', '2023-10-19 19:56:39');
INSERT INTO `sys_log` VALUES (31527, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:39', '超管', '2023-10-19 19:56:39');
INSERT INTO `sys_log` VALUES (31528, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 17, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 19:56:39', '超管', '2023-10-19 19:56:39');
INSERT INTO `sys_log` VALUES (31529, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:02:53', '超管', '2023-10-19 20:02:53');
INSERT INTO `sys_log` VALUES (31530, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:02:53', '超管', '2023-10-19 20:02:53');
INSERT INTO `sys_log` VALUES (31531, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:02:53', '超管', '2023-10-19 20:02:53');
INSERT INTO `sys_log` VALUES (31532, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:02:56', '超管', '2023-10-19 20:02:56');
INSERT INTO `sys_log` VALUES (31533, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:02:56', '超管', '2023-10-19 20:02:56');
INSERT INTO `sys_log` VALUES (31534, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:02:56', '超管', '2023-10-19 20:02:56');
INSERT INTO `sys_log` VALUES (31535, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.updateMenu()', '{\"filePath\":\"/index/Index\",\"icon\":\"Apple\",\"id\":1,\"name\":\"首页\",\"orderNum\":1,\"parentId\":0,\"type\":1,\"url\":\"/index\"}', 15, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:18', '超管', '2023-10-19 20:03:18');
INSERT INTO `sys_log` VALUES (31536, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:18', '超管', '2023-10-19 20:03:18');
INSERT INTO `sys_log` VALUES (31537, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:18', '超管', '2023-10-19 20:03:18');
INSERT INTO `sys_log` VALUES (31538, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:18', '超管', '2023-10-19 20:03:18');
INSERT INTO `sys_log` VALUES (31539, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 13, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:24', '超管', '2023-10-19 20:03:24');
INSERT INTO `sys_log` VALUES (31540, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:24', '超管', '2023-10-19 20:03:24');
INSERT INTO `sys_log` VALUES (31541, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:24', '超管', '2023-10-19 20:03:24');
INSERT INTO `sys_log` VALUES (31542, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:24', '超管', '2023-10-19 20:03:24');
INSERT INTO `sys_log` VALUES (31543, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:35', '超管', '2023-10-19 20:03:35');
INSERT INTO `sys_log` VALUES (31544, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:35', '超管', '2023-10-19 20:03:35');
INSERT INTO `sys_log` VALUES (31545, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:35', '超管', '2023-10-19 20:03:35');
INSERT INTO `sys_log` VALUES (31546, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.updateMenu()', '{\"filePath\":\"/index/Index\",\"icon\":\"House\",\"id\":1,\"name\":\"首页\",\"orderNum\":1,\"parentId\":0,\"type\":1,\"url\":\"/index\"}', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:49', '超管', '2023-10-19 20:03:49');
INSERT INTO `sys_log` VALUES (31547, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:49', '超管', '2023-10-19 20:03:49');
INSERT INTO `sys_log` VALUES (31548, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:49', '超管', '2023-10-19 20:03:49');
INSERT INTO `sys_log` VALUES (31549, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:03:49', '超管', '2023-10-19 20:03:49');
INSERT INTO `sys_log` VALUES (31550, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:05:12', '超管', '2023-10-19 20:05:12');
INSERT INTO `sys_log` VALUES (31551, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:05:12', '超管', '2023-10-19 20:05:12');
INSERT INTO `sys_log` VALUES (31552, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:05:12', '超管', '2023-10-19 20:05:12');
INSERT INTO `sys_log` VALUES (31553, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 9, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:05:16', '超管', '2023-10-19 20:05:16');
INSERT INTO `sys_log` VALUES (31554, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 50, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:05:16', '超管', '2023-10-19 20:05:16');
INSERT INTO `sys_log` VALUES (31555, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:05:17', '超管', '2023-10-19 20:05:17');
INSERT INTO `sys_log` VALUES (31556, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 11, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:05:17', '超管', '2023-10-19 20:05:17');
INSERT INTO `sys_log` VALUES (31557, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 542, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:12:41', '超管', '2023-10-19 20:12:41');
INSERT INTO `sys_log` VALUES (31558, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:12:41', '超管', '2023-10-19 20:12:41');
INSERT INTO `sys_log` VALUES (31559, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:12:41', '超管', '2023-10-19 20:12:41');
INSERT INTO `sys_log` VALUES (31560, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:12:41', '超管', '2023-10-19 20:12:41');
INSERT INTO `sys_log` VALUES (31561, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 538, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:17:45', '超管', '2023-10-19 20:17:45');
INSERT INTO `sys_log` VALUES (31562, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:17:45', '超管', '2023-10-19 20:17:45');
INSERT INTO `sys_log` VALUES (31563, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:17:45', '超管', '2023-10-19 20:17:45');
INSERT INTO `sys_log` VALUES (31564, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:17:45', '超管', '2023-10-19 20:17:45');
INSERT INTO `sys_log` VALUES (31565, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 10, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:24:55', '超管', '2023-10-19 20:24:55');
INSERT INTO `sys_log` VALUES (31566, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 38, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:24:55', '超管', '2023-10-19 20:24:55');
INSERT INTO `sys_log` VALUES (31567, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:10', '超管', '2023-10-19 20:25:10');
INSERT INTO `sys_log` VALUES (31568, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 9, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:10', '超管', '2023-10-19 20:25:10');
INSERT INTO `sys_log` VALUES (31569, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:20', '超管', '2023-10-19 20:25:20');
INSERT INTO `sys_log` VALUES (31570, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 24, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:20', '超管', '2023-10-19 20:25:20');
INSERT INTO `sys_log` VALUES (31571, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:21', '超管', '2023-10-19 20:25:21');
INSERT INTO `sys_log` VALUES (31572, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:21', '超管', '2023-10-19 20:25:21');
INSERT INTO `sys_log` VALUES (31573, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:21', '超管', '2023-10-19 20:25:21');
INSERT INTO `sys_log` VALUES (31574, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:27', '超管', '2023-10-19 20:25:27');
INSERT INTO `sys_log` VALUES (31575, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 8, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:27', '超管', '2023-10-19 20:25:27');
INSERT INTO `sys_log` VALUES (31576, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:28', '超管', '2023-10-19 20:25:28');
INSERT INTO `sys_log` VALUES (31577, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:28', '超管', '2023-10-19 20:25:28');
INSERT INTO `sys_log` VALUES (31578, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:28', '超管', '2023-10-19 20:25:28');
INSERT INTO `sys_log` VALUES (31579, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:29', '超管', '2023-10-19 20:25:29');
INSERT INTO `sys_log` VALUES (31580, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:29', '超管', '2023-10-19 20:25:29');
INSERT INTO `sys_log` VALUES (31581, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:29', '超管', '2023-10-19 20:25:29');
INSERT INTO `sys_log` VALUES (31582, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:29', '超管', '2023-10-19 20:25:29');
INSERT INTO `sys_log` VALUES (31583, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:29', '超管', '2023-10-19 20:25:29');
INSERT INTO `sys_log` VALUES (31584, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:30', '超管', '2023-10-19 20:25:30');
INSERT INTO `sys_log` VALUES (31585, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:30', '超管', '2023-10-19 20:25:30');
INSERT INTO `sys_log` VALUES (31586, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:31', '超管', '2023-10-19 20:25:31');
INSERT INTO `sys_log` VALUES (31587, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:31', '超管', '2023-10-19 20:25:31');
INSERT INTO `sys_log` VALUES (31588, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:31', '超管', '2023-10-19 20:25:31');
INSERT INTO `sys_log` VALUES (31589, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:31', '超管', '2023-10-19 20:25:31');
INSERT INTO `sys_log` VALUES (31590, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:31', '超管', '2023-10-19 20:25:31');
INSERT INTO `sys_log` VALUES (31591, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:32', '超管', '2023-10-19 20:25:32');
INSERT INTO `sys_log` VALUES (31592, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:32', '超管', '2023-10-19 20:25:32');
INSERT INTO `sys_log` VALUES (31593, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:32', '超管', '2023-10-19 20:25:32');
INSERT INTO `sys_log` VALUES (31594, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:34', '超管', '2023-10-19 20:25:34');
INSERT INTO `sys_log` VALUES (31595, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:34', '超管', '2023-10-19 20:25:34');
INSERT INTO `sys_log` VALUES (31596, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:37', '超管', '2023-10-19 20:25:37');
INSERT INTO `sys_log` VALUES (31597, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:37', '超管', '2023-10-19 20:25:37');
INSERT INTO `sys_log` VALUES (31598, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:37', '超管', '2023-10-19 20:25:37');
INSERT INTO `sys_log` VALUES (31599, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:39', '超管', '2023-10-19 20:25:39');
INSERT INTO `sys_log` VALUES (31600, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:39', '超管', '2023-10-19 20:25:39');
INSERT INTO `sys_log` VALUES (31601, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:40', '超管', '2023-10-19 20:25:40');
INSERT INTO `sys_log` VALUES (31602, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:40', '超管', '2023-10-19 20:25:40');
INSERT INTO `sys_log` VALUES (31603, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:40', '超管', '2023-10-19 20:25:40');
INSERT INTO `sys_log` VALUES (31604, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:42', '超管', '2023-10-19 20:25:42');
INSERT INTO `sys_log` VALUES (31605, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:42', '超管', '2023-10-19 20:25:42');
INSERT INTO `sys_log` VALUES (31606, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:42', '超管', '2023-10-19 20:25:42');
INSERT INTO `sys_log` VALUES (31607, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:42', '超管', '2023-10-19 20:25:42');
INSERT INTO `sys_log` VALUES (31608, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:42', '超管', '2023-10-19 20:25:42');
INSERT INTO `sys_log` VALUES (31609, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:43', '超管', '2023-10-19 20:25:43');
INSERT INTO `sys_log` VALUES (31610, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:43', '超管', '2023-10-19 20:25:43');
INSERT INTO `sys_log` VALUES (31611, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:44', '超管', '2023-10-19 20:25:44');
INSERT INTO `sys_log` VALUES (31612, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:44', '超管', '2023-10-19 20:25:44');
INSERT INTO `sys_log` VALUES (31613, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:44', '超管', '2023-10-19 20:25:44');
INSERT INTO `sys_log` VALUES (31614, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:47', '超管', '2023-10-19 20:25:47');
INSERT INTO `sys_log` VALUES (31615, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:25:47', '超管', '2023-10-19 20:25:47');
INSERT INTO `sys_log` VALUES (31616, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:28', '超管', '2023-10-19 20:26:28');
INSERT INTO `sys_log` VALUES (31617, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:28', '超管', '2023-10-19 20:26:28');
INSERT INTO `sys_log` VALUES (31618, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:31', '超管', '2023-10-19 20:26:31');
INSERT INTO `sys_log` VALUES (31619, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:31', '超管', '2023-10-19 20:26:31');
INSERT INTO `sys_log` VALUES (31620, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:32', '超管', '2023-10-19 20:26:32');
INSERT INTO `sys_log` VALUES (31621, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:32', '超管', '2023-10-19 20:26:32');
INSERT INTO `sys_log` VALUES (31622, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:32', '超管', '2023-10-19 20:26:32');
INSERT INTO `sys_log` VALUES (31623, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:34', '超管', '2023-10-19 20:26:34');
INSERT INTO `sys_log` VALUES (31624, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:26:34', '超管', '2023-10-19 20:26:34');
INSERT INTO `sys_log` VALUES (31625, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:27:39', '超管', '2023-10-19 20:27:39');
INSERT INTO `sys_log` VALUES (31626, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:27:39', '超管', '2023-10-19 20:27:39');
INSERT INTO `sys_log` VALUES (31627, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:31:15', '超管', '2023-10-19 20:31:15');
INSERT INTO `sys_log` VALUES (31628, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:31:15', '超管', '2023-10-19 20:31:15');
INSERT INTO `sys_log` VALUES (31629, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:31:32', '超管', '2023-10-19 20:31:32');
INSERT INTO `sys_log` VALUES (31630, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:31:32', '超管', '2023-10-19 20:31:32');
INSERT INTO `sys_log` VALUES (31631, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:33:53', '超管', '2023-10-19 20:33:53');
INSERT INTO `sys_log` VALUES (31632, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:33:53', '超管', '2023-10-19 20:33:53');
INSERT INTO `sys_log` VALUES (31633, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:33:55', '超管', '2023-10-19 20:33:55');
INSERT INTO `sys_log` VALUES (31634, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:33:55', '超管', '2023-10-19 20:33:55');
INSERT INTO `sys_log` VALUES (31635, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:33:55', '超管', '2023-10-19 20:33:55');
INSERT INTO `sys_log` VALUES (31636, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:33:56', '超管', '2023-10-19 20:33:56');
INSERT INTO `sys_log` VALUES (31637, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:33:56', '超管', '2023-10-19 20:33:56');
INSERT INTO `sys_log` VALUES (31638, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:34:25', '超管', '2023-10-19 20:34:25');
INSERT INTO `sys_log` VALUES (31639, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:34:25', '超管', '2023-10-19 20:34:25');
INSERT INTO `sys_log` VALUES (31640, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:34:55', '超管', '2023-10-19 20:34:55');
INSERT INTO `sys_log` VALUES (31641, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:34:55', '超管', '2023-10-19 20:34:55');
INSERT INTO `sys_log` VALUES (31642, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:35:38', '超管', '2023-10-19 20:35:38');
INSERT INTO `sys_log` VALUES (31643, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:35:38', '超管', '2023-10-19 20:35:38');
INSERT INTO `sys_log` VALUES (31644, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:35:55', '超管', '2023-10-19 20:35:55');
INSERT INTO `sys_log` VALUES (31645, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:41:38', '超管', '2023-10-19 20:41:38');
INSERT INTO `sys_log` VALUES (31646, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:41:38', '超管', '2023-10-19 20:41:38');
INSERT INTO `sys_log` VALUES (31647, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:42:15', '超管', '2023-10-19 20:42:15');
INSERT INTO `sys_log` VALUES (31648, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:42:15', '超管', '2023-10-19 20:42:15');
INSERT INTO `sys_log` VALUES (31649, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:42:18', '超管', '2023-10-19 20:42:18');
INSERT INTO `sys_log` VALUES (31650, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:42:18', '超管', '2023-10-19 20:42:18');
INSERT INTO `sys_log` VALUES (31651, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:42:53', '超管', '2023-10-19 20:42:53');
INSERT INTO `sys_log` VALUES (31652, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:42:53', '超管', '2023-10-19 20:42:53');
INSERT INTO `sys_log` VALUES (31653, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:45:45', '超管', '2023-10-19 20:45:45');
INSERT INTO `sys_log` VALUES (31654, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:45:45', '超管', '2023-10-19 20:45:45');
INSERT INTO `sys_log` VALUES (31655, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:47:06', '超管', '2023-10-19 20:47:06');
INSERT INTO `sys_log` VALUES (31656, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:47:06', '超管', '2023-10-19 20:47:06');
INSERT INTO `sys_log` VALUES (31657, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:50:08', '超管', '2023-10-19 20:50:08');
INSERT INTO `sys_log` VALUES (31658, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:50:08', '超管', '2023-10-19 20:50:08');
INSERT INTO `sys_log` VALUES (31659, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:52:49', '超管', '2023-10-19 20:52:49');
INSERT INTO `sys_log` VALUES (31660, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:52:49', '超管', '2023-10-19 20:52:49');
INSERT INTO `sys_log` VALUES (31661, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:52:49', '超管', '2023-10-19 20:52:49');
INSERT INTO `sys_log` VALUES (31662, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:52:59', '超管', '2023-10-19 20:52:59');
INSERT INTO `sys_log` VALUES (31663, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:52:59', '超管', '2023-10-19 20:52:59');
INSERT INTO `sys_log` VALUES (31664, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:00', '超管', '2023-10-19 20:53:00');
INSERT INTO `sys_log` VALUES (31665, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:00', '超管', '2023-10-19 20:53:00');
INSERT INTO `sys_log` VALUES (31666, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:00', '超管', '2023-10-19 20:53:00');
INSERT INTO `sys_log` VALUES (31667, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:30', '超管', '2023-10-19 20:53:30');
INSERT INTO `sys_log` VALUES (31668, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:30', '超管', '2023-10-19 20:53:30');
INSERT INTO `sys_log` VALUES (31669, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:30', '超管', '2023-10-19 20:53:30');
INSERT INTO `sys_log` VALUES (31670, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:35', '超管', '2023-10-19 20:53:35');
INSERT INTO `sys_log` VALUES (31671, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:35', '超管', '2023-10-19 20:53:35');
INSERT INTO `sys_log` VALUES (31672, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:36', '超管', '2023-10-19 20:53:36');
INSERT INTO `sys_log` VALUES (31673, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:36', '超管', '2023-10-19 20:53:36');
INSERT INTO `sys_log` VALUES (31674, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:36', '超管', '2023-10-19 20:53:36');
INSERT INTO `sys_log` VALUES (31675, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:51', '超管', '2023-10-19 20:53:51');
INSERT INTO `sys_log` VALUES (31676, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:51', '超管', '2023-10-19 20:53:51');
INSERT INTO `sys_log` VALUES (31677, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:51', '超管', '2023-10-19 20:53:51');
INSERT INTO `sys_log` VALUES (31678, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:53:57', '超管', '2023-10-19 20:53:57');
INSERT INTO `sys_log` VALUES (31679, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 33, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:54:10', '超管', '2023-10-19 20:54:10');
INSERT INTO `sys_log` VALUES (31680, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:55:30', '超管', '2023-10-19 20:55:30');
INSERT INTO `sys_log` VALUES (31681, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 20:56:11', '超管', '2023-10-19 20:56:11');
INSERT INTO `sys_log` VALUES (31682, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:14', '超管', '2023-10-19 21:09:14');
INSERT INTO `sys_log` VALUES (31683, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:14', '超管', '2023-10-19 21:09:14');
INSERT INTO `sys_log` VALUES (31684, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:15', '超管', '2023-10-19 21:09:15');
INSERT INTO `sys_log` VALUES (31685, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:15', '超管', '2023-10-19 21:09:15');
INSERT INTO `sys_log` VALUES (31686, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:16', '超管', '2023-10-19 21:09:16');
INSERT INTO `sys_log` VALUES (31687, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:16', '超管', '2023-10-19 21:09:16');
INSERT INTO `sys_log` VALUES (31688, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:16', '超管', '2023-10-19 21:09:16');
INSERT INTO `sys_log` VALUES (31689, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:22', '超管', '2023-10-19 21:09:22');
INSERT INTO `sys_log` VALUES (31690, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:22', '超管', '2023-10-19 21:09:22');
INSERT INTO `sys_log` VALUES (31691, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:22', '超管', '2023-10-19 21:09:22');
INSERT INTO `sys_log` VALUES (31692, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:29', '超管', '2023-10-19 21:09:29');
INSERT INTO `sys_log` VALUES (31693, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:29', '超管', '2023-10-19 21:09:29');
INSERT INTO `sys_log` VALUES (31694, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:31', '超管', '2023-10-19 21:09:31');
INSERT INTO `sys_log` VALUES (31695, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:35', '超管', '2023-10-19 21:09:35');
INSERT INTO `sys_log` VALUES (31696, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 7, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:43', '超管', '2023-10-19 21:09:43');
INSERT INTO `sys_log` VALUES (31697, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:43', '超管', '2023-10-19 21:09:43');
INSERT INTO `sys_log` VALUES (31698, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:43', '超管', '2023-10-19 21:09:43');
INSERT INTO `sys_log` VALUES (31699, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:43', '超管', '2023-10-19 21:09:43');
INSERT INTO `sys_log` VALUES (31700, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:46', '超管', '2023-10-19 21:09:46');
INSERT INTO `sys_log` VALUES (31701, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:49', '超管', '2023-10-19 21:09:49');
INSERT INTO `sys_log` VALUES (31702, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:49', '超管', '2023-10-19 21:09:49');
INSERT INTO `sys_log` VALUES (31703, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:49', '超管', '2023-10-19 21:09:49');
INSERT INTO `sys_log` VALUES (31704, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:52', '超管', '2023-10-19 21:09:52');
INSERT INTO `sys_log` VALUES (31705, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:52', '超管', '2023-10-19 21:09:52');
INSERT INTO `sys_log` VALUES (31706, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:54', '超管', '2023-10-19 21:09:54');
INSERT INTO `sys_log` VALUES (31707, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:54', '超管', '2023-10-19 21:09:54');
INSERT INTO `sys_log` VALUES (31708, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:56', '超管', '2023-10-19 21:09:56');
INSERT INTO `sys_log` VALUES (31709, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:56', '超管', '2023-10-19 21:09:56');
INSERT INTO `sys_log` VALUES (31710, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:09:56', '超管', '2023-10-19 21:09:56');
INSERT INTO `sys_log` VALUES (31711, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:28', '超管', '2023-10-19 21:10:28');
INSERT INTO `sys_log` VALUES (31712, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:28', '超管', '2023-10-19 21:10:28');
INSERT INTO `sys_log` VALUES (31713, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:28', '超管', '2023-10-19 21:10:28');
INSERT INTO `sys_log` VALUES (31714, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:30', '超管', '2023-10-19 21:10:30');
INSERT INTO `sys_log` VALUES (31715, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:30', '超管', '2023-10-19 21:10:30');
INSERT INTO `sys_log` VALUES (31716, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:31', '超管', '2023-10-19 21:10:31');
INSERT INTO `sys_log` VALUES (31717, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:31', '超管', '2023-10-19 21:10:31');
INSERT INTO `sys_log` VALUES (31718, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:31', '超管', '2023-10-19 21:10:31');
INSERT INTO `sys_log` VALUES (31719, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:32', '超管', '2023-10-19 21:10:32');
INSERT INTO `sys_log` VALUES (31720, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:32', '超管', '2023-10-19 21:10:32');
INSERT INTO `sys_log` VALUES (31721, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:33', '超管', '2023-10-19 21:10:33');
INSERT INTO `sys_log` VALUES (31722, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:33', '超管', '2023-10-19 21:10:33');
INSERT INTO `sys_log` VALUES (31723, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:34', '超管', '2023-10-19 21:10:34');
INSERT INTO `sys_log` VALUES (31724, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:35', '超管', '2023-10-19 21:10:35');
INSERT INTO `sys_log` VALUES (31725, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:35', '超管', '2023-10-19 21:10:35');
INSERT INTO `sys_log` VALUES (31726, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:35', '超管', '2023-10-19 21:10:35');
INSERT INTO `sys_log` VALUES (31727, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:39', '超管', '2023-10-19 21:10:39');
INSERT INTO `sys_log` VALUES (31728, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:44', '超管', '2023-10-19 21:10:44');
INSERT INTO `sys_log` VALUES (31729, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:44', '超管', '2023-10-19 21:10:44');
INSERT INTO `sys_log` VALUES (31730, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:44', '超管', '2023-10-19 21:10:44');
INSERT INTO `sys_log` VALUES (31731, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:44', '超管', '2023-10-19 21:10:44');
INSERT INTO `sys_log` VALUES (31732, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:47', '超管', '2023-10-19 21:10:47');
INSERT INTO `sys_log` VALUES (31733, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:47', '超管', '2023-10-19 21:10:47');
INSERT INTO `sys_log` VALUES (31734, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:49', '超管', '2023-10-19 21:10:49');
INSERT INTO `sys_log` VALUES (31735, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:49', '超管', '2023-10-19 21:10:49');
INSERT INTO `sys_log` VALUES (31736, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:51', '超管', '2023-10-19 21:10:51');
INSERT INTO `sys_log` VALUES (31737, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:51', '超管', '2023-10-19 21:10:51');
INSERT INTO `sys_log` VALUES (31738, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:51', '超管', '2023-10-19 21:10:51');
INSERT INTO `sys_log` VALUES (31739, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:10:53', '超管', '2023-10-19 21:10:53');
INSERT INTO `sys_log` VALUES (31740, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:01', '超管', '2023-10-19 21:11:01');
INSERT INTO `sys_log` VALUES (31741, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:01', '超管', '2023-10-19 21:11:01');
INSERT INTO `sys_log` VALUES (31742, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:01', '超管', '2023-10-19 21:11:01');
INSERT INTO `sys_log` VALUES (31743, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:02', '超管', '2023-10-19 21:11:02');
INSERT INTO `sys_log` VALUES (31744, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:18', '超管', '2023-10-19 21:11:18');
INSERT INTO `sys_log` VALUES (31745, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:46', '超管', '2023-10-19 21:11:46');
INSERT INTO `sys_log` VALUES (31746, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:48', '超管', '2023-10-19 21:11:48');
INSERT INTO `sys_log` VALUES (31747, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:48', '超管', '2023-10-19 21:11:48');
INSERT INTO `sys_log` VALUES (31748, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:48', '超管', '2023-10-19 21:11:48');
INSERT INTO `sys_log` VALUES (31749, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:11:50', '超管', '2023-10-19 21:11:50');
INSERT INTO `sys_log` VALUES (31750, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:12:05', '超管', '2023-10-19 21:12:05');
INSERT INTO `sys_log` VALUES (31751, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:12:05', '超管', '2023-10-19 21:12:05');
INSERT INTO `sys_log` VALUES (31752, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:12:10', '超管', '2023-10-19 21:12:10');
INSERT INTO `sys_log` VALUES (31753, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:12:19', '超管', '2023-10-19 21:12:19');
INSERT INTO `sys_log` VALUES (31754, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:12:19', '超管', '2023-10-19 21:12:19');
INSERT INTO `sys_log` VALUES (31755, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:12:19', '超管', '2023-10-19 21:12:19');
INSERT INTO `sys_log` VALUES (31756, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:10', '超管', '2023-10-19 21:13:10');
INSERT INTO `sys_log` VALUES (31757, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:10', '超管', '2023-10-19 21:13:10');
INSERT INTO `sys_log` VALUES (31758, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:10', '超管', '2023-10-19 21:13:10');
INSERT INTO `sys_log` VALUES (31759, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:14', '超管', '2023-10-19 21:13:14');
INSERT INTO `sys_log` VALUES (31760, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:14', '超管', '2023-10-19 21:13:14');
INSERT INTO `sys_log` VALUES (31761, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:14', '超管', '2023-10-19 21:13:14');
INSERT INTO `sys_log` VALUES (31762, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:14', '超管', '2023-10-19 21:13:14');
INSERT INTO `sys_log` VALUES (31763, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:16', '超管', '2023-10-19 21:13:16');
INSERT INTO `sys_log` VALUES (31764, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:20', '超管', '2023-10-19 21:13:20');
INSERT INTO `sys_log` VALUES (31765, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:20', '超管', '2023-10-19 21:13:20');
INSERT INTO `sys_log` VALUES (31766, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:20', '超管', '2023-10-19 21:13:20');
INSERT INTO `sys_log` VALUES (31767, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:27', '超管', '2023-10-19 21:13:27');
INSERT INTO `sys_log` VALUES (31768, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:27', '超管', '2023-10-19 21:13:27');
INSERT INTO `sys_log` VALUES (31769, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:30', '超管', '2023-10-19 21:13:30');
INSERT INTO `sys_log` VALUES (31770, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:30', '超管', '2023-10-19 21:13:30');
INSERT INTO `sys_log` VALUES (31771, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:33', '超管', '2023-10-19 21:13:33');
INSERT INTO `sys_log` VALUES (31772, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:35', '超管', '2023-10-19 21:13:35');
INSERT INTO `sys_log` VALUES (31773, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:35', '超管', '2023-10-19 21:13:35');
INSERT INTO `sys_log` VALUES (31774, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:35', '超管', '2023-10-19 21:13:35');
INSERT INTO `sys_log` VALUES (31775, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:37', '超管', '2023-10-19 21:13:37');
INSERT INTO `sys_log` VALUES (31776, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:37', '超管', '2023-10-19 21:13:37');
INSERT INTO `sys_log` VALUES (31777, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:39', '超管', '2023-10-19 21:13:39');
INSERT INTO `sys_log` VALUES (31778, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:39', '超管', '2023-10-19 21:13:39');
INSERT INTO `sys_log` VALUES (31779, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:41', '超管', '2023-10-19 21:13:41');
INSERT INTO `sys_log` VALUES (31780, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:13:58', '超管', '2023-10-19 21:13:58');
INSERT INTO `sys_log` VALUES (31781, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:01', '超管', '2023-10-19 21:14:01');
INSERT INTO `sys_log` VALUES (31782, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:01', '超管', '2023-10-19 21:14:01');
INSERT INTO `sys_log` VALUES (31783, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:01', '超管', '2023-10-19 21:14:01');
INSERT INTO `sys_log` VALUES (31784, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:05', '超管', '2023-10-19 21:14:05');
INSERT INTO `sys_log` VALUES (31785, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:05', '超管', '2023-10-19 21:14:05');
INSERT INTO `sys_log` VALUES (31786, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:05', '超管', '2023-10-19 21:14:05');
INSERT INTO `sys_log` VALUES (31787, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:32', '超管', '2023-10-19 21:14:32');
INSERT INTO `sys_log` VALUES (31788, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:32', '超管', '2023-10-19 21:14:32');
INSERT INTO `sys_log` VALUES (31789, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:32', '超管', '2023-10-19 21:14:32');
INSERT INTO `sys_log` VALUES (31790, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:35', '超管', '2023-10-19 21:14:35');
INSERT INTO `sys_log` VALUES (31791, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:35', '超管', '2023-10-19 21:14:35');
INSERT INTO `sys_log` VALUES (31792, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:36', '超管', '2023-10-19 21:14:36');
INSERT INTO `sys_log` VALUES (31793, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:36', '超管', '2023-10-19 21:14:36');
INSERT INTO `sys_log` VALUES (31794, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:37', '超管', '2023-10-19 21:14:37');
INSERT INTO `sys_log` VALUES (31795, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:37', '超管', '2023-10-19 21:14:37');
INSERT INTO `sys_log` VALUES (31796, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:37', '超管', '2023-10-19 21:14:37');
INSERT INTO `sys_log` VALUES (31797, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:40', '超管', '2023-10-19 21:14:40');
INSERT INTO `sys_log` VALUES (31798, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:44', '超管', '2023-10-19 21:14:44');
INSERT INTO `sys_log` VALUES (31799, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:44', '超管', '2023-10-19 21:14:44');
INSERT INTO `sys_log` VALUES (31800, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:14:44', '超管', '2023-10-19 21:14:44');
INSERT INTO `sys_log` VALUES (31801, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:23', '超管', '2023-10-19 21:31:23');
INSERT INTO `sys_log` VALUES (31802, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:23', '超管', '2023-10-19 21:31:23');
INSERT INTO `sys_log` VALUES (31803, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:25', '超管', '2023-10-19 21:31:25');
INSERT INTO `sys_log` VALUES (31804, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:25', '超管', '2023-10-19 21:31:25');
INSERT INTO `sys_log` VALUES (31805, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:26', '超管', '2023-10-19 21:31:26');
INSERT INTO `sys_log` VALUES (31806, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:26', '超管', '2023-10-19 21:31:26');
INSERT INTO `sys_log` VALUES (31807, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:27', '超管', '2023-10-19 21:31:27');
INSERT INTO `sys_log` VALUES (31808, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:27', '超管', '2023-10-19 21:31:27');
INSERT INTO `sys_log` VALUES (31809, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:27', '超管', '2023-10-19 21:31:27');
INSERT INTO `sys_log` VALUES (31810, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:31:28', '超管', '2023-10-19 21:31:28');
INSERT INTO `sys_log` VALUES (31811, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 36, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:31', '超管', '2023-10-19 21:56:31');
INSERT INTO `sys_log` VALUES (31812, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:31', '超管', '2023-10-19 21:56:31');
INSERT INTO `sys_log` VALUES (31813, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:31', '超管', '2023-10-19 21:56:31');
INSERT INTO `sys_log` VALUES (31814, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:31', '超管', '2023-10-19 21:56:31');
INSERT INTO `sys_log` VALUES (31815, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 5, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:37', '超管', '2023-10-19 21:56:37');
INSERT INTO `sys_log` VALUES (31816, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:37', '超管', '2023-10-19 21:56:37');
INSERT INTO `sys_log` VALUES (31817, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:37', '超管', '2023-10-19 21:56:37');
INSERT INTO `sys_log` VALUES (31818, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:37', '超管', '2023-10-19 21:56:37');
INSERT INTO `sys_log` VALUES (31819, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 6, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:42', '超管', '2023-10-19 21:56:42');
INSERT INTO `sys_log` VALUES (31820, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:42', '超管', '2023-10-19 21:56:42');
INSERT INTO `sys_log` VALUES (31821, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:42', '超管', '2023-10-19 21:56:42');
INSERT INTO `sys_log` VALUES (31822, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:42', '超管', '2023-10-19 21:56:42');
INSERT INTO `sys_log` VALUES (31823, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 21:56:44', '超管', '2023-10-19 21:56:44');
INSERT INTO `sys_log` VALUES (31824, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:00:28', '超管', '2023-10-19 22:00:28');
INSERT INTO `sys_log` VALUES (31825, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 7, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:00:41', '超管', '2023-10-19 22:00:41');
INSERT INTO `sys_log` VALUES (31826, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:00:41', '超管', '2023-10-19 22:00:41');
INSERT INTO `sys_log` VALUES (31827, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:00:41', '超管', '2023-10-19 22:00:41');
INSERT INTO `sys_log` VALUES (31828, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:00:41', '超管', '2023-10-19 22:00:41');
INSERT INTO `sys_log` VALUES (31829, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:00:43', '超管', '2023-10-19 22:00:43');
INSERT INTO `sys_log` VALUES (31830, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:02:48', '超管', '2023-10-19 22:02:48');
INSERT INTO `sys_log` VALUES (31831, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:03:55', '超管', '2023-10-19 22:03:55');
INSERT INTO `sys_log` VALUES (31832, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:05:30', '超管', '2023-10-19 22:05:30');
INSERT INTO `sys_log` VALUES (31833, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:06:13', '超管', '2023-10-19 22:06:13');
INSERT INTO `sys_log` VALUES (31834, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:06:52', '超管', '2023-10-19 22:06:52');
INSERT INTO `sys_log` VALUES (31835, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:07:33', '超管', '2023-10-19 22:07:33');
INSERT INTO `sys_log` VALUES (31836, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:09:19', '超管', '2023-10-19 22:09:19');
INSERT INTO `sys_log` VALUES (31837, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:11:09', '超管', '2023-10-19 22:11:09');
INSERT INTO `sys_log` VALUES (31838, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 9, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:37:39', '超管', '2023-10-19 22:37:39');
INSERT INTO `sys_log` VALUES (31839, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:37:39', '超管', '2023-10-19 22:37:39');
INSERT INTO `sys_log` VALUES (31840, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:37:39', '超管', '2023-10-19 22:37:39');
INSERT INTO `sys_log` VALUES (31841, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:37:39', '超管', '2023-10-19 22:37:39');
INSERT INTO `sys_log` VALUES (31842, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 6, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:41:00', '超管', '2023-10-19 22:41:00');
INSERT INTO `sys_log` VALUES (31843, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:41:00', '超管', '2023-10-19 22:41:00');
INSERT INTO `sys_log` VALUES (31844, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:41:00', '超管', '2023-10-19 22:41:00');
INSERT INTO `sys_log` VALUES (31845, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:41:00', '超管', '2023-10-19 22:41:00');
INSERT INTO `sys_log` VALUES (31846, NULL, NULL, 'cn.edu.guet.controller.LoginController.checkUserName()', '{\"firstPassword\":\"\",\"identity\":\"\",\"nickName\":\"\",\"secondPassword\":\"\",\"userName\":\"admin\"}', 5, '0:0:0:0:0:0:0:1', NULL, '2023-10-19 22:46:28', NULL, '2023-10-19 22:46:28');
INSERT INTO `sys_log` VALUES (31847, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 7, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:50:09', '超管', '2023-10-19 22:50:09');
INSERT INTO `sys_log` VALUES (31848, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:50:09', '超管', '2023-10-19 22:50:09');
INSERT INTO `sys_log` VALUES (31849, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:50:09', '超管', '2023-10-19 22:50:09');
INSERT INTO `sys_log` VALUES (31850, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-10-19 22:50:09', '超管', '2023-10-19 22:50:09');

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
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '首页', 0, '顶级菜单', '/index', '/index/Index', NULL, 1, 'House', NULL, 1, NULL, NULL, '超管', '2023-10-19 20:03:49', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 2188 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_role_menu` VALUES (2185, 2, 1, '超管', '2023-02-18 00:12:26', '超管', '2023-02-18 00:12:26');
INSERT INTO `sys_role_menu` VALUES (2186, 2, 19, '超管', '2023-02-18 00:12:26', '超管', '2023-02-18 00:12:26');
INSERT INTO `sys_role_menu` VALUES (2187, 2, 2, '超管', '2023-02-18 00:12:26', '超管', '2023-02-18 00:12:26');
INSERT INTO `sys_role_menu` VALUES (2188, 2, 6, '超管', '2023-02-18 00:12:26', '超管', '2023-02-18 00:12:26');

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
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '超管', 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F08%2F20200408223320_qmwoc.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1678767111&t=0349894ec346297b8b5548cefb05a7f8', '女', '13696195259', '1999-03-17', '469021199903176602', '南宁', NULL, NULL, 'c4fe4423a7d9fbf057738dd1ffafb129', '1b8d65371b174f01a4fb', 1, 'admin', '2021-08-13 18:11:11', '超管', '2023-07-06 22:44:49');
INSERT INTO `sys_user` VALUES (2, 'test', '测试', 'https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '男', '19895157383', '1993-12-27', '652924199312279041', '北京', NULL, NULL, '25a8f5416ef8a4c72d68e07170010030', '53caae756e414182914a', 1, 'admin', '2021-08-13 18:11:11', '超管', '2023-07-06 22:45:03');
INSERT INTO `sys_user` VALUES (3, 'manager', '管理员', 'https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg', '男', '18485711651', '2000-07-29', '610124200007298513', '上海', NULL, NULL, '25a8f5416ef8a4c72d68e07170010030', '53caae756e414182914a', 1, '超管', '2023-02-12 11:10:04', '超管', '2023-07-06 22:45:14');
INSERT INTO `sys_user` VALUES (32, 'hxh', '李白', '', '男', '15252737666', '2005-03-14', '131024200503149489', '长春', NULL, NULL, 'bbc0208ab5a17aff49fd6434435837c0', '4fbcc43125e643e1b59f', 1, '超管', '2023-07-06 21:38:43', '超管', '2023-07-06 22:45:26');

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
) ENGINE = InnoDB AUTO_INCREMENT = 173 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (2, 2, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user_role` VALUES (167, 3, 1, NULL, '2023-07-06 20:39:17', NULL, '2023-07-06 20:39:17');
INSERT INTO `sys_user_role` VALUES (171, 3, 2, NULL, '2023-07-06 20:51:45', NULL, '2023-07-06 20:51:45');
INSERT INTO `sys_user_role` VALUES (172, 32, 2, NULL, '2023-07-06 21:38:43', NULL, '2023-07-06 21:38:43');

-- ----------------------------
-- View structure for user_role_view
-- ----------------------------
DROP VIEW IF EXISTS `user_role_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_role_view` AS select `ur`.`user_id` AS `user_id`,`ur`.`role_id` AS `role_id`,`s`.`name` AS `name` from (`sys_user_role` `ur` join `sys_role` `s`) where (`ur`.`role_id` = `s`.`id`);

SET FOREIGN_KEY_CHECKS = 1;
