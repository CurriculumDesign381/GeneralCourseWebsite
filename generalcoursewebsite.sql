/*
Navicat MySQL Data Transfer

Source Server         : demo
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : generalcoursewebsite

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2018-07-14 09:23:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articleinfor
-- ----------------------------
DROP TABLE IF EXISTS `articleinfor`;
CREATE TABLE `articleinfor` (
  `Title` varchar(255) DEFAULT NULL,
  `Anthor` varchar(255) DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `roleID` int(10) DEFAULT NULL,
  `userID` varchar(255) DEFAULT NULL,
  `ColumnID` int(11) DEFAULT NULL,
  `articleContent` varchar(255) DEFAULT NULL,
  `isPass` int(1) NOT NULL DEFAULT '0',
  `isTop` int(1) DEFAULT '0',
  `AnthorInfor` varchar(255) DEFAULT NULL,
  KEY `RoleID2` (`roleID`),
  CONSTRAINT `RoleID2` FOREIGN KEY (`roleID`) REFERENCES `roletype` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articleinfor
-- ----------------------------
INSERT INTO `articleinfor` VALUES ('数据结构', '李四', '2018-07-02 14:56:08', '1', null, '7', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('高级Java', '张三', '2018-07-02 14:57:01', '2', null, '7', 'ddddddddd《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('Jquery', '王五', '2018-07-02 14:58:24', '1', null, '7', 'jQueryjQuery《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('JDBC基础', '黄飞', '2018-07-02 14:59:17', '1', '11603080110', '7', '觉得不错《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('研究项', '胡倩', '2018-07-02 14:59:52', '2', '11603080109', '9', '郁金香郁金香《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('研究成果', '111', '2018-07-02 15:00:31', '2', null, '10', '一举成功《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('课程建设', '杨维海', '2018-07-02 15:01:28', '1', null, '4', 'hhhhhh233333《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('大学英语', '小五', '2018-04-05 15:43:01', '1', null, '7', 'This is English of College《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '1', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');
INSERT INTO `articleinfor` VALUES ('会计信息化', '小三', '2018-07-05 00:11:35', '1', null, '7', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理，掌握管理工作。《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理', '0', '0', '《会计信息化》是会计学和财务管理专业的专业基础课。课程融合了会计学科和计算机学科的相关理论知识与技术手段，形成了贯穿会计信息化基本原理->会计软件开发技术->会计信息系统分析设计与开发四部分的内容体系。本课程要求学生理解会计信息化的基本原理');

-- ----------------------------
-- Table structure for bbs
-- ----------------------------
DROP TABLE IF EXISTS `bbs`;
CREATE TABLE `bbs` (
  `BBSid` int(11) NOT NULL,
  `BBSConten` char(255) NOT NULL,
  `BBSTime` datetime DEFAULT NULL,
  PRIMARY KEY (`BBSid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bbs
-- ----------------------------
INSERT INTO `bbs` VALUES ('1', '222222222222222222222222222222222222222', '2018-07-12 16:17:10');
INSERT INTO `bbs` VALUES ('2', '我很讨厌这个课程', '2018-07-04 15:53:20');
INSERT INTO `bbs` VALUES ('3', '我非常喜欢这个课程', '2018-07-04 15:53:25');
INSERT INTO `bbs` VALUES ('4', '我超级讨厌这个课程', '2018-07-04 15:53:27');
INSERT INTO `bbs` VALUES ('5', '这个课程很符合我的胃口', '2018-07-04 15:53:30');
INSERT INTO `bbs` VALUES ('6', '哈哈哈哈哈哈哈哈哈哈哈', '2018-07-04 15:53:33');
INSERT INTO `bbs` VALUES ('7', '红红火火恍恍惚惚', '2018-07-04 15:53:36');
INSERT INTO `bbs` VALUES ('8', '啊啊啊啊啊啊啊的呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜', '2018-07-04 15:53:39');
INSERT INTO `bbs` VALUES ('9', '131131111111111111111111111111111111111111111111', '2018-07-04 15:53:42');
INSERT INTO `bbs` VALUES ('10', '我就不学数据结构怎么样', '2018-07-02 15:53:51');
INSERT INTO `bbs` VALUES ('11', '你是不是猪啊！这都学不会', '2018-07-02 15:53:54');

-- ----------------------------
-- Table structure for column
-- ----------------------------
DROP TABLE IF EXISTS `column`;
CREATE TABLE `column` (
  `ColumnID` int(11) DEFAULT NULL,
  `ColumnName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of column
-- ----------------------------
INSERT INTO `column` VALUES ('1', '首页');
INSERT INTO `column` VALUES ('2', '课程介绍');
INSERT INTO `column` VALUES ('3', '教学团队');
INSERT INTO `column` VALUES ('4', '课程建设');
INSERT INTO `column` VALUES ('5', '问题与答疑');
INSERT INTO `column` VALUES ('1234', '士大夫');
INSERT INTO `column` VALUES ('1234', '倒萨倒萨');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `operationTypeID` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `TemplateID` int(11) NOT NULL,
  PRIMARY KEY (`TemplateID`,`operationTypeID`),
  KEY `operationTypeID` (`operationTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '码表管理', '1');
INSERT INTO `permission` VALUES ('2', '首页信息设置', '1');
INSERT INTO `permission` VALUES ('3', '默认功能设置', '1');
INSERT INTO `permission` VALUES ('4', '角色管理', '1');
INSERT INTO `permission` VALUES ('5', '人员管理', '1');
INSERT INTO `permission` VALUES ('6', '角色分配', '1');
INSERT INTO `permission` VALUES ('7', '模板管理', '1');
INSERT INTO `permission` VALUES ('8', '权限管理', '1');
INSERT INTO `permission` VALUES ('9', '栏目管理', '2');
INSERT INTO `permission` VALUES ('10', '审核文章', '2');
INSERT INTO `permission` VALUES ('11', '文章管理', '2');
INSERT INTO `permission` VALUES ('12', '留言管理', '2');

-- ----------------------------
-- Table structure for perrole
-- ----------------------------
DROP TABLE IF EXISTS `perrole`;
CREATE TABLE `perrole` (
  `roleID` int(11) NOT NULL,
  `operationTypeID` int(255) NOT NULL,
  PRIMARY KEY (`operationTypeID`,`roleID`),
  KEY `roleID` (`roleID`),
  CONSTRAINT `operationIDType` FOREIGN KEY (`operationTypeID`) REFERENCES `permission` (`operationTypeID`),
  CONSTRAINT `roleID` FOREIGN KEY (`roleID`) REFERENCES `roletype` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perrole
-- ----------------------------
INSERT INTO `perrole` VALUES ('1', '1');
INSERT INTO `perrole` VALUES ('1', '2');
INSERT INTO `perrole` VALUES ('1', '3');
INSERT INTO `perrole` VALUES ('1', '4');
INSERT INTO `perrole` VALUES ('1', '5');
INSERT INTO `perrole` VALUES ('1', '6');
INSERT INTO `perrole` VALUES ('1', '7');
INSERT INTO `perrole` VALUES ('1', '8');
INSERT INTO `perrole` VALUES ('1', '9');
INSERT INTO `perrole` VALUES ('1', '10');
INSERT INTO `perrole` VALUES ('1', '11');
INSERT INTO `perrole` VALUES ('1', '12');
INSERT INTO `perrole` VALUES ('2', '4');
INSERT INTO `perrole` VALUES ('2', '10');
INSERT INTO `perrole` VALUES ('2', '11');
INSERT INTO `perrole` VALUES ('2', '12');
INSERT INTO `perrole` VALUES ('3', '3');
INSERT INTO `perrole` VALUES ('3', '11');

-- ----------------------------
-- Table structure for roletype
-- ----------------------------
DROP TABLE IF EXISTS `roletype`;
CREATE TABLE `roletype` (
  `roleId` int(11) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  KEY `roleId` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roletype
-- ----------------------------
INSERT INTO `roletype` VALUES ('1', '超级管理员');
INSERT INTO `roletype` VALUES ('2', '高级管理员');
INSERT INTO `roletype` VALUES ('3', '普通管理员');
INSERT INTO `roletype` VALUES ('5', '普通管理员');
INSERT INTO `roletype` VALUES ('123', '炒鸡管理员');

-- ----------------------------
-- Table structure for template
-- ----------------------------
DROP TABLE IF EXISTS `template`;
CREATE TABLE `template` (
  `TemplateID` int(11) NOT NULL,
  `TemplateName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template
-- ----------------------------
INSERT INTO `template` VALUES ('1', '系统设置');
INSERT INTO `template` VALUES ('2', '网站内容管理');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` varchar(20) NOT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `roleID` int(11) DEFAULT NULL,
  `telephone` varchar(40) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `Photo` varchar(4) DEFAULT NULL,
  `passWord` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11603080109', '胡倩', '1', null, '女', null, '123');
INSERT INTO `user` VALUES ('11603080110', '黄飞', '1', null, '男', null, '123');
INSERT INTO `user` VALUES ('11603080111', '连瑞哲', '1', null, '男', null, '123');
