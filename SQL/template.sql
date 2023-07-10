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

 Date: 10/07/2023 22:59:09
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
) ENGINE = InnoDB AUTO_INCREMENT = 31513 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (30780, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 572, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:33:50', '超管', '2023-07-06 19:33:50');
INSERT INTO `sys_log` VALUES (30781, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:33:50', '超管', '2023-07-06 19:33:50');
INSERT INTO `sys_log` VALUES (30782, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:33:50', '超管', '2023-07-06 19:33:50');
INSERT INTO `sys_log` VALUES (30783, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 13, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:33:50', '超管', '2023-07-06 19:33:50');
INSERT INTO `sys_log` VALUES (30784, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:06', '超管', '2023-07-06 19:34:06');
INSERT INTO `sys_log` VALUES (30785, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 39, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:06', '超管', '2023-07-06 19:34:06');
INSERT INTO `sys_log` VALUES (30786, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:09', '超管', '2023-07-06 19:34:09');
INSERT INTO `sys_log` VALUES (30787, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 21, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:09', '超管', '2023-07-06 19:34:09');
INSERT INTO `sys_log` VALUES (30788, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:12', '超管', '2023-07-06 19:34:12');
INSERT INTO `sys_log` VALUES (30789, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:12', '超管', '2023-07-06 19:34:12');
INSERT INTO `sys_log` VALUES (30790, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:12', '超管', '2023-07-06 19:34:12');
INSERT INTO `sys_log` VALUES (30791, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:34:17', '超管', '2023-07-06 19:34:17');
INSERT INTO `sys_log` VALUES (30792, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 15, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:35:01', '超管', '2023-07-06 19:35:01');
INSERT INTO `sys_log` VALUES (30793, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:35:15', '超管', '2023-07-06 19:35:15');
INSERT INTO `sys_log` VALUES (30794, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.deleteMenu()', '160', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:19', '超管', '2023-07-06 19:36:19');
INSERT INTO `sys_log` VALUES (30795, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:19', '超管', '2023-07-06 19:36:19');
INSERT INTO `sys_log` VALUES (30796, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:19', '超管', '2023-07-06 19:36:19');
INSERT INTO `sys_log` VALUES (30797, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:19', '超管', '2023-07-06 19:36:19');
INSERT INTO `sys_log` VALUES (30798, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.deleteMenu()', '22', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:21', '超管', '2023-07-06 19:36:21');
INSERT INTO `sys_log` VALUES (30799, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:21', '超管', '2023-07-06 19:36:21');
INSERT INTO `sys_log` VALUES (30800, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:21', '超管', '2023-07-06 19:36:21');
INSERT INTO `sys_log` VALUES (30801, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:21', '超管', '2023-07-06 19:36:21');
INSERT INTO `sys_log` VALUES (30802, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.deleteMenu()', '21', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:23', '超管', '2023-07-06 19:36:23');
INSERT INTO `sys_log` VALUES (30803, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:23', '超管', '2023-07-06 19:36:23');
INSERT INTO `sys_log` VALUES (30804, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:23', '超管', '2023-07-06 19:36:23');
INSERT INTO `sys_log` VALUES (30805, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:23', '超管', '2023-07-06 19:36:23');
INSERT INTO `sys_log` VALUES (30806, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 11, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:28', '超管', '2023-07-06 19:36:28');
INSERT INTO `sys_log` VALUES (30807, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:28', '超管', '2023-07-06 19:36:28');
INSERT INTO `sys_log` VALUES (30808, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:28', '超管', '2023-07-06 19:36:28');
INSERT INTO `sys_log` VALUES (30809, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:28', '超管', '2023-07-06 19:36:28');
INSERT INTO `sys_log` VALUES (30810, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:36:30', '超管', '2023-07-06 19:36:30');
INSERT INTO `sys_log` VALUES (30811, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateOwnInfo()', '{\"age\":20,\"homeAddress\":\"广西南宁\",\"id\":1,\"identity\":\"450322200012121314\",\"mobile\":\"13500000000\",\"name\":\"admin\",\"nickName\":\"超管\",\"sex\":\"女\",\"userRoles\":[]}', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:37:00', '超管', '2023-07-06 19:37:00');
INSERT INTO `sys_log` VALUES (30812, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:37:00', '超管', '2023-07-06 19:37:00');
INSERT INTO `sys_log` VALUES (30813, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:37:07', '超管', '2023-07-06 19:37:07');
INSERT INTO `sys_log` VALUES (30814, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:37:07', '超管', '2023-07-06 19:37:07');
INSERT INTO `sys_log` VALUES (30815, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:37:13', '超管', '2023-07-06 19:37:13');
INSERT INTO `sys_log` VALUES (30816, '超管', NULL, 'cn.edu.guet.controller.SysUserController.deleteUser()', '30', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:39:07', '超管', '2023-07-06 19:39:07');
INSERT INTO `sys_log` VALUES (30817, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:39:07', '超管', '2023-07-06 19:39:07');
INSERT INTO `sys_log` VALUES (30818, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:39:07', '超管', '2023-07-06 19:39:07');
INSERT INTO `sys_log` VALUES (30819, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:39:26', '超管', '2023-07-06 19:39:26');
INSERT INTO `sys_log` VALUES (30820, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:39:33', '超管', '2023-07-06 19:39:33');
INSERT INTO `sys_log` VALUES (30821, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":27,\"avatar\":\"http://localhost:8888/static/images/2d71559cdd814ee89e70a49382681590.jpg\",\"avatarArray\":[\"http://localhost:8888/static/images/2d71559cdd814ee89e70a49382681590.jpg\",\"http://localhos...', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:07', '超管', '2023-07-06 19:40:07');
INSERT INTO `sys_log` VALUES (30822, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:07', '超管', '2023-07-06 19:40:07');
INSERT INTO `sys_log` VALUES (30823, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:07', '超管', '2023-07-06 19:40:07');
INSERT INTO `sys_log` VALUES (30824, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:10', '超管', '2023-07-06 19:40:10');
INSERT INTO `sys_log` VALUES (30825, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":21,\"avatar\":\"http://localhost:8888/static/images/2d71559cdd814ee89e70a49382681590.jpg\",\"avatarArray\":[\"http://localhost:8888/static/images/2d71559cdd814ee89e70a49382681590.jpg\",\"http://localhos...', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:22', '超管', '2023-07-06 19:40:22');
INSERT INTO `sys_log` VALUES (30826, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:22', '超管', '2023-07-06 19:40:22');
INSERT INTO `sys_log` VALUES (30827, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:22', '超管', '2023-07-06 19:40:22');
INSERT INTO `sys_log` VALUES (30828, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:23', '超管', '2023-07-06 19:40:23');
INSERT INTO `sys_log` VALUES (30829, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:35', '超管', '2023-07-06 19:40:35');
INSERT INTO `sys_log` VALUES (30830, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateOwnInfo()', '{\"age\":20,\"homeAddress\":\"南宁\",\"id\":1,\"identity\":\"450322200012121314\",\"mobile\":\"13500000000\",\"name\":\"admin\",\"nickName\":\"超管\",\"sex\":\"女\",\"userRoles\":[]}', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:42', '超管', '2023-07-06 19:40:42');
INSERT INTO `sys_log` VALUES (30831, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:43', '超管', '2023-07-06 19:40:43');
INSERT INTO `sys_log` VALUES (30832, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 11, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:48', '超管', '2023-07-06 19:40:48');
INSERT INTO `sys_log` VALUES (30833, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:48', '超管', '2023-07-06 19:40:48');
INSERT INTO `sys_log` VALUES (30834, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:48', '超管', '2023-07-06 19:40:48');
INSERT INTO `sys_log` VALUES (30835, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:48', '超管', '2023-07-06 19:40:48');
INSERT INTO `sys_log` VALUES (30836, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:49', '超管', '2023-07-06 19:40:49');
INSERT INTO `sys_log` VALUES (30837, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:40:49', '超管', '2023-07-06 19:40:49');
INSERT INTO `sys_log` VALUES (30838, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:42:02', '超管', '2023-07-06 19:42:02');
INSERT INTO `sys_log` VALUES (30839, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:42:02', '超管', '2023-07-06 19:42:02');
INSERT INTO `sys_log` VALUES (30840, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:43:02', '超管', '2023-07-06 19:43:02');
INSERT INTO `sys_log` VALUES (30841, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:43:03', '超管', '2023-07-06 19:43:03');
INSERT INTO `sys_log` VALUES (30842, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:48:39', '超管', '2023-07-06 19:48:39');
INSERT INTO `sys_log` VALUES (30843, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:48:39', '超管', '2023-07-06 19:48:39');
INSERT INTO `sys_log` VALUES (30844, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:50:08', '超管', '2023-07-06 19:50:08');
INSERT INTO `sys_log` VALUES (30845, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 19:50:08', '超管', '2023-07-06 19:50:08');
INSERT INTO `sys_log` VALUES (30846, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 194, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:36:59', '超管', '2023-07-06 20:36:59');
INSERT INTO `sys_log` VALUES (30847, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 199, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:36:59', '超管', '2023-07-06 20:36:59');
INSERT INTO `sys_log` VALUES (30848, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 11, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:37:12', '超管', '2023-07-06 20:37:12');
INSERT INTO `sys_log` VALUES (30849, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 41, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:37:12', '超管', '2023-07-06 20:37:12');
INSERT INTO `sys_log` VALUES (30850, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:37:21', '超管', '2023-07-06 20:37:21');
INSERT INTO `sys_log` VALUES (30851, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:37:25', '超管', '2023-07-06 20:37:25');
INSERT INTO `sys_log` VALUES (30852, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:37:25', '超管', '2023-07-06 20:37:25');
INSERT INTO `sys_log` VALUES (30853, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:37:25', '超管', '2023-07-06 20:37:25');
INSERT INTO `sys_log` VALUES (30854, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 10, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:37:34', '超管', '2023-07-06 20:37:34');
INSERT INTO `sys_log` VALUES (30855, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:39:04', '超管', '2023-07-06 20:39:04');
INSERT INTO `sys_log` VALUES (30856, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:39:10', '超管', '2023-07-06 20:39:10');
INSERT INTO `sys_log` VALUES (30857, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":27,\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=...', 26, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:39:18', '超管', '2023-07-06 20:39:18');
INSERT INTO `sys_log` VALUES (30858, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:39:18', '超管', '2023-07-06 20:39:18');
INSERT INTO `sys_log` VALUES (30859, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:39:18', '超管', '2023-07-06 20:39:18');
INSERT INTO `sys_log` VALUES (30860, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:39:26', '超管', '2023-07-06 20:39:26');
INSERT INTO `sys_log` VALUES (30861, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:39:26', '超管', '2023-07-06 20:39:26');
INSERT INTO `sys_log` VALUES (30862, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:31', '超管', '2023-07-06 20:42:31');
INSERT INTO `sys_log` VALUES (30863, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:31', '超管', '2023-07-06 20:42:31');
INSERT INTO `sys_log` VALUES (30864, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:34', '超管', '2023-07-06 20:42:34');
INSERT INTO `sys_log` VALUES (30865, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:34', '超管', '2023-07-06 20:42:34');
INSERT INTO `sys_log` VALUES (30866, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:36', '超管', '2023-07-06 20:42:36');
INSERT INTO `sys_log` VALUES (30867, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:36', '超管', '2023-07-06 20:42:36');
INSERT INTO `sys_log` VALUES (30868, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:36', '超管', '2023-07-06 20:42:36');
INSERT INTO `sys_log` VALUES (30869, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:38', '超管', '2023-07-06 20:42:38');
INSERT INTO `sys_log` VALUES (30870, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:39', '超管', '2023-07-06 20:42:39');
INSERT INTO `sys_log` VALUES (30871, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:39', '超管', '2023-07-06 20:42:39');
INSERT INTO `sys_log` VALUES (30872, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:45', '超管', '2023-07-06 20:42:45');
INSERT INTO `sys_log` VALUES (30873, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:45', '超管', '2023-07-06 20:42:45');
INSERT INTO `sys_log` VALUES (30874, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:53', '超管', '2023-07-06 20:42:53');
INSERT INTO `sys_log` VALUES (30875, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:53', '超管', '2023-07-06 20:42:53');
INSERT INTO `sys_log` VALUES (30876, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:53', '超管', '2023-07-06 20:42:53');
INSERT INTO `sys_log` VALUES (30877, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:56', '超管', '2023-07-06 20:42:56');
INSERT INTO `sys_log` VALUES (30878, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:56', '超管', '2023-07-06 20:42:56');
INSERT INTO `sys_log` VALUES (30879, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:42:57', '超管', '2023-07-06 20:42:57');
INSERT INTO `sys_log` VALUES (30880, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":21,\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=...', 10, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:01', '超管', '2023-07-06 20:43:01');
INSERT INTO `sys_log` VALUES (30881, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:01', '超管', '2023-07-06 20:43:01');
INSERT INTO `sys_log` VALUES (30882, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:01', '超管', '2023-07-06 20:43:01');
INSERT INTO `sys_log` VALUES (30883, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:03', '超管', '2023-07-06 20:43:03');
INSERT INTO `sys_log` VALUES (30884, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:03', '超管', '2023-07-06 20:43:03');
INSERT INTO `sys_log` VALUES (30885, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:03', '超管', '2023-07-06 20:43:03');
INSERT INTO `sys_log` VALUES (30886, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:05', '超管', '2023-07-06 20:43:05');
INSERT INTO `sys_log` VALUES (30887, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:05', '超管', '2023-07-06 20:43:05');
INSERT INTO `sys_log` VALUES (30888, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:07', '超管', '2023-07-06 20:43:07');
INSERT INTO `sys_log` VALUES (30889, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:07', '超管', '2023-07-06 20:43:07');
INSERT INTO `sys_log` VALUES (30890, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:15', '超管', '2023-07-06 20:43:15');
INSERT INTO `sys_log` VALUES (30891, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:15', '超管', '2023-07-06 20:43:15');
INSERT INTO `sys_log` VALUES (30892, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:24', '超管', '2023-07-06 20:43:24');
INSERT INTO `sys_log` VALUES (30893, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":21,\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=...', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:27', '超管', '2023-07-06 20:43:27');
INSERT INTO `sys_log` VALUES (30894, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:27', '超管', '2023-07-06 20:43:27');
INSERT INTO `sys_log` VALUES (30895, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:27', '超管', '2023-07-06 20:43:27');
INSERT INTO `sys_log` VALUES (30896, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:29', '超管', '2023-07-06 20:43:29');
INSERT INTO `sys_log` VALUES (30897, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:29', '超管', '2023-07-06 20:43:29');
INSERT INTO `sys_log` VALUES (30898, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:56', '超管', '2023-07-06 20:43:56');
INSERT INTO `sys_log` VALUES (30899, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:56', '超管', '2023-07-06 20:43:56');
INSERT INTO `sys_log` VALUES (30900, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:43:59', '超管', '2023-07-06 20:43:59');
INSERT INTO `sys_log` VALUES (30901, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":21,\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=...', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:44:01', '超管', '2023-07-06 20:44:01');
INSERT INTO `sys_log` VALUES (30902, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:44:01', '超管', '2023-07-06 20:44:01');
INSERT INTO `sys_log` VALUES (30903, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:44:01', '超管', '2023-07-06 20:44:01');
INSERT INTO `sys_log` VALUES (30904, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:44:04', '超管', '2023-07-06 20:44:04');
INSERT INTO `sys_log` VALUES (30905, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:44:04', '超管', '2023-07-06 20:44:04');
INSERT INTO `sys_log` VALUES (30906, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:44:05', '超管', '2023-07-06 20:44:05');
INSERT INTO `sys_log` VALUES (30907, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:44:05', '超管', '2023-07-06 20:44:05');
INSERT INTO `sys_log` VALUES (30908, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:22', '超管', '2023-07-06 20:45:22');
INSERT INTO `sys_log` VALUES (30909, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":21,\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=...', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:24', '超管', '2023-07-06 20:45:24');
INSERT INTO `sys_log` VALUES (30910, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:24', '超管', '2023-07-06 20:45:24');
INSERT INTO `sys_log` VALUES (30911, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:24', '超管', '2023-07-06 20:45:24');
INSERT INTO `sys_log` VALUES (30912, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:27', '超管', '2023-07-06 20:45:27');
INSERT INTO `sys_log` VALUES (30913, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:27', '超管', '2023-07-06 20:45:27');
INSERT INTO `sys_log` VALUES (30914, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:51', '超管', '2023-07-06 20:45:51');
INSERT INTO `sys_log` VALUES (30915, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:53', '超管', '2023-07-06 20:45:53');
INSERT INTO `sys_log` VALUES (30916, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":21,\"avatar\":\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\",\"avatarArray\":[\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\",\"htt...', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:56', '超管', '2023-07-06 20:45:56');
INSERT INTO `sys_log` VALUES (30917, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:56', '超管', '2023-07-06 20:45:56');
INSERT INTO `sys_log` VALUES (30918, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:45:56', '超管', '2023-07-06 20:45:56');
INSERT INTO `sys_log` VALUES (30919, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:46:20', '超管', '2023-07-06 20:46:20');
INSERT INTO `sys_log` VALUES (30920, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:46:20', '超管', '2023-07-06 20:46:20');
INSERT INTO `sys_log` VALUES (30921, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:27', '超管', '2023-07-06 20:51:27');
INSERT INTO `sys_log` VALUES (30922, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:27', '超管', '2023-07-06 20:51:27');
INSERT INTO `sys_log` VALUES (30923, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:29', '超管', '2023-07-06 20:51:29');
INSERT INTO `sys_log` VALUES (30924, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:29', '超管', '2023-07-06 20:51:29');
INSERT INTO `sys_log` VALUES (30925, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:30', '超管', '2023-07-06 20:51:30');
INSERT INTO `sys_log` VALUES (30926, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:32', '超管', '2023-07-06 20:51:32');
INSERT INTO `sys_log` VALUES (30927, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":21,\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=...', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:34', '超管', '2023-07-06 20:51:34');
INSERT INTO `sys_log` VALUES (30928, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:34', '超管', '2023-07-06 20:51:34');
INSERT INTO `sys_log` VALUES (30929, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:34', '超管', '2023-07-06 20:51:34');
INSERT INTO `sys_log` VALUES (30930, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:37', '超管', '2023-07-06 20:51:37');
INSERT INTO `sys_log` VALUES (30931, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:37', '超管', '2023-07-06 20:51:37');
INSERT INTO `sys_log` VALUES (30932, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:39', '超管', '2023-07-06 20:51:39');
INSERT INTO `sys_log` VALUES (30933, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:39', '超管', '2023-07-06 20:51:39');
INSERT INTO `sys_log` VALUES (30934, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:41', '超管', '2023-07-06 20:51:41');
INSERT INTO `sys_log` VALUES (30935, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"age\":27,\"avatar\":\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\",\"avatarArray\":[\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\"],\"ho...', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:46', '超管', '2023-07-06 20:51:46');
INSERT INTO `sys_log` VALUES (30936, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:46', '超管', '2023-07-06 20:51:46');
INSERT INTO `sys_log` VALUES (30937, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:46', '超管', '2023-07-06 20:51:46');
INSERT INTO `sys_log` VALUES (30938, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:51:48', '超管', '2023-07-06 20:51:48');
INSERT INTO `sys_log` VALUES (30939, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:52:15', '超管', '2023-07-06 20:52:15');
INSERT INTO `sys_log` VALUES (30940, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 20:56:00', '超管', '2023-07-06 20:56:00');
INSERT INTO `sys_log` VALUES (30941, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:15:47', '超管', '2023-07-06 21:15:47');
INSERT INTO `sys_log` VALUES (30942, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:15:47', '超管', '2023-07-06 21:15:47');
INSERT INTO `sys_log` VALUES (30943, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:19:52', '超管', '2023-07-06 21:19:52');
INSERT INTO `sys_log` VALUES (30944, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:19:52', '超管', '2023-07-06 21:19:52');
INSERT INTO `sys_log` VALUES (30945, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:19:56', '超管', '2023-07-06 21:19:56');
INSERT INTO `sys_log` VALUES (30946, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:19:56', '超管', '2023-07-06 21:19:56');
INSERT INTO `sys_log` VALUES (30947, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:19:59', '超管', '2023-07-06 21:19:59');
INSERT INTO `sys_log` VALUES (30948, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:19:59', '超管', '2023-07-06 21:19:59');
INSERT INTO `sys_log` VALUES (30949, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:00', '超管', '2023-07-06 21:20:00');
INSERT INTO `sys_log` VALUES (30950, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:00', '超管', '2023-07-06 21:20:00');
INSERT INTO `sys_log` VALUES (30951, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:00', '超管', '2023-07-06 21:20:00');
INSERT INTO `sys_log` VALUES (30952, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:01', '超管', '2023-07-06 21:20:01');
INSERT INTO `sys_log` VALUES (30953, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:01', '超管', '2023-07-06 21:20:01');
INSERT INTO `sys_log` VALUES (30954, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:01', '超管', '2023-07-06 21:20:01');
INSERT INTO `sys_log` VALUES (30955, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:01', '超管', '2023-07-06 21:20:01');
INSERT INTO `sys_log` VALUES (30956, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:02', '超管', '2023-07-06 21:20:02');
INSERT INTO `sys_log` VALUES (30957, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:02', '超管', '2023-07-06 21:20:02');
INSERT INTO `sys_log` VALUES (30958, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:03', '超管', '2023-07-06 21:20:03');
INSERT INTO `sys_log` VALUES (30959, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:20:03', '超管', '2023-07-06 21:20:03');
INSERT INTO `sys_log` VALUES (30960, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 182, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:26:59', '超管', '2023-07-06 21:26:59');
INSERT INTO `sys_log` VALUES (30961, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 171, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:29:19', '超管', '2023-07-06 21:29:19');
INSERT INTO `sys_log` VALUES (30962, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 167, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:30:26', '超管', '2023-07-06 21:30:26');
INSERT INTO `sys_log` VALUES (30963, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 177, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:31:50', '超管', '2023-07-06 21:31:50');
INSERT INTO `sys_log` VALUES (30964, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 177, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:31:50', '超管', '2023-07-06 21:31:50');
INSERT INTO `sys_log` VALUES (30965, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:31:56', '超管', '2023-07-06 21:31:56');
INSERT INTO `sys_log` VALUES (30966, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:32:50', '超管', '2023-07-06 21:32:50');
INSERT INTO `sys_log` VALUES (30967, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:32:50', '超管', '2023-07-06 21:32:50');
INSERT INTO `sys_log` VALUES (30968, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:34:09', '超管', '2023-07-06 21:34:09');
INSERT INTO `sys_log` VALUES (30969, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:34:09', '超管', '2023-07-06 21:34:09');
INSERT INTO `sys_log` VALUES (30970, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:34:11', '超管', '2023-07-06 21:34:11');
INSERT INTO `sys_log` VALUES (30971, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:34:11', '超管', '2023-07-06 21:34:11');
INSERT INTO `sys_log` VALUES (30972, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:35:27', '超管', '2023-07-06 21:35:27');
INSERT INTO `sys_log` VALUES (30973, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:35:27', '超管', '2023-07-06 21:35:27');
INSERT INTO `sys_log` VALUES (30974, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:36:11', '超管', '2023-07-06 21:36:11');
INSERT INTO `sys_log` VALUES (30975, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:36:11', '超管', '2023-07-06 21:36:11');
INSERT INTO `sys_log` VALUES (30976, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:37:16', '超管', '2023-07-06 21:37:16');
INSERT INTO `sys_log` VALUES (30977, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:37:16', '超管', '2023-07-06 21:37:16');
INSERT INTO `sys_log` VALUES (30978, '超管', NULL, 'cn.edu.guet.controller.SysUserController.checkUserName()', '\"h\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:37:26', '超管', '2023-07-06 21:37:26');
INSERT INTO `sys_log` VALUES (30979, '超管', NULL, 'cn.edu.guet.controller.SysUserController.checkUserName()', '\"he\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:37:26', '超管', '2023-07-06 21:37:26');
INSERT INTO `sys_log` VALUES (30980, '超管', NULL, 'cn.edu.guet.controller.SysUserController.checkUserName()', '\"h\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:37:28', '超管', '2023-07-06 21:37:28');
INSERT INTO `sys_log` VALUES (30981, '超管', NULL, 'cn.edu.guet.controller.SysUserController.checkUserName()', '\"hx\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:37:28', '超管', '2023-07-06 21:37:28');
INSERT INTO `sys_log` VALUES (30982, '超管', NULL, 'cn.edu.guet.controller.SysUserController.checkUserName()', '\"hxh\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:37:28', '超管', '2023-07-06 21:37:28');
INSERT INTO `sys_log` VALUES (30983, '超管', NULL, 'cn.edu.guet.controller.SysUserController.addUser()', '{\"avatar\":\"\",\"birthday\":634752000000,\"createBy\":\"超管\",\"homeAddress\":\"长春\",\"id\":32,\"identity\":\"450102199002124052\",\"lastUpdateBy\":\"超管\",\"mobile\":\"15078321234\",\"name\":\"hxh\",\"nickName\":\"李白\",\"password\":\"bbc0...', 17, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:38:44', '超管', '2023-07-06 21:38:44');
INSERT INTO `sys_log` VALUES (30984, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:38:44', '超管', '2023-07-06 21:38:44');
INSERT INTO `sys_log` VALUES (30985, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:38:44', '超管', '2023-07-06 21:38:44');
INSERT INTO `sys_log` VALUES (30986, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:42:28', '超管', '2023-07-06 21:42:28');
INSERT INTO `sys_log` VALUES (30987, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:42:28', '超管', '2023-07-06 21:42:28');
INSERT INTO `sys_log` VALUES (30988, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:43:53', '超管', '2023-07-06 21:43:53');
INSERT INTO `sys_log` VALUES (30989, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:43:53', '超管', '2023-07-06 21:43:53');
INSERT INTO `sys_log` VALUES (30990, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:46:17', '超管', '2023-07-06 21:46:17');
INSERT INTO `sys_log` VALUES (30991, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:46:17', '超管', '2023-07-06 21:46:17');
INSERT INTO `sys_log` VALUES (30992, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:46:48', '超管', '2023-07-06 21:46:48');
INSERT INTO `sys_log` VALUES (30993, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:46:48', '超管', '2023-07-06 21:46:48');
INSERT INTO `sys_log` VALUES (30994, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:48:12', '超管', '2023-07-06 21:48:12');
INSERT INTO `sys_log` VALUES (30995, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:48:12', '超管', '2023-07-06 21:48:12');
INSERT INTO `sys_log` VALUES (30996, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:48:24', '超管', '2023-07-06 21:48:24');
INSERT INTO `sys_log` VALUES (30997, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:48:24', '超管', '2023-07-06 21:48:24');
INSERT INTO `sys_log` VALUES (30998, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:48:42', '超管', '2023-07-06 21:48:42');
INSERT INTO `sys_log` VALUES (30999, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:48:42', '超管', '2023-07-06 21:48:42');
INSERT INTO `sys_log` VALUES (31000, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:49:50', '超管', '2023-07-06 21:49:50');
INSERT INTO `sys_log` VALUES (31001, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:49:50', '超管', '2023-07-06 21:49:50');
INSERT INTO `sys_log` VALUES (31002, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:51:08', '超管', '2023-07-06 21:51:08');
INSERT INTO `sys_log` VALUES (31003, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:51:08', '超管', '2023-07-06 21:51:08');
INSERT INTO `sys_log` VALUES (31004, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:51:18', '超管', '2023-07-06 21:51:18');
INSERT INTO `sys_log` VALUES (31005, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:51:18', '超管', '2023-07-06 21:51:18');
INSERT INTO `sys_log` VALUES (31006, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:51:58', '超管', '2023-07-06 21:51:58');
INSERT INTO `sys_log` VALUES (31007, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:51:58', '超管', '2023-07-06 21:51:58');
INSERT INTO `sys_log` VALUES (31008, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:52:09', '超管', '2023-07-06 21:52:09');
INSERT INTO `sys_log` VALUES (31009, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:52:09', '超管', '2023-07-06 21:52:09');
INSERT INTO `sys_log` VALUES (31010, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:53:14', '超管', '2023-07-06 21:53:14');
INSERT INTO `sys_log` VALUES (31011, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:53:14', '超管', '2023-07-06 21:53:14');
INSERT INTO `sys_log` VALUES (31012, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:53:47', '超管', '2023-07-06 21:53:47');
INSERT INTO `sys_log` VALUES (31013, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:53:47', '超管', '2023-07-06 21:53:47');
INSERT INTO `sys_log` VALUES (31014, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:54:16', '超管', '2023-07-06 21:54:16');
INSERT INTO `sys_log` VALUES (31015, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:54:16', '超管', '2023-07-06 21:54:16');
INSERT INTO `sys_log` VALUES (31016, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:55:04', '超管', '2023-07-06 21:55:04');
INSERT INTO `sys_log` VALUES (31017, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:55:04', '超管', '2023-07-06 21:55:04');
INSERT INTO `sys_log` VALUES (31018, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:56:35', '超管', '2023-07-06 21:56:35');
INSERT INTO `sys_log` VALUES (31019, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:56:35', '超管', '2023-07-06 21:56:35');
INSERT INTO `sys_log` VALUES (31020, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:59:30', '超管', '2023-07-06 21:59:30');
INSERT INTO `sys_log` VALUES (31021, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:59:30', '超管', '2023-07-06 21:59:30');
INSERT INTO `sys_log` VALUES (31022, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:59:42', '超管', '2023-07-06 21:59:42');
INSERT INTO `sys_log` VALUES (31023, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 21:59:42', '超管', '2023-07-06 21:59:42');
INSERT INTO `sys_log` VALUES (31024, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:28', '超管', '2023-07-06 22:00:28');
INSERT INTO `sys_log` VALUES (31025, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:28', '超管', '2023-07-06 22:00:28');
INSERT INTO `sys_log` VALUES (31026, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:36', '超管', '2023-07-06 22:00:36');
INSERT INTO `sys_log` VALUES (31027, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:36', '超管', '2023-07-06 22:00:36');
INSERT INTO `sys_log` VALUES (31028, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:48', '超管', '2023-07-06 22:00:48');
INSERT INTO `sys_log` VALUES (31029, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:48', '超管', '2023-07-06 22:00:48');
INSERT INTO `sys_log` VALUES (31030, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:52', '超管', '2023-07-06 22:00:52');
INSERT INTO `sys_log` VALUES (31031, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:00:52', '超管', '2023-07-06 22:00:52');
INSERT INTO `sys_log` VALUES (31032, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:01:03', '超管', '2023-07-06 22:01:03');
INSERT INTO `sys_log` VALUES (31033, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 29, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:01:03', '超管', '2023-07-06 22:01:03');
INSERT INTO `sys_log` VALUES (31034, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:01:04', '超管', '2023-07-06 22:01:04');
INSERT INTO `sys_log` VALUES (31035, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:01:04', '超管', '2023-07-06 22:01:04');
INSERT INTO `sys_log` VALUES (31036, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:01:04', '超管', '2023-07-06 22:01:04');
INSERT INTO `sys_log` VALUES (31037, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:01:06', '超管', '2023-07-06 22:01:06');
INSERT INTO `sys_log` VALUES (31038, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:02:05', '超管', '2023-07-06 22:02:05');
INSERT INTO `sys_log` VALUES (31039, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:02:05', '超管', '2023-07-06 22:02:05');
INSERT INTO `sys_log` VALUES (31040, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:02:06', '超管', '2023-07-06 22:02:06');
INSERT INTO `sys_log` VALUES (31041, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:02:06', '超管', '2023-07-06 22:02:06');
INSERT INTO `sys_log` VALUES (31042, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:02:06', '超管', '2023-07-06 22:02:06');
INSERT INTO `sys_log` VALUES (31043, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:02:07', '超管', '2023-07-06 22:02:07');
INSERT INTO `sys_log` VALUES (31044, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:02:10', '超管', '2023-07-06 22:02:10');
INSERT INTO `sys_log` VALUES (31045, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:03:29', '超管', '2023-07-06 22:03:29');
INSERT INTO `sys_log` VALUES (31046, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 96, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:03:35', '超管', '2023-07-06 22:03:35');
INSERT INTO `sys_log` VALUES (31047, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:03:35', '超管', '2023-07-06 22:03:35');
INSERT INTO `sys_log` VALUES (31048, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:03:35', '超管', '2023-07-06 22:03:35');
INSERT INTO `sys_log` VALUES (31049, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:03:35', '超管', '2023-07-06 22:03:35');
INSERT INTO `sys_log` VALUES (31050, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:03:37', '超管', '2023-07-06 22:03:37');
INSERT INTO `sys_log` VALUES (31051, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:03:53', '超管', '2023-07-06 22:03:53');
INSERT INTO `sys_log` VALUES (31052, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:14:36', '超管', '2023-07-06 22:14:36');
INSERT INTO `sys_log` VALUES (31053, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:14:39', '超管', '2023-07-06 22:14:39');
INSERT INTO `sys_log` VALUES (31054, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:14:39', '超管', '2023-07-06 22:14:39');
INSERT INTO `sys_log` VALUES (31055, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:14:42', '超管', '2023-07-06 22:14:42');
INSERT INTO `sys_log` VALUES (31056, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:15:24', '超管', '2023-07-06 22:15:24');
INSERT INTO `sys_log` VALUES (31057, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:15:24', '超管', '2023-07-06 22:15:24');
INSERT INTO `sys_log` VALUES (31058, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:15:27', '超管', '2023-07-06 22:15:27');
INSERT INTO `sys_log` VALUES (31059, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:16:03', '超管', '2023-07-06 22:16:03');
INSERT INTO `sys_log` VALUES (31060, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:16:03', '超管', '2023-07-06 22:16:03');
INSERT INTO `sys_log` VALUES (31061, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:16:11', '超管', '2023-07-06 22:16:11');
INSERT INTO `sys_log` VALUES (31062, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 173, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:22:26', '超管', '2023-07-06 22:22:26');
INSERT INTO `sys_log` VALUES (31063, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 178, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:36:11', '超管', '2023-07-06 22:36:11');
INSERT INTO `sys_log` VALUES (31064, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:38:58', '超管', '2023-07-06 22:38:58');
INSERT INTO `sys_log` VALUES (31065, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 41, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:38:58', '超管', '2023-07-06 22:38:58');
INSERT INTO `sys_log` VALUES (31066, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:38:59', '超管', '2023-07-06 22:38:59');
INSERT INTO `sys_log` VALUES (31067, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 29, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:38:59', '超管', '2023-07-06 22:38:59');
INSERT INTO `sys_log` VALUES (31068, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:00', '超管', '2023-07-06 22:39:00');
INSERT INTO `sys_log` VALUES (31069, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:00', '超管', '2023-07-06 22:39:00');
INSERT INTO `sys_log` VALUES (31070, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:00', '超管', '2023-07-06 22:39:00');
INSERT INTO `sys_log` VALUES (31071, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 11, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:01', '超管', '2023-07-06 22:39:01');
INSERT INTO `sys_log` VALUES (31072, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:03', '超管', '2023-07-06 22:39:03');
INSERT INTO `sys_log` VALUES (31073, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:03', '超管', '2023-07-06 22:39:03');
INSERT INTO `sys_log` VALUES (31074, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:04', '超管', '2023-07-06 22:39:04');
INSERT INTO `sys_log` VALUES (31075, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:04', '超管', '2023-07-06 22:39:04');
INSERT INTO `sys_log` VALUES (31076, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:05', '超管', '2023-07-06 22:39:05');
INSERT INTO `sys_log` VALUES (31077, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:05', '超管', '2023-07-06 22:39:05');
INSERT INTO `sys_log` VALUES (31078, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:05', '超管', '2023-07-06 22:39:05');
INSERT INTO `sys_log` VALUES (31079, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:06', '超管', '2023-07-06 22:39:06');
INSERT INTO `sys_log` VALUES (31080, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:08', '超管', '2023-07-06 22:39:08');
INSERT INTO `sys_log` VALUES (31081, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:08', '超管', '2023-07-06 22:39:08');
INSERT INTO `sys_log` VALUES (31082, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:08', '超管', '2023-07-06 22:39:08');
INSERT INTO `sys_log` VALUES (31083, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:09', '超管', '2023-07-06 22:39:09');
INSERT INTO `sys_log` VALUES (31084, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:09', '超管', '2023-07-06 22:39:09');
INSERT INTO `sys_log` VALUES (31085, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:10', '超管', '2023-07-06 22:39:10');
INSERT INTO `sys_log` VALUES (31086, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:10', '超管', '2023-07-06 22:39:10');
INSERT INTO `sys_log` VALUES (31087, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:39:14', '超管', '2023-07-06 22:39:14');
INSERT INTO `sys_log` VALUES (31088, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 95, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:48', '超管', '2023-07-06 22:40:48');
INSERT INTO `sys_log` VALUES (31089, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:48', '超管', '2023-07-06 22:40:48');
INSERT INTO `sys_log` VALUES (31090, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:48', '超管', '2023-07-06 22:40:48');
INSERT INTO `sys_log` VALUES (31091, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:48', '超管', '2023-07-06 22:40:48');
INSERT INTO `sys_log` VALUES (31092, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:52', '超管', '2023-07-06 22:40:52');
INSERT INTO `sys_log` VALUES (31093, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:52', '超管', '2023-07-06 22:40:52');
INSERT INTO `sys_log` VALUES (31094, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:53', '超管', '2023-07-06 22:40:53');
INSERT INTO `sys_log` VALUES (31095, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:53', '超管', '2023-07-06 22:40:53');
INSERT INTO `sys_log` VALUES (31096, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:40:58', '超管', '2023-07-06 22:40:58');
INSERT INTO `sys_log` VALUES (31097, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPE...', 14, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:41:35', '超管', '2023-07-06 22:41:35');
INSERT INTO `sys_log` VALUES (31098, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:41:35', '超管', '2023-07-06 22:41:35');
INSERT INTO `sys_log` VALUES (31099, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:41:35', '超管', '2023-07-06 22:41:35');
INSERT INTO `sys_log` VALUES (31100, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:41:38', '超管', '2023-07-06 22:41:38');
INSERT INTO `sys_log` VALUES (31101, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:41:47', '超管', '2023-07-06 22:41:47');
INSERT INTO `sys_log` VALUES (31102, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:41:49', '超管', '2023-07-06 22:41:49');
INSERT INTO `sys_log` VALUES (31103, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:42:04', '超管', '2023-07-06 22:42:04');
INSERT INTO `sys_log` VALUES (31104, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:42:53', '超管', '2023-07-06 22:42:53');
INSERT INTO `sys_log` VALUES (31105, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPE...', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:42:55', '超管', '2023-07-06 22:42:55');
INSERT INTO `sys_log` VALUES (31106, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:42:55', '超管', '2023-07-06 22:42:55');
INSERT INTO `sys_log` VALUES (31107, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:42:55', '超管', '2023-07-06 22:42:55');
INSERT INTO `sys_log` VALUES (31108, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:42:58', '超管', '2023-07-06 22:42:58');
INSERT INTO `sys_log` VALUES (31109, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:04', '超管', '2023-07-06 22:43:04');
INSERT INTO `sys_log` VALUES (31110, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:07', '超管', '2023-07-06 22:43:07');
INSERT INTO `sys_log` VALUES (31111, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\",\"avatarArray\":[\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\"],\"birthday\":9...', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:23', '超管', '2023-07-06 22:43:23');
INSERT INTO `sys_log` VALUES (31112, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:23', '超管', '2023-07-06 22:43:23');
INSERT INTO `sys_log` VALUES (31113, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:23', '超管', '2023-07-06 22:43:23');
INSERT INTO `sys_log` VALUES (31114, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:25', '超管', '2023-07-06 22:43:25');
INSERT INTO `sys_log` VALUES (31115, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:29', '超管', '2023-07-06 22:43:29');
INSERT INTO `sys_log` VALUES (31116, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:31', '超管', '2023-07-06 22:43:31');
INSERT INTO `sys_log` VALUES (31117, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '32', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:33', '超管', '2023-07-06 22:43:33');
INSERT INTO `sys_log` VALUES (31118, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '32', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:56', '超管', '2023-07-06 22:43:56');
INSERT INTO `sys_log` VALUES (31119, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"\",\"avatarArray\":[\"\"],\"birthday\":1110729600000,\"homeAddress\":\"长春\",\"id\":32,\"identity\":\"131024200503149489\",\"lastUpdateBy\":\"超管\",\"mobile\":\"15078321234\",\"name\":\"hxh\",\"nickName\":\"李白\",\"roleId\":[2]...', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:59', '超管', '2023-07-06 22:43:59');
INSERT INTO `sys_log` VALUES (31120, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:59', '超管', '2023-07-06 22:43:59');
INSERT INTO `sys_log` VALUES (31121, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:43:59', '超管', '2023-07-06 22:43:59');
INSERT INTO `sys_log` VALUES (31122, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:01', '超管', '2023-07-06 22:44:01');
INSERT INTO `sys_log` VALUES (31123, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:04', '超管', '2023-07-06 22:44:04');
INSERT INTO `sys_log` VALUES (31124, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:18', '超管', '2023-07-06 22:44:18');
INSERT INTO `sys_log` VALUES (31125, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F08%2F20200408223320_qmwoc.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002...', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:21', '超管', '2023-07-06 22:44:21');
INSERT INTO `sys_log` VALUES (31126, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:21', '超管', '2023-07-06 22:44:21');
INSERT INTO `sys_log` VALUES (31127, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:21', '超管', '2023-07-06 22:44:21');
INSERT INTO `sys_log` VALUES (31128, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '1', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:45', '超管', '2023-07-06 22:44:45');
INSERT INTO `sys_log` VALUES (31129, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202004%2F08%2F20200408223320_qmwoc.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002...', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:49', '超管', '2023-07-06 22:44:49');
INSERT INTO `sys_log` VALUES (31130, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:49', '超管', '2023-07-06 22:44:49');
INSERT INTO `sys_log` VALUES (31131, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:44:49', '超管', '2023-07-06 22:44:49');
INSERT INTO `sys_log` VALUES (31132, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:00', '超管', '2023-07-06 22:45:00');
INSERT INTO `sys_log` VALUES (31133, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500\",\"avatarArray\":[\"https://img0.baidu.com/it/u=1340932756,1533495834&fm=253&fmt=auto&app=138&f=JPE...', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:04', '超管', '2023-07-06 22:45:04');
INSERT INTO `sys_log` VALUES (31134, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:04', '超管', '2023-07-06 22:45:04');
INSERT INTO `sys_log` VALUES (31135, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:04', '超管', '2023-07-06 22:45:04');
INSERT INTO `sys_log` VALUES (31136, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:11', '超管', '2023-07-06 22:45:11');
INSERT INTO `sys_log` VALUES (31137, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\",\"avatarArray\":[\"https://p2.itc.cn/q_70/images03/20220106/2b349325c2a44e6eb11a25cc9ea05ab5.jpeg\"],\"birthday\":9...', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:14', '超管', '2023-07-06 22:45:14');
INSERT INTO `sys_log` VALUES (31138, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:14', '超管', '2023-07-06 22:45:14');
INSERT INTO `sys_log` VALUES (31139, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:14', '超管', '2023-07-06 22:45:14');
INSERT INTO `sys_log` VALUES (31140, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '32', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:23', '超管', '2023-07-06 22:45:23');
INSERT INTO `sys_log` VALUES (31141, '超管', NULL, 'cn.edu.guet.controller.SysUserController.updateUser()', '{\"avatar\":\"\",\"avatarArray\":[\"\"],\"birthday\":1110729600000,\"homeAddress\":\"长春\",\"id\":32,\"identity\":\"131024200503149489\",\"lastUpdateBy\":\"超管\",\"mobile\":\"15252737666\",\"name\":\"hxh\",\"nickName\":\"李白\",\"roleId\":[2]...', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:26', '超管', '2023-07-06 22:45:26');
INSERT INTO `sys_log` VALUES (31142, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:26', '超管', '2023-07-06 22:45:26');
INSERT INTO `sys_log` VALUES (31143, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:26', '超管', '2023-07-06 22:45:26');
INSERT INTO `sys_log` VALUES (31144, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:29', '超管', '2023-07-06 22:45:29');
INSERT INTO `sys_log` VALUES (31145, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:29', '超管', '2023-07-06 22:45:29');
INSERT INTO `sys_log` VALUES (31146, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:32', '超管', '2023-07-06 22:45:32');
INSERT INTO `sys_log` VALUES (31147, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:32', '超管', '2023-07-06 22:45:32');
INSERT INTO `sys_log` VALUES (31148, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:33', '超管', '2023-07-06 22:45:33');
INSERT INTO `sys_log` VALUES (31149, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:37', '超管', '2023-07-06 22:45:37');
INSERT INTO `sys_log` VALUES (31150, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '32', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:45:40', '超管', '2023-07-06 22:45:40');
INSERT INTO `sys_log` VALUES (31151, NULL, NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"131024200503149489\",\"username\":\"hxh\"}', 3, '0:0:0:0:0:0:0:1', NULL, '2023-07-06 22:46:04', NULL, '2023-07-06 22:46:04');
INSERT INTO `sys_log` VALUES (31152, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 500, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:47:58', '李白', '2023-07-06 22:47:58');
INSERT INTO `sys_log` VALUES (31153, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 5, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:47:58', '李白', '2023-07-06 22:47:58');
INSERT INTO `sys_log` VALUES (31154, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 8, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:47:58', '李白', '2023-07-06 22:47:58');
INSERT INTO `sys_log` VALUES (31155, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 7, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:47:58', '李白', '2023-07-06 22:47:58');
INSERT INTO `sys_log` VALUES (31156, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 5, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:48:04', '李白', '2023-07-06 22:48:04');
INSERT INTO `sys_log` VALUES (31157, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 5, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:48:08', '李白', '2023-07-06 22:48:08');
INSERT INTO `sys_log` VALUES (31158, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 12, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:48:20', '李白', '2023-07-06 22:48:20');
INSERT INTO `sys_log` VALUES (31159, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 2, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:48:20', '李白', '2023-07-06 22:48:20');
INSERT INTO `sys_log` VALUES (31160, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 2, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:48:20', '李白', '2023-07-06 22:48:20');
INSERT INTO `sys_log` VALUES (31161, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 5, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:48:20', '李白', '2023-07-06 22:48:20');
INSERT INTO `sys_log` VALUES (31162, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 3, '0:0:0:0:0:0:0:1', '李白', '2023-07-06 22:48:24', '李白', '2023-07-06 22:48:24');
INSERT INTO `sys_log` VALUES (31163, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 12, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:48:32', '超管', '2023-07-06 22:48:32');
INSERT INTO `sys_log` VALUES (31164, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:48:32', '超管', '2023-07-06 22:48:32');
INSERT INTO `sys_log` VALUES (31165, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:48:32', '超管', '2023-07-06 22:48:32');
INSERT INTO `sys_log` VALUES (31166, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:48:32', '超管', '2023-07-06 22:48:32');
INSERT INTO `sys_log` VALUES (31167, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:48:34', '超管', '2023-07-06 22:48:34');
INSERT INTO `sys_log` VALUES (31168, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 38, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:48:34', '超管', '2023-07-06 22:48:34');
INSERT INTO `sys_log` VALUES (31169, '超管', NULL, 'cn.edu.guet.controller.SysUserController.sendExportParm()', NULL, 0, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:49:21', '超管', '2023-07-06 22:49:21');
INSERT INTO `sys_log` VALUES (31170, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:20', '超管', '2023-07-06 22:51:20');
INSERT INTO `sys_log` VALUES (31171, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:20', '超管', '2023-07-06 22:51:20');
INSERT INTO `sys_log` VALUES (31172, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:26', '超管', '2023-07-06 22:51:26');
INSERT INTO `sys_log` VALUES (31173, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:26', '超管', '2023-07-06 22:51:26');
INSERT INTO `sys_log` VALUES (31174, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 17, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:26', '超管', '2023-07-06 22:51:26');
INSERT INTO `sys_log` VALUES (31175, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:39', '超管', '2023-07-06 22:51:39');
INSERT INTO `sys_log` VALUES (31176, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:39', '超管', '2023-07-06 22:51:39');
INSERT INTO `sys_log` VALUES (31177, '超管', NULL, 'cn.edu.guet.controller.SysUserController.sendExportParm()', NULL, 0, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:51:40', '超管', '2023-07-06 22:51:40');
INSERT INTO `sys_log` VALUES (31178, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 215, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:52:15', '超管', '2023-07-06 22:52:15');
INSERT INTO `sys_log` VALUES (31179, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 218, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:52:15', '超管', '2023-07-06 22:52:15');
INSERT INTO `sys_log` VALUES (31180, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:52:16', '超管', '2023-07-06 22:52:16');
INSERT INTO `sys_log` VALUES (31181, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 10, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:52:16', '超管', '2023-07-06 22:52:16');
INSERT INTO `sys_log` VALUES (31182, '超管', NULL, 'cn.edu.guet.controller.SysUserController.sendExportParm()', NULL, 0, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:52:19', '超管', '2023-07-06 22:52:19');
INSERT INTO `sys_log` VALUES (31183, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:52:21', '超管', '2023-07-06 22:52:21');
INSERT INTO `sys_log` VALUES (31184, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:52:21', '超管', '2023-07-06 22:52:21');
INSERT INTO `sys_log` VALUES (31185, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 175, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:55:05', '超管', '2023-07-06 22:55:05');
INSERT INTO `sys_log` VALUES (31186, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 175, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:55:05', '超管', '2023-07-06 22:55:05');
INSERT INTO `sys_log` VALUES (31187, '超管', NULL, 'cn.edu.guet.controller.SysUserController.sendExportParm()', NULL, 0, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:55:06', '超管', '2023-07-06 22:55:06');
INSERT INTO `sys_log` VALUES (31188, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 172, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:56:50', '超管', '2023-07-06 22:56:50');
INSERT INTO `sys_log` VALUES (31189, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 172, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:56:50', '超管', '2023-07-06 22:56:50');
INSERT INTO `sys_log` VALUES (31190, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:56:51', '超管', '2023-07-06 22:56:51');
INSERT INTO `sys_log` VALUES (31191, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:56:51', '超管', '2023-07-06 22:56:51');
INSERT INTO `sys_log` VALUES (31192, '超管', NULL, 'cn.edu.guet.controller.SysUserController.sendExportParm()', NULL, 0, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:56:52', '超管', '2023-07-06 22:56:52');
INSERT INTO `sys_log` VALUES (31193, NULL, NULL, 'cn.edu.guet.controller.SysUserController.exportExcel()', NULL, 480, '0:0:0:0:0:0:0:1', NULL, '2023-07-06 22:56:52', NULL, '2023-07-06 22:56:52');
INSERT INTO `sys_log` VALUES (31194, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:57:17', '超管', '2023-07-06 22:57:17');
INSERT INTO `sys_log` VALUES (31195, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:57:17', '超管', '2023-07-06 22:57:17');
INSERT INTO `sys_log` VALUES (31196, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 25, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 22:57:17', '超管', '2023-07-06 22:57:17');
INSERT INTO `sys_log` VALUES (31197, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 23:19:13', '超管', '2023-07-06 23:19:13');
INSERT INTO `sys_log` VALUES (31198, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 23:19:13', '超管', '2023-07-06 23:19:13');
INSERT INTO `sys_log` VALUES (31199, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 23:19:13', '超管', '2023-07-06 23:19:13');
INSERT INTO `sys_log` VALUES (31200, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 23:19:14', '超管', '2023-07-06 23:19:14');
INSERT INTO `sys_log` VALUES (31201, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-06 23:19:14', '超管', '2023-07-06 23:19:14');
INSERT INTO `sys_log` VALUES (31202, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 666, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:09:07', '超管', '2023-07-07 13:09:07');
INSERT INTO `sys_log` VALUES (31203, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 21, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:09:18', '超管', '2023-07-07 13:09:18');
INSERT INTO `sys_log` VALUES (31204, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 26, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:09:32', '超管', '2023-07-07 13:09:32');
INSERT INTO `sys_log` VALUES (31205, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 25, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:10:32', '超管', '2023-07-07 13:10:32');
INSERT INTO `sys_log` VALUES (31206, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 717, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:11:24', '超管', '2023-07-07 13:11:24');
INSERT INTO `sys_log` VALUES (31207, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 21, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:12:47', '超管', '2023-07-07 13:12:47');
INSERT INTO `sys_log` VALUES (31208, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 29, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:13:55', '超管', '2023-07-07 13:13:55');
INSERT INTO `sys_log` VALUES (31209, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 27, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:14:19', '超管', '2023-07-07 13:14:19');
INSERT INTO `sys_log` VALUES (31210, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 20, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:32', '超管', '2023-07-07 13:16:32');
INSERT INTO `sys_log` VALUES (31211, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:32', '超管', '2023-07-07 13:16:32');
INSERT INTO `sys_log` VALUES (31212, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 10, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:32', '超管', '2023-07-07 13:16:32');
INSERT INTO `sys_log` VALUES (31213, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:32', '超管', '2023-07-07 13:16:32');
INSERT INTO `sys_log` VALUES (31214, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 12, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:56', '超管', '2023-07-07 13:16:56');
INSERT INTO `sys_log` VALUES (31215, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:56', '超管', '2023-07-07 13:16:56');
INSERT INTO `sys_log` VALUES (31216, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:56', '超管', '2023-07-07 13:16:56');
INSERT INTO `sys_log` VALUES (31217, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:16:56', '超管', '2023-07-07 13:16:56');
INSERT INTO `sys_log` VALUES (31218, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 16, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:19:16', '超管', '2023-07-07 13:19:16');
INSERT INTO `sys_log` VALUES (31219, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:19:16', '超管', '2023-07-07 13:19:16');
INSERT INTO `sys_log` VALUES (31220, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:19:16', '超管', '2023-07-07 13:19:16');
INSERT INTO `sys_log` VALUES (31221, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:19:16', '超管', '2023-07-07 13:19:16');
INSERT INTO `sys_log` VALUES (31222, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 14, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:24:05', '超管', '2023-07-07 13:24:05');
INSERT INTO `sys_log` VALUES (31223, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:24:06', '超管', '2023-07-07 13:24:06');
INSERT INTO `sys_log` VALUES (31224, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:24:06', '超管', '2023-07-07 13:24:06');
INSERT INTO `sys_log` VALUES (31225, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:24:06', '超管', '2023-07-07 13:24:06');
INSERT INTO `sys_log` VALUES (31226, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 15, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:26:17', '超管', '2023-07-07 13:26:17');
INSERT INTO `sys_log` VALUES (31227, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:26:17', '超管', '2023-07-07 13:26:17');
INSERT INTO `sys_log` VALUES (31228, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:26:17', '超管', '2023-07-07 13:26:17');
INSERT INTO `sys_log` VALUES (31229, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:26:17', '超管', '2023-07-07 13:26:17');
INSERT INTO `sys_log` VALUES (31230, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 13, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:31:41', '超管', '2023-07-07 13:31:41');
INSERT INTO `sys_log` VALUES (31231, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:31:41', '超管', '2023-07-07 13:31:41');
INSERT INTO `sys_log` VALUES (31232, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:31:41', '超管', '2023-07-07 13:31:41');
INSERT INTO `sys_log` VALUES (31233, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:31:41', '超管', '2023-07-07 13:31:41');
INSERT INTO `sys_log` VALUES (31234, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 13, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:32:46', '超管', '2023-07-07 13:32:46');
INSERT INTO `sys_log` VALUES (31235, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:32:46', '超管', '2023-07-07 13:32:46');
INSERT INTO `sys_log` VALUES (31236, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:32:46', '超管', '2023-07-07 13:32:46');
INSERT INTO `sys_log` VALUES (31237, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:32:46', '超管', '2023-07-07 13:32:46');
INSERT INTO `sys_log` VALUES (31238, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 12, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:34:34', '超管', '2023-07-07 13:34:34');
INSERT INTO `sys_log` VALUES (31239, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:34:34', '超管', '2023-07-07 13:34:34');
INSERT INTO `sys_log` VALUES (31240, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:34:34', '超管', '2023-07-07 13:34:34');
INSERT INTO `sys_log` VALUES (31241, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:34:34', '超管', '2023-07-07 13:34:34');
INSERT INTO `sys_log` VALUES (31242, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 12, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:36:33', '超管', '2023-07-07 13:36:33');
INSERT INTO `sys_log` VALUES (31243, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:36:33', '超管', '2023-07-07 13:36:33');
INSERT INTO `sys_log` VALUES (31244, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:36:33', '超管', '2023-07-07 13:36:33');
INSERT INTO `sys_log` VALUES (31245, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:36:33', '超管', '2023-07-07 13:36:33');
INSERT INTO `sys_log` VALUES (31246, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 15, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:54:28', '超管', '2023-07-07 13:54:28');
INSERT INTO `sys_log` VALUES (31247, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:54:28', '超管', '2023-07-07 13:54:28');
INSERT INTO `sys_log` VALUES (31248, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:54:28', '超管', '2023-07-07 13:54:28');
INSERT INTO `sys_log` VALUES (31249, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:54:28', '超管', '2023-07-07 13:54:28');
INSERT INTO `sys_log` VALUES (31250, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 20, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:06', '超管', '2023-07-07 13:55:06');
INSERT INTO `sys_log` VALUES (31251, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 80, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:06', '超管', '2023-07-07 13:55:06');
INSERT INTO `sys_log` VALUES (31252, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:36', '超管', '2023-07-07 13:55:36');
INSERT INTO `sys_log` VALUES (31253, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 10, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:36', '超管', '2023-07-07 13:55:36');
INSERT INTO `sys_log` VALUES (31254, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 13, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:37', '超管', '2023-07-07 13:55:37');
INSERT INTO `sys_log` VALUES (31255, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 37, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:37', '超管', '2023-07-07 13:55:37');
INSERT INTO `sys_log` VALUES (31256, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:38', '超管', '2023-07-07 13:55:38');
INSERT INTO `sys_log` VALUES (31257, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:38', '超管', '2023-07-07 13:55:38');
INSERT INTO `sys_log` VALUES (31258, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:39', '超管', '2023-07-07 13:55:39');
INSERT INTO `sys_log` VALUES (31259, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:39', '超管', '2023-07-07 13:55:39');
INSERT INTO `sys_log` VALUES (31260, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:40', '超管', '2023-07-07 13:55:40');
INSERT INTO `sys_log` VALUES (31261, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 13:55:40', '超管', '2023-07-07 13:55:40');
INSERT INTO `sys_log` VALUES (31262, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 548, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 19:50:12', '超管', '2023-07-07 19:50:12');
INSERT INTO `sys_log` VALUES (31263, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 19:50:12', '超管', '2023-07-07 19:50:12');
INSERT INTO `sys_log` VALUES (31264, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 19:50:12', '超管', '2023-07-07 19:50:12');
INSERT INTO `sys_log` VALUES (31265, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 19:50:12', '超管', '2023-07-07 19:50:12');
INSERT INTO `sys_log` VALUES (31266, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 30, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 19:59:30', '超管', '2023-07-07 19:59:30');
INSERT INTO `sys_log` VALUES (31267, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 53, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 19:59:30', '超管', '2023-07-07 19:59:30');
INSERT INTO `sys_log` VALUES (31268, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:02:35', '超管', '2023-07-07 20:02:35');
INSERT INTO `sys_log` VALUES (31269, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:02:35', '超管', '2023-07-07 20:02:35');
INSERT INTO `sys_log` VALUES (31270, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:02:56', '超管', '2023-07-07 20:02:56');
INSERT INTO `sys_log` VALUES (31271, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:02:56', '超管', '2023-07-07 20:02:56');
INSERT INTO `sys_log` VALUES (31272, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:03:06', '超管', '2023-07-07 20:03:06');
INSERT INTO `sys_log` VALUES (31273, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 10, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:03:06', '超管', '2023-07-07 20:03:06');
INSERT INTO `sys_log` VALUES (31274, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:03:07', '超管', '2023-07-07 20:03:07');
INSERT INTO `sys_log` VALUES (31275, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:03:07', '超管', '2023-07-07 20:03:07');
INSERT INTO `sys_log` VALUES (31276, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:03:33', '超管', '2023-07-07 20:03:33');
INSERT INTO `sys_log` VALUES (31277, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:03:33', '超管', '2023-07-07 20:03:33');
INSERT INTO `sys_log` VALUES (31278, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 16, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:17:56', '超管', '2023-07-07 20:17:56');
INSERT INTO `sys_log` VALUES (31279, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 12, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:40:24', '超管', '2023-07-07 20:40:24');
INSERT INTO `sys_log` VALUES (31280, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 10, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:40:24', '超管', '2023-07-07 20:40:24');
INSERT INTO `sys_log` VALUES (31281, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:40:27', '超管', '2023-07-07 20:40:27');
INSERT INTO `sys_log` VALUES (31282, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:40:27', '超管', '2023-07-07 20:40:27');
INSERT INTO `sys_log` VALUES (31283, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:40:54', '超管', '2023-07-07 20:40:54');
INSERT INTO `sys_log` VALUES (31284, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:40:54', '超管', '2023-07-07 20:40:54');
INSERT INTO `sys_log` VALUES (31285, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:43:26', '超管', '2023-07-07 20:43:26');
INSERT INTO `sys_log` VALUES (31286, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:43:26', '超管', '2023-07-07 20:43:26');
INSERT INTO `sys_log` VALUES (31287, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:43:38', '超管', '2023-07-07 20:43:38');
INSERT INTO `sys_log` VALUES (31288, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:43:38', '超管', '2023-07-07 20:43:38');
INSERT INTO `sys_log` VALUES (31289, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 11, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:49', '超管', '2023-07-07 20:47:49');
INSERT INTO `sys_log` VALUES (31290, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:49', '超管', '2023-07-07 20:47:49');
INSERT INTO `sys_log` VALUES (31291, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:49', '超管', '2023-07-07 20:47:49');
INSERT INTO `sys_log` VALUES (31292, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:49', '超管', '2023-07-07 20:47:49');
INSERT INTO `sys_log` VALUES (31293, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:54', '超管', '2023-07-07 20:47:54');
INSERT INTO `sys_log` VALUES (31294, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:54', '超管', '2023-07-07 20:47:54');
INSERT INTO `sys_log` VALUES (31295, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:58', '超管', '2023-07-07 20:47:58');
INSERT INTO `sys_log` VALUES (31296, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:47:58', '超管', '2023-07-07 20:47:58');
INSERT INTO `sys_log` VALUES (31297, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:00', '超管', '2023-07-07 20:48:00');
INSERT INTO `sys_log` VALUES (31298, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:00', '超管', '2023-07-07 20:48:00');
INSERT INTO `sys_log` VALUES (31299, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 13, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:03', '超管', '2023-07-07 20:48:03');
INSERT INTO `sys_log` VALUES (31300, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '26', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:10', '超管', '2023-07-07 20:48:10');
INSERT INTO `sys_log` VALUES (31301, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:30', '超管', '2023-07-07 20:48:30');
INSERT INTO `sys_log` VALUES (31302, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:36', '超管', '2023-07-07 20:48:36');
INSERT INTO `sys_log` VALUES (31303, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:36', '超管', '2023-07-07 20:48:36');
INSERT INTO `sys_log` VALUES (31304, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:37', '超管', '2023-07-07 20:48:37');
INSERT INTO `sys_log` VALUES (31305, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:37', '超管', '2023-07-07 20:48:37');
INSERT INTO `sys_log` VALUES (31306, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:37', '超管', '2023-07-07 20:48:37');
INSERT INTO `sys_log` VALUES (31307, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:42', '超管', '2023-07-07 20:48:42');
INSERT INTO `sys_log` VALUES (31308, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:42', '超管', '2023-07-07 20:48:42');
INSERT INTO `sys_log` VALUES (31309, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:43', '超管', '2023-07-07 20:48:43');
INSERT INTO `sys_log` VALUES (31310, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:43', '超管', '2023-07-07 20:48:43');
INSERT INTO `sys_log` VALUES (31311, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:43', '超管', '2023-07-07 20:48:43');
INSERT INTO `sys_log` VALUES (31312, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:43', '超管', '2023-07-07 20:48:43');
INSERT INTO `sys_log` VALUES (31313, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:44', '超管', '2023-07-07 20:48:44');
INSERT INTO `sys_log` VALUES (31314, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:45', '超管', '2023-07-07 20:48:45');
INSERT INTO `sys_log` VALUES (31315, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:45', '超管', '2023-07-07 20:48:45');
INSERT INTO `sys_log` VALUES (31316, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:45', '超管', '2023-07-07 20:48:45');
INSERT INTO `sys_log` VALUES (31317, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:46', '超管', '2023-07-07 20:48:46');
INSERT INTO `sys_log` VALUES (31318, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:46', '超管', '2023-07-07 20:48:46');
INSERT INTO `sys_log` VALUES (31319, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:48:46', '超管', '2023-07-07 20:48:46');
INSERT INTO `sys_log` VALUES (31320, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:32', '超管', '2023-07-07 20:50:32');
INSERT INTO `sys_log` VALUES (31321, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:32', '超管', '2023-07-07 20:50:32');
INSERT INTO `sys_log` VALUES (31322, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:32', '超管', '2023-07-07 20:50:32');
INSERT INTO `sys_log` VALUES (31323, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:51', '超管', '2023-07-07 20:50:51');
INSERT INTO `sys_log` VALUES (31324, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:51', '超管', '2023-07-07 20:50:51');
INSERT INTO `sys_log` VALUES (31325, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:51', '超管', '2023-07-07 20:50:51');
INSERT INTO `sys_log` VALUES (31326, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:51', '超管', '2023-07-07 20:50:51');
INSERT INTO `sys_log` VALUES (31327, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:52', '超管', '2023-07-07 20:50:52');
INSERT INTO `sys_log` VALUES (31328, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:52', '超管', '2023-07-07 20:50:52');
INSERT INTO `sys_log` VALUES (31329, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:54', '超管', '2023-07-07 20:50:54');
INSERT INTO `sys_log` VALUES (31330, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:54', '超管', '2023-07-07 20:50:54');
INSERT INTO `sys_log` VALUES (31331, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:55', '超管', '2023-07-07 20:50:55');
INSERT INTO `sys_log` VALUES (31332, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:55', '超管', '2023-07-07 20:50:55');
INSERT INTO `sys_log` VALUES (31333, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:55', '超管', '2023-07-07 20:50:55');
INSERT INTO `sys_log` VALUES (31334, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:55', '超管', '2023-07-07 20:50:55');
INSERT INTO `sys_log` VALUES (31335, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:55', '超管', '2023-07-07 20:50:55');
INSERT INTO `sys_log` VALUES (31336, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:56', '超管', '2023-07-07 20:50:56');
INSERT INTO `sys_log` VALUES (31337, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:56', '超管', '2023-07-07 20:50:56');
INSERT INTO `sys_log` VALUES (31338, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:56', '超管', '2023-07-07 20:50:56');
INSERT INTO `sys_log` VALUES (31339, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:57', '超管', '2023-07-07 20:50:57');
INSERT INTO `sys_log` VALUES (31340, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 38, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:50:59', '超管', '2023-07-07 20:50:59');
INSERT INTO `sys_log` VALUES (31341, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 214, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:58:34', '超管', '2023-07-07 20:58:34');
INSERT INTO `sys_log` VALUES (31342, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 20, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:58:37', '超管', '2023-07-07 20:58:37');
INSERT INTO `sys_log` VALUES (31343, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 197, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:59:43', '超管', '2023-07-07 20:59:43');
INSERT INTO `sys_log` VALUES (31344, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 23, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 20:59:46', '超管', '2023-07-07 20:59:46');
INSERT INTO `sys_log` VALUES (31345, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 13, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:01:46', '超管', '2023-07-07 21:01:46');
INSERT INTO `sys_log` VALUES (31346, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 11, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:01:48', '超管', '2023-07-07 21:01:48');
INSERT INTO `sys_log` VALUES (31347, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:01:51', '超管', '2023-07-07 21:01:51');
INSERT INTO `sys_log` VALUES (31348, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 12, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:01:58', '超管', '2023-07-07 21:01:58');
INSERT INTO `sys_log` VALUES (31349, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 19, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:01:58', '超管', '2023-07-07 21:01:58');
INSERT INTO `sys_log` VALUES (31350, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:00', '超管', '2023-07-07 21:02:00');
INSERT INTO `sys_log` VALUES (31351, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 31, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:00', '超管', '2023-07-07 21:02:00');
INSERT INTO `sys_log` VALUES (31352, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:01', '超管', '2023-07-07 21:02:01');
INSERT INTO `sys_log` VALUES (31353, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:01', '超管', '2023-07-07 21:02:01');
INSERT INTO `sys_log` VALUES (31354, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:01', '超管', '2023-07-07 21:02:01');
INSERT INTO `sys_log` VALUES (31355, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:02', '超管', '2023-07-07 21:02:02');
INSERT INTO `sys_log` VALUES (31356, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:05', '超管', '2023-07-07 21:02:05');
INSERT INTO `sys_log` VALUES (31357, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:05', '超管', '2023-07-07 21:02:05');
INSERT INTO `sys_log` VALUES (31358, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:08', '超管', '2023-07-07 21:02:08');
INSERT INTO `sys_log` VALUES (31359, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:08', '超管', '2023-07-07 21:02:08');
INSERT INTO `sys_log` VALUES (31360, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:02:08', '超管', '2023-07-07 21:02:08');
INSERT INTO `sys_log` VALUES (31361, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:03:40', '超管', '2023-07-07 21:03:40');
INSERT INTO `sys_log` VALUES (31362, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:03:40', '超管', '2023-07-07 21:03:40');
INSERT INTO `sys_log` VALUES (31363, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:03:40', '超管', '2023-07-07 21:03:40');
INSERT INTO `sys_log` VALUES (31364, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:03:43', '超管', '2023-07-07 21:03:43');
INSERT INTO `sys_log` VALUES (31365, '超管', NULL, 'cn.edu.guet.controller.SysLogController.sevenDayDelete()', NULL, 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:03:45', '超管', '2023-07-07 21:03:45');
INSERT INTO `sys_log` VALUES (31366, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:03:47', '超管', '2023-07-07 21:03:47');
INSERT INTO `sys_log` VALUES (31367, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:12:04', '超管', '2023-07-07 21:12:04');
INSERT INTO `sys_log` VALUES (31368, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:12:13', '超管', '2023-07-07 21:12:13');
INSERT INTO `sys_log` VALUES (31369, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 9, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:12:40', '超管', '2023-07-07 21:12:40');
INSERT INTO `sys_log` VALUES (31370, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:12:54', '超管', '2023-07-07 21:12:54');
INSERT INTO `sys_log` VALUES (31371, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:35', '超管', '2023-07-07 21:14:35');
INSERT INTO `sys_log` VALUES (31372, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:40', '超管', '2023-07-07 21:14:40');
INSERT INTO `sys_log` VALUES (31373, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:40', '超管', '2023-07-07 21:14:40');
INSERT INTO `sys_log` VALUES (31374, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:40', '超管', '2023-07-07 21:14:40');
INSERT INTO `sys_log` VALUES (31375, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:43', '超管', '2023-07-07 21:14:43');
INSERT INTO `sys_log` VALUES (31376, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:43', '超管', '2023-07-07 21:14:43');
INSERT INTO `sys_log` VALUES (31377, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleAuthor()', '\"2\"', 32, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:47', '超管', '2023-07-07 21:14:47');
INSERT INTO `sys_log` VALUES (31378, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 97, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:58', '超管', '2023-07-07 21:14:58');
INSERT INTO `sys_log` VALUES (31379, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:58', '超管', '2023-07-07 21:14:58');
INSERT INTO `sys_log` VALUES (31380, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:58', '超管', '2023-07-07 21:14:58');
INSERT INTO `sys_log` VALUES (31381, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:14:58', '超管', '2023-07-07 21:14:58');
INSERT INTO `sys_log` VALUES (31382, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:15:03', '超管', '2023-07-07 21:15:03');
INSERT INTO `sys_log` VALUES (31383, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:15:03', '超管', '2023-07-07 21:15:03');
INSERT INTO `sys_log` VALUES (31384, '测试', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"test\"}', 11, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:14', '测试', '2023-07-07 21:15:14');
INSERT INTO `sys_log` VALUES (31385, '测试', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"test\"', 2, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:14', '测试', '2023-07-07 21:15:14');
INSERT INTO `sys_log` VALUES (31386, '测试', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"test\"', 2, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:14', '测试', '2023-07-07 21:15:14');
INSERT INTO `sys_log` VALUES (31387, '测试', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"test\"', 3, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:14', '测试', '2023-07-07 21:15:14');
INSERT INTO `sys_log` VALUES (31388, '测试', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:16', '测试', '2023-07-07 21:15:16');
INSERT INTO `sys_log` VALUES (31389, '测试', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:19', '测试', '2023-07-07 21:15:19');
INSERT INTO `sys_log` VALUES (31390, '测试', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 2, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:19', '测试', '2023-07-07 21:15:19');
INSERT INTO `sys_log` VALUES (31391, '测试', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 1, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:20', '测试', '2023-07-07 21:15:20');
INSERT INTO `sys_log` VALUES (31392, '测试', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 6, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:20', '测试', '2023-07-07 21:15:20');
INSERT INTO `sys_log` VALUES (31393, '测试', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '2', 2, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:22', '测试', '2023-07-07 21:15:22');
INSERT INTO `sys_log` VALUES (31394, '测试', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '3', 1, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:27', '测试', '2023-07-07 21:15:27');
INSERT INTO `sys_log` VALUES (31395, '测试', NULL, 'cn.edu.guet.controller.SysUserController.getUserRoles()', '32', 2, '0:0:0:0:0:0:0:1', '测试', '2023-07-07 21:15:30', '测试', '2023-07-07 21:15:30');
INSERT INTO `sys_log` VALUES (31396, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 6, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 21:15:39', '李白', '2023-07-07 21:15:39');
INSERT INTO `sys_log` VALUES (31397, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 1, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 21:15:39', '李白', '2023-07-07 21:15:39');
INSERT INTO `sys_log` VALUES (31398, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 1, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 21:15:39', '李白', '2023-07-07 21:15:39');
INSERT INTO `sys_log` VALUES (31399, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 2, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 21:15:39', '李白', '2023-07-07 21:15:39');
INSERT INTO `sys_log` VALUES (31400, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 21:15:44', '李白', '2023-07-07 21:15:44');
INSERT INTO `sys_log` VALUES (31401, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:16:02', '超管', '2023-07-07 21:16:02');
INSERT INTO `sys_log` VALUES (31402, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:16:02', '超管', '2023-07-07 21:16:02');
INSERT INTO `sys_log` VALUES (31403, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:16:02', '超管', '2023-07-07 21:16:02');
INSERT INTO `sys_log` VALUES (31404, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:16:02', '超管', '2023-07-07 21:16:02');
INSERT INTO `sys_log` VALUES (31405, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:16:04', '超管', '2023-07-07 21:16:04');
INSERT INTO `sys_log` VALUES (31406, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:24:06', '超管', '2023-07-07 21:24:06');
INSERT INTO `sys_log` VALUES (31407, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:24:06', '超管', '2023-07-07 21:24:06');
INSERT INTO `sys_log` VALUES (31408, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:24:17', '超管', '2023-07-07 21:24:17');
INSERT INTO `sys_log` VALUES (31409, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:24:17', '超管', '2023-07-07 21:24:17');
INSERT INTO `sys_log` VALUES (31410, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:25:22', '超管', '2023-07-07 21:25:22');
INSERT INTO `sys_log` VALUES (31411, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 21:25:22', '超管', '2023-07-07 21:25:22');
INSERT INTO `sys_log` VALUES (31412, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 7, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 22:03:19', '超管', '2023-07-07 22:03:19');
INSERT INTO `sys_log` VALUES (31413, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 8, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 22:03:19', '超管', '2023-07-07 22:03:19');
INSERT INTO `sys_log` VALUES (31414, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 22:04:52', '超管', '2023-07-07 22:04:52');
INSERT INTO `sys_log` VALUES (31415, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 6, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 22:05:02', '超管', '2023-07-07 22:05:02');
INSERT INTO `sys_log` VALUES (31416, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 3, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 22:05:04', '超管', '2023-07-07 22:05:04');
INSERT INTO `sys_log` VALUES (31417, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 22:05:23', '超管', '2023-07-07 22:05:23');
INSERT INTO `sys_log` VALUES (31418, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 6, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:05:39', '李白', '2023-07-07 22:05:39');
INSERT INTO `sys_log` VALUES (31419, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 1, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:05:39', '李白', '2023-07-07 22:05:39');
INSERT INTO `sys_log` VALUES (31420, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 1, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:05:39', '李白', '2023-07-07 22:05:39');
INSERT INTO `sys_log` VALUES (31421, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 3, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:05:39', '李白', '2023-07-07 22:05:39');
INSERT INTO `sys_log` VALUES (31422, '超管', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '超管', '2023-07-07 22:05:43', '超管', '2023-07-07 22:05:43');
INSERT INTO `sys_log` VALUES (31423, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 5, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:06:50', '李白', '2023-07-07 22:06:50');
INSERT INTO `sys_log` VALUES (31424, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 6, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:06:51', '李白', '2023-07-07 22:06:51');
INSERT INTO `sys_log` VALUES (31425, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '2', 4, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:07:36', '李白', '2023-07-07 22:07:36');
INSERT INTO `sys_log` VALUES (31426, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:07:37', '李白', '2023-07-07 22:07:37');
INSERT INTO `sys_log` VALUES (31427, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 7, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:08:47', '李白', '2023-07-07 22:08:47');
INSERT INTO `sys_log` VALUES (31428, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 1, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:08:47', '李白', '2023-07-07 22:08:47');
INSERT INTO `sys_log` VALUES (31429, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 2, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:08:47', '李白', '2023-07-07 22:08:47');
INSERT INTO `sys_log` VALUES (31430, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 3, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:08:47', '李白', '2023-07-07 22:08:47');
INSERT INTO `sys_log` VALUES (31431, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:08:50', '李白', '2023-07-07 22:08:50');
INSERT INTO `sys_log` VALUES (31432, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 7, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:09:22', '李白', '2023-07-07 22:09:22');
INSERT INTO `sys_log` VALUES (31433, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 1, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:09:22', '李白', '2023-07-07 22:09:22');
INSERT INTO `sys_log` VALUES (31434, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 1, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:09:22', '李白', '2023-07-07 22:09:22');
INSERT INTO `sys_log` VALUES (31435, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 2, '0:0:0:0:0:0:0:1', '李白', '2023-07-07 22:09:22', '李白', '2023-07-07 22:09:22');
INSERT INTO `sys_log` VALUES (31436, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '192.168.57.179', '李白', '2023-07-07 22:11:18', '李白', '2023-07-07 22:11:18');
INSERT INTO `sys_log` VALUES (31437, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 6, '192.168.57.179', '李白', '2023-07-07 22:23:36', '李白', '2023-07-07 22:23:36');
INSERT INTO `sys_log` VALUES (31438, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 1, '192.168.57.179', '李白', '2023-07-07 22:23:36', '李白', '2023-07-07 22:23:36');
INSERT INTO `sys_log` VALUES (31439, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 1, '192.168.57.179', '李白', '2023-07-07 22:23:36', '李白', '2023-07-07 22:23:36');
INSERT INTO `sys_log` VALUES (31440, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 3, '192.168.57.179', '李白', '2023-07-07 22:23:36', '李白', '2023-07-07 22:23:36');
INSERT INTO `sys_log` VALUES (31441, '李白', NULL, 'cn.edu.guet.controller.SysLogController.getLogList()', '1', 4, '192.168.57.179', '李白', '2023-07-07 22:24:37', '李白', '2023-07-07 22:24:37');
INSERT INTO `sys_log` VALUES (31442, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 7, '192.168.57.179', '李白', '2023-07-07 22:25:36', '李白', '2023-07-07 22:25:36');
INSERT INTO `sys_log` VALUES (31443, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 1, '192.168.57.179', '李白', '2023-07-07 22:25:36', '李白', '2023-07-07 22:25:36');
INSERT INTO `sys_log` VALUES (31444, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 1, '192.168.57.179', '李白', '2023-07-07 22:25:36', '李白', '2023-07-07 22:25:36');
INSERT INTO `sys_log` VALUES (31445, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 3, '192.168.57.179', '李白', '2023-07-07 22:25:36', '李白', '2023-07-07 22:25:36');
INSERT INTO `sys_log` VALUES (31446, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 6, '192.168.57.179', '李白', '2023-07-07 22:25:50', '李白', '2023-07-07 22:25:50');
INSERT INTO `sys_log` VALUES (31447, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 2, '192.168.57.179', '李白', '2023-07-07 22:25:50', '李白', '2023-07-07 22:25:50');
INSERT INTO `sys_log` VALUES (31448, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 1, '192.168.57.179', '李白', '2023-07-07 22:25:50', '李白', '2023-07-07 22:25:50');
INSERT INTO `sys_log` VALUES (31449, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 3, '192.168.57.179', '李白', '2023-07-07 22:25:50', '李白', '2023-07-07 22:25:50');
INSERT INTO `sys_log` VALUES (31450, '李白', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"hxh\"}', 9, '192.168.57.179', '李白', '2023-07-07 22:43:21', '李白', '2023-07-07 22:43:21');
INSERT INTO `sys_log` VALUES (31451, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"hxh\"', 3, '192.168.57.179', '李白', '2023-07-07 22:43:21', '李白', '2023-07-07 22:43:21');
INSERT INTO `sys_log` VALUES (31452, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"hxh\"', 1, '192.168.57.179', '李白', '2023-07-07 22:43:22', '李白', '2023-07-07 22:43:22');
INSERT INTO `sys_log` VALUES (31453, '李白', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"hxh\"', 4, '192.168.57.179', '李白', '2023-07-07 22:43:22', '李白', '2023-07-07 22:43:22');
INSERT INTO `sys_log` VALUES (31454, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 6, '192.168.57.179', '超管', '2023-07-07 22:43:40', '超管', '2023-07-07 22:43:40');
INSERT INTO `sys_log` VALUES (31455, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 2, '192.168.57.179', '超管', '2023-07-07 22:43:40', '超管', '2023-07-07 22:43:40');
INSERT INTO `sys_log` VALUES (31456, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '192.168.57.179', '超管', '2023-07-07 22:43:40', '超管', '2023-07-07 22:43:40');
INSERT INTO `sys_log` VALUES (31457, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 3, '192.168.57.179', '超管', '2023-07-07 22:43:40', '超管', '2023-07-07 22:43:40');
INSERT INTO `sys_log` VALUES (31458, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:43:57', '超管', '2023-07-07 22:43:57');
INSERT INTO `sys_log` VALUES (31459, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:43:57', '超管', '2023-07-07 22:43:57');
INSERT INTO `sys_log` VALUES (31460, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 6, '192.168.57.179', '超管', '2023-07-07 22:43:57', '超管', '2023-07-07 22:43:57');
INSERT INTO `sys_log` VALUES (31461, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:48:30', '超管', '2023-07-07 22:48:30');
INSERT INTO `sys_log` VALUES (31462, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:48:30', '超管', '2023-07-07 22:48:30');
INSERT INTO `sys_log` VALUES (31463, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 5, '192.168.57.179', '超管', '2023-07-07 22:48:30', '超管', '2023-07-07 22:48:30');
INSERT INTO `sys_log` VALUES (31464, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '192.168.57.179', '李白', '2023-07-07 22:48:32', '李白', '2023-07-07 22:48:32');
INSERT INTO `sys_log` VALUES (31465, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '192.168.57.179', '李白', '2023-07-07 22:48:32', '李白', '2023-07-07 22:48:32');
INSERT INTO `sys_log` VALUES (31466, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 6, '192.168.57.179', '超管', '2023-07-07 22:48:36', '超管', '2023-07-07 22:48:36');
INSERT INTO `sys_log` VALUES (31467, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '192.168.57.179', '超管', '2023-07-07 22:48:36', '超管', '2023-07-07 22:48:36');
INSERT INTO `sys_log` VALUES (31468, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 1, '192.168.57.179', '超管', '2023-07-07 22:48:36', '超管', '2023-07-07 22:48:36');
INSERT INTO `sys_log` VALUES (31469, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '192.168.57.179', '超管', '2023-07-07 22:48:36', '超管', '2023-07-07 22:48:36');
INSERT INTO `sys_log` VALUES (31470, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getRoleSelect()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:48:38', '超管', '2023-07-07 22:48:38');
INSERT INTO `sys_log` VALUES (31471, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserList()', '1', 4, '192.168.57.179', '超管', '2023-07-07 22:48:38', '超管', '2023-07-07 22:48:38');
INSERT INTO `sys_log` VALUES (31472, '超管', NULL, 'cn.edu.guet.controller.SysRoleController.getRoleList()', '1', 3, '192.168.57.179', '超管', '2023-07-07 22:48:40', '超管', '2023-07-07 22:48:40');
INSERT INTO `sys_log` VALUES (31473, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getAllMenu()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:48:40', '超管', '2023-07-07 22:48:40');
INSERT INTO `sys_log` VALUES (31474, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:48:42', '超管', '2023-07-07 22:48:42');
INSERT INTO `sys_log` VALUES (31475, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:48:42', '超管', '2023-07-07 22:48:42');
INSERT INTO `sys_log` VALUES (31476, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:48:42', '超管', '2023-07-07 22:48:42');
INSERT INTO `sys_log` VALUES (31477, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '192.168.57.179', '李白', '2023-07-07 22:50:18', '李白', '2023-07-07 22:50:18');
INSERT INTO `sys_log` VALUES (31478, '李白', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '192.168.57.179', '李白', '2023-07-07 22:50:18', '李白', '2023-07-07 22:50:18');
INSERT INTO `sys_log` VALUES (31479, '超管', NULL, 'cn.edu.guet.controller.LoginController.login()', '{\"password\":\"123456\",\"username\":\"admin\"}', 6, '192.168.57.179', '超管', '2023-07-07 22:50:22', '超管', '2023-07-07 22:50:22');
INSERT INTO `sys_log` VALUES (31480, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuTree()', '\"admin\"', 1, '192.168.57.179', '超管', '2023-07-07 22:50:22', '超管', '2023-07-07 22:50:22');
INSERT INTO `sys_log` VALUES (31481, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getPermissions()', '\"admin\"', 2, '192.168.57.179', '超管', '2023-07-07 22:50:22', '超管', '2023-07-07 22:50:22');
INSERT INTO `sys_log` VALUES (31482, '超管', NULL, 'cn.edu.guet.controller.SysUserController.getUserByNick()', '\"admin\"', 2, '192.168.57.179', '超管', '2023-07-07 22:50:22', '超管', '2023-07-07 22:50:22');
INSERT INTO `sys_log` VALUES (31483, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:50:28', '超管', '2023-07-07 22:50:28');
INSERT INTO `sys_log` VALUES (31484, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:50:28', '超管', '2023-07-07 22:50:28');
INSERT INTO `sys_log` VALUES (31485, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:50:28', '超管', '2023-07-07 22:50:28');
INSERT INTO `sys_log` VALUES (31486, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:50:30', '超管', '2023-07-07 22:50:30');
INSERT INTO `sys_log` VALUES (31487, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:50:30', '超管', '2023-07-07 22:50:30');
INSERT INTO `sys_log` VALUES (31488, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:50:30', '超管', '2023-07-07 22:50:30');
INSERT INTO `sys_log` VALUES (31489, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:51:18', '超管', '2023-07-07 22:51:18');
INSERT INTO `sys_log` VALUES (31490, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:51:18', '超管', '2023-07-07 22:51:18');
INSERT INTO `sys_log` VALUES (31491, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:51:18', '超管', '2023-07-07 22:51:18');
INSERT INTO `sys_log` VALUES (31492, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:53:21', '超管', '2023-07-07 22:53:21');
INSERT INTO `sys_log` VALUES (31493, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:53:21', '超管', '2023-07-07 22:53:21');
INSERT INTO `sys_log` VALUES (31494, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:53:21', '超管', '2023-07-07 22:53:21');
INSERT INTO `sys_log` VALUES (31495, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuName()', '\"n\"', 1, '192.168.57.179', '超管', '2023-07-07 22:53:36', '超管', '2023-07-07 22:53:36');
INSERT INTO `sys_log` VALUES (31496, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuName()', '\"ni\"', 2, '192.168.57.179', '超管', '2023-07-07 22:53:36', '超管', '2023-07-07 22:53:36');
INSERT INTO `sys_log` VALUES (31497, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuName()', '\"nih\"', 1, '192.168.57.179', '超管', '2023-07-07 22:53:36', '超管', '2023-07-07 22:53:36');
INSERT INTO `sys_log` VALUES (31498, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuUrl()', '\"g\"', 1, '192.168.57.179', '超管', '2023-07-07 22:53:44', '超管', '2023-07-07 22:53:44');
INSERT INTO `sys_log` VALUES (31499, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuUrl()', '\"gh\"', 1, '192.168.57.179', '超管', '2023-07-07 22:53:44', '超管', '2023-07-07 22:53:44');
INSERT INTO `sys_log` VALUES (31500, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuUrl()', '\"ghj\"', 1, '192.168.57.179', '超管', '2023-07-07 22:53:44', '超管', '2023-07-07 22:53:44');
INSERT INTO `sys_log` VALUES (31501, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuUrl()', '\"ghjj\"', 1, '192.168.57.179', '超管', '2023-07-07 22:53:44', '超管', '2023-07-07 22:53:44');
INSERT INTO `sys_log` VALUES (31502, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.checkMenuUrl()', '\"ghjjh\"', 0, '192.168.57.179', '超管', '2023-07-07 22:53:45', '超管', '2023-07-07 22:53:45');
INSERT INTO `sys_log` VALUES (31503, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.addMenu()', '{\"color\":\"\",\"filePath\":\"\",\"icon\":\"Apple\",\"name\":\"nih\",\"orderNum\":3,\"perms\":\"\",\"type\":0,\"url\":\"ghjjh\"}', 6, '192.168.57.179', '超管', '2023-07-07 22:53:49', '超管', '2023-07-07 22:53:49');
INSERT INTO `sys_log` VALUES (31504, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:53:49', '超管', '2023-07-07 22:53:49');
INSERT INTO `sys_log` VALUES (31505, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:53:49', '超管', '2023-07-07 22:53:49');
INSERT INTO `sys_log` VALUES (31506, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:53:49', '超管', '2023-07-07 22:53:49');
INSERT INTO `sys_log` VALUES (31507, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:53:58', '超管', '2023-07-07 22:53:58');
INSERT INTO `sys_log` VALUES (31508, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 1, '192.168.57.179', '超管', '2023-07-07 22:53:58', '超管', '2023-07-07 22:53:58');
INSERT INTO `sys_log` VALUES (31509, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:53:58', '超管', '2023-07-07 22:53:58');
INSERT INTO `sys_log` VALUES (31510, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.deleteMenu()', '164', 5, '192.168.57.179', '超管', '2023-07-07 22:54:00', '超管', '2023-07-07 22:54:00');
INSERT INTO `sys_log` VALUES (31511, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuData()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:54:00', '超管', '2023-07-07 22:54:00');
INSERT INTO `sys_log` VALUES (31512, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getCatalogueData()', NULL, 2, '192.168.57.179', '超管', '2023-07-07 22:54:00', '超管', '2023-07-07 22:54:00');
INSERT INTO `sys_log` VALUES (31513, '超管', NULL, 'cn.edu.guet.controller.SysMenuController.getMenuList()', NULL, 3, '192.168.57.179', '超管', '2023-07-07 22:54:00', '超管', '2023-07-07 22:54:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户管理' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

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
