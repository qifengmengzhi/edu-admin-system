-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edu_manage
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clazz`
--

DROP TABLE IF EXISTS `clazz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clazz` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(30) NOT NULL COMMENT '班级名称',
  `room` varchar(20) DEFAULT NULL COMMENT '班级教室',
  `begin_date` date NOT NULL COMMENT '开课时间',
  `end_date` date NOT NULL COMMENT '结课时间',
  `master_id` int unsigned DEFAULT NULL COMMENT '班主任ID, 关联员工表ID',
  `subject` tinyint unsigned NOT NULL COMMENT '学科, 1:java, 2:前端, 3:大数据, 4:Python, 5:Go, 6: 嵌入式',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clazz`
--

LOCK TABLES `clazz` WRITE;
/*!40000 ALTER TABLE `clazz` DISABLE KEYS */;
INSERT INTO `clazz` VALUES (1,'计科2班','N1311','2025-09-15','2025-12-15',6,5,'2025-12-12 19:29:33','2026-06-06 15:36:14'),(2,'前端就业90期','210','2024-07-10','2024-01-20',3,2,'2024-06-01 17:45:12','2024-06-01 17:45:12'),(3,'JavaEE就业165期','108','2024-06-15','2024-12-25',6,1,'2024-06-01 17:45:40','2024-06-01 17:45:40'),(4,'JavaEE就业166期','107','2024-07-20','2026-02-20',20,1,'2024-06-01 17:46:10','2026-05-08 18:33:44'),(5,'大数据就业58期','209','2026-08-01','2028-02-15',7,3,'2024-06-01 17:51:21','2024-06-01 17:51:21'),(6,'JavaEE就业167期','325','2024-11-20','2024-05-10',36,1,'2024-11-15 11:35:46','2024-12-13 14:31:24'),(7,'计科1班','N1305','2025-09-15','2026-02-02',37,3,'2025-12-12 19:29:33','2025-12-12 21:43:36');
/*!40000 ALTER TABLE `clazz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `name` varchar(10) NOT NULL COMMENT '部门名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'后勤部','2024-11-05 14:49:58','2025-12-05 09:44:07'),(2,'综合部','2023-09-25 09:47:40','2025-12-05 11:09:00'),(3,'咨询部','2025-12-05 10:44:07','2025-12-05 10:44:07'),(4,'教研部','2023-09-25 09:47:40','2025-12-05 11:10:22'),(5,'行政部','2023-11-30 20:56:37','2024-07-30 20:56:37'),(6,'学工部','2025-12-05 10:49:58','2025-12-05 10:49:58');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT '123456' COMMENT '密码',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1:男, 2:女',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `job` tinyint unsigned DEFAULT NULL COMMENT '职位, 1 班主任, 2 讲师 , 3 学工主管, 4 教研主管, 5 咨询师',
  `salary` int unsigned DEFAULT NULL COMMENT '薪资',
  `image` varchar(300) DEFAULT NULL COMMENT '头像',
  `entry_date` date DEFAULT NULL COMMENT '入职日期',
  `dept_id` int unsigned DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1,'qimengdan','$2a$10$1JpYf74cnafBKyAZ0dcAhuDEwv9lmvGK7TCzoEHY6/LjaW/Nh0cI.','戚梦丹',2,'19139696775',5,6666,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/3345452c-1a5f-4e99-beee-465f0149bbba.jpg','2026-05-06',3,'2026-05-28 11:23:16','2026-05-28 14:01:59'),(2,'鱼姐','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','梁静茹',2,'13324772342',5,30000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/cf5ca1d2-9f39-4ee7-8cf0-36778ccfa515.png','2026-05-03',3,'2026-05-29 15:13:27','2026-05-29 15:13:27'),(3,'lujunyi','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','卢俊义',1,'13309090003',2,8900,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2008-05-01',2,'2023-10-20 16:35:33','2026-05-31 13:02:31'),(4,'donghuang','$2a$10$NlkO6WSD9ZZDUineXEkt7OA4B3/.H3LD4YSjexQJsVvOsHdy0M20.','东皇太一',1,'13344456789',4,66666,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/06/3472438b-adc1-4756-9043-2dc03313e51d.jpg','2025-06-01',4,'2026-06-06 15:44:51','2026-06-06 15:44:51'),(5,'gongsunsheng','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','公孙胜',1,'13309090005',2,9500,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2012-12-05',2,'2023-10-20 16:35:33','2023-10-20 16:35:43'),(6,'huosanniang','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','扈三娘',2,'13309090006',3,6500,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2013-09-05',6,'2023-10-20 16:35:33','2026-06-06 15:35:34'),(7,'chaijin','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','柴进',1,'13309090007',1,4700,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2005-08-01',4,'2023-10-20 16:35:33','2026-06-06 15:43:34'),(8,'likui','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','李逵',4,'13309090008',1,4800,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2014-11-09',4,'2023-10-20 16:35:33','2026-06-06 15:45:18'),(9,'wusong','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','武松',1,'13309090009',1,4900,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2011-03-11',1,'2023-10-20 16:35:33','2023-10-20 16:35:51'),(10,'linchong','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','林冲',3,'13309090010',1,5000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2013-09-05',1,'2023-10-20 16:35:33','2023-10-20 16:35:53'),(11,'huyanzhuo','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','呼延灼',1,'13309090011',2,9700,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2007-02-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:55'),(12,'xiaoliguang','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','小李广',1,'13309090012',2,12000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2008-08-18',2,'2023-10-20 16:35:33','2026-05-08 18:32:29'),(13,'yangzhi','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','杨志',5,'13309090013',1,5300,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2012-11-01',1,'2023-10-20 16:35:33','2023-10-20 16:35:59'),(14,'shijin','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','史进',1,'13309090014',2,10600,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2002-08-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:01'),(15,'sunerniang','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','孙二娘',2,'13309090015',2,10900,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2011-05-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:03'),(16,'luzhishen','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','鲁智深',1,'13309090016',2,9600,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2010-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:05'),(17,'liying','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','李应',1,'13309090017',1,5800,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2015-03-21',1,'2023-10-20 16:35:33','2023-10-20 16:36:07'),(18,'shiqian','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','时迁',1,'13309090018',2,10200,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2015-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:09'),(19,'gudasao','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','顾大嫂',2,'13309090019',2,10500,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2008-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:11'),(20,'ruanxiaoer','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','阮小二',1,'13309090020',2,10800,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2018-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:36:13'),(21,'ruanxiaowu','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','阮小五',1,'13309090021',5,5200,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2015-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:15'),(22,'ruanxiaoqi','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','阮小七',1,'13309090022',5,5500,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2016-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:17'),(23,'ruanji','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','阮籍',5,'13309090023',5,5800,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2012-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:19'),(24,'tongwei','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','童威',1,'13309090024',5,5000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2006-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:21'),(25,'tongmeng','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','童猛',2,'13309090025',5,4800,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2002-01-01',3,'2023-10-20 16:35:33','2023-10-20 16:36:23'),(26,'yanshun','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','燕顺',1,'13309090026',5,5400,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2011-01-01',3,'2023-10-20 16:35:33','2023-11-08 22:12:46'),(27,'lijun','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','李俊',3,'13309090027',2,6600,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2004-01-01',2,'2023-10-20 16:35:33','2023-11-16 17:56:59'),(28,'lizhong','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','李忠',1,'13309090028',5,5000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2007-01-01',3,'2023-10-20 16:35:33','2023-11-17 16:34:22'),(29,'apple','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','jack',2,'19999999999',1,30000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2024-12-01',6,'2025-12-10 21:06:16','2025-12-10 21:06:16'),(30,'liyun','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','李云',1,'13309090030',NULL,NULL,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2020-03-01',NULL,'2023-10-20 16:35:33','2023-10-20 16:36:31'),(31,'qirou','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','rr',1,'19139999066',1,10000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2025-12-07',6,'2025-12-10 17:48:33','2025-12-10 17:48:33'),(32,'wlji','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','twj',2,'14123452345',4,20000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2024-12-02',3,'2025-12-10 17:53:38','2025-12-10 17:53:38'),(33,'bbbb','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','qqqqq',1,'12345432111',6,12345,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2022-11-07',5,'2025-12-11 10:48:20','2025-12-11 20:09:25'),(34,'shinaian','$2a$10$/xF0ukBagUkcq.XxIGK7/uA8XM99QObzJqTsGRgdmtI81zljwW.7e','施耐庵',1,'13309090001',4,15000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2000-01-01',4,'2023-10-20 16:35:33','2026-06-06 15:46:00'),(35,'songjiang','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','宋江',1,'13309090002',2,8600,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2015-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:37'),(36,'linghuchong','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','令狐冲',1,'18809091212',2,6800,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2023-10-19',2,'2023-10-20 20:44:54','2023-11-09 09:41:04'),(37,'qifeng','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','qi',2,'19139999666',6,10000,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2025-12-10',5,NULL,NULL),(38,'wuyong','$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm','吴用',1,'13309090004',2,9200,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png','2007-01-01',2,'2023-10-20 16:35:33','2023-10-20 16:35:41'),(39,'admin','$2a$10$ajurTDydKsM/aUegHdN5uOlQmgEKVTGAnA5FgjLH3aJcsnxDQ1wiC','管理员',2,'16688889999',4,66666,'https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/06/26feaea6-a65e-48d5-a294-b80ead02341f.jpg','2026-06-09',4,'2026-06-07 19:45:31','2026-06-07 19:45:31');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_expr`
--

DROP TABLE IF EXISTS `emp_expr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_expr` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID, 主键',
  `emp_id` int unsigned DEFAULT NULL COMMENT '员工ID',
  `begin` date DEFAULT NULL COMMENT '开始时间',
  `end` date DEFAULT NULL COMMENT '结束时间',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `job` varchar(50) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作经历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_expr`
--

LOCK TABLES `emp_expr` WRITE;
/*!40000 ALTER TABLE `emp_expr` DISABLE KEYS */;
INSERT INTO `emp_expr` VALUES (1,NULL,'2023-12-03','2023-12-03','jdong','gcs'),(2,NULL,'2025-12-01','2025-12-01','hyt','jli'),(3,NULL,'2024-01-22','2024-01-22','hyt','gcs'),(4,NULL,'2023-12-03','2024-01-08','pgleu','form'),(10,44,'2015-12-13','2015-12-13','uuu','gcs'),(11,44,'2022-12-11','2023-01-14','cccc','gcs'),(12,45,'2025-05-05','2026-05-30','海云天','运维'),(13,1,'2025-05-20','2026-05-02','海云天','运维'),(14,2,'2024-05-06','2026-05-03','滚石','歌手'),(15,4,'2016-06-13','2026-06-04','王者峡谷','法师');
/*!40000 ALTER TABLE `emp_expr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_log`
--

DROP TABLE IF EXISTS `emp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `info` text COMMENT '详细信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_log`
--

LOCK TABLES `emp_log` WRITE;
/*!40000 ALTER TABLE `emp_log` DISABLE KEYS */;
INSERT INTO `emp_log` VALUES (1,'2026-05-28 11:23:16','Emp(id=45, username=qimengdan, password=null, name=戚梦丹, gender=2, phone=19139696775, job=5, salary=6666, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/3345452c-1a5f-4e99-beee-465f0149bbba.jpg, entryDate=2026-05-06, deptId=3, createTime=2026-05-28T11:23:16.017566900, updateTime=2026-05-28T11:23:16.018590, deptName=null, exprList=[EmpExpr(id=null, empId=45, begin=2025-05-05, end=2026-05-30, company=海云天, job=运维)])'),(2,'2026-05-28 14:02:19','删除id为[Ljava.lang.Integer;@6c9704e0的员工'),(3,'2026-05-28 14:12:58','删除id为[Ljava.lang.Integer;@bb885c3的员工'),(4,'2026-05-29 15:11:26','Emp(id=1000, username=鱼姐, password=null, name=梁静茹, gender=2, phone=13324772342, job=5, salary=30000, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/cf5ca1d2-9f39-4ee7-8cf0-36778ccfa515.png, entryDate=2026-05-03, deptId=3, createTime=2026-05-29T15:11:26.105338, updateTime=2026-05-29T15:11:26.105338, deptName=null, exprList=[])'),(5,'2026-05-29 15:11:39','Emp(id=1001, username=鱼姐, password=null, name=梁静茹, gender=2, phone=13324772342, job=5, salary=30000, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/cf5ca1d2-9f39-4ee7-8cf0-36778ccfa515.png, entryDate=2026-05-03, deptId=3, createTime=2026-05-29T15:11:38.843164100, updateTime=2026-05-29T15:11:38.843164100, deptName=null, exprList=[])'),(6,'2026-05-29 15:13:27','Emp(id=1002, username=鱼姐, password=null, name=梁静茹, gender=2, phone=13324772342, job=5, salary=30000, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/cf5ca1d2-9f39-4ee7-8cf0-36778ccfa515.png, entryDate=2026-05-03, deptId=3, createTime=2026-05-29T15:13:27.007759700, updateTime=2026-05-29T15:13:27.007759700, deptName=null, exprList=[EmpExpr(id=null, empId=1002, begin=2024-05-06, end=2026-05-03, company=滚石, job=歌手)])'),(7,'2026-06-06 15:44:51','Emp(id=1003, username=donghuang, password=$2a$10$WetoV6Q5903EyPHo3DmHpO9OJnJnTCUdt3h0b.sie0h54MBB8wx9O, name=东皇太一, gender=1, phone=13344456789, job=4, salary=66666, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/06/3472438b-adc1-4756-9043-2dc03313e51d.jpg, entryDate=2025-06-01, deptId=4, createTime=2026-06-06T15:44:51.405456, updateTime=2026-06-06T15:44:51.405456, deptName=null, exprList=[EmpExpr(id=null, empId=1003, begin=2016-06-13, end=2026-06-04, company=王者峡谷, job=法师)])'),(8,'2026-06-07 19:45:31','Emp(id=1004, username=admin, password=$2a$10$ajurTDydKsM/aUegHdN5uOlQmgEKVTGAnA5FgjLH3aJcsnxDQ1wiC, name=管理员, gender=2, phone=16688889999, job=4, salary=66666, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/06/26feaea6-a65e-48d5-a294-b80ead02341f.jpg, entryDate=2026-06-09, deptId=4, createTime=2026-06-07T19:45:30.665968, updateTime=2026-06-07T19:45:30.665968, deptName=null, exprList=[])');
/*!40000 ALTER TABLE `emp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operate_log`
--

DROP TABLE IF EXISTS `operate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operate_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operate_emp_id` int unsigned DEFAULT NULL COMMENT '操作人ID',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `class_name` varchar(100) DEFAULT NULL COMMENT '操作的类名',
  `method_name` varchar(100) DEFAULT NULL COMMENT '操作的方法名',
  `method_params` varchar(2000) DEFAULT NULL COMMENT '方法参数',
  `return_value` varchar(2000) DEFAULT NULL COMMENT '返回值',
  `cost_time` bigint unsigned DEFAULT NULL COMMENT '方法执行耗时, 单位:ms',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operate_log`
--

LOCK TABLES `operate_log` WRITE;
/*!40000 ALTER TABLE `operate_log` DISABLE KEYS */;
INSERT INTO `operate_log` VALUES (1,1,'2026-05-08 17:37:44','com.qi.controller.StudentController','save','[Student(id=null, name=云中君, no=2023000001, gender=1, phone=18800008765, idCard=411122200009192313, isCollege=1, address=重庆, degree=4, graduationDate=2027-05-06, clazzId=7, violationCount=null, violationScore=null, createTime=2026-05-08T17:37:44.125594, updateTime=2026-05-08T17:37:44.125594, clazzName=null)]','Result(code=1, msg=操作成功！, data=null)',40),(2,1,'2026-05-08 18:32:29','com.qi.controller.EmpController','update','[Emp(id=12, username=xiaoliguang, password=null, name=小李广, gender=1, phone=13309090012, job=2, salary=12000, image=https://web-framework.oss-cn-hangzhou.aliyuncs.com/2023/1.jpg, entryDate=2008-08-18, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2026-05-08T18:32:28.839177800, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',95),(3,10,'2026-05-08 18:33:44','com.qi.controller.ClazzController','update','[Clazz(id=4, name=JavaEE就业166期, room=107, beginDate=2024-07-20, endDate=2026-02-20, masterId=20, subject=1, createTime=2024-06-01T17:46:10, updateTime=2024-06-01T17:46:10, masterName=null, status=null)]','Result(code=1, msg=操作成功！, data=null)',21),(4,1,'2026-05-28 11:23:16','com.qi.controller.EmpController','insert','[Emp(id=45, username=qimengdan, password=null, name=戚梦丹, gender=2, phone=19139696775, job=5, salary=6666, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/3345452c-1a5f-4e99-beee-465f0149bbba.jpg, entryDate=2026-05-06, deptId=3, createTime=2026-05-28T11:23:16.017566900, updateTime=2026-05-28T11:23:16.018590, deptName=null, exprList=[EmpExpr(id=null, empId=45, begin=2025-05-05, end=2026-05-30, company=海云天, job=运维)])]','Result(code=1, msg=操作成功！, data=null)',167),(5,1,'2026-05-28 14:01:59','com.qi.controller.EmpController','update','[Emp(id=1, username=qimengdan, password=null, name=戚梦丹, gender=2, phone=19139696775, job=5, salary=6666, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/3345452c-1a5f-4e99-beee-465f0149bbba.jpg, entryDate=2026-05-06, deptId=3, createTime=2026-05-28T11:23:16, updateTime=2026-05-28T14:01:58.972294800, deptName=null, exprList=[EmpExpr(id=null, empId=1, begin=2025-05-20, end=2026-05-02, company=海云天, job=运维)])]','Result(code=1, msg=操作成功！, data=null)',29),(6,1,'2026-05-29 15:13:27','com.qi.controller.EmpController','insert','[Emp(id=1002, username=鱼姐, password=null, name=梁静茹, gender=2, phone=13324772342, job=5, salary=30000, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/cf5ca1d2-9f39-4ee7-8cf0-36778ccfa515.png, entryDate=2026-05-03, deptId=3, createTime=2026-05-29T15:13:27.007759700, updateTime=2026-05-29T15:13:27.007759700, deptName=null, exprList=[EmpExpr(id=null, empId=1002, begin=2024-05-06, end=2026-05-03, company=滚石, job=歌手)])]','Result(code=1, msg=操作成功！, data=null)',53),(7,34,'2026-05-31 13:01:49','com.qi.controller.EmpController','update','[Emp(id=3, username=lujunyi, password=null, name=卢俊义, gender=1, phone=13309090003, job=2, salary=8900, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/43ffb511-e86e-480d-93c9-25508ef989aa.jpg, entryDate=2008-05-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2026-05-31T13:01:48.619184100, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',51),(8,34,'2026-05-31 13:02:31','com.qi.controller.EmpController','update','[Emp(id=3, username=lujunyi, password=null, name=卢俊义, gender=1, phone=13309090003, job=2, salary=8900, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2008-05-01, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2026-05-31T13:02:30.674449, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',19),(9,34,'2026-06-06 15:09:33','com.qi.controller.EmpController','update','[Emp(id=6, username=huosanniang, password=null, name=扈三娘, gender=2, phone=13309090006, job=3, salary=6500, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2013-09-05, deptId=2, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:09:33.050312100, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',72),(10,34,'2026-06-06 15:09:48','com.qi.controller.EmpController','update','[Emp(id=8, username=likui, password=null, name=李逵, gender=4, phone=13309090008, job=1, salary=4800, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2014-11-09, deptId=5, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:09:48.150341700, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',13),(11,1,'2026-06-06 15:35:34','com.qi.controller.EmpController','update','[Emp(id=6, username=huosanniang, password=$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm, name=扈三娘, gender=2, phone=13309090006, job=3, salary=6500, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2013-09-05, deptId=6, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:35:33.936521400, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',96),(12,1,'2026-06-06 15:36:15','com.qi.controller.ClazzController','update','[Clazz(id=1, name=计科2班, room=N1311, beginDate=2025-09-15, endDate=2025-12-15, masterId=6, subject=5, createTime=2025-12-12T19:29:33, updateTime=2025-12-12T19:29:33, masterName=null, status=null)]','Result(code=1, msg=操作成功！, data=null)',26),(13,1,'2026-06-06 15:41:39','com.qi.controller.EmpController','update','[Emp(id=7, username=chaijin, password=$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm, name=柴进, gender=1, phone=13309090007, job=1, salary=4700, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2005-08-01, deptId=4, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:41:39.152943700, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',18),(14,1,'2026-06-06 15:43:19','com.qi.controller.EmpController','update','[Emp(id=7, username=chaijin, password=$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm, name=柴进, gender=1, phone=13309090007, job=1, salary=4700, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2005-08-01, deptId=5, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:43:19.111156700, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',15),(15,1,'2026-06-06 15:43:34','com.qi.controller.EmpController','update','[Emp(id=7, username=chaijin, password=$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm, name=柴进, gender=1, phone=13309090007, job=1, salary=4700, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2005-08-01, deptId=4, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:43:33.531035300, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',17),(16,1,'2026-06-06 15:44:51','com.qi.controller.EmpController','insert','[Emp(id=1003, username=donghuang, password=$2a$10$WetoV6Q5903EyPHo3DmHpO9OJnJnTCUdt3h0b.sie0h54MBB8wx9O, name=东皇太一, gender=1, phone=13344456789, job=4, salary=66666, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/06/3472438b-adc1-4756-9043-2dc03313e51d.jpg, entryDate=2025-06-01, deptId=4, createTime=2026-06-06T15:44:51.405456, updateTime=2026-06-06T15:44:51.405456, deptName=null, exprList=[EmpExpr(id=null, empId=1003, begin=2016-06-13, end=2026-06-04, company=王者峡谷, job=法师)])]','Result(code=1, msg=操作成功！, data=null)',210),(17,1,'2026-06-06 15:45:18','com.qi.controller.EmpController','update','[Emp(id=8, username=likui, password=$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm, name=李逵, gender=4, phone=13309090008, job=1, salary=4800, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2014-11-09, deptId=4, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:45:17.667559300, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',17),(18,1,'2026-06-06 15:46:00','com.qi.controller.EmpController','update','[Emp(id=34, username=shinaian, password=$2a$10$xq4zqQge90ip34rSYrEwf.qQB.SGfl33fzF/WKSjAZvAYkCfb5QPm, name=施耐庵, gender=1, phone=13309090001, job=4, salary=15000, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/05/10b5f5a8-c08b-44d3-95df-04eadfda0ecc.png, entryDate=2000-01-01, deptId=4, createTime=2023-10-20T16:35:33, updateTime=2026-06-06T15:46:00.060862400, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',17),(19,34,'2026-06-07 19:45:31','com.qi.controller.EmpController','insert','[Emp(id=1004, username=admin, password=$2a$10$ajurTDydKsM/aUegHdN5uOlQmgEKVTGAnA5FgjLH3aJcsnxDQ1wiC, name=管理员, gender=2, phone=16688889999, job=4, salary=66666, image=https://javaweb-qi.oss-cn-beijing.aliyuncs.com/2026/06/26feaea6-a65e-48d5-a294-b80ead02341f.jpg, entryDate=2026-06-09, deptId=4, createTime=2026-06-07T19:45:30.665968, updateTime=2026-06-07T19:45:30.665968, deptName=null, exprList=[])]','Result(code=1, msg=操作成功！, data=null)',233);
/*!40000 ALTER TABLE `operate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID,主键',
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `no` char(10) NOT NULL COMMENT '学号',
  `gender` tinyint unsigned NOT NULL COMMENT '性别, 1: 男, 2: 女',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `id_card` char(18) NOT NULL COMMENT '身份证号',
  `is_college` tinyint unsigned NOT NULL COMMENT '是否来自于院校, 1:是, 0:否',
  `address` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `degree` tinyint unsigned DEFAULT NULL COMMENT '最高学历, 1:初中, 2:高中, 3:大专, 4:本科, 5:硕士, 6:博士',
  `graduation_date` date DEFAULT NULL COMMENT '毕业时间',
  `clazz_id` int unsigned NOT NULL COMMENT '班级ID, 关联班级表ID',
  `violation_count` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪次数',
  `violation_score` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '违纪扣分',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `id_card` (`id_card`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='学员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (4,'萧远山','2022000004',1,'18800003211','110120000300200004',1,'北京市昌平区建材城西路4号',3,'2024-07-01',1,2,15,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(5,'阿朱','2022000005',2,'18800160002','110120000300200005',1,'北京市昌平区建材城西路5号',4,'2020-07-01',1,1,2,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(6,'阿紫','2022000006',2,'18800000034','110120000300200006',1,'北京市昌平区建材城西路6号',4,'2021-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(8,'康敏','2022000008',2,'18800000077','110120000300200008',1,'北京市昌平区建材城西路8号',5,'2024-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(9,'徐长老','2022000009',1,'18800000341','110120000300200009',1,'北京市昌平区建材城西路9号',3,'2024-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(10,'云中鹤','2022000010',1,'18800006571','110120000300200010',1,'北京市昌平区建材城西路10号',2,'2020-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(11,'钟万仇','2022000011',1,'18800000391','110120000300200011',1,'北京市昌平区建材城西路11号',4,'2021-07-01',1,0,0,'2024-11-14 21:22:19','2024-11-15 16:21:24'),(12,'崔百泉','2022000012',1,'18800000781','110120000300200018',1,'北京市昌平区建材城西路12号',1,'2022-07-05',3,6,17,'2024-11-14 21:22:19','2025-12-12 22:58:56'),(13,'耶律洪基','2022000013',1,'18800008901','110120000300200013',1,'北京市昌平区建材城西路13号',4,'2024-07-01',2,0,0,'2024-11-14 21:22:19','2024-11-15 16:21:21'),(14,'天山童姥','2022000014',2,'18800009201','110120000300200014',1,'北京市昌平区建材城西路14号',4,'2024-07-01',1,0,0,'2024-11-14 21:22:19','2024-11-15 16:21:17'),(15,'刘竹庄','2022000015',1,'18800009401','110120000300200015',1,'北京市昌平区建材城西路15号',3,'2020-07-01',4,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(17,'王语嫣','2022000017',2,'18800007601','110120000300200017',1,'北京市昌平区建材城西路17号',2,'2022-07-01',4,0,0,'2024-11-14 21:22:19','2024-11-14 21:22:19'),(18,'郑成功','2024001101',1,'13309092345','110110110110110110',0,'北京市昌平区回龙观街道88号',5,'2021-07-01',3,2,7,'2024-11-15 16:26:18','2024-11-15 16:40:10'),(19,'qqq','1111111111',2,'19999696700','111122223333444455',1,'cq',6,'2027-09-09',7,0,0,'2025-12-12 21:35:58','2025-12-12 21:58:21'),(20,'云中君','2023000001',1,'18800008765','411122200009192313',1,'重庆',4,'2027-05-06',7,0,0,'2026-05-08 17:37:44','2026-05-08 17:37:44');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-11 11:37:53
