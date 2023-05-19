/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : answer

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2019-07-17 23:23:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '数学', '0', 'knowledge_label', null, 'default', 'Y', '0', 'admin', '2019-04-02 14:29:31', '', null, '数学');
INSERT INTO `sys_dict_data` VALUES ('28', '2', 'Java基础', '1', 'knowledge_label', null, 'default', 'Y', '0', 'admin', '2019-04-02 14:30:11', 'admin', '2019-04-02 14:30:37', 'Java基础');
INSERT INTO `sys_dict_data` VALUES ('29', '3', '小程序', '2', 'knowledge_label', null, null, 'Y', '0', 'admin', '2019-04-02 14:31:21', '', null, '小程序');
INSERT INTO `sys_dict_data` VALUES ('30', '4', 'C++编程', '3', 'knowledge_label', null, 'default', 'Y', '0', 'admin', '2019-04-02 14:31:57', '', null, 'C++编程');
INSERT INTO `sys_dict_data` VALUES ('31', '5', 'linux系统', '4', 'knowledge_label', null, 'default', 'Y', '0', 'admin', '2019-04-02 14:32:51', '', null, 'linux系统');

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('10', '知识标签', 'knowledge_label', '0', 'admin', '2019-04-02 14:28:22', 'admin', '2019-04-02 14:28:36', '知识标签表');

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-03 22:57:29');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-03 23:25:41');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-27 15:59:43');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 15:59:47');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 16:08:46');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 16:12:44');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-27 16:14:49');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 22:26:16');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 22:31:22');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 22:36:21');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-30 22:37:31');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 22:37:34');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 22:39:51');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 22:41:27');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-30 22:52:59');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 14:14:49');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 14:22:33');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-02 14:41:37');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-02 14:41:41');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-02 14:41:48');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 14:41:51');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 15:11:47');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 15:22:57');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 15:29:39');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2019-04-02 15:38:01');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-02 15:38:04');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 15:38:06');
INSERT INTO `sys_logininfor` VALUES ('127', 'student', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-04-02 16:28:40');
INSERT INTO `sys_logininfor` VALUES ('128', 'student', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-02 16:28:45');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '退出成功', '2019-07-17 22:52:37');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-07-17 22:52:43');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-07-17 23:01:18');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '退出成功', '2019-07-17 23:03:29');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-07-17 23:03:49');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-07-17 23:11:13');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', 'XX XX', 'Firefox', 'Windows 7', '0', '登录成功', '2019-07-17 23:19:47');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '退出成功', '2019-07-17 23:21:54');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 7', '0', '登录成功', '2019-07-17 23:22:09');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2040 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('3', '业务管理', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-05 00:10:53', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-02 14:18:08', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-24 23:35:47', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '1', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-05 00:11:30', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2025', '答疑管理', '3', '1', '/module/answer', 'C', '0', 'module:answer:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '答疑管理菜单');
INSERT INTO `sys_menu` VALUES ('2026', '答疑管理查询', '2025', '1', '#', 'F', '0', 'module:answer:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2027', '答疑管理新增', '2025', '2', '#', 'F', '0', 'module:answer:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2028', '答疑管理修改', '2025', '3', '#', 'F', '0', 'module:answer:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2029', '答疑管理删除', '2025', '4', '#', 'F', '0', 'module:answer:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2030', '问题管理', '3', '1', '/module/problem', 'C', '0', 'module:problem:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '问题管理菜单');
INSERT INTO `sys_menu` VALUES ('2031', '问题管理查询', '2030', '1', '#', 'F', '0', 'module:problem:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2032', '问题管理新增', '2030', '2', '#', 'F', '0', 'module:problem:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2033', '问题管理修改', '2030', '3', '#', 'F', '0', 'module:problem:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2034', '问题管理删除', '2030', '4', '#', 'F', '0', 'module:problem:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2035', '问题标签', '3', '1', '/module/userLabel', 'C', '0', 'module:userLabel:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '问题标签菜单');
INSERT INTO `sys_menu` VALUES ('2036', '问题标签查询', '2035', '1', '#', 'F', '0', 'module:userLabel:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2037', '问题标签新增', '2035', '2', '#', 'F', '0', 'module:userLabel:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2038', '问题标签修改', '2035', '3', '#', 'F', '0', 'module:userLabel:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('2039', '问题标签删除', '2035', '4', '#', 'F', '0', 'module:userLabel:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-02 14:35:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('148', '收藏', '1', 'com.ruoyi.project.module.mycollections.controller.MycollectionsController.addSave()', '1', null, null, '/cpsspbbc/module/mycollections/add', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-31 00:05:57');
INSERT INTO `sys_oper_log` VALUES ('149', '收藏', '1', 'com.ruoyi.project.module.mycollections.controller.MycollectionsController.addSave()', '1', null, null, '/cpsspbbc/module/mycollections/add', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-31 00:05:59');
INSERT INTO `sys_oper_log` VALUES ('150', '收藏', '1', 'com.ruoyi.project.module.mycollections.controller.MycollectionsController.addSave()', '1', null, null, '/cpsspbbc/module/mycollections/add', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-31 00:09:01');
INSERT INTO `sys_oper_log` VALUES ('151', '收藏', '1', 'com.ruoyi.project.module.mycollections.controller.MycollectionsController.addSave()', '1', null, null, '/cpsspbbc/module/mycollections/add', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-03-31 00:09:06');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"100\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"教师管理\"],\"url\":[\"/system/user\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-02 14:17:57');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"100\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/user\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2019-04-02 14:18:09');
INSERT INTO `sys_oper_log` VALUES ('154', '重置密码', '2', 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', '1', 'admin', '研发部门', '/cpsspbbc/system/user/resetPwd/2', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:18:23');
INSERT INTO `sys_oper_log` VALUES ('155', '用户管理', '3', 'com.ruoyi.project.system.user.controller.UserController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/user/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2019-04-02 14:18:26');
INSERT INTO `sys_oper_log` VALUES ('156', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"\"],\"loginName\":[\"student\"],\"userName\":[\"学生1\"],\"password\":[\"123456\"],\"email\":[\"student@qq.com\"],\"phonenumber\":[\"13333333333\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '0', null, '2019-04-02 14:23:27');
INSERT INTO `sys_oper_log` VALUES ('157', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"\"],\"loginName\":[\"teacher1\"],\"userName\":[\"老师1\"],\"password\":[\"123456\"],\"email\":[\"teacher1@qq.com\"],\"phonenumber\":[\"13333333334\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '0', null, '2019-04-02 14:24:05');
INSERT INTO `sys_oper_log` VALUES ('158', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"\"],\"loginName\":[\"teacher2\"],\"userName\":[\"老师2\"],\"password\":[\"123456\"],\"email\":[\"teacher2@qq.com\"],\"phonenumber\":[\"13333333335\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '0', null, '2019-04-02 14:24:32');
INSERT INTO `sys_oper_log` VALUES ('159', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"\"],\"loginName\":[\"teacher3\"],\"userName\":[\"老师3\"],\"password\":[\"123456\"],\"email\":[\"teacher3@qq.com\"],\"phonenumber\":[\"13333333336\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}', '0', null, '2019-04-02 14:24:58');
INSERT INTO `sys_oper_log` VALUES ('160', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/1034', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:25:41');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/1033', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:25:46');
INSERT INTO `sys_oper_log` VALUES ('162', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"\"]}', '0', null, '2019-04-02 14:26:06');
INSERT INTO `sys_oper_log` VALUES ('163', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"100\"],\"roleName\":[\"老师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"\"]}', '0', null, '2019-04-02 14:26:11');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/107', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:26:23');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/1033', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:26:28');
INSERT INTO `sys_oper_log` VALUES ('166', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/1038', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:26:35');
INSERT INTO `sys_oper_log` VALUES ('167', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/1037', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:26:41');
INSERT INTO `sys_oper_log` VALUES ('168', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/1036', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:26:47');
INSERT INTO `sys_oper_log` VALUES ('169', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/1035', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:26:53');
INSERT INTO `sys_oper_log` VALUES ('170', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/cpsspbbc/system/menu/remove/107', '127.0.0.1', 'XX XX', '{}', '0', null, '2019-04-02 14:27:03');
INSERT INTO `sys_oper_log` VALUES ('171', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/add', '127.0.0.1', 'XX XX', '{\"dictName\":[\"知识标签\"],\"dictType\":[\"knowledge_label\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2019-04-02 14:28:22');
INSERT INTO `sys_oper_log` VALUES ('172', '字典类型', '2', 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/edit', '127.0.0.1', 'XX XX', '{\"dictId\":[\"10\"],\"dictName\":[\"知识标签\"],\"dictType\":[\"knowledge_label\"],\"status\":[\"0\"],\"remark\":[\"知识标签表\"]}', '0', null, '2019-04-02 14:28:36');
INSERT INTO `sys_oper_log` VALUES ('173', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"数学\"],\"dictValue\":[\"1\"],\"dictType\":[\"knowledge_label\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"数学\"]}', '0', null, '2019-04-02 14:29:31');
INSERT INTO `sys_oper_log` VALUES ('174', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"Java技术\"],\"dictValue\":[\"2\"],\"dictType\":[\"knowledge_label\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"Java技术\"]}', '0', null, '2019-04-02 14:30:12');
INSERT INTO `sys_oper_log` VALUES ('175', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"28\"],\"dictLabel\":[\"Java基础\"],\"dictValue\":[\"2\"],\"dictType\":[\"knowledge_label\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"Java基础\"]}', '0', null, '2019-04-02 14:30:37');
INSERT INTO `sys_oper_log` VALUES ('176', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"小程序\"],\"dictValue\":[\"3\"],\"dictType\":[\"knowledge_label\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"小程序\"]}', '0', null, '2019-04-02 14:31:21');
INSERT INTO `sys_oper_log` VALUES ('177', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"C++编程\"],\"dictValue\":[\"4\"],\"dictType\":[\"knowledge_label\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"C++编程\"]}', '0', null, '2019-04-02 14:31:57');
INSERT INTO `sys_oper_log` VALUES ('178', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"linux系统\"],\"dictValue\":[\"5\"],\"dictType\":[\"knowledge_label\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"linux系统\"]}', '0', null, '2019-04-02 14:32:51');
INSERT INTO `sys_oper_log` VALUES ('179', '通知公告', '2', 'com.ruoyi.project.system.notice.controller.NoticeController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/notice/edit', '127.0.0.1', 'XX XX', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"新版本内容\"],\"status\":[\"0\"]}', '0', null, '2019-04-02 14:35:01');
INSERT INTO `sys_oper_log` VALUES ('180', '代码生成', '8', 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', '1', 'admin', '研发部门', '/cpsspbbc/tool/gen/batchGenCode', '127.0.0.1', 'XX XX', '{\"tables\":[\"t_answer,t_user_label,t_problem\"]}', '0', null, '2019-04-02 14:35:46');
INSERT INTO `sys_oper_log` VALUES ('181', '角色管理', '2', 'com.ruoyi.project.system.role.controller.RoleController.editSave()', '1', 'admin', '研发部门', '/cpsspbbc/system/role/edit', '127.0.0.1', 'XX XX', '{\"roleId\":[\"2\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"3,2030,2031,2032,2033,2034\"]}', '0', null, '2019-04-02 15:12:10');
INSERT INTO `sys_oper_log` VALUES ('182', '问题管理', '1', 'com.ruoyi.project.module.problem.controller.ProblemController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/module/problem/add', '127.0.0.1', 'XX XX', '{\"title\":[\"List,Set,Map 是否继承自Collection 接口？\"],\"dictLabel\":[\"2\"]}', '0', null, '2019-04-02 15:15:28');
INSERT INTO `sys_oper_log` VALUES ('183', '答疑管理', '1', 'com.ruoyi.project.module.answer.controller.AnswerController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/module/answer/add', '127.0.0.1', 'XX XX', '{\"id\":[\"200\"],\"answer\":[\"List,Set 是；Map 不是。\"],\"score\":[\"1\"]}', '0', null, '2019-04-02 15:39:52');
INSERT INTO `sys_oper_log` VALUES ('184', '问题管理', '1', 'com.ruoyi.project.module.problem.controller.ProblemController.addSave()', '1', 'admin', '研发部门', '/cpsspbbc/module/problem/add', '127.0.0.1', 'XX XX', '{\"title\":[\"HashMap 和Hashtable 的区别? \"],\"dictLabel\":[\"2\"]}', '0', null, '2019-04-02 15:40:45');
INSERT INTO `sys_oper_log` VALUES ('185', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', null, null, '/cpsspbbc/system/user/edit', '127.0.0.1', 'XX XX', '{}', '1', '', '2019-04-02 16:06:51');
INSERT INTO `sys_oper_log` VALUES ('186', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', null, null, '/cpsspbbc/system/user/edit', '127.0.0.1', 'XX XX', '{}', '1', '', '2019-04-02 16:09:23');
INSERT INTO `sys_oper_log` VALUES ('187', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', null, null, '/cpsspbbc/system/user/edit', '127.0.0.1', 'XX XX', '{}', '1', '', '2019-04-02 16:10:54');
INSERT INTO `sys_oper_log` VALUES ('188', '用户管理', '2', 'com.ruoyi.project.system.user.controller.UserController.editSave()', '1', null, null, '/cpsspbbc/system/user/edit', '127.0.0.1', 'XX XX', '{}', '1', '', '2019-04-02 16:11:31');
INSERT INTO `sys_oper_log` VALUES ('189', '问题管理', '1', 'com.ruoyi.project.module.problem.controller.ProblemController.addSave()', '1', null, null, '/cpsspbbc/module/problem/add', '127.0.0.1', 'XX XX', '{\"title\":[\"有趣的数学问题\"],\"dictLabel\":[\"数学\"],\"content\":[\"undefined\"]}', '0', null, '2019-04-02 20:52:03');
INSERT INTO `sys_oper_log` VALUES ('190', '问题管理', '1', 'com.ruoyi.project.module.problem.controller.ProblemController.addSave()', '1', null, null, '/cpsspbbc/module/problem/add', '127.0.0.1', 'XX XX', '{\"title\":[\"有趣的数学问题\"],\"dictLabel\":[\"数学\"],\"content\":[\"在你面前有一条长长的阶梯。如果你每步跨2阶，那么最后剩下1阶；如果你每步跨3阶，那么最后剩2阶；如果你每步跨5阶，那么最后剩4阶；如果你每步跨6阶，那么最后剩5阶；只有当你每步跨7阶时，最后才正好走完，一阶也不剩。\\n　　请你算一算，这条阶梯到底有多少阶？\"]}', '0', null, '2019-04-02 20:54:35');
INSERT INTO `sys_oper_log` VALUES ('191', '问题管理', '1', 'com.ruoyi.project.module.problem.controller.ProblemController.addSave()', '1', null, null, '/cpsspbbc/module/problem/add', '127.0.0.1', 'XX XX', '{\"title\":[\"11212\"],\"dictLabel\":[\"数学\"],\"content\":[\"12321312\"]}', '0', null, '2019-04-02 20:57:11');
INSERT INTO `sys_oper_log` VALUES ('192', '问题管理', '1', 'com.ruoyi.project.module.problem.controller.ProblemController.addSave()', '1', null, null, '/cpsspbbc/module/problem/add', '127.0.0.1', 'XX XX', '{\"problemId\":[\"有趣的数学问题\"],\"title\":[\"有趣的数学问题\"],\"answer\":[\"答案：分析能力较强的同学可以看出，所求的阶梯数应比2、3、5、6的公倍数(即30的倍数)小1，并且是7的倍数。因此只需从29、59、89、119中找7的倍数就可以了。很快可以得到答案为119阶。\"],\"userId\":[\"3\"],\"createBy\":[\"学生1\"]}', '0', null, '2019-04-02 21:25:32');
INSERT INTO `sys_oper_log` VALUES ('193', '答疑管理', '1', 'com.ruoyi.project.module.answer.controller.AnswerController.addSave()', '1', null, null, '/cpsspbbc/module/answer/add', '127.0.0.1', 'XX XX', '{\"problemId\":[\"209\"],\"title\":[\"有趣的数学问题\"],\"answer\":[\"答案：分析能力较强的同学可以看出，所求的阶梯数应比2、3、5、6的公倍数(即30的倍数)小1，并且是7的倍数。因此只需从29、59、89、119中找7的倍数就可以了。很快可以得到答案为119阶。\"],\"userId\":[\"3\"],\"createBy\":[\"学生1\"]}', '0', null, '2019-04-02 21:28:41');
INSERT INTO `sys_oper_log` VALUES ('194', '答疑管理', '2', 'com.ruoyi.project.module.answer.controller.AnswerController.editSave()', '1', null, null, '/cpsspbbc/module/answer/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"208\"],\"score\":[\"4\"]}', '0', null, '2019-04-02 21:48:59');
INSERT INTO `sys_oper_log` VALUES ('195', '答疑管理', '2', 'com.ruoyi.project.module.answer.controller.AnswerController.editSave()', '1', null, null, '/cpsspbbc/module/answer/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"208\"],\"score\":[\"3\"]}', '0', null, '2019-04-02 21:49:01');
INSERT INTO `sys_oper_log` VALUES ('196', '答疑管理', '2', 'com.ruoyi.project.module.answer.controller.AnswerController.editSave()', '1', null, null, '/cpsspbbc/module/answer/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"208\"],\"score\":[\"2\"]}', '0', null, '2019-04-02 21:49:02');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '学生', 'student', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-02 15:12:10', '学生');
INSERT INTO `sys_role` VALUES ('100', '老师', 'teacher', '3', '1', '0', '0', 'admin', '2019-03-03 23:00:33', 'admin', '2019-04-02 14:26:11', '老师');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '2030');
INSERT INTO `sys_role_menu` VALUES ('2', '2031');
INSERT INTO `sys_role_menu` VALUES ('2', '2032');
INSERT INTO `sys_role_menu` VALUES ('2', '2033');
INSERT INTO `sys_role_menu` VALUES ('2', '2034');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `open_id` varchar(128) DEFAULT NULL COMMENT '微信唯一标识',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `dict_label` varchar(255) DEFAULT NULL COMMENT '知识标签',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', null, '0', null, '103', 'admin', '超级管理员', '00', 'admin@163.com', '15888888888', '0', '', 'cd57d2c1596596d7a6ebebdc139b3c6a', '111111', '0', '0', '127.0.0.1', '2019-07-17 23:22:10', 'admin', '2018-03-16 11:33:00', 'ry', '2019-07-17 23:22:09', '管理员');
INSERT INTO `sys_user` VALUES ('2', null, '0', null, '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES ('3', 'o9zMF5vG-h-mdaH7RWv1eespLsUY', '0', 'Java基础', null, 'student', '学生1', '00', 'student@qq.com', '13333333333', '0', '', '0075a9aebb429a8e8f4834771b954d33', 'ccf526', '0', '0', '127.0.0.1', '2019-04-02 16:28:45', 'admin', '2019-04-02 14:23:27', '', '2019-04-02 16:42:22', '');
INSERT INTO `sys_user` VALUES ('4', null, '0', null, null, 'teacher1', '老师1', '00', 'teacher1@qq.com', '13333333334', '0', '', 'c788fbd64cddcb9cddd436ff76c2dcbf', '850b69', '0', '0', '', null, 'admin', '2019-04-02 14:24:05', '', null, '');
INSERT INTO `sys_user` VALUES ('5', null, '0', null, null, 'teacher2', '老师2', '00', 'teacher2@qq.com', '13333333335', '0', '', '97bdde4b4b33fd6dbee4781e67086da4', '87ede2', '0', '0', '', null, 'admin', '2019-04-02 14:24:32', '', null, '');
INSERT INTO `sys_user` VALUES ('6', null, '0', null, null, 'teacher3', '老师3', '00', 'teacher3@qq.com', '13333333336', '0', '', 'cc8d29438571a7fbbdd8499122505dc0', '7844d7', '0', '0', '', null, 'admin', '2019-04-02 14:24:57', '', null, '');

-- ----------------------------
-- Table structure for `sys_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '100');
INSERT INTO `sys_user_role` VALUES ('5', '100');
INSERT INTO `sys_user_role` VALUES ('6', '100');

-- ----------------------------
-- Table structure for `t_answer`
-- ----------------------------
DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `problem_id` int(11) DEFAULT NULL COMMENT '问题id',
  `title` varchar(256) DEFAULT '' COMMENT '问题',
  `answer` varchar(5000) DEFAULT '' COMMENT '回答内容',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `user_id` int(11) DEFAULT NULL COMMENT '回答者ID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COMMENT='答疑管理';

-- ----------------------------
-- Records of t_answer
-- ----------------------------
INSERT INTO `t_answer` VALUES ('202', '200', 'List,Set,Map 是否继承自Collection 接口？', '答：二者都实现了Map 接口，是将惟一键映射到特定的值上；主要区别在于：1)HashMap 没有排序，允许一个null 键和多个null 值,而Hashtable 不允许；2)HashMap 把Hashtable 的contains 方法去掉了，改成containsvalue 和containsKey,因为contains 方法容易让人引起误解；3)Hashtable 继承自Dictionary 类，HashMap 是Java1.2 引进的Map 接口的实现；4)Hashtable 的方法是Synchronize 的，而HashMap 不是，在多个线程访问Hashtable 时，不需要自己为它的方法实现同步，而HashMap 就必须为之提供外同步。Hashtable 和HashMap 采用的hash/rehash 算法大致一样，所以性能不会有很大的差异。', '3', '4', '老师1', '2019-04-02 20:03:59');
INSERT INTO `t_answer` VALUES ('203', '200', 'List,Set,Map 是否继承自Collection 接口？', '答：二者都实现了Map 接口，是将惟一键映射到特定的值上；主要区别在于：1)HashMap 没有排序，允许一个null 键和多个null 值,而Hashtable 不允许；2)HashMap 把Hashtable 的contains 方法去掉了，改成containsvalue 和containsKey,因为contains 方法容易让人引起误解；3)Hashtable 继承自Dictionary 类，HashMap 是Java1.2 引进的Map 接口的实现；4)Hashtable 的方法是Synchronize 的，而HashMap 不是，在多个线程访问Hashtable 时，不需要自己为它的方法实现同步，而HashMap 就必须为之提供外同步。Hashtable 和HashMap 采用的hash/rehash 算法大致一样，所以性能不会有很大的差异。', '2', '4', '老师1', '2019-04-02 20:04:00');
INSERT INTO `t_answer` VALUES ('204', '200', 'List,Set,Map 是否继承自Collection 接口？', '答：二者都实现了Map 接口，是将惟一键映射到特定的值上；主要区别在于：1)HashMap 没有排序，允许一个null 键和多个null 值,而Hashtable 不允许；2)HashMap 把Hashtable 的contains 方法去掉了，改成containsvalue 和containsKey,因为contains 方法容易让人引起误解；3)Hashtable 继承自Dictionary 类，HashMap 是Java1.2 引进的Map 接口的实现；4)Hashtable 的方法是Synchronize 的，而HashMap 不是，在多个线程访问Hashtable 时，不需要自己为它的方法实现同步，而HashMap 就必须为之提供外同步。Hashtable 和HashMap 采用的hash/rehash 算法大致一样，所以性能不会有很大的差异。', '4', '4', '老师1', '2019-04-02 20:04:00');
INSERT INTO `t_answer` VALUES ('205', '200', 'List,Set,Map 是否继承自Collection 接口？', '答：二者都实现了Map 接口，是将惟一键映射到特定的值上；主要区别在于：1)HashMap 没有排序，允许一个null 键和多个null 值,而Hashtable 不允许；2)HashMap 把Hashtable 的contains 方法去掉了，改成containsvalue 和containsKey,因为contains 方法容易让人引起误解；3)Hashtable 继承自Dictionary 类，HashMap 是Java1.2 引进的Map 接口的实现；4)Hashtable 的方法是Synchronize 的，而HashMap 不是，在多个线程访问Hashtable 时，不需要自己为它的方法实现同步，而HashMap 就必须为之提供外同步。Hashtable 和HashMap 采用的hash/rehash 算法大致一样，所以性能不会有很大的差异。', '0', '4', '老师1', '2019-04-02 20:04:00');
INSERT INTO `t_answer` VALUES ('206', '200', 'List,Set,Map 是否继承自Collection 接口？', '答：二者都实现了Map 接口，是将惟一键映射到特定的值上；主要区别在于：1)HashMap 没有排序，允许一个null 键和多个null 值,而Hashtable 不允许；2)HashMap 把Hashtable 的contains 方法去掉了，改成containsvalue 和containsKey,因为contains 方法容易让人引起误解；3)Hashtable 继承自Dictionary 类，HashMap 是Java1.2 引进的Map 接口的实现；4)Hashtable 的方法是Synchronize 的，而HashMap 不是，在多个线程访问Hashtable 时，不需要自己为它的方法实现同步，而HashMap 就必须为之提供外同步。Hashtable 和HashMap 采用的hash/rehash 算法大致一样，所以性能不会有很大的差异。', '0', '4', '老师1', '2019-04-02 20:04:01');
INSERT INTO `t_answer` VALUES ('207', '200', 'List,Set,Map 是否继承自Collection 接口？', '答：二者都实现了Map 接口，是将惟一键映射到特定的值上；主要区别在于：1)HashMap 没有排序，允许一个null 键和多个null 值,而Hashtable 不允许；2)HashMap 把Hashtable 的contains 方法去掉了，改成containsvalue 和containsKey,因为contains 方法容易让人引起误解；3)Hashtable 继承自Dictionary 类，HashMap 是Java1.2 引进的Map 接口的实现；4)Hashtable 的方法是Synchronize 的，而HashMap 不是，在多个线程访问Hashtable 时，不需要自己为它的方法实现同步，而HashMap 就必须为之提供外同步。Hashtable 和HashMap 采用的hash/rehash 算法大致一样，所以性能不会有很大的差异。', '0', '4', '老师1', '2019-04-02 20:04:01');
INSERT INTO `t_answer` VALUES ('208', '209', '有趣的数学问题', '答案：分析能力较强的同学可以看出，所求的阶梯数应比2、3、5、6的公倍数(即30的倍数)小1，并且是7的倍数。因此只需从29、59、89、119中找7的倍数就可以了。很快可以得到答案为119阶。', '2', '3', '学生1', '2019-04-02 21:28:41');

-- ----------------------------
-- Table structure for `t_problem`
-- ----------------------------
DROP TABLE IF EXISTS `t_problem`;
CREATE TABLE `t_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(256) DEFAULT '' COMMENT '问题',
  `content` varchar(5000) DEFAULT NULL COMMENT '内容',
  `user_id` int(11) DEFAULT '0' COMMENT '提问者ID',
  `dict_label` varchar(100) DEFAULT '' COMMENT '标签',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 COMMENT='问题管理';

-- ----------------------------
-- Records of t_problem
-- ----------------------------
INSERT INTO `t_problem` VALUES ('200', 'List,Set,Map 是否继承自Collection 接口？', 'List,Set,Map 是否继承自Collection 接口', '1', 'Java基础', '超级管理员', '2019-04-02 15:15:28');
INSERT INTO `t_problem` VALUES ('201', 'HashMap 和Hashtable 的区别? ', 'HashMap 和Hashtable 的区别', '1', 'Java基础', '超级管理员', '2019-04-02 15:40:45');
INSERT INTO `t_problem` VALUES ('202', 'HashMap 和Hashtable 的区别? ', '到底有什么区别呢？', '3', 'Java基础', '学生1', '2019-04-02 15:40:45');
INSERT INTO `t_problem` VALUES ('203', 'HashMap 和Hashtable 的区别? ', '到底有什么区别呢？', '3', 'Java基础', '学生1', '2019-04-02 15:40:45');
INSERT INTO `t_problem` VALUES ('204', 'HashMap 和Hashtable 的区别? ', '到底有什么区别呢？', '3', 'Java基础', '学生1', '2019-04-02 15:40:45');
INSERT INTO `t_problem` VALUES ('205', 'HashMap 和Hashtable 的区别? ', '到底有什么区别呢？', '3', 'Java基础', '学生1', '2019-04-02 15:40:45');
INSERT INTO `t_problem` VALUES ('206', 'HashMap 和Hashtable 的区别? ', '到底有什么区别呢？', '3', 'Java基础', '学生1', '2019-04-02 15:40:45');
INSERT INTO `t_problem` VALUES ('207', 'HashMap 和Hashtable 的区别? ', '到底有什么区别呢？', '3', 'Java基础', '学生1', '2019-04-02 15:40:45');
INSERT INTO `t_problem` VALUES ('209', '有趣的数学问题', '在你面前有一条长长的阶梯。如果你每步跨2阶，那么最后剩下1阶；如果你每步跨3阶，那么最后剩2阶；如果你每步跨5阶，那么最后剩4阶；如果你每步跨6阶，那么最后剩5阶；只有当你每步跨7阶时，最后才正好走完，一阶也不剩。\n　　请你算一算，这条阶梯到底有多少阶？', '0', '数学', '', '2019-04-02 20:54:35');

-- ----------------------------
-- Table structure for `t_user_label`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_label`;
CREATE TABLE `t_user_label` (
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `dict_code` int(11) NOT NULL DEFAULT '0' COMMENT '标签编号',
  `dict_label` varchar(100) DEFAULT '' COMMENT '标签',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`user_id`,`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题标签';

-- ----------------------------
-- Records of t_user_label
-- ----------------------------
