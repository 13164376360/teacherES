/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ems

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-11-19 17:03:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for anthorty_info
-- ----------------------------
DROP TABLE IF EXISTS `anthorty_info`;
CREATE TABLE `anthorty_info` (
  `anthorty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `anthorty_pid` int(11) DEFAULT NULL COMMENT '上级编号',
  `anthorty_name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `anthorty_desc` varchar(1000) DEFAULT NULL COMMENT '权限描述',
  `anthorty_url` varchar(1000) DEFAULT NULL COMMENT '权限url',
  PRIMARY KEY (`anthorty_id`),
  KEY `FK_Reference_2` (`anthorty_pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1503 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of anthorty_info
-- ----------------------------
INSERT INTO `anthorty_info` VALUES ('10', '1', '系统管理', 'system', null);
INSERT INTO `anthorty_info` VALUES ('11', '1', '营销管理', 'markting', null);
INSERT INTO `anthorty_info` VALUES ('12', '1', '班级管理', 'classinfo', null);
INSERT INTO `anthorty_info` VALUES ('13', '1', '学员管理', 'student', null);
INSERT INTO `anthorty_info` VALUES ('14', '1', '教务管理', 'educational', null);
INSERT INTO `anthorty_info` VALUES ('15', '1', '财务管理', 'finance', null);
INSERT INTO `anthorty_info` VALUES ('16', '1', '招生管理', 'recruistudent', null);
INSERT INTO `anthorty_info` VALUES ('1001', '10', '员工管理', '员工权限管理', 'system/list.do');
INSERT INTO `anthorty_info` VALUES ('1002', '10', '角色管理', 'trackrecordinfo/list.do', 'roleinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1003', '10', '权限变更', 'auditioninfo/list.do', 'anthotychange/list.do');
INSERT INTO `anthorty_info` VALUES ('1004', '10', '权限管理', '1', 'anthorty/list.do');
INSERT INTO `anthorty_info` VALUES ('1005', '10', '数据字典', '1', 'datadictionary/list.do');
INSERT INTO `anthorty_info` VALUES ('1006', '10', '角色变更', null, 'roleinfo/staffinforolelist.do');
INSERT INTO `anthorty_info` VALUES ('1101', '11', '模板管理', '1', 'template/list.do');
INSERT INTO `anthorty_info` VALUES ('1102', '11', '短信管理', '1', 'messafeinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1103', '11', '邮件管理', '1', 'email/list.do');
INSERT INTO `anthorty_info` VALUES ('1104', '11', '营销活动', '', 'marketactive/list.do');
INSERT INTO `anthorty_info` VALUES ('1201', '12', '学科信息', null, 'disciplineinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1202', '12', '教师信息', '1', 'teacher/list.do');
INSERT INTO `anthorty_info` VALUES ('1203', '12', '课程表', '1', 'syllabusinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1204', '12', '教室管理', '1', 'classroominfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1205', '12', '班级管理', '1', 'classinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1301', '13', '学员信息', '1', 'student/list.do');
INSERT INTO `anthorty_info` VALUES ('1302', '13', '学员评价', '1', 'evaluationinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1303', '13', '沟通记录', '1', 'communicateinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1304', '13', '学员成绩', '1', 'studentwritegrade/list.do');
INSERT INTO `anthorty_info` VALUES ('1401', '14', '班级事务', '1', 'classtransactioninfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1402', '14', '学员考勤', '1', 'attendanceinfo/list.do');
INSERT INTO `anthorty_info` VALUES ('1501', '15', '学员缴费', 'studentpayment/list.do', 'studentpayment/list.do');
INSERT INTO `anthorty_info` VALUES ('1502', '15', '员工薪水', 'staffsalary/list.do', 'staffsalary/list.do');

-- ----------------------------
-- Table structure for attendance_info
-- ----------------------------
DROP TABLE IF EXISTS `attendance_info`;
CREATE TABLE `attendance_info` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤编号',
  `student_id` int(11) DEFAULT NULL COMMENT '学员编号',
  `attendance_desc` varchar(100) DEFAULT NULL COMMENT '描述',
  `attendance_state` varchar(10) DEFAULT NULL,
  `attendance_time` datetime DEFAULT NULL COMMENT '日期',
  `attendance_remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`attendance_id`),
  KEY `FK_Reference_22` (`student_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance_info
-- ----------------------------
INSERT INTO `attendance_info` VALUES ('1', '10', '出勤', '1', '2019-11-02 00:00:00', '全勤');
INSERT INTO `attendance_info` VALUES ('2', '10', null, null, null, null);
INSERT INTO `attendance_info` VALUES ('3', '10', null, null, null, null);

-- ----------------------------
-- Table structure for audition_info
-- ----------------------------
DROP TABLE IF EXISTS `audition_info`;
CREATE TABLE `audition_info` (
  `audition_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '试听编号',
  `student_id` int(11) DEFAULT NULL COMMENT '学员编号',
  `audition_time` datetime DEFAULT NULL COMMENT '试听日期',
  `audition_addr` varchar(300) DEFAULT NULL COMMENT '试听地点',
  `audition_course` varchar(100) DEFAULT NULL COMMENT '试听课程',
  `audition_desc` varchar(2000) DEFAULT NULL COMMENT '试听描述',
  PRIMARY KEY (`audition_id`),
  KEY `FK_Reference_10` (`student_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of audition_info
-- ----------------------------
INSERT INTO `audition_info` VALUES ('1', '10', '2019-11-01 15:08:35', '1111', '111', '1');

-- ----------------------------
-- Table structure for classroom_info
-- ----------------------------
DROP TABLE IF EXISTS `classroom_info`;
CREATE TABLE `classroom_info` (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_name` varchar(100) DEFAULT NULL,
  `classroom_max` int(11) DEFAULT NULL,
  `classroom_info` varchar(1000) DEFAULT NULL COMMENT '设备信息',
  `classroom_remark` varchar(1000) DEFAULT NULL,
  `classroom_mark` varchar(10) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom_info
-- ----------------------------
INSERT INTO `classroom_info` VALUES ('1', '403', '28', '1111', '15154', '1');
INSERT INTO `classroom_info` VALUES ('4', '404', '110', '111', '11111', '1');

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_id` int(11) DEFAULT NULL COMMENT '学科编号',
  `syllabus_id` int(11) DEFAULT NULL COMMENT '课程表',
  `classroom_id` int(11) DEFAULT NULL COMMENT '教室编号',
  `staff_id` int(11) DEFAULT NULL COMMENT '员工编号',
  `class_name` varchar(100) DEFAULT NULL,
  `class_number` int(11) DEFAULT NULL,
  `class_start_time` datetime DEFAULT NULL,
  `class_end_time` datetime DEFAULT NULL,
  `class_isuesd` varchar(10) DEFAULT NULL COMMENT '是否有效',
  `class_state` varchar(10) DEFAULT NULL COMMENT '状态',
  `class_desc` varchar(1000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`class_id`),
  KEY `FK_Reference_17` (`discipline_id`),
  KEY `FK_Reference_18` (`syllabus_id`),
  KEY `FK_Reference_19` (`classroom_id`),
  KEY `FK_Reference_20` (`staff_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`discipline_id`) REFERENCES `discipline_info` (`discipline_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`syllabus_id`) REFERENCES `syllabus_info` (`syllabus_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`classroom_id`) REFERENCES `classroom_info` (`classroom_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES ('2', '2', '2', '2', '15', '软工2001', '20', '2019-11-02 00:00:00', '2019-11-02 00:00:00', '1', '1', 'www');
INSERT INTO `class_info` VALUES ('3', '1', '1', '1', '17', '软工2002', '21', '2019-11-02 21:43:41', '2019-11-02 00:00:00', '1', '1', '');
INSERT INTO `class_info` VALUES ('4', '1', '1', '1', '17', '软工2003', '22', '2019-11-02 00:00:00', '2019-11-02 00:00:00', '1', '1', '');
INSERT INTO `class_info` VALUES ('5', '1', '1', '1', '17', '软工2004', '23', '2019-11-02 00:00:00', '2019-11-02 00:00:00', '1', '1', '11');
INSERT INTO `class_info` VALUES ('6', '1', '1', '1', '17', '软工2005', '24', '2019-11-02 00:00:00', '2019-11-02 00:00:00', '1', '1', '');
INSERT INTO `class_info` VALUES ('7', '2', '2', '2', '15', '软工2006', '25', '2019-11-12 00:00:00', '2019-11-02 00:00:00', '1', '1', '11111111');

-- ----------------------------
-- Table structure for class_transaction_info
-- ----------------------------
DROP TABLE IF EXISTS `class_transaction_info`;
CREATE TABLE `class_transaction_info` (
  `class_transaction_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级活动id',
  `class_id` int(11) DEFAULT NULL,
  `class_transaction_title` varchar(100) DEFAULT NULL,
  `class_transaction_content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `class_transaction_person` varchar(100) DEFAULT NULL COMMENT '组织人',
  `class_transaction_time` datetime DEFAULT NULL,
  `class_transaction_remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`class_transaction_id`),
  KEY `FK_Reference_21` (`class_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_transaction_info
-- ----------------------------
INSERT INTO `class_transaction_info` VALUES ('1', '2', '班会', '学习Java要balabala', '1', '2019-11-02 00:00:00', '老师说的好');

-- ----------------------------
-- Table structure for communicate_info
-- ----------------------------
DROP TABLE IF EXISTS `communicate_info`;
CREATE TABLE `communicate_info` (
  `communicate_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL COMMENT '负责人',
  `communicate_time` datetime DEFAULT NULL COMMENT '沟通时间',
  `communicate_content` varchar(2000) DEFAULT NULL COMMENT '沟通内容',
  PRIMARY KEY (`communicate_id`),
  KEY `FK_Reference_12` (`student_id`),
  KEY `FK_Reference_13` (`staff_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of communicate_info
-- ----------------------------
INSERT INTO `communicate_info` VALUES ('1', '10', '17', '2019-11-01 15:11:33', '讨论内容');

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_content` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `data_desc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_dictionary
-- ----------------------------
INSERT INTO `data_dictionary` VALUES ('7', '系统管理', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('8', '营销管理', 'active_state', '');
INSERT INTO `data_dictionary` VALUES ('9', '招生管理', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('10', '班级管理', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('11', '学员管理', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('12', '教务管理', 'active_type', '');
INSERT INTO `data_dictionary` VALUES ('22', '财务管理', 'payment_method', '');

-- ----------------------------
-- Table structure for discipline_info
-- ----------------------------
DROP TABLE IF EXISTS `discipline_info`;
CREATE TABLE `discipline_info` (
  `discipline_id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_name` varchar(100) DEFAULT NULL,
  `discipline_tuition` int(11) DEFAULT NULL,
  `discipline_bring` int(11) DEFAULT NULL COMMENT '课时',
  `discipline_desc` varchar(2000) DEFAULT NULL COMMENT '备注',
  `discipline_isuesd` varchar(10) DEFAULT NULL COMMENT '是否有效',
  `discipline_teacher` int(11) DEFAULT NULL COMMENT '外键关联员工表中的教师信息课程-教师 n-n',
  PRIMARY KEY (`discipline_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discipline_info
-- ----------------------------
INSERT INTO `discipline_info` VALUES ('1', 'java基础', '10200', '120', '111111', '1', null);
INSERT INTO `discipline_info` VALUES ('2', 'c++入门', '10200', '11', '111111', '1', null);
INSERT INTO `discipline_info` VALUES ('3', 'pythen', '1580', '30', '111111', '1', null);
INSERT INTO `discipline_info` VALUES ('4', 'mysql', '11', '111', '111111', '0', null);

-- ----------------------------
-- Table structure for email_info
-- ----------------------------
DROP TABLE IF EXISTS `email_info`;
CREATE TABLE `email_info` (
  `email_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL COMMENT '发送人',
  `email_title` varchar(1000) DEFAULT NULL,
  `email_content` varchar(2000) DEFAULT NULL,
  `email_time` datetime DEFAULT NULL,
  `email_man` varchar(100) DEFAULT NULL COMMENT '接收人',
  `email_addr` varchar(300) DEFAULT NULL,
  `email_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `FK_Reference_7` (`staff_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of email_info
-- ----------------------------
INSERT INTO `email_info` VALUES ('3', '17', '1111111', '222222222', '2019-11-02 17:07:46', '23', 'beifeng1003@163.com', '1');

-- ----------------------------
-- Table structure for evaluation_info
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_info`;
CREATE TABLE `evaluation_info` (
  `evaluation_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `evaluation_title` varchar(100) DEFAULT NULL,
  `evaluation_content` varchar(2000) DEFAULT NULL COMMENT '评价内容',
  `evaluation_course` varchar(100) DEFAULT NULL COMMENT '课程名',
  `evaluation_teacher` varchar(100) DEFAULT NULL,
  `evaluation_time` datetime DEFAULT NULL,
  PRIMARY KEY (`evaluation_id`),
  KEY `FK_Reference_11` (`student_id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_info
-- ----------------------------
INSERT INTO `evaluation_info` VALUES ('1', '10', 'Java', 'Java老师讲的真不错', '98', '1', '2019-11-02 21:50:57');

-- ----------------------------
-- Table structure for market_active
-- ----------------------------
DROP TABLE IF EXISTS `market_active`;
CREATE TABLE `market_active` (
  `active_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `active_name` varchar(300) DEFAULT NULL,
  `active_state` int(11) DEFAULT NULL,
  `active_start` datetime DEFAULT NULL COMMENT '开始时间',
  `active_end` datetime DEFAULT NULL COMMENT '结束时间',
  `active_type` int(11) DEFAULT NULL COMMENT '活动类型',
  `active_coste_emtimate` double DEFAULT NULL COMMENT '成本预算',
  `active_coste` double DEFAULT NULL COMMENT '实际成本',
  `active_refect_estimate` int(11) DEFAULT NULL COMMENT '预期反应',
  `active_student` varchar(300) DEFAULT NULL,
  `active_content` varchar(2000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`active_id`),
  KEY `FK_Reference_5` (`staff_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_active
-- ----------------------------
INSERT INTO `market_active` VALUES ('3', '17', 'Java总结活动', '1', '2019-11-02 00:00:00', '2019-11-02 20:00:00', '123123', '123123', '11', '1551515', '89', '巴拉巴拉');

-- ----------------------------
-- Table structure for messafe_info
-- ----------------------------
DROP TABLE IF EXISTS `messafe_info`;
CREATE TABLE `messafe_info` (
  `messafe_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL COMMENT '发送人',
  `messafe_content` varchar(1000) DEFAULT NULL,
  `messafe_man` varchar(50) DEFAULT NULL COMMENT '接收人',
  `messafe_phone` varchar(50) DEFAULT NULL COMMENT '接受手机号',
  `messafe_time` datetime DEFAULT NULL COMMENT '发送时间',
  `messafe_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`messafe_id`),
  KEY `FK_Reference_6` (`staff_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messafe_info
-- ----------------------------
INSERT INTO `messafe_info` VALUES ('1', '17', '按喇叭啦巴拉巴拉', '周润发', '111111111', '2019-11-02 15:29:01', '1');
INSERT INTO `messafe_info` VALUES ('15', '17', '按喇叭啦巴拉巴拉', '周润发', '2222222', '2019-11-02 16:07:40', '1');

-- ----------------------------
-- Table structure for role_anthority_info
-- ----------------------------
DROP TABLE IF EXISTS `role_anthority_info`;
CREATE TABLE `role_anthority_info` (
  `role_anthority_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `anthorty_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_anthority_id`),
  KEY `FK_Reference_3` (`role_id`),
  KEY `FK_Reference_4` (`anthorty_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`anthorty_id`) REFERENCES `anthorty_info` (`anthorty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_anthority_info
-- ----------------------------
INSERT INTO `role_anthority_info` VALUES ('1', '1', '10');
INSERT INTO `role_anthority_info` VALUES ('2', '1', '11');
INSERT INTO `role_anthority_info` VALUES ('3', '1', '12');
INSERT INTO `role_anthority_info` VALUES ('4', '1', '13');
INSERT INTO `role_anthority_info` VALUES ('5', '1', '14');
INSERT INTO `role_anthority_info` VALUES ('6', '1', '15');
INSERT INTO `role_anthority_info` VALUES ('8', '1', '1001');
INSERT INTO `role_anthority_info` VALUES ('9', '1', '1002');
INSERT INTO `role_anthority_info` VALUES ('10', '1', '1003');
INSERT INTO `role_anthority_info` VALUES ('11', '1', '1101');
INSERT INTO `role_anthority_info` VALUES ('12', '1', '1102');
INSERT INTO `role_anthority_info` VALUES ('13', '1', '1103');
INSERT INTO `role_anthority_info` VALUES ('14', '1', '1104');
INSERT INTO `role_anthority_info` VALUES ('15', '1', '1201');
INSERT INTO `role_anthority_info` VALUES ('17', '1', '1202');
INSERT INTO `role_anthority_info` VALUES ('18', '1', '1203');
INSERT INTO `role_anthority_info` VALUES ('19', '1', '1501');
INSERT INTO `role_anthority_info` VALUES ('20', '1', '1502');
INSERT INTO `role_anthority_info` VALUES ('21', '1', '1004');
INSERT INTO `role_anthority_info` VALUES ('24', '1', '1005');
INSERT INTO `role_anthority_info` VALUES ('25', '1', '1204');
INSERT INTO `role_anthority_info` VALUES ('26', '1', '1205');
INSERT INTO `role_anthority_info` VALUES ('27', '1', '1301');
INSERT INTO `role_anthority_info` VALUES ('28', '1', '1302');
INSERT INTO `role_anthority_info` VALUES ('29', '1', '1303');
INSERT INTO `role_anthority_info` VALUES ('30', '1', '1304');
INSERT INTO `role_anthority_info` VALUES ('31', '1', '1401');
INSERT INTO `role_anthority_info` VALUES ('32', '1', '1402');
INSERT INTO `role_anthority_info` VALUES ('33', '1', '1006');

-- ----------------------------
-- Table structure for role_info
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `role_desc` varchar(1000) DEFAULT NULL,
  `role_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '管理员', '1', '1');
INSERT INTO `role_info` VALUES ('2', '教师', '教师', '1');
INSERT INTO `role_info` VALUES ('3', '学生', '学生', '1');
INSERT INTO `role_info` VALUES ('4', '校长', '校长', '0');

-- ----------------------------
-- Table structure for staff_info
-- ----------------------------
DROP TABLE IF EXISTS `staff_info`;
CREATE TABLE `staff_info` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `staff_name` varchar(100) DEFAULT NULL,
  `staff_sex` varchar(10) DEFAULT NULL,
  `staff_age` int(10) DEFAULT NULL,
  `staff_native_place` varchar(10) DEFAULT NULL,
  `staff_idcard` varchar(100) DEFAULT NULL,
  `staff_brithday` datetime DEFAULT NULL,
  `staff_office_phone` varchar(50) DEFAULT NULL,
  `staff_mobile_phone` varchar(50) DEFAULT NULL,
  `staff_eamil` varchar(100) DEFAULT NULL,
  `staff_addr` varchar(200) DEFAULT NULL,
  `staff_qq` varchar(30) DEFAULT NULL,
  `staff_entry_time` datetime DEFAULT NULL,
  `staff_eduction_level` varchar(20) DEFAULT NULL,
  `staff_remark` varchar(2000) DEFAULT NULL,
  `staff_state` varchar(10) DEFAULT NULL COMMENT '1 有效 员工\r\n            0 无效\r\n            2 教师\r\n            ',
  `user_number` varchar(100) DEFAULT NULL,
  `user_passowrd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `unq_user_number` (`user_number`),
  KEY `FK_Reference_1` (`role_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`role_id`) REFERENCES `role_info` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_info
-- ----------------------------
INSERT INTO `staff_info` VALUES ('17', '2', '张教授', '男', '18', '教师公寓', '5001420198820203432', '2019-11-02 00:00:00', '123-12313213111', '1234567890', '1321313', '12', '21313', '2019-11-29 00:00:00', '保密', '  ', '2', 'teacher001', '123456');
INSERT INTO `staff_info` VALUES ('18', '2', '哈教授', null, null, null, null, null, null, null, null, null, null, null, '教授', null, '2', 'teacher002', '123456');
INSERT INTO `staff_info` VALUES ('19', '3', '张三', '男', '18', '7号楼', null, null, null, null, null, null, null, null, '学生', null, '1', 'student001', '123456');
INSERT INTO `staff_info` VALUES ('20', '1', '管理员', null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'admin0001', '123456');

-- ----------------------------
-- Table structure for staff_salary
-- ----------------------------
DROP TABLE IF EXISTS `staff_salary`;
CREATE TABLE `staff_salary` (
  `staff_salary_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `sta_staff_id` int(11) DEFAULT NULL,
  `total_salary` double DEFAULT NULL,
  `deduct_salary` double DEFAULT NULL,
  `real_salary` double DEFAULT NULL,
  `is_uesd` varchar(10) DEFAULT NULL,
  `staff_salary_time` datetime DEFAULT NULL,
  `staff_remark` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`staff_salary_id`),
  KEY `FK_Reference_25` (`staff_id`),
  KEY `FK_Reference_26` (`sta_staff_id`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`sta_staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff_salary
-- ----------------------------
INSERT INTO `staff_salary` VALUES ('3', '13', '15', '1000', '200', '800', '1', '2019-11-16 21:21:59', '111');
INSERT INTO `staff_salary` VALUES ('4', '19', '18', '5000', '2000', '3000', '1', '2019-11-16 15:40:31', '加油');

-- ----------------------------
-- Table structure for student_info
-- ----------------------------
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `student_sex` varchar(10) DEFAULT NULL,
  `student_age` int(11) DEFAULT NULL,
  `student_tellphone` varchar(100) DEFAULT NULL,
  `student_email` varchar(200) DEFAULT NULL,
  `student_idcard` varchar(30) DEFAULT NULL,
  `student_address` varchar(300) DEFAULT NULL,
  `student_birthday` varchar(100) DEFAULT NULL,
  `student_school` varchar(100) DEFAULT NULL,
  `student_qq` varchar(100) DEFAULT NULL,
  `student_parents_name` varchar(100) DEFAULT NULL,
  `student_parents_phone` varchar(100) DEFAULT NULL,
  `student_pro` varchar(100) DEFAULT NULL,
  `student_pro_city` varchar(100) DEFAULT NULL,
  `student_type` varchar(10) DEFAULT NULL,
  `student_ispay` varchar(10) DEFAULT NULL,
  `student_sate` int(10) DEFAULT NULL,
  `student_mark` varchar(10) DEFAULT NULL,
  `student_desc` varchar(2000) DEFAULT NULL,
  `student_number` varchar(100) DEFAULT NULL,
  `student_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `FK_stu_number` (`student_number`),
  KEY `FK_Reference_16` (`class_id`),
  KEY `FK_Reference_8` (`staff_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_info
-- ----------------------------
INSERT INTO `student_info` VALUES ('10', '17', '2', '张三', '男', '18', '123456789', '111', '111', '111', '111', '111', '11', '111', '111', '11', '111', null, '111', '1', '2', '1', 'student001', '123456');
INSERT INTO `student_info` VALUES ('11', '17', '2', '李四', '男', '18', '', '', '', '', '', '', '', '', '', '', '', null, '1', '1', '2', '1', 'student002', '123456');

-- ----------------------------
-- Table structure for student_payment
-- ----------------------------
DROP TABLE IF EXISTS `student_payment`;
CREATE TABLE `student_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `payment_situation` varchar(1000) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `should_amount` double DEFAULT NULL,
  `real_amount` double DEFAULT NULL,
  `debt_amount` double DEFAULT NULL,
  `payment_remark` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FK_Reference_23` (`student_id`),
  KEY `FK_Reference_24` (`staff_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_payment
-- ----------------------------
INSERT INTO `student_payment` VALUES ('3', '10', '17', 'Java培训', '10', '2019-11-02 00:00:00', '200', '1000', '600', '200', '备注1111');
INSERT INTO `student_payment` VALUES ('4', '11', '17', 'Java培训', '10', '2019-11-02 00:00:00', '200', '1000', '600', '200', '备注22222');

-- ----------------------------
-- Table structure for student_write_grade
-- ----------------------------
DROP TABLE IF EXISTS `student_write_grade`;
CREATE TABLE `student_write_grade` (
  `write_grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `write_grade_subject` varchar(1000) DEFAULT NULL,
  `write_grade` varchar(50) DEFAULT NULL,
  `write_grade_time` datetime DEFAULT NULL,
  `write_grade_note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`write_grade_id`),
  KEY `FK_Reference_14` (`student_id`),
  KEY `FK_Reference_15` (`staff_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`staff_id`) REFERENCES `staff_info` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_write_grade
-- ----------------------------
INSERT INTO `student_write_grade` VALUES ('1', '1', '17', 'java', '60', '2019-11-02 00:00:00', 'aaaaaaaaaaaa');
INSERT INTO `student_write_grade` VALUES ('2', '1', '17', 'C++', '80', '2019-11-02 00:00:00', 'cccccccccccc');
INSERT INTO `student_write_grade` VALUES ('3', '10', '17', 'java', '79', '2019-11-02 00:00:00', 'dddddddd');

-- ----------------------------
-- Table structure for syllabus_info
-- ----------------------------
DROP TABLE IF EXISTS `syllabus_info`;
CREATE TABLE `syllabus_info` (
  `syllabus_id` int(11) NOT NULL AUTO_INCREMENT,
  `syllabus_yi` varchar(50) DEFAULT NULL,
  `syllabus_er` varchar(50) DEFAULT NULL,
  `syllabus_san` varchar(50) DEFAULT NULL,
  `syllabus_si` varchar(50) DEFAULT NULL,
  `syllabus_wu` varchar(50) DEFAULT NULL,
  `syllabus_liu` varchar(50) DEFAULT NULL,
  `syllabus_qi` varchar(50) DEFAULT NULL,
  `is_uesd` varchar(50) DEFAULT NULL COMMENT '是否有效',
  `syllabus_name` varchar(100) DEFAULT NULL COMMENT '课程表名称',
  PRIMARY KEY (`syllabus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syllabus_info
-- ----------------------------
INSERT INTO `syllabus_info` VALUES ('2', '2', '4', '', '5', '3', '1', '', '1', '数学课');
INSERT INTO `syllabus_info` VALUES ('3', '1', '5', '3', '4', '2', '2', '', '1', '语文课');

-- ----------------------------
-- Table structure for template_info
-- ----------------------------
DROP TABLE IF EXISTS `template_info`;
CREATE TABLE `template_info` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_title` varchar(200) DEFAULT NULL,
  `template_content` varchar(2000) DEFAULT NULL,
  `template_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_info
-- ----------------------------
INSERT INTO `template_info` VALUES ('1', '模板1', '模板内容2', '模板类型3');
INSERT INTO `template_info` VALUES ('3', '模板1', '模板内容2', '模板类型3');
INSERT INTO `template_info` VALUES ('4', '模板1', '模板内容2', '模板类型3');

-- ----------------------------
-- Table structure for track_record_info
-- ----------------------------
DROP TABLE IF EXISTS `track_record_info`;
CREATE TABLE `track_record_info` (
  `track_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `track_record_title` varchar(200) DEFAULT NULL,
  `track_record_content` varchar(2000) DEFAULT NULL,
  `track_record_time` datetime DEFAULT NULL,
  `enrollment` int(11) DEFAULT NULL,
  `next_record_time` datetime DEFAULT NULL,
  PRIMARY KEY (`track_record_id`),
  KEY `FK_Reference_9` (`student_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of track_record_info
-- ----------------------------
INSERT INTO `track_record_info` VALUES ('2', '2', 'PHP', 'java', '2019-11-12 10:10:10', '17', '2019-11-12 12:12:12');
INSERT INTO `track_record_info` VALUES ('5', '1', 'java', 'java', '2019-11-12 10:10:10', '18', '2019-11-12 12:12:12');
INSERT INTO `track_record_info` VALUES ('6', '5', 'java', 'java', '2019-11-12 10:10:10', '17', '2019-11-12 12:12:12');
INSERT INTO `track_record_info` VALUES ('7', '7', 'java', 'java', '2019-11-12 10:10:10', '18', '2019-11-12 12:12:12');
INSERT INTO `track_record_info` VALUES ('8', '8', '', 'java', '2019-11-12 10:10:10', null, '2019-11-12 12:12:12');
INSERT INTO `track_record_info` VALUES ('9', '9', '', 'java', '2019-11-12 10:10:10', null, '2019-11-12 12:12:12');
