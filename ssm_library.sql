/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.23 : Database - ssm_library
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_library` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm_library`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `adminType` int(11) DEFAULT NULL COMMENT '管理员类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员';

/*Data for the table `admin` */

insert  into `admin`(`id`,`username`,`password`,`adminType`) values (1,'admin','12345',1),(2,'yx5411','12345',0),(4,'xy1221','12345',0),(5,'root','123',1);

/*Table structure for table `book_info` */

DROP TABLE IF EXISTS `book_info`;

CREATE TABLE `book_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) DEFAULT NULL COMMENT '图书名称',
  `author` varchar(30) DEFAULT NULL COMMENT '作者',
  `publish` varchar(30) DEFAULT NULL COMMENT '出版社',
  `isbn` varchar(30) DEFAULT NULL COMMENT '书籍编号',
  `introduction` varchar(50) DEFAULT NULL COMMENT '简介',
  `language` varchar(20) DEFAULT NULL COMMENT '语言',
  `price` double DEFAULT NULL COMMENT '价格',
  `publish_date` date DEFAULT NULL COMMENT '出版时间',
  `type_id` int(11) DEFAULT NULL COMMENT '书籍类型',
  `status` int(11) DEFAULT NULL COMMENT '状态：0未借出，1已借出',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图书信息';

/*Data for the table `book_info` */

insert  into `book_info`(`id`,`name`,`author`,`publish`,`isbn`,`introduction`,`language`,`price`,`publish_date`,`type_id`,`status`) values (1,'西游记','施耐庵','机械工业出版社','100011','师徒四人去西天取真经','中文',42,'2020-03-20',1,0),(2,'三国演义','罗贯中','清华大学出版社','100012','东汉末年分三国。。。','中文',48,'2018-03-30',1,0),(3,'红楼梦','曹雪芹','机械工业出版社','100013','宝玉与众多男女之间故事','中文',39,'2019-04-04',1,0),(4,'资本论','马克思','原子能出版社','100014','马克思的剩余价值理论','英文',42,'2019-04-05',5,0),(5,'经济学原理','马歇尔','机械工业出版社','100015','西方经济学界公认为划时代的著作','英文',45,'2020-04-06',5,0),(6,'大变局下的中国法治','李卫东','北京大学出版社','100016','十大经典法学著作','中文',42,'2015-04-05',4,0),(7,'数据结构与算法','马云','杭州师范大学出版社','100017','讲述数据结构和算法的故事','中文',66,'2021-09-01',7,0),(8,'大学语文','王长华','科学出版社','100018','中国科学院规划教材','中文',40,'2021-04-01',1,0),(9,'概率论与数理统计','肖桂荣','西安交通大学出版社','100019','讲述概率论与数理统计','中文',55,'2020-08-13',6,0),(10,'中国近代史','毛泽东','北京大学出版社','100020','讲述中国近代史','英文',23,'2021-06-24',2,0),(11,'计算机应用基础','孙宇轩','电子科技大学出版社','100021','普及计算机应用基础','英文',66,'2022-04-14',7,0),(12,'弹药工程与爆炸技术','刘龙','陕西大学出版社','100022','讲述弹药爆炸基础','中文',50,'2034-10-11',3,0),(13,'Linux从入门到放弃','王建林','北京大学出版社','100023','Linux从入门到入土','英文',74,'2013-06-23',7,0),(14,'著作权法','黄灵','广东外语外贸大学出版社','100024','与计算机软件保护条例齐用','中文',40,'1955-07-16',4,0),(15,'西方近代史','黄非洪','上海交通大学出版社','100025','讲述西方近代史','英文',30,'2011-07-11',2,0),(16,'毛泽东思想概论','毛泽东','人民邮电出版社','100026','普及毛泽东思想','中文',25,'1844-07-24',1,0),(17,'离散数学基础','王军华','清华大学出版社','100027','讲述离散数学，本书还有实验 教程','中文',36,'2022-02-27',6,0),(18,'计算机网络','蔡许坤','电子科技大学出版社','100028','四大天书之一：计网','中文',50,'1955-07-04',7,0);

/*Table structure for table `lend_list` */

DROP TABLE IF EXISTS `lend_list`;

CREATE TABLE `lend_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bookId` int(11) DEFAULT NULL COMMENT '图书id',
  `readerId` int(11) DEFAULT NULL COMMENT '读者id',
  `lendDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '借书时间',
  `backDate` datetime DEFAULT NULL COMMENT '还书时间',
  `backType` int(11) DEFAULT NULL,
  `exceptRemarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='借阅记录（谁在何时借走了什么书，并且有没有归还，归还时间多少）';

/*Data for the table `lend_list` */

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `topic` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL COMMENT '公告内容',
  `author` varchar(20) DEFAULT NULL COMMENT '发布人',
  `createDate` datetime DEFAULT NULL COMMENT '公告发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';

/*Data for the table `notice` */

insert  into `notice`(`id`,`topic`,`content`,`author`,`createDate`) values (1,'欢迎使用本管理系统','尊敬的管理员，欢迎使用本管理系统。该系统有任何问题请联系管理员',NULL,'2022-05-04 21:02:09');

/*Table structure for table `reader_info` */

DROP TABLE IF EXISTS `reader_info`;

CREATE TABLE `reader_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(5) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `address` varchar(30) DEFAULT NULL COMMENT '籍贯',
  `tel` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(15) DEFAULT NULL COMMENT '邮箱',
  `registerDate` datetime DEFAULT NULL COMMENT '注册日期',
  `readerNumber` varchar(20) DEFAULT NULL COMMENT '读者编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='读者信息（包括登录账号密码等）';

/*Data for the table `reader_info` */

insert  into `reader_info`(`id`,`username`,`password`,`realName`,`sex`,`birthday`,`address`,`tel`,`email`,`registerDate`,`readerNumber`) values (1,'zhangsan','12345','彭于晏','男','2001-04-01','江西南昌','13767134834','yu123@163.com','2021-04-02 13:18:59','8120116041'),(2,'mary','12345','陈恋','女','2004-04-01','湖北武汉','15270839599','yx123@163.com','2021-03-06 07:57:56','8120116044'),(3,'cindy','12345','辛帝','女','2010-04-04','北京海淀','13834141133','zs1314@163.com','2021-04-04 13:36:42','8120116042');

/*Table structure for table `type_info` */

DROP TABLE IF EXISTS `type_info`;

CREATE TABLE `type_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) DEFAULT NULL COMMENT '图书分类名称',
  `remarks` char(30) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图书类型表';

/*Data for the table `type_info` */

insert  into `type_info`(`id`,`name`,`remarks`) values (1,'文学类','陶冶情操'),(2,'历史类','了解历史文化'),(3,'工学类','造火箭'),(4,'法学类','学习法律，打官司'),(5,'经济学类','搞经济'),(6,'统计学类','学习统计，天下无敌'),(7,'计算机类','20岁以下，30年编程经验'),(8,'艺术类','美术，音乐');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
