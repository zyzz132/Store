/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.25 : Database - store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `store`;

/*Table structure for table `bill` */

DROP TABLE IF EXISTS `bill`;

CREATE TABLE `bill` (
  `Bill_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `BillComm_Id` int(11) DEFAULT NULL COMMENT '订单商品ID',
  `Bill_address` varchar(255) NOT NULL COMMENT '收货地址',
  `Bill_freight` double(5,2) NOT NULL COMMENT '运费 ',
  `User_Id` int(11) DEFAULT NULL COMMENT '用户ID',
  `Bill_Time` time DEFAULT '00:00:00' COMMENT '订单日期',
  `Bill_number` varchar(20) NOT NULL COMMENT '订单编号',
  `Bill_state` int(2) NOT NULL DEFAULT '1' COMMENT '订单状态',
  `Bill_type` int(2) NOT NULL DEFAULT '1' COMMENT '订单类型',
  `Recipients` varchar(20) NOT NULL COMMENT '收件人姓名',
  `phne` varchar(20) NOT NULL COMMENT '收件人电话',
  `postcode` varchar(10) DEFAULT '000000' COMMENT '邮政编码',
  PRIMARY KEY (`Bill_Id`),
  KEY `FK_bill` (`BillComm_Id`),
  CONSTRAINT `FK_bill` FOREIGN KEY (`BillComm_Id`) REFERENCES `bill_commodity` (`BillComm_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bill` */

/*Table structure for table `bill_commodity` */

DROP TABLE IF EXISTS `bill_commodity`;

CREATE TABLE `bill_commodity` (
  `BillComm_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品ID',
  `CommType_Id` int(11) DEFAULT NULL COMMENT '商品型号ID',
  `Count` int(11) NOT NULL COMMENT '数量',
  `Price` double(5,2) DEFAULT '0.00' COMMENT '金额',
  PRIMARY KEY (`BillComm_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `bill_commodity` */

/*Table structure for table `bill_state` */

DROP TABLE IF EXISTS `bill_state`;

CREATE TABLE `bill_state` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '状态id',
  `name` varchar(50) NOT NULL COMMENT '状态名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `bill_state` */

insert  into `bill_state`(`id`,`name`) values (1,'待发货'),(2,'已发货'),(3,'已完成'),(4,'退货中'),(5,'已关闭');

/*Table structure for table `bill_type` */

DROP TABLE IF EXISTS `bill_type`;

CREATE TABLE `bill_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `bill_type` */

insert  into `bill_type`(`id`,`name`) values (1,'普通订单'),(2,'秒杀活动');

/*Table structure for table `brand` */

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(40) NOT NULL COMMENT '品牌名称',
  `brand_letter` varchar(2) DEFAULT NULL COMMENT '品牌字母',
  `brand_logoID` int(11) NOT NULL COMMENT '品牌LOGO_ID',
  `brand_bigImageID` int(11) DEFAULT NULL COMMENT '品牌专区大图ID',
  `brand_story` text COMMENT '品牌故事',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `isShow` int(1) DEFAULT '0' COMMENT '是否显示',
  `brand_manufacturer` int(1) DEFAULT NULL COMMENT '品牌制造商',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='品牌表';

/*Data for the table `brand` */

insert  into `brand`(`id`,`brand_name`,`brand_letter`,`brand_logoID`,`brand_bigImageID`,`brand_story`,`sort`,`isShow`,`brand_manufacturer`) values (1,'苹果','p',0,NULL,NULL,0,0,NULL),(2,'华为','h',1,2,'歌手',0,1,1),(3,'234235','s',37,38,'213',0,1,1);

/*Table structure for table `brand_images` */

DROP TABLE IF EXISTS `brand_images`;

CREATE TABLE `brand_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `image_path` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`image_path`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `brand_images` */

insert  into `brand_images`(`id`,`type`,`image_path`) values (4,1,'asdsas33d'),(5,0,'650292913.png'),(6,0,'973079698.png'),(7,0,'956473572.png'),(8,0,'216074673.png'),(9,0,'754664842.png'),(10,0,'792379689.png'),(11,0,'242527949.png'),(12,0,'77697961.png'),(13,0,'671860200.png'),(14,0,'180497649.png'),(15,1,'191088680.png'),(16,0,'130939160.png'),(17,0,'633168933.png'),(18,1,'595891830.png'),(19,1,'221930979.png'),(20,0,'83207611.png'),(21,0,'759019641.png'),(22,0,'458176487.png'),(23,1,'348041961.png'),(24,0,'902644669.png'),(25,1,'596939217.png'),(26,0,'99968091.png'),(27,1,'60138409.png'),(28,0,'412612130.png'),(29,1,'821191021.png'),(30,1,'976052449.png'),(31,1,'892709789.png'),(32,1,'785775363.png'),(33,1,'360702715.png'),(34,1,'569951524.png'),(35,0,'221864699.png'),(36,1,'561215906.png'),(37,0,'509304024.png'),(38,1,'278308162.png');

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `Collect_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号ID',
  `User_Id` int(11) DEFAULT NULL COMMENT '用户ID',
  `Commodity_Id` int(11) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`Collect_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `collect` */

/*Table structure for table `commclass` */

DROP TABLE IF EXISTS `commclass`;

CREATE TABLE `commclass` (
  `CommClass_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `parentClass` int(11) DEFAULT '0' COMMENT '上级分类id',
  `CommClass_Name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `isShow` int(11) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `isNavShow` int(11) NOT NULL DEFAULT '0' COMMENT '是否在导航显示',
  `keyWord` varchar(20) DEFAULT NULL COMMENT '关键词',
  `ClassDescribe` varchar(50) DEFAULT NULL COMMENT '分类描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`CommClass_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `commclass` */

insert  into `commclass`(`CommClass_Id`,`parentClass`,`CommClass_Name`,`isShow`,`isNavShow`,`keyWord`,`ClassDescribe`,`sort`) values (4,1,'裤子',1,0,'短裤','短裤',0),(11,0,'adsd ',1,1,'','',0);

/*Table structure for table `commodity` */

DROP TABLE IF EXISTS `commodity`;

CREATE TABLE `commodity` (
  `Commodity_Id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `Commodity_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `CommClass_Id` int(11) DEFAULT NULL COMMENT '商品分类',
  `Time` datetime DEFAULT NULL COMMENT '商品日期',
  `subname` varchar(50) DEFAULT NULL COMMENT '副标题',
  `unit` varchar(20) DEFAULT '件' COMMENT '计量单位',
  `brand_id` int(11) NOT NULL COMMENT '商品品牌',
  `Commodity_No` varchar(40) DEFAULT NULL COMMENT '商品货号',
  `warehousing` int(5) DEFAULT '0' COMMENT '存库',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `selling_price` double(6,2) NOT NULL DEFAULT '0.00' COMMENT '商品售价',
  `market_price` double(6,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `weight` varchar(10) DEFAULT NULL COMMENT '重量',
  `Commodity_introduce` text COMMENT '商品介绍',
  PRIMARY KEY (`Commodity_Id`),
  UNIQUE KEY `NewIndex1` (`Commodity_No`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `commodity` */

insert  into `commodity`(`Commodity_Id`,`Commodity_name`,`CommClass_Id`,`Time`,`subname`,`unit`,`brand_id`,`Commodity_No`,`warehousing`,`sort`,`selling_price`,`market_price`,`weight`,`Commodity_introduce`) values (0000000001,'小米MIX2',NULL,'2020-08-31 00:00:00',NULL,'件',0,NULL,0,0,0.00,0.00,NULL,NULL),(0000000002,'苹果5s',1,'2020-08-31 21:02:47','ipaid','件',0,'xx0516512',100,0,2500.00,3000.00,'10.3g','苹果5s介绍'),(0000000003,'小米9pro',11,'2020-08-31 21:47:41','小米9pro','件',11,'小米9pro',11,0,111.00,1111.00,NULL,'小米9pro小米9pro'),(0000000004,'',0,'2020-09-01 22:59:54','','件',0,'',0,0,0.00,0.00,NULL,''),(0000000005,'asd sad',11,'2020-09-02 13:27:50','asd sad ','件',11,'asdsad sa',0,0,0.00,0.00,NULL,'asd asd');

/*Table structure for table `commodity_evaluate` */

DROP TABLE IF EXISTS `commodity_evaluate`;

CREATE TABLE `commodity_evaluate` (
  `Score_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `Commodity_Id` int(11) NOT NULL COMMENT '商品iD',
  `CommType_Id` int(11) NOT NULL COMMENT '商品型号id',
  `evaluate` varchar(255) NOT NULL COMMENT '评价内容详细',
  PRIMARY KEY (`Score_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `commodity_evaluate` */

/*Table structure for table `commodity_image` */

DROP TABLE IF EXISTS `commodity_image`;

CREATE TABLE `commodity_image` (
  `CommImage_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品展示图ID',
  `Commodity_Id` int(11) DEFAULT NULL COMMENT '商品id   ',
  `CommImage_Url` varchar(255) DEFAULT NULL COMMENT '图片地址 ',
  PRIMARY KEY (`CommImage_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `commodity_image` */

/*Table structure for table `commodity_type` */

DROP TABLE IF EXISTS `commodity_type`;

CREATE TABLE `commodity_type` (
  `CommType_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品型号id',
  `Commodity_Id` int(11) DEFAULT NULL COMMENT '商品ID',
  `CommType_Name` varchar(50) NOT NULL COMMENT '商品型号名称',
  `CommType_Price` double(5,2) DEFAULT '0.00' COMMENT '商品型号价格',
  `CommType_Count` int(11) DEFAULT '0' COMMENT '商品存货',
  PRIMARY KEY (`CommType_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `commodity_type` */

/*Table structure for table `commtype_cover` */

DROP TABLE IF EXISTS `commtype_cover`;

CREATE TABLE `commtype_cover` (
  `cover_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品型号的封面ID',
  `CommType_Id` int(11) DEFAULT NULL COMMENT '商品型号id',
  `cover_Url` varchar(255) NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`cover_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `commtype_cover` */

/*Table structure for table `seckill` */

DROP TABLE IF EXISTS `seckill`;

CREATE TABLE `seckill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(40) NOT NULL COMMENT '秒杀活动名称',
  `OpenData` date NOT NULL COMMENT '开始日期',
  `StopData` date NOT NULL COMMENT '结束日期',
  `isopen` int(1) NOT NULL COMMENT '是否启动(1=开启 0=关闭)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seckill` */

/*Table structure for table `seckill_commodity` */

DROP TABLE IF EXISTS `seckill_commodity`;

CREATE TABLE `seckill_commodity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `seckill_Time_id` int(11) DEFAULT NULL COMMENT '秒杀时间id  FK',
  `commodity_id` int(11) NOT NULL COMMENT '商品id     FK',
  `seckill_Price` double(6,2) DEFAULT NULL COMMENT '秒杀价格',
  `seckill_Count` int(11) DEFAULT NULL COMMENT '秒杀数量',
  `xg_Count` int(11) DEFAULT NULL COMMENT '限购数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seckill_commodity` */

/*Table structure for table `seckill_time` */

DROP TABLE IF EXISTS `seckill_time`;

CREATE TABLE `seckill_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Nmae` varchar(40) NOT NULL COMMENT '时间段名称',
  `OpenTime` time NOT NULL COMMENT '开始时间',
  `SoptTime` time NOT NULL COMMENT '结束时间',
  `isOpen` int(1) DEFAULT '0' COMMENT '是否启动（1：0）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `seckill_time` */

/*Table structure for table `sendaddress` */

DROP TABLE IF EXISTS `sendaddress`;

CREATE TABLE `sendaddress` (
  `Address_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `User_Id` int(11) DEFAULT NULL COMMENT '用户ID',
  `Address` varchar(255) NOT NULL COMMENT '详细地址',
  PRIMARY KEY (`Address_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sendaddress` */

/*Table structure for table `shopv` */

DROP TABLE IF EXISTS `shopv`;

CREATE TABLE `shopv` (
  `ShopV_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车序号id',
  `User_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `CommType_id` int(11) DEFAULT NULL COMMENT '商品型号ID',
  `Count` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`ShopV_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shopv` */

/*Table structure for table `user_type` */

DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `user_type` (
  `User_typeID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户类型ID',
  `typeName` varchar(20) DEFAULT '普通会员' COMMENT '用户类型名称',
  PRIMARY KEY (`User_typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_type` */

insert  into `user_type`(`User_typeID`,`typeName`) values (1,'普通会员'),(2,'高级会员'),(3,'管理员');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `User_Name` varchar(50) NOT NULL COMMENT '用户名称',
  `PassWord` varchar(50) NOT NULL COMMENT '用户登录密码',
  `phone` varchar(50) NOT NULL COMMENT '手机号',
  `Email` varchar(50) NOT NULL COMMENT '邮箱',
  `User_typeID` int(11) NOT NULL DEFAULT '1' COMMENT '用户类型ID',
  `DateTime` datetime DEFAULT NULL COMMENT '注册日期',
  `UserWealth` int(11) DEFAULT NULL COMMENT '用户财富表ID',
  `newDateTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `Account_number` varchar(50) DEFAULT NULL COMMENT '用户账号',
  PRIMARY KEY (`User_Id`),
  UNIQUE KEY `wy` (`phone`,`Email`,`Account_number`),
  KEY `FK_users` (`UserWealth`),
  CONSTRAINT `FK_users` FOREIGN KEY (`UserWealth`) REFERENCES `userwealth` (`UserWealth_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `users` */

insert  into `users`(`User_Id`,`User_Name`,`PassWord`,`phone`,`Email`,`User_typeID`,`DateTime`,`UserWealth`,`newDateTime`,`Account_number`) values (94,'管理爸爸','1234','1','admin@qq.com',3,'2020-08-21 00:00:00',1,'2020-08-22 21:27:45','zyzz'),(95,'zyzz2','1','1','1',1,'2020-08-30 22:27:30',1,'2020-08-30 22:27:30','zyzz2'),(96,'zyzz3','21','2','2',1,NULL,NULL,NULL,'zyzz23'),(99,'zyzz233','qq','1365465423323','4214214234@qq.com',1,'2020-08-30 23:10:58',NULL,'2020-08-30 23:10:58','zyzz233');

/*Table structure for table `userwealth` */

DROP TABLE IF EXISTS `userwealth`;

CREATE TABLE `userwealth` (
  `UserWealth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户财富ID',
  `User_Id` int(11) NOT NULL COMMENT '用户id ',
  `Money` double(5,2) DEFAULT '0.00' COMMENT '余额',
  `Score` int(11) DEFAULT '0' COMMENT '积分',
  `PayPwd` varchar(50) DEFAULT NULL COMMENT '支付密码',
  PRIMARY KEY (`UserWealth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `userwealth` */

insert  into `userwealth`(`UserWealth_id`,`User_Id`,`Money`,`Score`,`PayPwd`) values (1,2,NULL,NULL,'1234');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
