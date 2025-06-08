-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl3338746
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl3338746`
--

/*!40000 DROP DATABASE IF EXISTS `cl3338746`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl3338746` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl3338746`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussminsuxinxi`
--

DROP TABLE IF EXISTS `discussminsuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussminsuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708529620607 DEFAULT CHARSET=utf8 COMMENT='民宿信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussminsuxinxi`
--

LOCK TABLES `discussminsuxinxi` WRITE;
/*!40000 ALTER TABLE `discussminsuxinxi` DISABLE KEYS */;
INSERT INTO `discussminsuxinxi` VALUES (1708529620606,'2024-02-21 15:33:39',61,1708529599469,'file/1708529594209.jpg','111','2','');
/*!40000 ALTER TABLE `discussminsuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-02-21 15:26:56','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"网站介绍\",\"menuJump\":\"列表\",\"tableName\":\"systemintro\"},{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common2\",\"menu\":\"系统管理\",\"unicode\":\"&#xeda4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"},{\"appFrontIcon\":\"cuIcon-addressbook\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-common41\",\"menu\":\"管理员管理\",\"unicode\":\"&#xeede;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"民宿类型\",\"menuJump\":\"列表\",\"tableName\":\"minsuleixing\"},{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"民宿信息\",\"menuJump\":\"列表\",\"tableName\":\"minsuxinxi\"}],\"fontClass\":\"icon-common1\",\"menu\":\"民宿信息管理\",\"unicode\":\"&#xeda3;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"menu\":\"民宿预订\",\"menuJump\":\"列表\",\"tableName\":\"minsuyuding\"}],\"fontClass\":\"icon-common27\",\"menu\":\"民宿预订管理\",\"unicode\":\"&#xee2c;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"预订\"],\"menu\":\"民宿信息\",\"menuJump\":\"列表\",\"tableName\":\"minsuxinxi\"}],\"menu\":\"民宿信息管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"查看\",\"支付\"],\"menu\":\"民宿预订\",\"menuJump\":\"列表\",\"tableName\":\"minsuyuding\"}],\"fontClass\":\"icon-common27\",\"menu\":\"民宿预订管理\",\"unicode\":\"&#xee2c;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"查看\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common3\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xeda5;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"预订\"],\"menu\":\"民宿信息\",\"menuJump\":\"列表\",\"tableName\":\"minsuxinxi\"}],\"menu\":\"民宿信息管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minsuleixing`
--

DROP TABLE IF EXISTS `minsuleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minsuleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `minsuleixing` varchar(200) DEFAULT NULL COMMENT '民宿类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='民宿类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minsuleixing`
--

LOCK TABLES `minsuleixing` WRITE;
/*!40000 ALTER TABLE `minsuleixing` DISABLE KEYS */;
INSERT INTO `minsuleixing` VALUES (51,'2024-02-21 15:26:56','民宿类型1'),(52,'2024-02-21 15:26:56','民宿类型2'),(53,'2024-02-21 15:26:56','民宿类型3'),(54,'2024-02-21 15:26:56','民宿类型4'),(55,'2024-02-21 15:26:56','民宿类型5'),(56,'2024-02-21 15:26:56','别墅');
/*!40000 ALTER TABLE `minsuleixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minsuxinxi`
--

DROP TABLE IF EXISTS `minsuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minsuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fangjianmingcheng` varchar(200) NOT NULL COMMENT '房间名称',
  `fangjiantupian` longtext COMMENT '房间图片',
  `fangjianleixing` varchar(200) NOT NULL COMMENT '房间类型',
  `yiwanjiage` double NOT NULL COMMENT '一晚价格',
  `fuwudianhua` varchar(200) DEFAULT NULL COMMENT '服务电话',
  `fangneisheshi` longtext COMMENT '房内设施',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `minsumingcheng` varchar(200) NOT NULL COMMENT '民宿名称',
  `minsudizhi` varchar(200) NOT NULL COMMENT '民宿地址',
  `minsuleixing` varchar(200) DEFAULT NULL COMMENT '民宿类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='民宿信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minsuxinxi`
--

LOCK TABLES `minsuxinxi` WRITE;
/*!40000 ALTER TABLE `minsuxinxi` DISABLE KEYS */;
INSERT INTO `minsuxinxi` VALUES (61,'2024-02-21 15:26:56','房间名称1','file/minsuxinxiFangjiantupian1.jpg,file/minsuxinxiFangjiantupian2.jpg,file/minsuxinxiFangjiantupian3.jpg','单人间',1,'010-21500991','房内设施1',2,'民宿名称1','民宿地址1','民宿类型1'),(62,'2024-02-21 15:26:56','房间名称2','file/minsuxinxiFangjiantupian2.jpg,file/minsuxinxiFangjiantupian3.jpg,file/minsuxinxiFangjiantupian4.jpg','单人间',2,'010-21500992','房内设施2',3,'民宿名称2','民宿地址2','民宿类型2'),(63,'2024-02-21 15:26:56','房间名称3','file/minsuxinxiFangjiantupian3.jpg,file/minsuxinxiFangjiantupian4.jpg,file/minsuxinxiFangjiantupian5.jpg','单人间',3,'010-21500993','房内设施3',3,'民宿名称3','民宿地址3','民宿类型3'),(64,'2024-02-21 15:26:56','房间名称4','file/minsuxinxiFangjiantupian4.jpg,file/minsuxinxiFangjiantupian5.jpg,file/minsuxinxiFangjiantupian6.jpg','单人间',4,'010-21500994','房内设施4',4,'民宿名称4','民宿地址4','民宿类型4'),(65,'2024-02-21 15:26:56','房间名称5','file/minsuxinxiFangjiantupian5.jpg,file/minsuxinxiFangjiantupian6.jpg,file/minsuxinxiFangjiantupian7.jpg','单人间',5,'010-21500995','房内设施5',5,'民宿名称5','民宿地址5','民宿类型5'),(66,'2024-02-21 15:26:56','房间名称6','file/minsuxinxiFangjiantupian6.jpg,file/minsuxinxiFangjiantupian7.jpg,file/minsuxinxiFangjiantupian8.jpg','单人间',6,'010-21500996','<p>房内设施6</p>',6,'民宿名称6','民宿地址6','别墅');
/*!40000 ALTER TABLE `minsuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minsuyuding`
--

DROP TABLE IF EXISTS `minsuyuding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minsuyuding` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fangjianmingcheng` varchar(200) DEFAULT NULL COMMENT '房间名称',
  `fangjianleixing` varchar(200) NOT NULL COMMENT '房间类型',
  `yiwanjiage` double NOT NULL COMMENT '一晚价格',
  `minsumingcheng` varchar(200) NOT NULL COMMENT '民宿名称',
  `minsudizhi` varchar(200) NOT NULL COMMENT '民宿地址',
  `minsuleixing` varchar(200) DEFAULT NULL COMMENT '民宿类型',
  `ruzhuriqi` date NOT NULL COMMENT '入住日期',
  `ruzhutianshu` int(11) NOT NULL COMMENT '入住天数',
  `ruzhujine` double DEFAULT NULL COMMENT '入住金额',
  `yudingshijian` datetime DEFAULT NULL COMMENT '预订时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `sfsh` varchar(200) DEFAULT NULL COMMENT '是否审核',
  `shhf` longtext COMMENT '回复内容',
  `ispay` varchar(200) DEFAULT NULL COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708529636331 DEFAULT CHARSET=utf8 COMMENT='民宿预订';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minsuyuding`
--

LOCK TABLES `minsuyuding` WRITE;
/*!40000 ALTER TABLE `minsuyuding` DISABLE KEYS */;
INSERT INTO `minsuyuding` VALUES (81,'2024-02-21 15:26:56','房间名称1','单人间',1,'民宿名称1','民宿地址1','民宿类型1','2024-02-21',1,1,'2024-02-21 23:26:56','用户账号1','用户姓名1','手机号码1','是','','未支付'),(82,'2024-02-21 15:26:56','房间名称2','单人间',2,'民宿名称2','民宿地址2','民宿类型2','2024-02-21',2,2,'2024-02-21 23:26:56','用户账号2','用户姓名2','手机号码2','是','','未支付'),(83,'2024-02-21 15:26:56','房间名称3','单人间',3,'民宿名称3','民宿地址3','民宿类型3','2024-02-21',3,3,'2024-02-21 23:26:56','用户账号3','用户姓名3','手机号码3','是','','未支付'),(84,'2024-02-21 15:26:56','房间名称4','单人间',4,'民宿名称4','民宿地址4','民宿类型4','2024-02-21',4,4,'2024-02-21 23:26:56','用户账号4','用户姓名4','手机号码4','是','','未支付'),(85,'2024-02-21 15:26:56','房间名称5','单人间',5,'民宿名称5','民宿地址5','民宿类型5','2024-02-21',5,5,'2024-02-21 23:26:56','用户账号5','用户姓名5','手机号码5','是','','未支付'),(86,'2024-02-21 15:26:56','房间名称6','单人间',6,'民宿名称6','民宿地址6','民宿类型6','2024-02-21',6,6,'2024-02-21 23:26:56','用户账号6','用户姓名6','手机号码6','是','','未支付'),(1708529636330,'2024-02-21 15:33:55','房间名称1','单人间',1,'民宿名称1','民宿地址1','民宿类型1','2024-02-21',7,7,'2024-02-21 23:33:45','111','李李','13444444444','是','1','已支付');
/*!40000 ALTER TABLE `minsuyuding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1708529616128 DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
INSERT INTO `storeup` VALUES (1708529384652,'2024-02-21 15:29:44',62,'minsuxinxi','房间名称2','file/minsuxinxiFangjiantupian2.jpg','1',NULL,NULL,1708529369852),(1708529616127,'2024-02-21 15:33:35',61,'minsuxinxi','房间名称1','file/minsuxinxiFangjiantupian1.jpg','1',NULL,NULL,1708529599469);
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemintro`
--

DROP TABLE IF EXISTS `systemintro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemintro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `content` longtext NOT NULL COMMENT '内容',
  `picture1` longtext COMMENT '图片1',
  `picture2` longtext COMMENT '图片2',
  `picture3` longtext COMMENT '图片3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站介绍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemintro`
--

LOCK TABLES `systemintro` WRITE;
/*!40000 ALTER TABLE `systemintro` DISABLE KEYS */;
INSERT INTO `systemintro` VALUES (1,'2024-02-21 15:26:56','网站介绍','WEBSITE INTRODUCTION','我带着比身体重的行李，游入尼罗河底， 经过几道闪电， 看到一堆光圈， 不确定是不是这里，我看到几个人站在一起， 他们拿着剪刀摘走我的行李， 擦拭我的脑袋， 没有机会返回去，直到我听见一个声音， 我确定是你，可你怎记得我，我带来了另界的消息， 可我怎么告知你，注定失忆着相遇，我记得这里是片树林， 后面有个山坡 ，山坡上的枣树每当秋天到来， 我们把枣装满口袋我记得除了朋友我还 ，做过你的叔父 ，你总喜欢跟在我的屁股后面， 只是为了那几个铜钱，我记得我们曾是恋人， 后来战争爆发 ，你上战场后就再也没有回来 ，直到收不到你的信，我们总这样重复分离 ，却要重新开，始 相互送别对方， 说着来世再见， 再次失忆着相聚，呜 呜 呜 呜…快来抱抱 ，快来抱抱我，呜 呜 呜 呜…快来抱抱 快来抱抱我在路上我遇到了一位故去多年的人 她是如此年轻 扎着过肩马尾露出和你一样的笑她和我讲了很多关于你成长的故事 在星空另一端 思念从未停，如同墓碑上的名，不要哭我最亲爱的人 我最好的玩伴 时空是个圆圈 直行或是转弯 我们最终都会相见在城池的某个拐角处， 在夕阳西下时 在万家灯火的某一扇窗纱里，人们失忆着相聚，呜 快来抱抱 ，快来抱抱我，呜 快来抱抱，快来抱抱我，我终于找到你，呜 快来抱抱，快来抱抱我，我终于找到你。','file/systemintroPicture1.jpg','file/systemintroPicture2.jpg','file/systemintroPicture3.jpg');
/*!40000 ALTER TABLE `systemintro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1708529369852,'123','yonghu','用户','3z29uc8qc30wubzkqjhdncnbz1c99ec7','2024-02-21 15:29:40','2024-02-21 16:29:41'),(2,1,'admin','users','管理员','hm9tbhj0v06ufkoi19htr80l37qk1w0b','2024-02-21 15:30:56','2024-02-21 16:35:16'),(3,1708529599469,'111','yonghu','用户','xyjoui69wi9x0dz65j7fqri0d4z36jht','2024-02-21 15:33:30','2024-02-21 16:33:30');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-02-21 15:26:56','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1708529599470 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (41,'2024-02-21 15:26:56','用户账号1','e10adc3949ba59abbe56e057f20f883e','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111'),(42,'2024-02-21 15:26:56','用户账号2','e10adc3949ba59abbe56e057f20f883e','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112'),(43,'2024-02-21 15:26:56','用户账号3','e10adc3949ba59abbe56e057f20f883e','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113'),(44,'2024-02-21 15:26:56','用户账号4','e10adc3949ba59abbe56e057f20f883e','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114'),(45,'2024-02-21 15:26:56','用户账号5','e10adc3949ba59abbe56e057f20f883e','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115'),(46,'2024-02-21 15:26:56','用户账号6','e10adc3949ba59abbe56e057f20f883e','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116'),(1708529599469,'2024-02-21 15:33:19','111','698d51a19d8a121ce581499d7b701668','李李','file/1708529594209.jpg','女','13444444444');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26 21:05:32
