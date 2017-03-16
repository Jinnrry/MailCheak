/*
Navicat MySQL Data Transfer

Source Server         : 测试服务器
Source Server Version : 50546
Source Host           : 122.114.248.27:3306
Source Database       : a0315203818

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2017-03-16 17:15:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for email
-- ----------------------------
DROP TABLE IF EXISTS `email`;
CREATE TABLE `email` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromname` varchar(255) DEFAULT NULL,
  `fromaddress` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for work
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `fromadd` varchar(255) DEFAULT NULL,
  `fromname` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
DROP TRIGGER IF EXISTS `cheakDate`;
DELIMITER ;;
CREATE TRIGGER `cheakDate` AFTER INSERT ON `email` FOR EACH ROW begin
if LOCATE('作业',new.subject)!=0      then
insert into work(id,subject,fromadd,fromname,date,type) values(new.id,new.subject,new.fromaddress,new.fromname,new.date,'作业');
elseif LOCATE('周报',new.subject)!=0 then
insert into work(id,subject,fromadd,fromname,date,type) values(new.id,new.subject,new.fromaddress,new.fromname,new.date,'周报');
end if;
end
;;
DELIMITER ;
