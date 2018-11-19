/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.23-log : Database - jumei
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jumei` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jumei`;

/*Table structure for table `eop_app` */

DROP TABLE IF EXISTS `eop_app`;

CREATE TABLE `eop_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `app_name` varchar(50) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `descript` longtext,
  `deployment` int(11) DEFAULT '1',
  `path` varchar(255) DEFAULT NULL,
  `authorizationcode` varchar(50) DEFAULT NULL,
  `installuri` varchar(255) DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `eop_app` */

insert  into `eop_app`(`id`,`appid`,`app_name`,`author`,`descript`,`deployment`,`path`,`authorizationcode`,`installuri`,`deleteflag`,`version`) values (1,'base','base应用',NULL,'base应用',0,'/core',NULL,NULL,0,'2.2.0'),(2,'cms','cms应用',NULL,'cms应用',0,'/cms',NULL,NULL,0,'2.2.0'),(3,'shop','shop应用',NULL,'shop应用',0,'/shop',NULL,NULL,0,'2.2.0');

/*Table structure for table `es_access` */

DROP TABLE IF EXISTS `es_access`;

CREATE TABLE `es_access` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `access_time` int(11) DEFAULT NULL,
  `stay_time` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  `membername` varchar(255) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_access` */

/*Table structure for table `es_account_log` */

DROP TABLE IF EXISTS `es_account_log`;

CREATE TABLE `es_account_log` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) DEFAULT NULL,
  `user_money` decimal(20,2) DEFAULT NULL,
  `frozen_money` decimal(20,2) DEFAULT NULL,
  `rank_points` int(9) DEFAULT NULL,
  `pay_points` decimal(20,2) DEFAULT NULL,
  `friend_points` decimal(20,2) DEFAULT NULL,
  `change_time` bigint(20) DEFAULT NULL,
  `change_desc` varchar(512) DEFAULT NULL,
  `change_type` int(8) DEFAULT NULL,
  `frozen_friend_points` int(10) DEFAULT NULL,
  `add_credit_account_money` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `ind_account_log` (`user_id`,`change_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_account_log` */

/*Table structure for table `es_activity` */

DROP TABLE IF EXISTS `es_activity`;

CREATE TABLE `es_activity` (
  `activity_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) DEFAULT NULL,
  `start_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `description` longtext,
  `range_type` smallint(1) DEFAULT NULL,
  `activity_type` smallint(1) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_activity` */

/*Table structure for table `es_activity_detail` */

DROP TABLE IF EXISTS `es_activity_detail`;

CREATE TABLE `es_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `full_money` decimal(20,2) DEFAULT NULL,
  `minus_value` decimal(20,2) DEFAULT NULL,
  `point_value` int(10) DEFAULT NULL,
  `is_full_minus` smallint(1) DEFAULT '0',
  `is_free_ship` smallint(1) DEFAULT '0',
  `is_send_point` smallint(1) DEFAULT '0',
  `is_send_gift` smallint(1) DEFAULT '0',
  `is_send_bonus` smallint(1) DEFAULT '0',
  `gift_id` int(10) DEFAULT NULL,
  `bonus_id` int(10) DEFAULT NULL,
  `is_discount` smallint(1) DEFAULT '0',
  `discount_value` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_activity_detail` */

/*Table structure for table `es_activity_gift` */

DROP TABLE IF EXISTS `es_activity_gift`;

CREATE TABLE `es_activity_gift` (
  `gift_id` int(10) NOT NULL AUTO_INCREMENT,
  `gift_name` varchar(255) DEFAULT NULL,
  `gift_price` decimal(20,2) DEFAULT NULL,
  `gift_img` varchar(255) DEFAULT NULL,
  `gift_type` smallint(1) DEFAULT NULL,
  `actual_store` int(10) DEFAULT NULL,
  `enable_store` int(10) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_activity_gift` */

/*Table structure for table `es_activity_goods` */

DROP TABLE IF EXISTS `es_activity_goods`;

CREATE TABLE `es_activity_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_activity_goods` */

/*Table structure for table `es_adcolumn` */

DROP TABLE IF EXISTS `es_adcolumn`;

CREATE TABLE `es_adcolumn` (
  `acid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `width` varchar(50) DEFAULT NULL,
  `height` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `anumber` bigint(20) DEFAULT NULL,
  `atype` int(11) DEFAULT NULL,
  `arule` bigint(20) DEFAULT NULL,
  `disabled` varchar(5) DEFAULT 'false',
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `es_adcolumn` */

insert  into `es_adcolumn`(`acid`,`cname`,`width`,`height`,`description`,`anumber`,`atype`,`arule`,`disabled`) values (1,'首页最上方广告','765px','296px',NULL,NULL,0,NULL,'false'),(2,'热卖排行右侧大幅广告','765px','194px',NULL,NULL,0,NULL,'false'),(3,'整幅长广告分类一','976px','135px',NULL,NULL,0,NULL,'false'),(4,'整幅长广告分类二','976px','135px',NULL,NULL,0,NULL,'false'),(5,'列表页上部横幅','972px','67px',NULL,NULL,0,NULL,'false'),(6,'jingdong(old)首页slider','766','120',NULL,NULL,0,NULL,'false'),(7,'moonbasajquery','670','441',NULL,NULL,0,NULL,'false'),(8,'首页主广告下方广告','246px','158px',NULL,NULL,0,NULL,'false'),(9,'一楼美食广告','350','420',NULL,NULL,0,NULL,'false'),(10,'二楼美容美妆','350','420',NULL,NULL,0,NULL,'false'),(11,'三楼箱包','350','420',NULL,NULL,0,NULL,'false'),(12,'首页顶部横幅','1920','480',NULL,NULL,0,NULL,'false'),(13,'4楼服装鞋帽','350','420',NULL,NULL,0,NULL,'false');

/*Table structure for table `es_admin_logs` */

DROP TABLE IF EXISTS `es_admin_logs`;

CREATE TABLE `es_admin_logs` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(50) DEFAULT NULL,
  `operator_name` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `log_detail` varchar(255) DEFAULT NULL,
  `log_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `es_admin_logs` */

insert  into `es_admin_logs`(`log_id`,`log_type`,`operator_name`,`operator_id`,`log_detail`,`log_time`) values (1,'setting','admin',1,'更新所有系统设置',1542620649),(2,'setting','admin',1,'更新所有系统设置',1542620708),(3,'setting','admin',1,'更新所有系统设置',1542620762),(4,'setting','admin',1,'更新所有系统设置',1542620787);

/*Table structure for table `es_admintheme` */

DROP TABLE IF EXISTS `es_admintheme`;

CREATE TABLE `es_admintheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  `themename` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `framemode` int(6) DEFAULT '0',
  `deleteflag` int(6) DEFAULT '0',
  `thumb` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `es_admintheme` */

insert  into `es_admintheme`(`id`,`appid`,`siteid`,`themename`,`path`,`userid`,`author`,`version`,`framemode`,`deleteflag`,`thumb`) values (1,NULL,NULL,'新模板','version3',NULL,NULL,NULL,0,0,'preview.png');

/*Table structure for table `es_adminuser` */

DROP TABLE IF EXISTS `es_adminuser`;

CREATE TABLE `es_adminuser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` int(6) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `userno` varchar(255) DEFAULT NULL,
  `userdept` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  `founder` int(8) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `es_adminuser` */

insert  into `es_adminuser`(`userid`,`username`,`password`,`state`,`realname`,`userno`,`userdept`,`remark`,`dateline`,`founder`,`siteid`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'chanpin','e10adc3949ba59abbe56e057f20f883e',1,NULL,NULL,NULL,NULL,NULL,0,NULL),(3,'kuguan','e10adc3949ba59abbe56e057f20f883e',1,NULL,NULL,NULL,NULL,NULL,0,NULL),(4,'caiwu','e10adc3949ba59abbe56e057f20f883e',1,NULL,NULL,NULL,NULL,NULL,0,NULL),(5,'kefu','e10adc3949ba59abbe56e057f20f883e',1,NULL,NULL,NULL,NULL,NULL,0,NULL);

/*Table structure for table `es_adv` */

DROP TABLE IF EXISTS `es_adv`;

CREATE TABLE `es_adv` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `acid` bigint(20) DEFAULT NULL,
  `atype` int(11) DEFAULT NULL,
  `begintime` bigint(20) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `isclose` int(11) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `atturl` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `aname` varchar(255) DEFAULT NULL,
  `clickcount` int(11) DEFAULT '0',
  `linkman` varchar(50) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `disabled` varchar(5) DEFAULT 'false',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `es_adv` */

insert  into `es_adv`(`aid`,`acid`,`atype`,`begintime`,`endtime`,`isclose`,`attachment`,`atturl`,`url`,`aname`,`clickcount`,`linkman`,`company`,`contact`,`disabled`) values (1,1,NULL,1328025600000,1614182400000,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/1.jpg','/search-cat-35.html','潮人双肩包69元起',0,'','','','false'),(2,1,NULL,1328025600000,1613750400000,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/2.jpg','/search-cat-86.html','男士POLO衫特价68元',0,'','','','false'),(3,1,NULL,1328025600000,1582041600000,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/3.jpg','/search-cat-87.html','真空压缩袋节省空间67%',0,'','','','false'),(4,1,NULL,1328025600000,1613059200000,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/4.jpg','/search-cat-86.html','早春运动针织长裤69元起',1,'','','','false'),(22,9,NULL,1420041600,1420041600,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/201512091708414759.jpg','index.html','1楼美食、饮料广告',0,'','','','false'),(23,10,NULL,1448208000,1574956800,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/201511240215017846.jpg','','2楼美容美妆',0,'','','','false'),(24,11,NULL,1420041600,1420041600,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/201512091709250332.jpg','','3楼箱包',1,'','','','false'),(25,12,NULL,1448208000,1606665600,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/201511241013053556.jpg','','横幅1',0,'','','','false'),(26,12,NULL,1448208000,1511971200,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/201511240946126585.jpg','','横幅2',0,'','','','false'),(27,13,NULL,1420041600,1420041600,0,NULL,'http://static.v5.javamall.com.cn/attachment/adv/201512091709403758.jpg','','4楼',0,'','','','false');

/*Table structure for table `es_advance_logs` */

DROP TABLE IF EXISTS `es_advance_logs`;

CREATE TABLE `es_advance_logs` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL,
  `money` decimal(20,2) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `mtime` bigint(20) NOT NULL,
  `payment_id` varchar(20) DEFAULT NULL,
  `order_id` varchar(20) DEFAULT NULL,
  `paymethod` varchar(100) DEFAULT NULL,
  `memo` varchar(100) DEFAULT NULL,
  `import_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `explode_money` decimal(20,2) NOT NULL DEFAULT '0.00',
  `member_advance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `shop_advance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_advance_logs` */

/*Table structure for table `es_agent` */

DROP TABLE IF EXISTS `es_agent`;

CREATE TABLE `es_agent` (
  `agentid` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `sex` int(6) DEFAULT '0',
  `zip` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `ww` varchar(50) DEFAULT NULL,
  `msn` varchar(50) DEFAULT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `bank_account` varchar(50) DEFAULT NULL,
  `bank_username` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_city` varchar(50) DEFAULT NULL,
  `shop_url` varchar(50) DEFAULT NULL,
  `state` int(6) DEFAULT '0',
  `dateline` int(10) DEFAULT NULL,
  PRIMARY KEY (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_agent` */

/*Table structure for table `es_agent_transfer` */

DROP TABLE IF EXISTS `es_agent_transfer`;

CREATE TABLE `es_agent_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `memberid` int(10) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `is_transfer` int(8) DEFAULT NULL,
  `blank_account` varchar(50) DEFAULT NULL,
  `blank_username` varchar(50) DEFAULT NULL,
  `blank_name` varchar(50) DEFAULT NULL,
  `blank_city` varchar(50) DEFAULT NULL,
  `apply_time` int(11) DEFAULT NULL,
  `transfer_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_agent_transfer` */

/*Table structure for table `es_allocation_item` */

DROP TABLE IF EXISTS `es_allocation_item`;

CREATE TABLE `es_allocation_item` (
  `allocationid` int(10) NOT NULL AUTO_INCREMENT,
  `itemid` int(10) DEFAULT NULL,
  `orderid` int(10) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `productid` int(10) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  `other` longtext,
  `iscmpl` int(8) DEFAULT '0',
  PRIMARY KEY (`allocationid`),
  KEY `es_allocation_item` (`orderid`,`itemid`,`depotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_allocation_item` */

/*Table structure for table `es_article` */

DROP TABLE IF EXISTS `es_article`;

CREATE TABLE `es_article` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_article` */

/*Table structure for table `es_article_cat` */

DROP TABLE IF EXISTS `es_article_cat`;

CREATE TABLE `es_article_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(200) DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_article_cat` */

/*Table structure for table `es_auth_action` */

DROP TABLE IF EXISTS `es_auth_action`;

CREATE TABLE `es_auth_action` (
  `actid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `objvalue` longtext,
  `choose` int(11) DEFAULT NULL,
  PRIMARY KEY (`actid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `es_auth_action` */

insert  into `es_auth_action`(`actid`,`name`,`type`,`objvalue`,`choose`) values (1,'超级管理员','menu','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,127,128,129,31,32,33,34,35,36,37,38,39,40,41,42,43,44,133,134,45,46,47,48,49,50,51,52,130,131,132,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,135,136,137,138,139,140,141,142',1),(2,'商品管理权限','menu','1,2,3,4,5,6,7,8,9,10,11,12,13,14',1),(3,'订单管理权限','menu','15,16,17,18,19,20,21,22,23,24,25',1),(4,'库管权限','menu','1,2,3,5,6,15,16,19,23',1),(5,'财务权限','menu','2,17,18,19',1),(6,'客服权限','menu','1,13,14,16,17,28,29,30,31,32,33,34',1);

/*Table structure for table `es_bonus_goods` */

DROP TABLE IF EXISTS `es_bonus_goods`;

CREATE TABLE `es_bonus_goods` (
  `rel_id` int(10) NOT NULL AUTO_INCREMENT,
  `bonus_type_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_bonus_goods` */

/*Table structure for table `es_bonus_type` */

DROP TABLE IF EXISTS `es_bonus_type`;

CREATE TABLE `es_bonus_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) DEFAULT NULL,
  `type_money` decimal(10,2) DEFAULT NULL,
  `send_type` int(8) DEFAULT NULL,
  `min_amount` decimal(10,2) DEFAULT NULL,
  `max_amount` decimal(10,2) DEFAULT NULL,
  `send_start_date` int(11) DEFAULT NULL,
  `send_end_date` int(11) DEFAULT NULL,
  `use_start_date` int(11) DEFAULT NULL,
  `use_end_date` int(11) DEFAULT NULL,
  `min_goods_amount` decimal(10,2) DEFAULT NULL,
  `recognition` varchar(20) DEFAULT NULL,
  `create_num` int(10) DEFAULT NULL,
  `use_num` int(10) DEFAULT '0',
  `received_num` int(10) DEFAULT '0',
  `belong` int(10) DEFAULT '0',
  `can_be_edit` smallint(1) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_bonus_type` */

/*Table structure for table `es_brand` */

DROP TABLE IF EXISTS `es_brand`;

CREATE TABLE `es_brand` (
  `brand_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `keywords` longtext,
  `brief` longtext,
  `url` varchar(255) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT '0',
  PRIMARY KEY (`brand_id`),
  KEY `ind_brand` (`disabled`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

/*Data for the table `es_brand` */

insert  into `es_brand`(`brand_id`,`name`,`logo`,`keywords`,`brief`,`url`,`disabled`,`ordernum`) values (1,'旺旺','http://static.v4.javamall.com.cn/attachment/brand/201202211150124684.jpg',NULL,'<p>\n	旺旺之业务可追溯至台湾宜兰食品工业股份有限公司。旺旺于1992年正式投资大陆市场，是台湾第一个在大陆注册商标并且拥有最多注册商标的公司，于1994年在湖南设立第一家工厂，旺旺秉持着&ldquo;缘、自信、大团结&rdquo;的经营理念，立志成为&ldquo;综合消费食品王国&rdquo;，向着&ldquo;中国第一，世界第一&rdquo;的目标不断前进。</p>\n','http://www.wantwant.com.cn/',1,0),(2,'新农哥','http://static.v4.javamall.com.cn/attachment/brand/201202211143461491.jpg',NULL,'','http://http://xinnongge.o-sa.info',1,0),(3,'洽洽','http://static.v4.javamall.com.cn/attachment/brand/201202211146563596.jpg',NULL,'<p>\n	洽洽食品股份有限公司成立于2001年8月9日，位于合肥市国家级经济技术开发区，主要生产坚果炒货类、焙烤类和薯片类等休闲食品。洽洽食品（002557）于2011年3月2日在深圳交易所挂牌上市。2011年6月1日，洽洽食品启动品牌新形象&ldquo;更时尚、更快乐&rdquo;。</p>\n<p>\n	洽洽食品坚持以&ldquo;创造美味产品，传播快乐味道&rdquo;为使命，经过近十多年的发展，产品线日趋丰富，成功推广&ldquo;洽洽香瓜子&rdquo;、洽洽喀吱脆&rdquo;、&ldquo;洽洽小而 香&rdquo;、&ldquo;洽洽怪U味&rdquo;等产品，深受消费者的喜爱，品牌知名度和美誉度不断提升，是中国坚果炒货行业的领军品牌，产品远销国内外30多个国家和地区。</p>\n','http://www.qiaqiafood.com',1,0),(4,'百味林','http://static.v4.javamall.com.cn/attachment/brand/201202211152387107.gif',NULL,'<p style=\"color: rgb(102, 102, 102); line-height: 18px; margin-top: 5px; margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; \">\n	<strong>上海百味林实业有限公司</strong></p>\n<p style=\"color: rgb(102, 102, 102); line-height: 18px; margin: 5px 0px; padding: 0px;\">\n	上海总部地址：上海市嘉定区马陆镇丰功路801号百味林大厦</p>\n<p style=\"color: rgb(102, 102, 102); line-height: 18px; margin: 5px 0px; padding: 0px;\">\n	上海总部电话：021-31273838</p>\n<p style=\"color: rgb(102, 102, 102); line-height: 18px; margin: 5px 0px; padding: 0px;\">\n	电子商务部电话：400-110-3001</p>\n<p style=\"color: rgb(102, 102, 102); line-height: 18px; margin: 5px 0px; padding: 0px;\">\n	传真：021-63739210</p>\n','http://www.bwlfood.com/',1,0),(5,'乐事','http://static.v4.javamall.com.cn/attachment/brand/201202211154567239.jpg',NULL,'','http://www.lays.com.cn/',1,0),(6,'上好佳','http://static.v4.javamall.com.cn/attachment/brand/201202211156220232.gif',NULL,'<p>\n	上好佳控股有限公司由施恭旗董事长领导，作为一个企业家，他从亚洲地区小企业家们敢做敢为寻求财富的精神中汲取灵感、受到鼓舞。上好佳公司以享有这种精神的亚洲企业而感到自豪。</p>\n','http://www.oishi-tm.com/',1,0),(7,'天喔','http://static.v4.javamall.com.cn/attachment/brand/201202211200113292.jpg',NULL,'<p>\n	上海天喔食品（集团）有限公司是一家以蜜饯、炒货、南北货、麦片生产为主，其他休闲食品生产为辅的著名食品生产企业。成立于1999年12月，总投资 11320.75万港元，注册资本8490.75万港元，为沪港合资。公司地处上海市松江区泗泾镇，总占地面积65亩。生产车间完全参照标准药品洁净厂房 要求设计修建。设施先进，环境优美，年均产值过亿元。</p>\n','http://www.tenwowfood.com',1,0),(8,'金帝','http://static.v4.javamall.com.cn/attachment/brand/201202221015047090.jpg',NULL,'<p>\n	<font size=\"-1\">源自欧洲，由瑞士<em>巧克力</em>大师亲自调制。多年来，严格坚持欧洲甄选标准,精心挑选上乘&ldquo;黄金可可&rdquo;，造就了至浓可可味的经典<em>巧克力</em></font></p>\n','http://www.leconte.com.cn/',1,0),(9,'好时','http://static.v4.javamall.com.cn/attachment/brand/201202221018146247.gif',NULL,'','http://www.hersheys.com',1,0),(10,'瑞士莲','http://static.v4.javamall.com.cn/attachment/brand/201202221035341549.gif',NULL,'','http://www.lindtusa.com',1,0),(11,'德芙','http://static.v4.javamall.com.cn/attachment/brand/201202221036549178.jpg',NULL,'','http://www.dovechocolate.com.cn/',1,0),(12,'可口可乐','http://static.v4.javamall.com.cn/attachment/brand/201202221038391096.jpg',NULL,'','http://www.coca-cola.com',1,0),(13,'百事','http://static.v4.javamall.com.cn/attachment/brand/201202221040322598.jpg',NULL,'','http://www.pepsi.com',1,0),(14,'农夫山泉','http://static.v4.javamall.com.cn/attachment/brand/201202221042275274.jpg',NULL,'','http://www.nfsq.com.cn/app/appOut.action',1,0),(15,'五粮液','http://static.v4.javamall.com.cn/attachment/brand/201202221044295459.jpg',NULL,'<p>\n	五粮液集团有限公司前身是50年代初8家古传酿酒作坊联合组建而成的&ldquo;中国专卖公司四川省宜宾酒厂&rdquo;，1959年正式命名为&ldquo;宜宾五粮液酒厂&rdquo;，1998年改制为&ldquo;四川省宜宾五粮液集团有限公司&rdquo;。</p>\n','http://www.wuliangye.com.cn/',1,0),(16,'阿尔卑斯','http://static.v4.javamall.com.cn/attachment/brand/201202221654250514.jpg',NULL,'<p>\n	<font size=\"-1\"><em>阿尔卑斯</em>全球最大的糖果生产企业之一，专业从事各种糖果和胶姆糖的生产和销售。其中比较有代表性的就是<em>阿尔卑斯</em>棒棒糖和<em>阿尔卑斯</em>糖。<em>阿尔卑斯</em>糖表达爱只需一颗<em>阿尔卑斯</em>。</font></p>\n','http://www.acandy.cn/',0,0),(17,'大白兔','http://static.v4.javamall.com.cn/attachment/brand/201202221658088525.jpg',NULL,'','http://www.guanshengyuan.com.cn/dabaitu/',1,0),(18,'伊利','http://static.v4.javamall.com.cn/attachment/brand/201202221659311713.jpg',NULL,'','http://www.yili.com/',1,0),(19,'益达','http://static.v4.javamall.com.cn/attachment/brand/201202221702199745.jpg',NULL,'','http://www.extra-city.com/',1,0),(20,'绿箭','http://static.v4.javamall.com.cn/attachment/brand/201202221707525542.jpg',NULL,'','http://www.wrigley.com.cn/',1,0),(21,'好丽友','http://static.v4.javamall.com.cn/attachment/brand/201202221709247073.jpg',NULL,'','http://www.orion.cn/product/index.aspx',1,0),(22,'康师傅','http://static.v4.javamall.com.cn/attachment/brand/201202221727178594.jpg',NULL,'<p>\n	康师傅主要在中国从事生产和销售方便面饮品及糕饼。2011年连续第三年获得福布斯亚洲50强称号,品牌价值10.66亿美元。</p>\n','http://www.masterkong.com.cn/',1,0),(23,'娃哈哈','http://static.v4.javamall.com.cn/attachment/brand/201202221728161737.gif',NULL,'','http://www.wahaha.com.cn/',1,0),(24,'统一','http://static.v4.javamall.com.cn/attachment/brand/201202221729517242.jpg',NULL,'','http://www.uni-president.com.cn/',1,0),(25,'郎酒',NULL,NULL,'<p>\n	四川郎酒集团，是一个以生产销售中国名酒郎酒和房地产开发的大型现代化企业集团。</p>\n<p align=\"left\">\n	郎酒，始于1903年，产自川黔交界有&ldquo;中国美酒河&rdquo;之称的赤水河畔，是目前中国唯一一家采用山泉水酿造的白酒企业。</p>\n<p>\n	郎酒历史可追溯到汉武帝时期，当时宫廷贡酒&ldquo;枸酱酒&rdquo;即是郎酒前身。从&ldquo;絮志酒厂&rdquo;、&ldquo;惠川糟房&rdquo;到&ldquo;集义糟房&rdquo;的&ldquo;回沙郎酒&rdquo;开始，至今已有100多年的悠久历史。</p>\n','http://www.langjiu.cn/',1,0),(26,'洋河','http://static.v4.javamall.com.cn/attachment/brand/201202221742498256.jpg',NULL,'','http://www.chinayanghe.com/',1,0),(27,'百威',NULL,NULL,'','http://www.budweiser.com/public/age-gate11.aspx?ReturnUrl=/d',1,0),(28,'哈尔滨','http://static.v4.javamall.com.cn/attachment/brand/201202221747410265.jpg',NULL,'','http://www.harbin-beer.cn',1,0),(29,'爱士堡',NULL,NULL,'','http://www.harbin-beer.cn',1,0),(30,'百利',NULL,NULL,'','http://www.baileys.com.cn',1,0),(31,'富豪',NULL,NULL,'','http://www.harbin-beer.cn',1,0),(32,'欧德堡',NULL,NULL,'','http://www.oldelburg.com/',1,0),(33,'多美鲜',NULL,NULL,'','http://www.chnimport.com',1,0),(34,'爱尔曼',NULL,NULL,'','http://#',1,0),(35,'丹麦蓝罐',NULL,NULL,'','http://www.baidu.com',1,0),(36,'莱家',NULL,NULL,'','http://www.baidu.com',1,0),(37,'北田',NULL,NULL,'','http://www.baidu.com',1,0),(38,'玛勃洛可','http://static.v4.javamall.com.cn/attachment/brand/201202222100337891.jpg',NULL,'<p>\n	　　老上海人可能不熟悉斯里兰卡茶，但永远不会忘记锡兰茶，所谓的锡兰茶，就是上世纪初进口到中国的英式红茶。 中国是茶叶的故乡，也是世界上最大的茶叶生产、消费和出口国之一。在漫长的岁月中，中国的茶叶经过海上贸易传遍全球，改变了无数人的生活方式，也推进了世界经</p>\n','http://www.mabroc.cn',1,0),(39,'AKBAR',NULL,NULL,'','http://www.akbarsilverlake.com/',1,0),(40,'川宁',NULL,NULL,'','http://www.baidu.com',1,0),(41,'卡司诺',NULL,NULL,'','http://www.baidu.com',1,0),(42,'益昌老街',NULL,NULL,'','http://www.baidu.com',1,0),(43,'卡度',NULL,NULL,'','http://www.baidu.com',1,0),(44,'张君雅','http://static.v4.javamall.com.cn/attachment/brand/201202222116468759.jpg',NULL,'','http://www.weilih.com.tw/',1,0),(45,'鲜得味',NULL,NULL,'','http://www.centurytuna.com/',1,0),(46,'海牌',NULL,NULL,'','http://www.baidu.com',1,0),(47,'Olay/玉兰油',NULL,NULL,'','http://www.olay.com.cn',1,0),(48,'鲜之园',NULL,NULL,'','http://www.xianzhiyuan.com',1,0),(49,'Hunts/汉斯',NULL,NULL,'','http://www.baidu.com',1,0),(50,'可康',NULL,NULL,'','http://www.kjkk.cc/',1,0),(51,'PomPotes/梦果鲜',NULL,NULL,'','http://www.baidu.com',1,0),(52,'Shiseido/资生堂','http://static.v4.javamall.com.cn/attachment/brand/201202222258101961.jpg',NULL,'','http://www.shiseidochina.com/',1,0),(53,'迪丽',NULL,NULL,'','http://www.baidu.com',1,0),(54,'花间公主',NULL,NULL,'','http://www.baidu.com/',1,0),(55,'城市生活',NULL,NULL,'','http://www.baidu.com/',1,0),(56,'Inoherb/相宜本草','http://static.v4.javamall.com.cn/attachment/brand/201202231016206426.jpg',NULL,'<p>\n	相宜本草&mdash;&mdash;一个诠释&ldquo;本草养肤&rdquo;概念的品牌。悠久灿烂、博大精深的中医文化充满奥妙与智慧。相宜本草深信：天然神奇的中草药对皮肤的改善是安全的、有效的，而且高品质的天然护肤品应该是平易近人的，人人都能拥有。源于这份初衷，2000年&ldquo;相宜本草&rdquo;品牌诞生了。<br />\n	<br />\n	中医强调的&ldquo;标本兼治&rdquo;理念，正是相宜本草养肤之道的来由。 因为，女人的美，从来都是由内而外。 即使外表平凡， 强大的内在力量亦让美丽绽放； 倘若丽质天生，内在力量更令你魅力加分。 肌肤更是如此，强韧的肌肤能量，内在的活力和健康，才是肌肤真正的美丽源泉。</p>\n','http://www.inoherb.com/',1,0),(57,'Mentholatum/曼秀雷敦','http://static.v4.javamall.com.cn/attachment/brand/201202231018171140.png',NULL,'','http://www.mentholatum.com.cn/',1,0),(58,'Herborist/佰草集','http://static.v4.javamall.com.cn/attachment/brand/201202231020005541.gif',NULL,'<p style=\" padding-left:20px;\">\n	受千年本草美颜文化启迪，中国第一套具有完整意义的中草药护理品牌&mdash;&mdash;佰草集于1998年清新诞生。糅合中国美颜经典与现代生物科技，以本草古方配伍为特色，佰草集逐步实现着中国文化中追求&ldquo;自然、平衡&rdquo;的亘美境界，缔造了一个本草养美颜的传奇。</p>\n<p style=\" padding-left:20px;\">\n	采天地灵气，化气韵和谐，佰草集萃取自中国经典草药精华，提出以&ldquo;证&rdquo;、&ldquo;方&rdquo;、&ldquo;效&rdquo;为核心的严谨的理论体系：以中医理论辩肌肤问题之证，以现代科技焕活传世古方，以内在调养之法达到养护肌肤之效，开启中草药养美的全新风尚。</p>\n<p style=\"padding-left: 20px;\">\n	享受自然的绿色馈赠，更将绿色之美还给自然,佰草集自创立以来，一直倡导绿色环保的品牌理念，提出&ldquo;养出地球之美&rdquo;的绿色时尚宣言。现在，佰草集更走出国门，以其独特的中国文化底蕴和全新品牌形象在法国以及其他国际市场中引领中医养美潮流，与全球分享&ldquo;美自根源养有方&rdquo;的佰草集养美之理念！</p>\n','http://www.herborist.com.cn/',1,0),(59,'海飞丝','http://static.v4.javamall.com.cn/attachment/brand/201202231146497650.jpg',NULL,'','http://scalptrends.ellechina.com/',1,0),(60,'潘婷','http://static.v4.javamall.com.cn/attachment/brand/201202231147529126.gif',NULL,'','http://www.pantene.com.cn/',1,0),(61,'飘柔','http://static.v4.javamall.com.cn/attachment/brand/201202231149270759.jpg',NULL,'','http://www.pg.com.cn/',1,0),(62,'多美滋',NULL,NULL,'','http://1000day.dumex.com.cn/',1,0),(63,'美赞臣','http://static.v4.javamall.com.cn/attachment/brand/201202231159446345.jpg',NULL,'','http://www.meadjohnson.com.cn/',1,0),(64,'光明',NULL,NULL,'','http://www.brightdairy.com/',1,0),(65,'雅培',NULL,NULL,'','http://www.abbottmama.com.cn/',1,0),(66,'Nestle/雀巢','http://static.v4.javamall.com.cn/attachment/brand/201202231204385546.jpg',NULL,'','http://www.nestle.com.cn/',1,0),(67,'妈咪宝贝',NULL,NULL,'','http://www.unicharm.com.cn/',1,0),(68,'帮宝适',NULL,NULL,'','http://goldensleep.pampers.com.cn/',1,0),(69,'Johnson/强生',NULL,NULL,'','http://www.johnsonsbaby.com.cn/index.html',1,0),(70,'好奇',NULL,NULL,'','http://www.kimberly-clark.com.cn/kcc_huggies/',1,0),(71,'Bonyee/邦怡',NULL,NULL,'','http://www.bonyee.com/',1,0),(72,'良良',NULL,NULL,'','http://www.llyez.com',1,0),(73,'喜亲宝',NULL,NULL,'','http://www.tjxqb.com.cn/',1,0),(74,'三月桃花',NULL,NULL,'','http://www.baidu.com',1,0),(75,'亨氏','http://static.v4.javamall.com.cn/attachment/brand/201202232302299961.jpg',NULL,'','http://www.heinz.com.cn/',1,0),(76,'伊威','http://static.v4.javamall.com.cn/attachment/brand/201202232303236077.gif',NULL,'','http://www.sh-eastwes.com/index.html',1,0),(77,'欧格尼','http://static.v4.javamall.com.cn/attachment/brand/201202232304418701.gif',NULL,'','http://www.ognfood.com/',1,0),(78,'Pigeon/贝亲',NULL,NULL,'','http://www.pigeon.cn',1,0),(79,'嗳呵',NULL,NULL,'','http://www.elsker.com/',1,0),(80,'铃兰','http://static.v4.javamall.com.cn/attachment/brand/201202232346471548.jpg',NULL,'','http://www.suzuran.cn/',1,0),(81,'爱得利','http://static.v4.javamall.com.cn/attachment/brand/201202232350075147.jpg',NULL,'','http://www.ivorybaby.com/',1,0),(82,'小榕树',NULL,NULL,'','http://www.xici.net/',1,0),(83,'1号药网',NULL,NULL,'','http://www.yihaodian.com',1,0),(84,'利其尔',NULL,NULL,'','http://www.richell.co.jp',1,0),(85,'亲亲我','http://static.v4.javamall.com.cn/attachment/brand/201202240003319744.jpg',NULL,'','http://www.kidsme.cn/',1,0),(86,'美美',NULL,NULL,'<p>\n	美美</p>\n','http://www.baidu.com',1,0),(87,'丹尼熊',NULL,NULL,'<p>\n	丹尼熊</p>\n','http://www.baidu.com',1,0),(88,'蒂乐',NULL,NULL,'','http://dele.wumeiwang.com',1,0),(89,'皇家宝贝',NULL,NULL,'','http://www.royalsonny.com.cn',1,0),(90,'ASD/爱仕达','http://static.v4.javamall.com.cn/attachment/brand/201202242158308119.jpg',NULL,'','http://www.chinaasd.com/wwwroot/index.htm',1,0),(91,'双立人',NULL,NULL,'','http://www.zwilling.com.cn/index.aspx',1,0),(92,'ROICHEN',NULL,NULL,'','http://www.baidu.com',1,0),(93,'Xingcai/兴财',NULL,NULL,'','http://www.xingcai.com/',1,0),(94,'张小泉',NULL,NULL,'','http://www.zhangxiaoquan.cn/',1,0),(95,'金仕顿(Kingstone)',NULL,NULL,'','http://www.kingstone.com',1,0),(96,'百变猪排','http://static.v5.javamall.com.cn/attachment/brand/201511240103545878.jpg',NULL,NULL,'http://www.javamall.com.cn',1,0),(97,'雅诗兰黛','http://static.v5.javamall.com.cn/attachment/brand/201511240206216011.jpg',NULL,NULL,'http://www.javamall.com.cn',1,0),(98,'海蓝之谜','http://static.v5.javamall.com.cn/attachment/brand/201511240207039976.jpg',NULL,NULL,'http://www.javamall.com.cn',1,0),(99,'美肤宝','http://static.v5.javamall.com.cn/attachment/brand/201511240207301397.jpg',NULL,NULL,'http://www.javamall.com.cn',1,0),(100,'法国娇韵诗','http://static.v5.javamall.com.cn/attachment/brand/201511240208099557.jpg',NULL,NULL,'http://www.javamall.com.cn',1,0),(101,'慕斯小姐','http://static.v5.javamall.com.cn/attachment/brand/201511240831260274.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(102,'迪菲莱','http://static.v5.javamall.com.cn/attachment/brand/201511240831524474.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(103,'稻草人','http://static.v5.javamall.com.cn/attachment/brand/201511240832127070.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(104,'狼族u','http://static.v5.javamall.com.cn/attachment/brand/201511240832334608.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(105,'木村耀司','http://static.v5.javamall.com.cn/attachment/brand/201511240834251919.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(106,'金狐狸','http://static.v5.javamall.com.cn/attachment/brand/201511240834453943.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(107,'美娜途','http://static.v5.javamall.com.cn/attachment/brand/201511240835127393.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(108,'萨蒙斯','http://static.v5.javamall.com.cn/attachment/brand/201511240836015061.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(109,'淑女屋','http://static.v5.javamall.com.cn/attachment/brand/201511241116564199.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(110,'骆驼','http://static.v5.javamall.com.cn/attachment/brand/201511241117175752.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(111,'ONLY','http://static.v5.javamall.com.cn/attachment/brand/201511241117354260.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(112,'七匹狼','http://static.v5.javamall.com.cn/attachment/brand/201511241117598462.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(113,'MIPANAD','http://static.v5.javamall.com.cn/attachment/brand/201511241118254552.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(114,'索菲斯尔','http://static.v5.javamall.com.cn/attachment/brand/201511241118460276.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(115,'太子龙','http://static.v5.javamall.com.cn/attachment/brand/201511241119084132.jpg',NULL,NULL,'http://javamall.com.cn',1,0),(116,'有货','http://static.v5.javamall.com.cn/attachment/brand/201511241119220911.jpg',NULL,NULL,'http://javamall.com.cn',1,0);

/*Table structure for table `es_cart` */

DROP TABLE IF EXISTS `es_cart`;

CREATE TABLE `es_cart` (
  `cart_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(9) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `itemtype` int(8) DEFAULT '0',
  `num` int(8) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `addon` longtext,
  `activity_id` int(10) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `is_check` smallint(1) DEFAULT '0',
  `is_change` smallint(1) DEFAULT '0',
  `activity_end_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `ind_cart_sessionid` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_cart` */

/*Table structure for table `es_comments` */

DROP TABLE IF EXISTS `es_comments`;

CREATE TABLE `es_comments` (
  `comment_id` int(8) NOT NULL AUTO_INCREMENT,
  `for_comment_id` int(8) DEFAULT NULL,
  `object_id` int(8) NOT NULL,
  `object_type` varchar(50) NOT NULL DEFAULT 'ask',
  `author_id` int(8) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `levelname` varchar(50) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `mem_read_status` varchar(5) NOT NULL DEFAULT 'false',
  `adm_read_status` varchar(5) NOT NULL DEFAULT 'false',
  `time` bigint(20) DEFAULT NULL,
  `lastreply` bigint(20) DEFAULT NULL,
  `reply_name` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `acomment` longtext,
  `ip` varchar(15) DEFAULT NULL,
  `display` varchar(5) NOT NULL DEFAULT 'false',
  `p_index` varchar(2) DEFAULT NULL,
  `disabled` varchar(5) DEFAULT 'false',
  `commenttype` varchar(50) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_comments` */

/*Table structure for table `es_component` */

DROP TABLE IF EXISTS `es_component`;

CREATE TABLE `es_component` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `componentid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `install_state` int(8) DEFAULT '0',
  `enable_state` int(8) DEFAULT '0',
  `version` varchar(50) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `javashop_version` varchar(50) DEFAULT NULL,
  `description` longtext,
  `error_message` longtext,
  `sort_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `es_component` */

insert  into `es_component`(`id`,`componentid`,`name`,`install_state`,`enable_state`,`version`,`author`,`javashop_version`,`description`,`error_message`,`sort_order`) values (1,'goodsCoreComponent','商品核心组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(2,'depotComponent','网店仓库组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(3,'orderCoreComponent','订单核心组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(4,'paymentComponent','支付组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(5,'shopEmailComponent','网店邮件组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(6,'receiptComponent','发票组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(7,'goodsSearchComponent','商品搜索过滤器组件',1,1,'2.0','javashop','3.0.0','',NULL,NULL),(8,'shopShortMsgComponent','网店短消息组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(9,'shopMemberComponent','网店会员组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(10,'memeberPointComponent','会员积分组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(11,'visitedGoodsComponent','浏览过的商品组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(12,'cmsCoreComponent','CMS核心组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(13,'galleryComponent','新相册组件',1,1,'1.0','Javashop','3.0.0','',NULL,NULL),(14,'bonusComponent','红包组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(15,'shopExpressComponent','网店快递组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(16,'goodsSpecComponent','商品规格组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(17,'activityComponent','网店促销活动组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL),(18,'decorateComponent','装修组件',1,1,'1.0','Javashop','3.0.0','',NULL,NULL),(19,'baseComponent','base应用基础组件',1,1,'1.0','javashop','3.0.0','',NULL,NULL);

/*Table structure for table `es_coupons` */

DROP TABLE IF EXISTS `es_coupons`;

CREATE TABLE `es_coupons` (
  `cpns_id` int(8) NOT NULL AUTO_INCREMENT,
  `cpns_name` varchar(255) DEFAULT NULL,
  `cpns_sn` varchar(50) DEFAULT NULL,
  `cpns_status` varchar(1) DEFAULT '1',
  `cpns_type` varchar(1) DEFAULT '1',
  `disabled` varchar(5) DEFAULT 'false',
  `can_give` int(8) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `member_id_start` int(10) DEFAULT NULL,
  `member_id_end` int(10) DEFAULT NULL,
  `reg_time_start` int(10) DEFAULT NULL,
  `reg_time_end` int(10) DEFAULT NULL,
  `lv_ids` longtext,
  `lv_names` longtext,
  `end_time` int(11) DEFAULT NULL,
  `cat_ids` longtext,
  `cat_names` longtext,
  `goods_price` varchar(22) DEFAULT NULL,
  `discount_price` varchar(22) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `remark` longtext,
  `allcat` int(8) DEFAULT '0',
  PRIMARY KEY (`cpns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_coupons` */

/*Table structure for table `es_data_cat` */

DROP TABLE IF EXISTS `es_data_cat`;

CREATE TABLE `es_data_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(255) DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  `model_id` int(8) DEFAULT NULL,
  `if_audit` int(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `detail_url` varchar(255) DEFAULT NULL,
  `descript` longtext,
  `tositemap` int(8) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `es_data_cat` */

insert  into `es_data_cat`(`cat_id`,`name`,`parent_id`,`cat_path`,`cat_order`,`model_id`,`if_audit`,`url`,`detail_url`,`descript`,`tositemap`) values (1,'热门关键字',0,'0|1|',1,1,NULL,'newslist-1-1.html','',NULL,0),(2,'帮助中心',0,'0|2|',2,2,NULL,'newslist-2-1.html','',NULL,0),(17,'新手上路',2,'0|2|17|',500,2,NULL,'newslist-17-1.html','',NULL,0),(18,'购物指南',2,'0|2|18|',510,2,NULL,'newslist-18-1.html','',NULL,0),(19,'支付方式',2,'0|2|19|',520,2,NULL,'newslist-19-1.html','',NULL,0),(20,'购物条款',2,'0|2|20|',530,2,NULL,'newslist-20-1.html','',NULL,0),(21,'关于网站',2,'0|2|21|',400,2,NULL,'newslist-21-1.html','',NULL,0),(22,'配送方式',2,'0|2|22|',600,2,NULL,'newslist-22-1.html','',NULL,0),(23,'服务',2,'0|2|23|',610,2,NULL,'newslist-23-1.html','',NULL,0),(24,'优惠活动',2,'0|2|24|',700,2,NULL,'newslist-24-1.html','',NULL,0),(25,'我的订单',2,'0|2|25|',750,2,NULL,'newslist-25-1.html','',NULL,0);

/*Table structure for table `es_data_field` */

DROP TABLE IF EXISTS `es_data_field`;

CREATE TABLE `es_data_field` (
  `field_id` int(8) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL,
  `data_size` varchar(20) DEFAULT NULL,
  `show_form` varchar(255) DEFAULT NULL,
  `show_value` varchar(400) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `model_id` int(8) DEFAULT NULL,
  `save_value` longtext,
  `is_validate` int(8) DEFAULT NULL,
  `taxis` int(4) DEFAULT NULL,
  `dict_id` int(8) DEFAULT NULL,
  `is_show` int(8) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `es_data_field` */

insert  into `es_data_field`(`field_id`,`china_name`,`english_name`,`data_type`,`data_size`,`show_form`,`show_value`,`add_time`,`model_id`,`save_value`,`is_validate`,`taxis`,`dict_id`,`is_show`) values (1,'关键字','hot_searchword',NULL,NULL,'input',NULL,1330318246806,1,'',1,1,NULL,1),(2,'url','url',NULL,NULL,'input',NULL,1330318278216,1,'',1,2,NULL,1),(3,'标题','title',NULL,NULL,'input',NULL,1330402514437,2,'',1,1,NULL,1),(4,'图片','image',NULL,NULL,'image',NULL,1330402560750,2,'',0,2,NULL,0),(5,'内容','content',NULL,NULL,'richedit',NULL,1330403222956,2,'',0,3,NULL,0);

/*Table structure for table `es_data_model` */

DROP TABLE IF EXISTS `es_data_model`;

CREATE TABLE `es_data_model` (
  `model_id` int(8) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `brief` varchar(400) DEFAULT NULL,
  `if_audit` int(8) DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `es_data_model` */

insert  into `es_data_model`(`model_id`,`china_name`,`english_name`,`add_time`,`project_name`,`brief`,`if_audit`) values (1,'热门关键字','hot_keyword',1330317978678,NULL,'',0),(2,'帮助中心','helpcenter',1330402484834,NULL,'',0);

/*Table structure for table `es_delivery` */

DROP TABLE IF EXISTS `es_delivery`;

CREATE TABLE `es_delivery` (
  `delivery_id` int(8) NOT NULL AUTO_INCREMENT,
  `type` varchar(1) DEFAULT NULL,
  `order_id` int(8) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `ship_type` varchar(255) DEFAULT NULL,
  `is_protect` varchar(4) DEFAULT NULL,
  `protect_price` decimal(20,2) DEFAULT NULL,
  `logi_id` int(8) DEFAULT NULL,
  `logi_name` varchar(255) DEFAULT NULL,
  `logi_no` varchar(255) DEFAULT NULL,
  `ship_name` varchar(255) DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `ship_addr` varchar(255) DEFAULT NULL,
  `ship_zip` varchar(50) DEFAULT NULL,
  `ship_tel` varchar(50) DEFAULT NULL,
  `ship_mobile` varchar(50) DEFAULT NULL,
  `ship_email` varchar(50) DEFAULT NULL,
  `op_name` varchar(255) DEFAULT NULL,
  `remark` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `logi_code` varchar(255) DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `ind_deliver_orderid` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_delivery` */

/*Table structure for table `es_delivery_item` */

DROP TABLE IF EXISTS `es_delivery_item`;

CREATE TABLE `es_delivery_item` (
  `item_id` int(8) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num` int(8) DEFAULT NULL,
  `itemtype` int(8) DEFAULT '0',
  `order_itemid` int(10) DEFAULT NULL,
  `depotId` int(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ind_delivery_item` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_delivery_item` */

/*Table structure for table `es_depot` */

DROP TABLE IF EXISTS `es_depot`;

CREATE TABLE `es_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `choose` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `es_depot` */

insert  into `es_depot`(`id`,`name`,`choose`) values (1,'海淀仓库',1),(2,'朝阳仓库',0),(3,'昌平仓库',0);

/*Table structure for table `es_depot_user` */

DROP TABLE IF EXISTS `es_depot_user`;

CREATE TABLE `es_depot_user` (
  `userid` int(10) NOT NULL,
  `depotid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_depot_user` */

/*Table structure for table `es_dly_area` */

DROP TABLE IF EXISTS `es_dly_area`;

CREATE TABLE `es_dly_area` (
  `area_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_dly_area` */

/*Table structure for table `es_dly_center` */

DROP TABLE IF EXISTS `es_dly_center`;

CREATE TABLE `es_dly_center` (
  `dly_center_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `zip` varchar(6) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `uname` varchar(100) DEFAULT NULL,
  `cellphone` varchar(100) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `memo` longtext,
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  `choose` varchar(5) NOT NULL,
  PRIMARY KEY (`dly_center_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_dly_center` */

/*Table structure for table `es_dly_type` */

DROP TABLE IF EXISTS `es_dly_type`;

CREATE TABLE `es_dly_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `protect` int(8) DEFAULT NULL,
  `protect_rate` varchar(6) DEFAULT NULL,
  `has_cod` varchar(1) DEFAULT NULL,
  `min_price` varchar(10) DEFAULT NULL,
  `detail` longtext,
  `corp_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `is_same` int(8) DEFAULT '0',
  `config` longtext,
  `expressions` longtext,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `es_dly_type` */

insert  into `es_dly_type`(`type_id`,`name`,`protect`,`protect_rate`,`has_cod`,`min_price`,`detail`,`corp_id`,`ordernum`,`disabled`,`is_same`,`config`,`expressions`) values (1,'圆通速递',0,'0.0','0','0.0','<p>\n	测试用，请在后台修改</p>\n',1,1,0,1,'{\"continueprice\":10,\"continueunit\":1000,\"defAreaFee\":0,\"expression\":\"\",\"firstprice\":10,\"firstunit\":1000,\"have_cod\":0,\"is_same\":0,\"useexp\":0}','10.0+tint(w-1000)/1000*10.0'),(2,'宅急送',0,NULL,'0',NULL,'<p>\n	测试用，请在后台修改.</p>\n',2,2,0,1,'{\"continueprice\":5,\"continueunit\":1000,\"defAreaFee\":0,\"expression\":\"\",\"firstprice\":15,\"firstunit\":1000,\"have_cod\":0,\"is_same\":0,\"useexp\":0}','15.0+tint(w-1000)/1000*5.0');

/*Table structure for table `es_dly_type_area` */

DROP TABLE IF EXISTS `es_dly_type_area`;

CREATE TABLE `es_dly_type_area` (
  `type_id` int(8) DEFAULT NULL,
  `area_id_group` longtext,
  `area_name_group` longtext,
  `expressions` longtext,
  `has_cod` int(8) DEFAULT NULL,
  `config` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_dly_type_area` */

/*Table structure for table `es_email_list` */

DROP TABLE IF EXISTS `es_email_list`;

CREATE TABLE `es_email_list` (
  `email_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `is_success` int(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` longtext,
  `error_num` int(6) DEFAULT NULL,
  `last_send` int(11) DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_email_list` */

/*Table structure for table `es_express_platform` */

DROP TABLE IF EXISTS `es_express_platform`;

CREATE TABLE `es_express_platform` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(50) DEFAULT NULL,
  `is_open` int(8) DEFAULT NULL,
  `config` longtext,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `es_express_platform` */

insert  into `es_express_platform`(`id`,`platform_name`,`is_open`,`config`,`code`) values (1,'快递100',1,'{\'keyid\':\'92a25441fc46fded\',\'user\':\'0\'}','kuaidi100Plugin'),(2,'showapi快递',NULL,NULL,'showapiPlugin');

/*Table structure for table `es_favorite` */

DROP TABLE IF EXISTS `es_favorite`;

CREATE TABLE `es_favorite` (
  `favorite_id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `favorite_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`favorite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_favorite` */

/*Table structure for table `es_floor` */

DROP TABLE IF EXISTS `es_floor`;

CREATE TABLE `es_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `type` int(11) DEFAULT NULL,
  `style` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `cat_id` varchar(255) DEFAULT NULL,
  `guid_cat_id` varchar(255) DEFAULT NULL,
  `goods_ids` longtext,
  `props` longtext,
  `brand_ids` longtext,
  `adv_ids` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `es_floor` */

insert  into `es_floor`(`id`,`page_id`,`title`,`parent_id`,`type`,`style`,`logo`,`is_display`,`sort`,`cat_id`,`guid_cat_id`,`goods_ids`,`props`,`brand_ids`,`adv_ids`) values (1,1,'食品饮料',0,NULL,'new_storey',NULL,0,1,'1',NULL,NULL,NULL,'{\"0\":\"14\",\"1\":\"13\",\"2\":\"12\",\"3\":\"11\",\"4\":\"10\",\"5\":\"9\",\"6\":\"8\",\"7\":\"7\"}','{\"only\":{\"0\":\"22\"}}'),(2,1,'美容化妆',0,NULL,'new_storey',NULL,0,2,'38',NULL,NULL,NULL,'{\"0\":\"97\",\"1\":\"98\",\"2\":\"99\",\"3\":\"100\",\"4\":\"101\",\"5\":\"56\",\"6\":\"52\",\"7\":\"57\"}','{\"only\":{\"0\":\"23\"}}'),(3,1,'珠宝箱包',0,NULL,'new_storey',NULL,0,3,'35',NULL,NULL,NULL,'{\"0\":\"115\",\"1\":\"114\",\"2\":\"113\",\"3\":\"112\",\"4\":\"111\",\"5\":\"110\",\"6\":\"109\",\"7\":\"108\"}','{\"only\":{\"0\":\"24\"}}'),(4,1,'服装鞋帽',0,NULL,'new_storey',NULL,0,4,'86',NULL,NULL,NULL,'{\"0\":\"116\",\"1\":\"115\",\"2\":\"114\",\"3\":\"113\",\"4\":\"112\",\"5\":\"111\",\"6\":\"110\",\"7\":\"109\"}','{\"only\":{\"0\":\"27\"}}'),(5,1,'食品',1,NULL,'style2',NULL,0,1,NULL,NULL,'{\"0\":\"267\",\"1\":\"266\",\"2\":\"265\",\"3\":\"11\",\"4\":\"10\",\"5\":\"9\"}',NULL,NULL,NULL),(6,1,'美容化妆',2,NULL,'style2',NULL,0,1,NULL,NULL,'{\"0\":\"272\",\"1\":\"270\",\"2\":\"268\",\"3\":\"134\",\"4\":\"128\",\"5\":\"124\"}',NULL,NULL,NULL),(7,1,'珠宝箱包',3,NULL,'style2',NULL,0,1,NULL,NULL,'{\"0\":\"279\",\"1\":\"276\",\"2\":\"277\",\"3\":\"278\",\"4\":\"275\",\"5\":\"274\"}',NULL,NULL,NULL),(9,1,'女装',4,NULL,'style2',NULL,0,1,NULL,NULL,'{\"0\":\"283\",\"1\":\"282\",\"2\":\"280\",\"3\":\"285\",\"4\":\"284\",\"5\":\"281\"}',NULL,NULL,NULL),(11,1,'饮料',1,NULL,'style2',NULL,0,1,NULL,NULL,'{\"0\":\"54\",\"1\":\"55\",\"2\":\"53\",\"3\":\"47\",\"4\":\"52\",\"5\":\"45\"}',NULL,NULL,NULL),(12,1,'个人护理',2,NULL,'style2',NULL,0,1,NULL,NULL,'{\"0\":\"150\",\"1\":\"146\",\"2\":\"152\",\"3\":\"153\",\"4\":\"144\",\"5\":\"139\"}',NULL,NULL,NULL);

/*Table structure for table `es_flow_log` */

DROP TABLE IF EXISTS `es_flow_log`;

CREATE TABLE `es_flow_log` (
  `flow_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `visit_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_flow_log` */

/*Table structure for table `es_freeoffer` */

DROP TABLE IF EXISTS `es_freeoffer`;

CREATE TABLE `es_freeoffer` (
  `fo_id` int(8) NOT NULL AUTO_INCREMENT,
  `fo_category_id` int(8) DEFAULT NULL,
  `fo_name` varchar(50) DEFAULT NULL,
  `publishable` int(6) DEFAULT '0',
  `recommend` int(6) DEFAULT '1',
  `sorder` int(6) DEFAULT NULL,
  `limit_purchases` int(6) DEFAULT NULL,
  `startdate` bigint(20) DEFAULT NULL,
  `enddate` bigint(20) DEFAULT NULL,
  `lv_ids` varchar(50) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `list_thumb` longtext,
  `pic` longtext,
  `score` int(8) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `repertory` int(8) DEFAULT NULL,
  `descript` longtext,
  `disabled` int(6) DEFAULT '0',
  PRIMARY KEY (`fo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_freeoffer` */

/*Table structure for table `es_freeoffer_category` */

DROP TABLE IF EXISTS `es_freeoffer_category`;

CREATE TABLE `es_freeoffer_category` (
  `cat_id` int(10) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT NULL,
  `publishable` int(6) DEFAULT '0',
  `sorder` int(10) DEFAULT NULL,
  `disabled` int(6) DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_freeoffer_category` */

/*Table structure for table `es_freeze_point` */

DROP TABLE IF EXISTS `es_freeze_point`;

CREATE TABLE `es_freeze_point` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `memberid` int(10) DEFAULT NULL,
  `childid` int(10) DEFAULT NULL,
  `point` int(10) DEFAULT NULL,
  `mp` int(10) DEFAULT NULL,
  `orderid` int(10) DEFAULT NULL,
  `dateline` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_freeze_point_index` (`memberid`,`type`),
  KEY `es_freeze_point_index1` (`orderid`,`dateline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_freeze_point` */

/*Table structure for table `es_friends_link` */

DROP TABLE IF EXISTS `es_friends_link`;

CREATE TABLE `es_friends_link` (
  `link_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `sort` int(8) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_friends_link` */

/*Table structure for table `es_gnotify` */

DROP TABLE IF EXISTS `es_gnotify`;

CREATE TABLE `es_gnotify` (
  `gnotify_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'ready',
  `send_time` bigint(20) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  `remark` longtext,
  PRIMARY KEY (`gnotify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_gnotify` */

/*Table structure for table `es_goods` */

DROP TABLE IF EXISTS `es_goods`;

CREATE TABLE `es_goods` (
  `goods_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `sn` varchar(200) DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `unit` varchar(20) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `market_enable` int(8) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `intro` longtext,
  `price` decimal(20,2) DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `mktprice` decimal(20,2) DEFAULT NULL,
  `params` longtext,
  `specs` longtext,
  `have_spec` int(8) DEFAULT NULL,
  `adjuncts` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL,
  `view_count` int(10) DEFAULT NULL,
  `buy_count` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  `point` int(8) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(1000) DEFAULT NULL,
  `meta_description` varchar(1000) DEFAULT NULL,
  `p20` varchar(255) DEFAULT NULL,
  `p19` varchar(255) DEFAULT NULL,
  `p18` varchar(255) DEFAULT NULL,
  `p17` varchar(255) DEFAULT NULL,
  `p16` varchar(255) DEFAULT NULL,
  `p15` varchar(255) DEFAULT NULL,
  `p14` varchar(255) DEFAULT NULL,
  `p13` varchar(255) DEFAULT NULL,
  `p12` varchar(255) DEFAULT NULL,
  `p11` varchar(255) DEFAULT NULL,
  `p10` varchar(255) DEFAULT NULL,
  `p9` varchar(255) DEFAULT NULL,
  `p8` varchar(255) DEFAULT NULL,
  `p7` varchar(255) DEFAULT NULL,
  `p6` varchar(255) DEFAULT NULL,
  `p5` varchar(255) DEFAULT NULL,
  `p4` varchar(255) DEFAULT NULL,
  `p3` varchar(255) DEFAULT NULL,
  `p2` varchar(255) DEFAULT NULL,
  `p1` varchar(255) DEFAULT NULL,
  `sord` int(10) DEFAULT '0',
  `have_field` int(8) DEFAULT '0',
  `grade` int(10) DEFAULT '0',
  `goods_comment` longtext,
  `is_pack` int(8) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `ind_goods_cat_id` (`cat_id`),
  KEY `ind_goods_brand_id` (`brand_id`),
  KEY `ind_goods_name` (`name`),
  KEY `ind_goods_sn` (`sn`),
  KEY `ind_goods_other` (`goods_type`,`disabled`,`market_enable`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;

/*Data for the table `es_goods` */

insert  into `es_goods`(`goods_id`,`name`,`sn`,`brand_id`,`cat_id`,`type_id`,`goods_type`,`unit`,`weight`,`market_enable`,`brief`,`intro`,`price`,`cost`,`mktprice`,`params`,`specs`,`have_spec`,`adjuncts`,`create_time`,`last_modify`,`view_count`,`buy_count`,`disabled`,`store`,`enable_store`,`point`,`page_title`,`meta_keywords`,`meta_description`,`p20`,`p19`,`p18`,`p17`,`p16`,`p15`,`p14`,`p13`,`p12`,`p11`,`p10`,`p9`,`p8`,`p7`,`p6`,`p5`,`p4`,`p3`,`p2`,`p1`,`sord`,`have_field`,`grade`,`goods_comment`,`is_pack`,`thumbnail`,`big`,`small`,`original`) values (280,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ','201511240987',0,109,54,0,NULL,'0.00',1,NULL,'<p><img src=\"https://img.alicdn.com/imgextra/i4/1959087270/TB2bzb6hpXXXXaNXXXXXXXXXXXX_%21%211959087270.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i2/1959087270/TB2tDWHhpXXXXbvXpXXXXXXXXXX_%21%211959087270.jpg\" align=\"absmiddle\"/></p><div id=\"xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd\"></div>','1680.00','0.00','2000.00','[]','[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":280,\"name\":\"威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 \",\"price\":1680,\"product_id\":360,\"sn\":\"2015112566789\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":44},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":10}],\"specs\":\"红色、XXS\",\"specsvIdJson\":\"[44,10]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":280,\"name\":\"威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 \",\"price\":1670,\"product_id\":361,\"sn\":\"2015112566788\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":45},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":10}],\"specs\":\"蓝色、XXS\",\"specsvIdJson\":\"[45,10]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":280,\"name\":\"威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 \",\"price\":1660,\"product_id\":362,\"sn\":\"2015112566787\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":57},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":10}],\"specs\":\"粉紫色、XXS\",\"specsvIdJson\":\"[57,10]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":280,\"name\":\"威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 \",\"price\":1650,\"product_id\":363,\"sn\":\"2015112566786\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":41},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":10}],\"specs\":\"黄色、XXS\",\"specsvIdJson\":\"[41,10]\",\"store\":0,\"weight\":0}]',1,NULL,1448336163,1448336163,3,0,0,1332,1332,0,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'http://static.v5.javamall.com.cn/attachment/goods/201511241134546958_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134546958_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134546958_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134546958.jpg'),(281,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ','2015112400814',0,109,54,0,NULL,'0.00',1,NULL,'<p><img src=\"https://img.alicdn.com/imgextra/i1/2074649025/TB2iEKrhXXXXXb.XXXXXXXXXXXX_%21%212074649025.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i3/2074649025/TB28omKhXXXXXXcXXXXXXXXXXXX_%21%212074649025.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i2/2074649025/TB26XWfhXXXXXbtXpXXXXXXXXXX_%21%212074649025.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i3/2074649025/TB2qJemhXXXXXaoXpXXXXXXXXXX_%21%212074649025.jpg\" align=\"absmiddle\"/></p><div id=\"xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd\"></div>','430.00','0.00','500.00','[]','[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":281,\"name\":\"sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 \",\"price\":430,\"product_id\":364,\"sn\":\"2015112400123453\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":56}],\"specs\":\"西瓜红\",\"specsvIdJson\":\"[56]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":281,\"name\":\"sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 \",\"price\":420,\"product_id\":365,\"sn\":\"2015112400123455\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":48}],\"specs\":\"灰色\",\"specsvIdJson\":\"[48]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":281,\"name\":\"sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 \",\"price\":410,\"product_id\":366,\"sn\":\"2015112400123456\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":41}],\"specs\":\"黄色\",\"specsvIdJson\":\"[41]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":281,\"name\":\"sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 \",\"price\":400,\"product_id\":367,\"sn\":\"2015112400123457\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":54}],\"specs\":\"粉红色\",\"specsvIdJson\":\"[54]\",\"store\":0,\"weight\":0}]',1,NULL,1448337525,1448337525,4,0,0,2331,2331,0,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157540387.jpg'),(282,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ','2015112400987',0,109,54,0,NULL,'0.00',1,NULL,'<p><img src=\"https://img.alicdn.com/imgextra/i3/1765328414/TB2NKPGfFXXXXakXXXXXXXXXXXX_%21%211765328414.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i1/1765328414/TB2S0vcfFXXXXcVXpXXXXXXXXXX_%21%211765328414.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i3/1765328414/TB2FUzhfFXXXXbkXpXXXXXXXXXX_%21%211765328414.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i2/1765328414/TB2NvLEfFXXXXaKXXXXXXXXXXXX_%21%211765328414.jpg\" align=\"absmiddle\"/></p><div id=\"xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd\"></div>','300.00','0.00','500.00','[]','[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":282,\"name\":\"云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 \",\"price\":300,\"product_id\":368,\"sn\":\"201511240089\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":44},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":10}],\"specs\":\"红色、XXS\",\"specsvIdJson\":\"[44,10]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":282,\"name\":\"云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 \",\"price\":310,\"product_id\":369,\"sn\":\"201511240088\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":44},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":11}],\"specs\":\"红色、XS\",\"specsvIdJson\":\"[44,11]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":282,\"name\":\"云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 \",\"price\":320,\"product_id\":370,\"sn\":\"201511240087\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":41},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":10}],\"specs\":\"黄色、XXS\",\"specsvIdJson\":\"[41,10]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":282,\"name\":\"云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 \",\"price\":330,\"product_id\":371,\"sn\":\"201511240086\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":41},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":11}],\"specs\":\"黄色、XS\",\"specsvIdJson\":\"[41,11]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":282,\"name\":\"云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 \",\"price\":340,\"product_id\":372,\"sn\":\"201511240085\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":43},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":10}],\"specs\":\"黑色、XXS\",\"specsvIdJson\":\"[43,10]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":282,\"name\":\"云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 \",\"price\":350,\"product_id\":373,\"sn\":\"201511240084\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":43},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":11}],\"specs\":\"黑色、XS\",\"specsvIdJson\":\"[43,11]\",\"store\":0,\"weight\":0}]',1,NULL,1448337929,1448337929,5,0,0,666,666,0,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204330677.jpg'),(283,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ','2015112400900',0,113,54,0,NULL,'0.00',1,NULL,'<table height=\"837\" cellpadding=\"0\" cellspacing=\"0\" width=\"790\"><tbody><tr class=\"firstRow\"><td rowspan=\"2\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/762037070/TB2StoOepXXXXbxXXXXXXXXXXXX_%21%21762037070.jpg\" height=\"837\" width=\"421\"/> </td><td><a href=\"https://detail.tmall.com/item.htm?id=522623418763&sku_properties=-1:-1\" target=\"_blank\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/762037070/TB2NvcUepXXXXanXXXXXXXXXXXX_%21%21762037070.jpg\" height=\"450\" width=\"369\"/></a> </td></tr><tr><td><a href=\"https://detail.tmall.com/item.htm?spm=0.0.0.0.wTaKT9&id=521287107615\" target=\"_blank\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/762037070/TB26_wUepXXXXaoXXXXXXXXXXXX_%21%21762037070.jpg\" height=\"387\" width=\"369\"/></a> </td></tr></tbody></table><p><img class=\"desc_anchor\" id=\"desc-module-2\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\"/><img src=\"https://img.alicdn.com/imgextra/i2/762037070/TB2vCKgfFXXXXc.XpXXXXXXXXXX_%21%21762037070.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i1/762037070/TB2SlSLfFXXXXaWXXXXXXXXXXXX_%21%21762037070.jpg\" align=\"absmiddle\"/></p><p><br/></p>','310.00','0.00','500.00','[]','[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":283,\"name\":\"2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 \",\"price\":310,\"product_id\":374,\"sn\":\"201511240097\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":50},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":9}],\"specs\":\"粉黄色、均码\",\"specsvIdJson\":\"[50,9]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":283,\"name\":\"2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 \",\"price\":320,\"product_id\":375,\"sn\":\"201511240096\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":50},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":13}],\"specs\":\"粉黄色、M\",\"specsvIdJson\":\"[50,13]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":283,\"name\":\"2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 \",\"price\":330,\"product_id\":376,\"sn\":\"201511240095\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":50},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":14}],\"specs\":\"粉黄色、L\",\"specsvIdJson\":\"[50,14]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":283,\"name\":\"2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 \",\"price\":340,\"product_id\":377,\"sn\":\"201511240094\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":55},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":9}],\"specs\":\"浅玫红、均码\",\"specsvIdJson\":\"[55,9]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":283,\"name\":\"2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 \",\"price\":350,\"product_id\":378,\"sn\":\"201511240093\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":55},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":13}],\"specs\":\"浅玫红、M\",\"specsvIdJson\":\"[55,13]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":283,\"name\":\"2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 \",\"price\":360,\"product_id\":379,\"sn\":\"201511240092\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":55},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":14}],\"specs\":\"浅玫红、L\",\"specsvIdJson\":\"[55,14]\",\"store\":0,\"weight\":0}]',1,NULL,1448338374,1448338374,6,0,0,666,666,0,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280361.jpg'),(284,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ','2015112400656',0,111,53,0,NULL,'0.00',1,NULL,'<p><img src=\"https://img.alicdn.com/imgextra/i2/831000451/TB2JV5EfVXXXXcgXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2izODfVXXXXcqXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i1/831000451/TB2eoWNfVXXXXXUXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2KOyPfVXXXXXPXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/></p><div id=\"xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd\"></div>','270.00','0.00','400.00','[]','[{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":284,\"name\":\"大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 \",\"price\":270,\"product_id\":380,\"sn\":\"201511243345\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":44},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":16}],\"specs\":\"红色、XXL\",\"specsvIdJson\":\"[44,16]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":284,\"name\":\"大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 \",\"price\":280,\"product_id\":381,\"sn\":\"201511243345\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":44},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":39}],\"specs\":\"红色、85D\",\"specsvIdJson\":\"[44,39]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":284,\"name\":\"大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 \",\"price\":290,\"product_id\":382,\"sn\":\"201511243345\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":48},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":16}],\"specs\":\"灰色、XXL\",\"specsvIdJson\":\"[48,16]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":284,\"name\":\"大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 \",\"price\":260,\"product_id\":383,\"sn\":\"201511243345\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":48},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":39}],\"specs\":\"灰色、85D\",\"specsvIdJson\":\"[48,39]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":284,\"name\":\"大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 \",\"price\":290,\"product_id\":384,\"sn\":\"201511243345\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":43},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":16}],\"specs\":\"黑色、XXL\",\"specsvIdJson\":\"[43,16]\",\"store\":0,\"weight\":0},{\"cost\":0,\"enable_store\":0,\"goodsLvPrices\":[],\"goods_id\":284,\"name\":\"大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 \",\"price\":300,\"product_id\":385,\"sn\":\"201511243345\",\"specList\":[{\"spec_id\":1,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":43},{\"spec_id\":2,\"spec_image\":\"\",\"spec_order\":0,\"spec_type\":0,\"spec_value\":\"\",\"spec_value_id\":39}],\"specs\":\"黑色、85D\",\"specsvIdJson\":\"[43,39]\",\"store\":0,\"weight\":0}]',1,NULL,1448338808,1448338808,11,0,0,666,666,0,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219082665.jpg'),(285,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣','201511243123',0,111,53,0,'盒','0.00',1,NULL,'<p><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2wHslfXXXXXb1XpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i3/831000451/TB27z3tfXXXXXa9XpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i1/831000451/TB2QOQAfXXXXXaaXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2wmUFfXXXXXXHXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2wHslfXXXXXb1XpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i3/831000451/TB27z3tfXXXXXa9XpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i1/831000451/TB2QOQAfXXXXXaaXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2wmUFfXXXXXXHXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2wHslfXXXXXb1XpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i3/831000451/TB27z3tfXXXXXa9XpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i1/831000451/TB2QOQAfXXXXXaaXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/><img src=\"https://img.alicdn.com/imgextra/i4/831000451/TB2wmUFfXXXXXXHXpXXXXXXXXXX_%21%21831000451.jpg\" align=\"absmiddle\"/></p>','320.00','0.00','400.00','[]','[{\"cost\":0,\"enable_store\":215,\"goodsLvPrices\":[],\"goods_id\":285,\"name\":\"THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣\",\"price\":320,\"product_id\":386,\"sn\":\"201511243123\",\"specList\":[],\"specs\":\"灰色、XXL\",\"specsvIdJson\":\"[]\",\"store\":217,\"weight\":0}]',0,NULL,1448339327,1529982693,15,0,0,883,879,0,'','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,'http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000607.jpg');

/*Table structure for table `es_goods_adjunct` */

DROP TABLE IF EXISTS `es_goods_adjunct`;

CREATE TABLE `es_goods_adjunct` (
  `adjunct_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `adjunct_name` varchar(50) DEFAULT NULL,
  `min_num` int(10) DEFAULT NULL,
  `max_num` int(10) DEFAULT NULL,
  `set_price` varchar(8) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `items` longtext,
  PRIMARY KEY (`adjunct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_adjunct` */

/*Table structure for table `es_goods_articles` */

DROP TABLE IF EXISTS `es_goods_articles`;

CREATE TABLE `es_goods_articles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `articleid` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_articles` */

/*Table structure for table `es_goods_cat` */

DROP TABLE IF EXISTS `es_goods_cat`;

CREATE TABLE `es_goods_cat` (
  `cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `parent_id` int(8) DEFAULT NULL,
  `cat_path` varchar(200) DEFAULT NULL,
  `goods_count` int(8) DEFAULT NULL,
  `cat_order` int(5) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `list_show` varchar(1) DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `ind_goods_cat_parentid` (`parent_id`),
  KEY `ind_goods_cat_order` (`cat_order`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_cat` */

insert  into `es_goods_cat`(`cat_id`,`name`,`parent_id`,`cat_path`,`goods_count`,`cat_order`,`type_id`,`list_show`,`image`) values (1,'胶浆',0,'0|1|',0,1,1,'1','fs:/attachment/goodscat/2018/6/21/10//35492067.png'),(3,'糖果/巧克力',1,'0|1|3|',0,0,5,'1',NULL),(4,'水浆',0,'0|4|',0,2,15,'1','fs:/attachment/goodscat/2018/6/21/10//36102585.png'),(5,'进口乳制品',4,'0|4|5|',0,0,15,'1',NULL),(10,'巧克力',3,'0|1|3|10|',0,0,5,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111446033566.jpg'),(11,'糖果',3,'0|1|3|11|',0,0,6,'1','http://static.v4.javamall.com.cn/attachment/brand/201202221658088525.jpg'),(12,'口香糖',3,'0|1|3|12|',0,0,7,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034360.jpg'),(13,'饮料',1,'0|1|13|',0,0,8,'1',NULL),(14,'碳酸饮料',13,'0|1|13|14|',0,0,8,'1','http://static.b2b2cv2.javamall.com.cn/attachment/brand/201506021638079631.jpg'),(15,'茶饮料',13,'0|1|13|15|',0,0,10,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034362.jpg'),(16,'果汁',13,'0|1|13|16|',0,0,9,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201610201481034042.jpg'),(17,'水',13,'0|1|13|17|',0,0,11,'1','http://static.b2b2cv2.javamall.com.cn/attachment/brand/2016/5/28/16//30113688.jpg'),(18,'酒水',1,'0|1|18|',0,0,12,'1',NULL),(19,'白酒',18,'0|1|18|19|',0,0,12,'1','http://static.v4.javamall.com.cn/attachment/brand/201202221742498256.jpg'),(20,'啤酒',18,'0|1|18|20|',0,0,13,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201610061481034256.jpg'),(21,'洋酒',18,'0|1|18|21|',0,0,14,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201610081481032684.jpg'),(22,'进品牛奶',5,'0|4|5|22|',0,0,15,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111447274164.jpg'),(23,'进品酸奶',5,'0|4|5|23|',0,0,16,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111448195036.jpg'),(24,'进口饼干糕点',4,'0|4|24|',0,0,16,'1',NULL),(25,'进口饼干',24,'0|4|24|25|',0,0,17,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034364.jpg'),(26,'进口糕点',24,'0|4|24|26|',0,0,17,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034366.jpg'),(27,'进口咖啡/茶品',4,'0|4|27|',0,0,18,'1',NULL),(28,'进口红茶',27,'0|4|27|28|',0,0,18,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034368.jpg'),(29,'进口绿茶',27,'0|4|27|29|',0,0,18,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034369.jpg'),(30,'进口速溶咖啡',27,'0|4|27|30|',0,0,19,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034370.jpg'),(31,'进口休闲零食',4,'0|4|31|',0,0,20,'1',NULL),(32,'进口膨化',31,'0|4|31|32|',0,0,20,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034371.jpg'),(33,'进口海产品',31,'0|4|31|33|',0,0,21,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034372.jpg'),(34,'进口果冻/布丁',31,'0|4|31|34|',0,0,22,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034373.jpg'),(35,'辅助材料',0,'0|35|',0,20,1,'1','fs:/attachment/goodscat/2018/6/21/10//37252426.png'),(36,'潮流女包',35,'0|35|36|',0,0,1,'1',NULL),(37,'单肩包',36,'0|35|36|37|',0,0,23,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111533123303.jpg'),(38,'制版材料',0,'0|38|',0,3,24,'1','fs:/attachment/goodscat/2018/6/21/10//36407599.png'),(39,'面部护肤',38,'0|38|39|',0,0,24,'1',NULL),(40,'洁面',39,'0|38|39|40|',0,0,24,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111457449261.jpg'),(41,'柔肤水/爽肤水',39,'0|38|39|41|',0,0,24,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111459279002.jpg'),(42,'乳液',39,'0|38|39|42|',0,0,24,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111500254938.jpg'),(43,'眼部保养',38,'0|38|43|',0,0,25,'1',NULL),(44,'眼部精华',43,'0|38|43|44|',0,0,25,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034374.jpg'),(45,'眼霜',43,'0|38|43|45|',0,0,25,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034375.jpg'),(46,'眼膜',43,'0|38|43|46|',0,0,25,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034376.jpg'),(47,'男士护理',38,'0|38|47|',0,0,26,'1',NULL),(48,'男士洁面',47,'0|38|47|48|',0,0,26,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034377.jpg'),(49,'男士护肤',47,'0|38|47|49|',0,0,26,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034378.jpg'),(50,'须后水',47,'0|38|47|50|',0,0,26,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034379.jpg'),(51,'洗发护发',38,'0|38|51|',0,0,27,'1',NULL),(52,'去屑型洗发水',51,'0|38|51|52|',0,0,27,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034380.jpg'),(53,'柔顺型洗发水',51,'0|38|51|53|',0,0,27,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034381.jpg'),(54,'修复型洗发水',51,'0|38|51|54|',0,0,27,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034382.jpg'),(55,'滋润营养洗发水',51,'0|38|51|55|',0,0,27,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034383.jpg'),(56,'油墨',0,'0|56|',0,4,28,'1','fs:/attachment/goodscat/2018/6/21/10//36565171.png'),(57,'奶粉系列',56,'0|56|57|',0,0,28,'1',NULL),(58,'1段奶粉',57,'0|56|57|58|',0,0,28,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111512253546.jpg'),(59,'2段奶粉',57,'0|56|57|59|',0,0,28,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111512336298.jpg'),(60,'3段奶粉',57,'0|56|57|60|',0,0,28,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111512402062.jpg'),(61,'特殊配方奶粉',57,'0|56|57|61|',0,0,28,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111513478356.jpg'),(62,'防尿用品',56,'0|56|62|',0,0,29,'1',NULL),(63,'纸尿裤',62,'0|56|62|63|',0,0,29,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111516097152.jpg'),(64,'婴儿湿巾',62,'0|56|62|64|',0,0,30,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111517031945.jpg'),(65,'尿布/尿垫',62,'0|56|62|65|',0,0,31,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111518009531.jpg'),(66,'辅食',56,'0|56|66|',0,0,32,'1',NULL),(67,'米粉',66,'0|56|66|67|',0,0,32,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034385.jpg'),(68,'婴儿果汁',66,'0|56|66|68|',0,0,33,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034386.jpg'),(69,'面条',66,'0|56|66|69|',0,0,34,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034387.jpg'),(70,'饼干/磨牙棒',66,'0|56|66|70|',0,0,34,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034388.jpg'),(71,'清洁用品',56,'0|56|71|',0,0,35,'1',NULL),(72,'澡盆/浴床',71,'0|56|71|72|',0,0,35,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034389.jpg'),(73,'奶瓶/餐具清洁',71,'0|56|71|73|',0,0,36,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034390.jpg'),(74,'幼儿口腔护理',71,'0|56|71|74|',0,0,37,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034391.jpg'),(75,'纺织/用品',56,'0|56|75|',0,0,38,'1',NULL),(76,'床单/枕头',75,'0|56|75|76|',0,0,38,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034392.jpg'),(77,'浴巾/毛巾',75,'0|56|75|77|',0,0,39,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034393.jpg'),(78,'抱被',75,'0|56|75|78|',0,0,40,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034394.jpg'),(79,'色浆',0,'0|79|',0,5,41,'1','fs:/attachment/goodscat/2018/6/21/10//37120136.png'),(80,'锅具水壶',79,'0|79|80|',0,0,41,'1',NULL),(81,'汤锅',80,'0|79|80|81|',0,0,41,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111525058004.jpg'),(82,'水壶',80,'0|79|80|82|',0,0,42,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111525135203.jpg'),(83,'炒锅',80,'0|79|80|83|',0,0,43,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111525228948.jpg'),(84,'奶锅',80,'0|79|80|84|',0,0,44,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111525338422.jpg'),(85,'特殊浆',0,'0|85|',0,20,1,'1','fs:/attachment/goodscat/2018/6/21/10//37463569.png'),(86,'机械设备',0,'0|86|',0,21,47,'1','fs:/attachment/goodscat/2018/6/21/10//38030847.png'),(91,'男装',86,'0|86|91|',0,0,46,'1',NULL),(92,'短裤',91,'0|86|91|92|',0,0,46,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201509111603512346.jpg'),(93,'裙子',86,'0|86|93|',0,0,48,'1',NULL),(94,'旅行箱',35,'0|35|94|',0,2,49,'1',NULL),(95,'手提包',36,'0|35|36|95|',0,0,50,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034395.jpg'),(96,'斜挎包',36,'0|35|36|96|',0,0,50,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034396.jpg'),(97,'万向轮箱',94,'0|35|94|97|',0,0,49,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034397.jpg'),(98,'硬质旅行箱',94,'0|35|94|98|',0,0,49,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034398.jpg'),(99,'拉杆旅行箱',94,'0|35|94|99|',0,0,49,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034399.jpg'),(100,'精品男包',35,'0|35|100|',0,0,51,'1',NULL),(101,'斜挎包',100,'0|35|100|101|',0,0,51,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034410.jpg'),(102,'手提包',100,'0|35|100|102|',0,0,51,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034411.jpg'),(103,'商场同款',100,'0|35|100|103|',0,0,51,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034412.jpg'),(104,'黄金珠宝',35,'0|35|104|',0,0,52,'1',NULL),(105,'黄金吊坠',104,'0|35|104|105|',0,0,52,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034413.jpg'),(106,'黄金手链',104,'0|35|104|106|',0,0,52,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034414.jpg'),(107,'黄金戒指',104,'0|35|104|107|',0,0,52,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034416.jpg'),(108,'女装',86,'0|86|108|',0,0,54,'1',NULL),(109,'针织衫',108,'0|86|108|109|',0,0,54,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034417.jpg'),(110,'户外运动',86,'0|86|110|',0,0,57,'1',NULL),(111,'长袖衬衫',91,'0|86|91|111|',0,0,53,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034418.jpg'),(112,'短袖T恤 ',91,'0|86|91|112|',0,0,53,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034419.jpg'),(113,'短裙',93,'0|86|93|113|',0,0,54,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034420.jpg'),(114,'连衣裙',93,'0|86|93|114|',0,0,54,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034421.jpg'),(115,'百褶裙',93,'0|86|93|115|',0,0,54,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034422.jpg'),(116,'羊毛衫',108,'0|86|108|116|',0,0,54,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034423.jpg'),(117,'小西服',108,'0|86|108|117|',0,0,54,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034424.jpg'),(118,'冲锋衣',110,'0|86|110|118|',0,0,57,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034425.jpg'),(119,'登山用品',110,'0|86|110|119|',0,0,57,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034426.jpg'),(120,'速干衣',110,'0|86|110|120|',0,0,57,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/201612061481034427.jpg'),(127,'营养保健',85,'0|85|127|',0,20,1,'1',NULL),(158,'营养保健',127,'0|85|127|158|',0,20,1,'1','http://static.b2b2cv2.javamall.com.cn/attachment/goodscat/585a1c09N5725b4bd.jpg!q50.jpg');

/*Table structure for table `es_goods_complex` */

DROP TABLE IF EXISTS `es_goods_complex`;

CREATE TABLE `es_goods_complex` (
  `goods_1` int(8) NOT NULL,
  `goods_2` int(8) NOT NULL,
  `manual` varchar(4) DEFAULT NULL,
  `rate` int(8) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_complex` */

/*Table structure for table `es_goods_depot` */

DROP TABLE IF EXISTS `es_goods_depot`;

CREATE TABLE `es_goods_depot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `iscmpl` int(8) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `es_goods_room_goods_index2` (`depotid`,`iscmpl`),
  KEY `es_goods_room_goods_index1` (`goodsid`,`depotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_depot` */

/*Table structure for table `es_goods_field` */

DROP TABLE IF EXISTS `es_goods_field`;

CREATE TABLE `es_goods_field` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `china_name` varchar(255) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `pluginid` varchar(255) DEFAULT NULL,
  `config` longtext,
  `add_time` bigint(20) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `is_validate` int(8) DEFAULT NULL,
  `field_sort` int(10) DEFAULT NULL,
  `is_show` int(8) DEFAULT NULL,
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_field` */

/*Table structure for table `es_goods_gallery` */

DROP TABLE IF EXISTS `es_goods_gallery`;

CREATE TABLE `es_goods_gallery` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  `tiny` varchar(255) DEFAULT NULL,
  `isdefault` int(11) DEFAULT '0',
  `sort` int(10) DEFAULT '0',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_gallery` */

insert  into `es_goods_gallery`(`img_id`,`goods_id`,`thumbnail`,`small`,`big`,`original`,`tiny`,`isdefault`,`sort`) values (338,271,'http://static.v5.javamall.com.cn/attachment/goods/201511240235039360_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235039360_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235039360_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235039360.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235039360_tiny.jpg',1,0),(339,271,'http://static.v5.javamall.com.cn/attachment/goods/201511240235032194_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235032194_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235032194_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235032194.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235032194_tiny.jpg',0,0),(340,271,'http://static.v5.javamall.com.cn/attachment/goods/201511240235033598_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235033598_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235033598_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235033598.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235033598_tiny.jpg',0,0),(341,271,'http://static.v5.javamall.com.cn/attachment/goods/201511240235049715_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235049715_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235049715_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235049715.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235049715_tiny.jpg',0,0),(342,271,'http://static.v5.javamall.com.cn/attachment/goods/201511240235046520_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235046520_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235046520_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235046520.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511240235046520_tiny.jpg',0,0),(370,280,'http://static.v5.javamall.com.cn/attachment/goods/201511241134546958_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134546958_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134546958_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134546958.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134546958_tiny.jpg',1,0),(371,280,'http://static.v5.javamall.com.cn/attachment/goods/201511241134542893_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134542893_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134542893_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134542893.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134542893_tiny.jpg',0,0),(372,280,'http://static.v5.javamall.com.cn/attachment/goods/201511241134552559_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134552559_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134552559_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134552559.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134552559_tiny.jpg',0,0),(373,280,'http://static.v5.javamall.com.cn/attachment/goods/201511241134557526_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134557526_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134557526_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134557526.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134557526_tiny.jpg',0,0),(374,280,'http://static.v5.javamall.com.cn/attachment/goods/201511241134558842_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134558842_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134558842_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134558842.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241134558842_tiny.jpg',0,0),(375,281,'http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157540387.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157540387_tiny.jpg',1,0),(376,281,'http://static.v5.javamall.com.cn/attachment/goods/201511241157547102_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157547102_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157547102_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157547102.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157547102_tiny.jpg',0,0),(377,281,'http://static.v5.javamall.com.cn/attachment/goods/201511241157544542_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157544542_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157544542_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157544542.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241157544542_tiny.jpg',0,0),(378,282,'http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204330677.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204330677_tiny.jpg',1,0),(379,282,'http://static.v5.javamall.com.cn/attachment/goods/201511241204339895_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204339895_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204339895_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204339895.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204339895_tiny.jpg',0,0),(380,282,'http://static.v5.javamall.com.cn/attachment/goods/201511241204342497_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204342497_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204342497_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204342497.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204342497_tiny.jpg',0,0),(381,282,'http://static.v5.javamall.com.cn/attachment/goods/201511241204343353_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204343353_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204343353_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204343353.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204343353_tiny.jpg',0,0),(382,282,'http://static.v5.javamall.com.cn/attachment/goods/201511241204348655_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204348655_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204348655_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204348655.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241204348655_tiny.jpg',0,0),(383,283,'http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280361.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280361_tiny.jpg',1,0),(384,283,'http://static.v5.javamall.com.cn/attachment/goods/201511241211280749_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280749_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280749_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280749.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211280749_tiny.jpg',0,0),(385,283,'http://static.v5.javamall.com.cn/attachment/goods/201511241211285225_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211285225_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211285225_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211285225.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211285225_tiny.jpg',0,0),(386,283,'http://static.v5.javamall.com.cn/attachment/goods/201511241211289919_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289919_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289919_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289919.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289919_tiny.jpg',0,0),(387,283,'http://static.v5.javamall.com.cn/attachment/goods/201511241211289179_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289179_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289179_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289179.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241211289179_tiny.jpg',0,0),(388,284,'http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219082665.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219082665_tiny.jpg',1,0),(389,284,'http://static.v5.javamall.com.cn/attachment/goods/201511241219089973_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219089973_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219089973_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219089973.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219089973_tiny.jpg',0,0),(390,284,'http://static.v5.javamall.com.cn/attachment/goods/201511241219090138_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219090138_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219090138_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219090138.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219090138_tiny.jpg',0,0),(391,284,'http://static.v5.javamall.com.cn/attachment/goods/201511241219092594_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219092594_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219092594_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219092594.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241219092594_tiny.jpg',0,0),(392,285,'http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000607.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000607_tiny.jpg',1,1),(393,285,'http://static.v5.javamall.com.cn/attachment/goods/201511241228000800_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000800_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000800_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000800.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228000800_tiny.jpg',0,2),(394,285,'http://static.v5.javamall.com.cn/attachment/goods/201511241228007675_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228007675_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228007675_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228007675.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228007675_tiny.jpg',0,3),(395,285,'http://static.v5.javamall.com.cn/attachment/goods/201511241228018196_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018196_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018196_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018196.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018196_tiny.jpg',0,4),(396,285,'http://static.v5.javamall.com.cn/attachment/goods/201511241228018254_thumbnail.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018254_small.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018254_big.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018254.jpg','http://static.v5.javamall.com.cn/attachment/goods/201511241228018254_tiny.jpg',0,5);

/*Table structure for table `es_goods_lv_price` */

DROP TABLE IF EXISTS `es_goods_lv_price`;

CREATE TABLE `es_goods_lv_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `productid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `lvid` int(10) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_lv_price` */

/*Table structure for table `es_goods_snapshot` */

DROP TABLE IF EXISTS `es_goods_snapshot`;

CREATE TABLE `es_goods_snapshot` (
  `snapshot_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `edit_time` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `sn` varchar(200) DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `type_id` int(8) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `unit` varchar(20) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `market_enable` int(8) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `intro` longtext,
  `price` decimal(20,2) DEFAULT NULL,
  `cost` decimal(20,2) DEFAULT NULL,
  `mktprice` decimal(20,2) DEFAULT NULL,
  `params` longtext,
  `specs` longtext,
  `have_spec` int(8) DEFAULT NULL,
  `adjuncts` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `last_modify` bigint(20) DEFAULT NULL,
  `view_count` int(10) DEFAULT NULL,
  `buy_count` int(10) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  `point` int(8) DEFAULT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(1000) DEFAULT NULL,
  `meta_description` varchar(1000) DEFAULT NULL,
  `p20` varchar(255) DEFAULT NULL,
  `p19` varchar(255) DEFAULT NULL,
  `p18` varchar(255) DEFAULT NULL,
  `p17` varchar(255) DEFAULT NULL,
  `p16` varchar(255) DEFAULT NULL,
  `p15` varchar(255) DEFAULT NULL,
  `p14` varchar(255) DEFAULT NULL,
  `p13` varchar(255) DEFAULT NULL,
  `p12` varchar(255) DEFAULT NULL,
  `p11` varchar(255) DEFAULT NULL,
  `p10` varchar(255) DEFAULT NULL,
  `p9` varchar(255) DEFAULT NULL,
  `p8` varchar(255) DEFAULT NULL,
  `p7` varchar(255) DEFAULT NULL,
  `p6` varchar(255) DEFAULT NULL,
  `p5` varchar(255) DEFAULT NULL,
  `p4` varchar(255) DEFAULT NULL,
  `p3` varchar(255) DEFAULT NULL,
  `p2` varchar(255) DEFAULT NULL,
  `p1` varchar(255) DEFAULT NULL,
  `sord` int(10) DEFAULT '0',
  `have_field` int(8) DEFAULT '0',
  `grade` int(10) DEFAULT '0',
  `goods_comment` longtext,
  `is_pack` int(8) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`snapshot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_snapshot` */

/*Table structure for table `es_goods_snapshot_gallery` */

DROP TABLE IF EXISTS `es_goods_snapshot_gallery`;

CREATE TABLE `es_goods_snapshot_gallery` (
  `img_id` int(11) DEFAULT NULL,
  `snapshot_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `small` varchar(255) DEFAULT NULL,
  `big` varchar(255) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  `tiny` varchar(255) DEFAULT NULL,
  `isdefault` int(11) DEFAULT '0',
  `sort` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_snapshot_gallery` */

/*Table structure for table `es_goods_spec` */

DROP TABLE IF EXISTS `es_goods_spec`;

CREATE TABLE `es_goods_spec` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_id` int(8) DEFAULT NULL,
  `spec_value_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_spec_goods_index` (`goods_id`),
  KEY `ind_spec_goods_value` (`spec_id`,`spec_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_spec` */

insert  into `es_goods_spec`(`id`,`spec_id`,`spec_value_id`,`goods_id`,`product_id`) values (128,1,44,280,360),(129,2,10,280,360),(130,1,45,280,361),(131,2,10,280,361),(132,1,57,280,362),(133,2,10,280,362),(134,1,41,280,363),(135,2,10,280,363),(136,1,56,281,364),(137,1,48,281,365),(138,1,41,281,366),(139,1,54,281,367),(140,1,44,282,368),(141,2,10,282,368),(142,1,44,282,369),(143,2,11,282,369),(144,1,41,282,370),(145,2,10,282,370),(146,1,41,282,371),(147,2,11,282,371),(148,1,43,282,372),(149,2,10,282,372),(150,1,43,282,373),(151,2,11,282,373),(164,1,50,283,374),(165,2,9,283,374),(166,1,50,283,375),(167,2,13,283,375),(168,1,50,283,376),(169,2,14,283,376),(170,1,55,283,377),(171,2,9,283,377),(172,1,55,283,378),(173,2,13,283,378),(174,1,55,283,379),(175,2,14,283,379),(176,1,44,284,380),(177,2,16,284,380),(178,1,44,284,381),(179,2,39,284,381),(180,1,48,284,382),(181,2,16,284,382),(182,1,48,284,383),(183,2,39,284,383),(184,1,43,284,384),(185,2,16,284,384),(186,1,43,284,385),(187,2,39,284,385);

/*Table structure for table `es_goods_type` */

DROP TABLE IF EXISTS `es_goods_type`;

CREATE TABLE `es_goods_type` (
  `type_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `props` longtext,
  `params` longtext,
  `disabled` int(8) DEFAULT NULL,
  `is_physical` int(8) DEFAULT NULL,
  `have_prop` int(8) DEFAULT NULL,
  `have_parm` int(8) DEFAULT NULL,
  `join_brand` int(8) DEFAULT NULL,
  `have_field` int(8) DEFAULT '0',
  `join_spec` int(8) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `es_goods_type` */

insert  into `es_goods_type`(`type_id`,`name`,`props`,`params`,`disabled`,`is_physical`,`have_prop`,`have_parm`,`join_brand`,`have_field`,`join_spec`) values (1,'坚果','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"杯装\",\"袋装\",\"礼盒装\",\"盒装\",\"罐装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"杯装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"礼盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"}],\"options\":\"杯装,袋装,礼盒装,盒装,罐装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"规格参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"重量\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产品标准号\",\"value\":\"\",\"valueList\":[]},{\"name\":\"生产日期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储存方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"配料\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"厂家\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":9}]',0,0,1,1,1,0,0),(2,'蜜饯','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0],\"optionAr\":[\"袋装\",\"礼盒装\",\"盒装\",\"罐装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"礼盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"}],\"options\":\"袋装,礼盒装,盒装,罐装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"重量\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":6}]',1,0,1,1,1,0,0),(3,'肉干','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0],\"optionAr\":[\"袋装\",\"礼盒装\",\"盒装\",\"罐装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"礼盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"}],\"options\":\"袋装,礼盒装,盒装,罐装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":7}]',1,0,1,1,1,0,0),(4,'薯片','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0],\"optionAr\":[\"袋装\",\"盒装\",\"罐装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"}],\"options\":\"袋装,盒装,罐装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',1,0,1,1,1,0,0),(5,'巧克力','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0],\"optionAr\":[\"礼盒\",\"盒装\",\"罐装\",\"袋装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"礼盒\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"}],\"options\":\"礼盒,盒装,罐装,袋装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储存方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":6}]',0,0,1,1,1,0,0),(6,'糖果','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0],\"optionAr\":[\"盒装\",\"罐装\",\"袋装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"}],\"options\":\"盒装,罐装,袋装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"配料\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保存方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,1,1,1,0,0),(7,'口香糖',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储存方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":3}]',0,0,0,1,1,0,0),(8,'碳酸饮料','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"组合包装\",\"nums\":[0,0],\"optionAr\":[\"单瓶装\",\"组合装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"单瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"组合装\"}],\"options\":\"单瓶装,组合装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"瓶装\",\"听装\",\"袋装\",\"箱装\",\"盒装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"听装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"箱装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"}],\"options\":\"瓶装,听装,袋装,箱装,盒装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,1,1,1,0,0),(9,'果汁','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"组合包装\",\"nums\":[0,0],\"optionAr\":[\"单瓶装\",\"组合装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"单瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"组合装\"}],\"options\":\"单瓶装,组合装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"瓶装\",\"听装\",\"袋装\",\"箱装\",\"盒装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"听装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"箱装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"}],\"options\":\"瓶装,听装,袋装,箱装,盒装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":7}]',0,0,1,1,1,0,0),(10,'茶饮料','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"组合包装\",\"nums\":[0,0],\"optionAr\":[\"单瓶装\",\"组合装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"单瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"组合装\"}],\"options\":\"单瓶装,组合装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0],\"optionAr\":[\"瓶装\",\"听装\",\"箱装\",\"盒装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"听装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"箱装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"}],\"options\":\"瓶装,听装,箱装,盒装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储存方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"配料\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(11,'水','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"组合包装\",\"nums\":[0,0],\"optionAr\":[\"单瓶装\",\"组合装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"单瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"组合装\"}],\"options\":\"单瓶装,组合装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0],\"optionAr\":[\"瓶装\",\"听装\",\"袋装 \"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"瓶装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"听装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装 \"}],\"options\":\"瓶装,听装,袋装 \",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,1,1,1,0,0),(12,'白酒',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"香型\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"原料\",\"value\":\"\",\"valueList\":[]},{\"name\":\"酒精度\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":9}]',0,0,0,1,1,0,0),(13,'啤酒',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,0,1,1,0,0),(14,'洋酒','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"葡萄酒种类\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"葡萄品种\",\"value\":\"\",\"valueList\":[]},{\"name\":\"级别\",\"value\":\"\",\"valueList\":[]},{\"name\":\"酒精度\",\"value\":\"\",\"valueList\":[]},{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"香味\",\"value\":\"\",\"valueList\":[]},{\"name\":\"色泽\",\"value\":\"\",\"valueList\":[]},{\"name\":\"搭配菜肴\",\"value\":\"\",\"valueList\":[]},{\"name\":\"建议醒酒时间\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":10}]',0,0,1,1,1,0,0),(15,'进口牛奶','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"品种\",\"nums\":[0,0,0,0],\"optionAr\":[\"全脂\",\"低脂\",\"脱脂\",\"有机\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"全脂\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"低脂\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"脱脂\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"有机\"}],\"options\":\"全脂,低脂,脱脂,有机\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"口味\",\"nums\":[0],\"optionAr\":[\"纯牛奶\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯牛奶\"}],\"options\":\"纯牛奶\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[0,0,0,0,0,0],\"optionAr\":[\"澳大利亚\",\"其他国家和地区\",\"美国\",\"德国\",\"法国\",\"新西兰\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"澳大利亚\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他国家和地区\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"美国\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"德国\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"法国\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"新西兰\"}],\"options\":\"澳大利亚,其他国家和地区,美国,德国,法国,新西兰\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成份\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,1,1,1,0,0),(16,'进品酸奶','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"品种\",\"nums\":[0,0],\"optionAr\":[\"酸奶\",\"全脂\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"酸奶\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"全脂\"}],\"options\":\"酸奶,全脂\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"类型\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"贮存条件\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(17,'进口糕点','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0],\"optionAr\":[\"盒装\",\"罐装\",\"袋装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"}],\"options\":\"盒装,罐装,袋装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"口味\",\"nums\":[0,0,0,0],\"optionAr\":[\"甜味\",\"咸味\",\"夹心\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"甜味\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"咸味\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"夹心\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"甜味,咸味,夹心,其他\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,1,1,1,0,0),(18,'进品茶品','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,1,1,1,0,0),(19,'进口速溶咖啡','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0],\"optionAr\":[\"盒装\",\"瓶装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"瓶装\"}],\"options\":\"盒装,瓶装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"口味\",\"nums\":[0,0,0,0],\"optionAr\":[\"白咖啡\",\"卡布奇诺\",\"其它\",\"特色咖啡\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"白咖啡\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"卡布奇诺\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其它\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"特色咖啡\"}],\"options\":\"白咖啡,卡布奇诺,其它,特色咖啡\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"原产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,1,1,1,0,0),(20,'进口膨化','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"口味\",\"nums\":[0,0,0],\"optionAr\":[\"巧克力\",\"奶油\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"巧克力\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"奶油\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"巧克力,奶油,其他\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0],\"optionAr\":[\"罐装\",\"袋装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"罐装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"}],\"options\":\"罐装,袋装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"其他国家和地区\",\"美国\",\"泰国\",\"中国台湾\",\"日本\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他国家和地区\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"美国\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"泰国\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"中国台湾\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"日本\"}],\"options\":\"其他国家和地区,美国,泰国,中国台湾,日本\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"原产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,1,1,1,0,0),(21,'进口海产品','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"口味\",\"nums\":[0,0,0,0],\"optionAr\":[\"烧烤味\",\"原味\",\"香辣味\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"烧烤味\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"原味\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"香辣味\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"烧烤味,原味,香辣味,其他\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"原产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":8}]',0,0,1,1,1,0,0),(22,'进口果冻/布丁','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"包装\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"袋装\",\"盒装\",\"托装\",\"卡通装\",\"杯装\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"袋装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"盒装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"托装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"卡通装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"杯装\"}],\"options\":\"袋装,盒装,托装,卡通装,杯装\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"口味\",\"nums\":[0,0,0],\"optionAr\":[\"水果\",\"巧克力\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"水果\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"巧克力\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"水果,巧克力,其他\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"其他国家和地区\",\"美国\",\"中国台湾\",\"法国\",\"马来西亚 \"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他国家和地区\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"美国\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"中国台湾\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"法国\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"马来西亚 \"}],\"options\":\"其他国家和地区,美国,中国台湾,法国,马来西亚 \",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格(重量)\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品形态\",\"value\":\"\",\"valueList\":[]},{\"name\":\"食用方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":7}]',0,0,1,1,1,0,0),(23,'单肩包','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"开袋方式\",\"nums\":[0,0],\"optionAr\":[\"包盖式\",\"搭扣\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"包盖式\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"搭扣\"}],\"options\":\"包盖式,搭扣\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"货号\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":1}]',0,0,1,1,1,0,0),(24,'面部护肤','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"功效\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产品成分\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保存方法\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":6}]',0,0,1,1,1,0,0),(25,'眼部保养','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"性状\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(26,'男士护理','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"功能\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(27,'洗发护发','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"类别\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"功能\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"ml\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质天数\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,1,1,1,0,0),(28,'奶粉系列','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"年龄\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[0,0,0],\"optionAr\":[\"400g\",\"900g\",\"其它\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"400g\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"900g\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其它\"}],\"options\":\"400g,900g,其它\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"产地\",\"nums\":[0,0],\"optionAr\":[\"国产\",\"进口\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"国产\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"进口\"}],\"options\":\"国产,进口\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"配方\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(29,'纸尿裤','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"人群\",\"nums\":[0,0,0],\"optionAr\":[\"女宝宝\",\"男宝宝\",\"其它\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"女宝宝\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"男宝宝\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其它\"}],\"options\":\"女宝宝,男宝宝,其它\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"型号\",\"nums\":[0,0,0,0,0,0,0],\"optionAr\":[\"NB\",\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"其它\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"NB\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"S\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"M\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"L\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"XL\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"XXL\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其它\"}],\"options\":\"NB,S,M,L,XL,XXL,其它\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成份\",\"value\":\"\",\"valueList\":[]},{\"name\":\"型号\",\"value\":\"\",\"valueList\":[]},{\"name\":\"适合体重\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地说明\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":7}]',0,0,1,1,1,0,0),(30,'婴儿湿巾','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[0,0,0,0],\"optionAr\":[\"10片装\",\"30片装\",\"80片装\",\"其它\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"10片装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"30片装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"80片装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其它\"}],\"options\":\"10片装,30片装,80片装,其它\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质天数\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,1,1,1,0,0),(31,'尿布/尿垫',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"包装规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产品尺寸\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"颜色\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品清单\",\"value\":\"\",\"valueList\":[]},{\"name\":\"材质\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":6}]',0,0,0,1,1,0,0),(32,'米粉',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"原产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"储藏方法\",\"value\":\"\",\"valueList\":[]},{\"name\":\"配料\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,0,1,1,0,0),(33,'婴儿果汁','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"g\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]},{\"name\":\"适用年龄\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"配料\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(34,'面条/饼干/磨牙棒','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"g\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"适用年龄\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]},{\"name\":\"配料\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,1,1,1,0,0),(35,'澡盆/浴床',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"颜色\",\"value\":\"\",\"valueList\":[]},{\"name\":\"用途\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,0,1,1,0,0),(36,'奶瓶/餐具清洁','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[0,0],\"optionAr\":[\"500ml\",\"其它\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"500ml\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其它\"}],\"options\":\"500ml,其它\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]},{\"name\":\"材质\",\"value\":\"\",\"valueList\":[]},{\"name\":\"保质期\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(37,'幼儿口腔护理','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[0,0],\"optionAr\":[\"1个装\",\"其它\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"1个装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其它\"}],\"options\":\"1个装,其它\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成分\",\"value\":\"\",\"valueList\":[]},{\"name\":\"颜色\",\"value\":\"\",\"valueList\":[]},{\"name\":\"适用人群\",\"value\":\"\",\"valueList\":[]},{\"name\":\"产地\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(38,'床单/枕头',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"颜色\",\"value\":\"\",\"valueList\":[]},{\"name\":\"材质\",\"value\":\"\",\"valueList\":[]},{\"name\":\"重量\",\"value\":\"\",\"valueList\":[]},{\"name\":\"包装\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,0,1,1,0,0),(39,'浴巾/毛巾',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"面料\",\"value\":\"\",\"valueList\":[]},{\"name\":\"颜色\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,0,1,1,0,0),(40,'抱被',NULL,'[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"成份\",\"value\":\"\",\"valueList\":[]},{\"name\":\"填充物\",\"value\":\"\",\"valueList\":[]},{\"name\":\"洗涤方式\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,0,1,1,0,0),(41,'汤锅','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"适用电磁炉\",\"nums\":[0,0],\"optionAr\":[\"是\",\"否\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"是\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"否\"}],\"options\":\"是,否\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"材质\",\"nums\":[0,0,0,0],\"optionAr\":[\"不锈钢\",\"铝合金\",\"搪瓷\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"不锈钢\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"铝合金\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"搪瓷\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"不锈钢,铝合金,搪瓷,其他\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[0,0,0,0,0,0,0,0],\"optionAr\":[\"16cm\",\"4L\",\"2.3L\",\"24cm\",\"22cm\",\"20cm\",\"18cm\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"16cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"4L\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"2.3L\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"24cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"22cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"20cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"18cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"16cm,4L,2.3L,24cm,22cm,20cm,18cm,其他\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"材质\",\"value\":\"\",\"valueList\":[]},{\"name\":\"型号\",\"value\":\"\",\"valueList\":[]},{\"name\":\"系列\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":5}]',0,0,1,1,1,0,0),(42,'水壶','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"适用电磁炉\",\"nums\":[0,0],\"optionAr\":[\"是\",\"否\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"是\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"否\"}],\"options\":\"是,否\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"材质\",\"nums\":[0,0],\"optionAr\":[\"不锈钢\",\"搪瓷\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"不锈钢\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"搪瓷\"}],\"options\":\"不锈钢,搪瓷\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"材质\",\"value\":\"\",\"valueList\":[]},{\"name\":\"容量\",\"value\":\"\",\"valueList\":[]},{\"name\":\"厚度\",\"value\":\"\",\"valueList\":[]},{\"name\":\"底部直径\",\"value\":\"\",\"valueList\":[]},{\"name\":\"壶身高度\",\"value\":\"\",\"valueList\":[]},{\"name\":\"净重\",\"value\":\"\",\"valueList\":[]},{\"name\":\"毛重\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":7}]',0,0,1,1,1,0,0),(43,'炒锅','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"适用电磁炉\",\"nums\":[0,0],\"optionAr\":[\"是\",\"否\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"是\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"否\"}],\"options\":\"是,否\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"材质\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"铸铁\",\"铝合金\",\"单层不锈钢\",\"精铁\",\"复合不锈钢\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"铸铁\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"铝合金\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"单层不锈钢\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"精铁\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"复合不锈钢\"}],\"options\":\"铸铁,铝合金,单层不锈钢,精铁,复合不锈钢\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"规格\",\"nums\":[0,0,0,0],\"optionAr\":[\"30cm\",\"32cm\",\"34cm\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"30cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"32cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"34cm\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"30cm,32cm,34cm,其他\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"重量\",\"value\":\"\",\"valueList\":[]},{\"name\":\"材质\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,1,1,1,0,0),(44,'奶锅','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"适用电磁炉\",\"nums\":[0,0],\"optionAr\":[\"否\",\"是\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"否\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"是\"}],\"options\":\"否,是\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"材质\",\"nums\":[0,0],\"optionAr\":[\"不锈钢\",\"铝合金\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"不锈钢\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"铝合金\"}],\"options\":\"不锈钢,铝合金\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本参数\",\"paramList\":[{\"name\":\"规格\",\"value\":\"\",\"valueList\":[]},{\"name\":\"上架时间\",\"value\":\"\",\"valueList\":[]},{\"name\":\"重量\",\"value\":\"\",\"valueList\":[]},{\"name\":\"材质\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":4}]',0,0,1,1,1,0,0),(45,'U盘','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"速度\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"尺寸\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"操作温度\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":1,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]','[{\"name\":\"基本信息\",\"paramList\":[{\"name\":\"商品尺寸\",\"value\":\"\",\"valueList\":[]},{\"name\":\"商品重量\",\"value\":\"\",\"valueList\":[]}],\"paramNum\":2}]',1,0,1,1,1,0,0),(46,'休闲短裤','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"剪裁\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":2,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"花色\",\"nums\":[0,0,0,0,0,0,0,0],\"optionAr\":[\"纯色\",\"条纹\",\"印花\",\"竖条纹\",\"格纹\",\"水洗\",\"渐变色水洗\",\"色织\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯色\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"条纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"印花\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"竖条纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"格纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"水洗\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"渐变色水洗\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"色织\"}],\"options\":\"纯色,条纹,印花,竖条纹,格纹,水洗,渐变色水洗,色织\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"款式\",\"nums\":[0,0,0,0],\"optionAr\":[\"直筒\",\"修身\",\"卷边\",\"合体\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"直筒\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"修身\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"卷边\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"合体\"}],\"options\":\"直筒,修身,卷边,合体\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"系列\",\"nums\":[0,0,0,0,0,0,0,0,0,0,0],\"optionAr\":[\"经典\",\"经典休闲系列\",\"英伦风情系列\",\"潮流炫彩系列\",\"卡其裤风行系列\",\"随意棉麻系列\",\"个性工装\",\"时尚潮人\",\"休闲短裤\",\"经典款\",\"时尚款\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"经典\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"经典休闲系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"英伦风情系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"潮流炫彩系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"卡其裤风行系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"随意棉麻系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"个性工装\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"时尚潮人\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"休闲短裤\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"经典款\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"时尚款\"}],\"options\":\"经典,经典休闲系列,英伦风情系列,潮流炫彩系列,卡其裤风行系列,随意棉麻系列,个性工装,时尚潮人,休闲短裤,经典款,时尚款\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"细节\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":2,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"腰型\",\"nums\":[0,0,0],\"optionAr\":[\"低腰\",\"中低腰\",\"中腰\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"低腰\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"中低腰\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"中腰\"}],\"options\":\"低腰,中低腰,中腰\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"类别\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"休闲裤\",\"卡其裤\",\"工装裤\",\"炫彩\",\"麻棉\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"休闲裤\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"卡其裤\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"工装裤\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"炫彩\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"麻棉\"}],\"options\":\"休闲裤,卡其裤,工装裤,炫彩,麻棉\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"裤型\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":2,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"特色\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":2,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"成分\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":2,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"版型\",\"nums\":[0,0,0],\"optionAr\":[\"修身\",\"合体\",\"宽松\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"修身\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"合体\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"宽松\"}],\"options\":\"修身,合体,宽松\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"图案\",\"nums\":[0,0,0,0,0,0],\"optionAr\":[\"纯色\",\"格纹\",\"条纹\",\"渐变\",\"迷彩\",\"其他\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯色\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"格纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"条纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"渐变\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"迷彩\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"其他\"}],\"options\":\"纯色,格纹,条纹,渐变,迷彩,其他\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]',NULL,0,0,1,0,0,0,0),(47,'服装','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"面料\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"仿天丝\",\"羊毛面料\",\"闪光斜纹面料\",\"聚酯纤维\",\"针织面料\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"仿天丝\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"羊毛面料\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"闪光斜纹面料\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"聚酯纤维\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"针织面料\"}],\"options\":\"仿天丝,羊毛面料,闪光斜纹面料,聚酯纤维,针织面料\",\"required\":0,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]',NULL,0,0,1,0,0,0,0),(48,'裙子','[{\"datatype\":\"\",\"hidden\":0,\"name\":\"季节\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":2,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"系列\",\"nums\":[0,0,0,0,0,0,0,0,0,0,0,0,0,0],\"optionAr\":[\"非洲风\",\"海军风\",\"学院风\",\"田园/森林系\",\"都市风\",\"甜美公主系\",\"休闲百搭\",\"BASIC 经典系列\",\"CITY 城市系列\",\"GIRLY 少女系列\",\"STREET 街头系列\",\"日韩风\",\"欧美风\",\"复古风\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"非洲风\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"海军风\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"学院风\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"田园/森林系\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"都市风\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"甜美公主系\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"休闲百搭\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"BASIC 经典系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"CITY 城市系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"GIRLY 少女系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"STREET 街头系列\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"日韩风\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"欧美风\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"复古风\"}],\"options\":\"非洲风,海军风,学院风,田园/森林系,都市风,甜美公主系,休闲百搭,BASIC 经典系列,CITY 城市系列,GIRLY 少女系列,STREET 街头系列,日韩风,欧美风,复古风\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"花色\",\"nums\":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\"optionAr\":[\"纯色拼接\",\"纯色拼接\",\"蕾丝\",\"纯色+条纹\",\"撞色\",\"格纹\",\"纯色拼贴\",\"提花\",\"条纹拼色\",\"前后幅抄雪花\",\"纯色\",\"格子\",\"条纹拼接\",\"石磨印染\",\"雪花效果\",\"牛仔蓝\",\"条纹\",\"印花\",\"渐变\",\"圆点\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯色拼接\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯色拼接\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"蕾丝\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯色+条纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"撞色\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"格纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯色拼贴\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"提花\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"条纹拼色\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"前后幅抄雪花\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"纯色\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"格子\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"条纹拼接\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"石磨印染\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"雪花效果\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"牛仔蓝\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"条纹\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"印花\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"渐变\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"圆点\"}],\"options\":\"纯色拼接,纯色拼接,蕾丝,纯色+条纹,撞色,格纹,纯色拼贴,提花,条纹拼色,前后幅抄雪花,纯色,格子,条纹拼接,石磨印染,雪花效果,牛仔蓝,条纹,印花,渐变,圆点\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"面料\",\"nums\":[0,0,0,0,0],\"optionAr\":[\"仿天丝\",\"羊毛面料\",\"闪光斜纹面料\",\"聚酯纤维\",\"针织面料\"],\"optionMap\":[{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"仿天丝\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"羊毛面料\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"闪光斜纹面料\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"聚酯纤维\"},{\"num\":0,\"selected\":0,\"url\":\"\",\"name\":\"针织面料\"}],\"options\":\"仿天丝,羊毛面料,闪光斜纹面料,聚酯纤维,针织面料\",\"required\":1,\"type\":3,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]},{\"datatype\":\"\",\"hidden\":0,\"name\":\"细节\",\"nums\":[],\"optionAr\":[],\"optionMap\":[],\"options\":\"\",\"required\":0,\"type\":2,\"unit\":\"\",\"valStr\":\"\",\"value\":\"\",\"valueList\":[]}]',NULL,0,0,1,0,0,0,0),(49,'箱包',NULL,NULL,0,0,1,1,1,0,1),(50,'女包',NULL,NULL,0,0,1,1,1,0,1),(51,'男包',NULL,NULL,0,0,1,1,1,0,1),(52,'贵重金属',NULL,NULL,0,0,1,1,1,0,1),(53,'男装',NULL,NULL,0,0,1,1,1,0,1),(54,'女装',NULL,NULL,0,0,1,1,1,0,1),(55,'帽子',NULL,NULL,1,0,1,1,1,0,1),(56,'女鞋',NULL,NULL,1,0,1,1,1,0,1),(57,'户外运动',NULL,NULL,0,0,1,1,1,0,1),(58,'手机',NULL,NULL,1,0,1,1,1,0,1),(59,'电视',NULL,NULL,1,0,1,1,1,0,1),(60,'音响',NULL,NULL,1,0,1,1,1,0,1),(61,'耳机',NULL,NULL,1,0,1,1,1,0,1),(62,'平板',NULL,NULL,1,0,1,1,1,0,1),(63,'数码',NULL,NULL,1,0,1,1,1,0,1);

/*Table structure for table `es_group_buy_count` */

DROP TABLE IF EXISTS `es_group_buy_count`;

CREATE TABLE `es_group_buy_count` (
  `ruleid` int(10) NOT NULL AUTO_INCREMENT,
  `groupid` int(10) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `num` int(10) DEFAULT NULL,
  PRIMARY KEY (`ruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_group_buy_count` */

/*Table structure for table `es_guestbook` */

DROP TABLE IF EXISTS `es_guestbook`;

CREATE TABLE `es_guestbook` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `parentid` int(8) DEFAULT NULL,
  `dateline` bigint(20) DEFAULT NULL,
  `issubject` int(8) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_guestbook` */

/*Table structure for table `es_helpcenter` */

DROP TABLE IF EXISTS `es_helpcenter`;

CREATE TABLE `es_helpcenter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `lastmodified` bigint(20) DEFAULT NULL,
  `hit` bigint(20) DEFAULT NULL,
  `able_time` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cat_id` int(10) DEFAULT NULL,
  `is_commend` int(11) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT '0',
  `page_title` varchar(255) DEFAULT NULL,
  `page_keywords` varchar(255) DEFAULT NULL,
  `page_description` longtext,
  `site_code` int(11) DEFAULT '100000',
  `siteidlist` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`),
  KEY `ind_helpcenter_catid` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `es_helpcenter` */

insert  into `es_helpcenter`(`id`,`sort`,`add_time`,`lastmodified`,`hit`,`able_time`,`state`,`user_id`,`cat_id`,`is_commend`,`sys_lock`,`page_title`,`page_keywords`,`page_description`,`site_code`,`siteidlist`,`title`,`image`,`content`) values (7,500,1337815832,1450586990,0,NULL,NULL,NULL,21,NULL,0,'关于我们','',NULL,100000,NULL,'关于我们','','<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>关于我们</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">修改本区域内容，请到</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">商店管理后台</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt;</span> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">页面设置<span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt; 文章管理</span></span></span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">关于网站 </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">&nbsp; 关于我们&nbsp; </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">进行编辑</span></strong></span></p><p>\n	本商城是新一代专业消费服务网站。我们利用强大的全球化集约采购优势、丰富的电子商务管理服务经验和最先进的互联网技术为您提供最新最好的产品。</p></li><li><p><strong>成立源起</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	在目前广大购物者渐渐对产品性价比要求越来越高的今天，我们发现必须有一套完善的采购经销体系，才能不断的提高产品质量同时降低产品价格，因此减少产品销 售中间环节成本的增加势在必行。因此我们创办中国网上购物商城网站，让产品在网站上直接面对消费者，一方面网站可以提供比在商店购物中更为详尽的资料、历 史渊源以及顾客评论等信息，顾客可以方便的从琳琅满目的各类商品中快速查询出需要的产品；另一方面也大大的减少商店运营成本，将价格实惠转让给顾客。</p></li><li><p><br/></p></li><li><p><strong>定位</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	本商城所登录的商品全部是经过我们在千百种产品中精挑细选出的精品，每一件商品都有自己的特色，每件产品在登录之前都经过网站编辑的层层筛选，这个将是我们自始至终所坚定的服务原则。</p></li><li><p><strong>承诺</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	我们承诺提供权威的资讯、最低的价格和便捷的购物方式，为您打造全新的e时代购物新体验！我们承诺严格按照国家法规政策正规经营，经营的产品皆为正规渠道 引进合法缴税的原装正品，有着完善的保修、退货与售后服务制度。为了让您更准确全面的了解您所需要的商品，我们的每一件商品都提供100%实样的高清晰数 码照片、详尽的技术性能指标和制造厂商的介绍。同时采用多种便捷的支付方式和安全快速的配送体系，通过先进的互联网技术进行订单的实时跟踪，并保证每一位 客户资料的安全与保密。</p></li></ul>'),(8,490,1337816076,1450587000,0,NULL,NULL,NULL,21,NULL,0,'联系我们','',NULL,100000,NULL,'联系我们','','<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>联系我们</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">修改本区域内容，请到</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">商店管理后台</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt;</span>&nbsp;页面设置<span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt; 文章管理</span></span></span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">关于网站 &gt;&gt;</span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> 联系我们&nbsp; </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">进行编辑</span></strong></span></p><p>\n		热心细致的服务态度打造温暖亲切的购物氛围。</p><table class=\"liststyle data\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody><tr><th>\n					服务热线：</th><td>\n					010-88888888&nbsp; <span class=\"g\"><span style=\"color:#666666\">(工作时间竭诚为您服务)<br/>\n					热线服务时间：<br/>\n					周一～周五 09：00－18：00<br/>\n					周六、周日以及公共假期 12：00－17：00</span></span></td></tr><tr><th>\n					电子邮箱：</th><td><a href=\"mailto:storesupport@ourstore.com.cn.net\">webmaster@javamall.com</a></td></tr><tr><th>\n					商店留言：</th><td>\n					您可以点击&amp;ldquo;商店留言&amp;rdquo;将您的意见和建议提给我们。</td></tr><tr><th>\n					地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 址：</th><td>\n					北京市朝阳区朝阳大街2001号</td></tr><tr><th>\n					邮政编码：</th><td>\n					100000</td></tr></tbody></table></li></ul>'),(9,480,1337816163,1450587010,0,NULL,NULL,NULL,21,NULL,0,'业务合作','',NULL,100000,NULL,'业务合作','','<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><p><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">修改本区域内容，请到</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">商店管理后台</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt;</span></span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">页面设置<span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">&gt;&gt; 文章管理</span></span></span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\"> </span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">关于网站</span></strong></span><span style=\"font-size: 9pt; color: rgb(102, 102, 102); font-family: 宋体;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\"> &gt;&gt;</span><span style=\"font-size: 10.5pt; color: red; font-family: &#39;Times New Roman&#39;;\" lang=\"EN-US\">&nbsp; 业务合作&nbsp; </span><span style=\"font-size: 10.5pt; color: red; font-family: 宋体;\">进行编辑</span></strong></span></p><li><p><strong>媒体/广告合作</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><br/></p></li><ul style=\"list-style-type: square;\" class=\"list list-paddingleft-2\"><li><p>\n			联系人：刘先生</p></li><li><p>\n			联系方式：010-88888888</p></li><li><p>\n			合作范围：媒体互动宣传、内容合作、广告投放、物流、配货、技术合作</p></li></ul><li><p><strong>招商咨询</strong></p></li><li><p>\n		&nbsp;</p></li><li><p><br/></p></li><ul style=\"list-style-type: square;\" class=\"list list-paddingleft-2\"><li><p>\n			联系人：刘先生</p></li><li><p>\n			联系方式：010-88888888</p></li><li><p>\n			合作范围：品牌服饰入驻及在线市场推广服务</p></li></ul></ul>'),(10,500,1337816571,1450587027,44,NULL,NULL,NULL,17,NULL,0,'顾客必读','',NULL,100000,NULL,'顾客必读','','<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>如何订购商品？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		您可以首先浏览我们的网站了解商品。看到您满意的商品您可以直接在我们的网站上实现订购。您也可以和我们网站的客服人员联系订购。</p></li><li><p>\n		凭借与国内外多家产品制造商长期的合作关系，以及多家实体连锁店面的支持，本商城汇集了大量最新、最潮、最时尚且品质过硬的产品，并以全网底价的超低价格交付给消费者。</p></li><li><p>\n		为消费者提供高品质产品，是李商城的一贯追求，确保为消费者提供的每一件商品都是精品。</p></li></ul><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>品牌保障计划</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商场的供应商全部是生产厂商或授权的总代理商或经销商，所售出的商品全部为通过正规进货渠道购进的正牌商品，与您亲临商场选购的商品享受同样的质量保证。本商城对销售产品的质量承担所有相应法律责任，发现假货十倍赔偿！</p></li></ul><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>电话客服中心联系方式</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		电话服务时间：早9:00-晚21:00</p></li><li><p>\n		全国服务热线：4001-234-567（免长途费）</p></li></ul><p>\n	&nbsp;</p><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>商务/广告合作</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		联系QQ：12345678</p></li><li><p><span style=\"float: left\">联系邮箱：</span><a href=\"mailto:webmaster@yourdomain.com\" style=\"line-height: 18px; float: left; color: #333333\">webmaster@yourdomain.com</a></p></li></ul>'),(11,490,1337816630,1450587616,5,NULL,NULL,NULL,17,NULL,0,'会员等级折扣','',NULL,100000,NULL,'会员等级折扣','','<p>\n				</p><h2 style=\"color:#999\">积分规则</h2><p>\n				</p><p>当积分已达到某一兑换积分标准时，顾客可将累计积分依照网站相应积分及兑换标准兑换回馈商品，网站将即时从用户会员积分中扣减相应积分。</p><p>\n				</p><p>各项回馈项目（包含各项商品、服务或抵用券等）及兑换标准及兑换规则均以兑换当时最新回馈活动公告或目录为准。</p><p>\n				</p><p>部分兑换商品有数量限制的，兑完为止。</p><p>\n				</p><p>公告或目录如有有效期限的，逾期即不得兑换。</p><p>\n				</p><p>积分兑换区的商品为只可用积分兑换的商品(如积分价格：100积分)</p><p><br/></p><p><br/></p><p>\n			</p><p>\n			</p><p>\n				</p><h2 style=\"color:#999\">积分规则</h2><p>普通会员所需积分：0，可参与网站指定会员活动，并可享受最低100%优惠</p><p>黄金会员所需积分：300，可参与网站指定会员活动，并可享受最低98%优惠</p><p>白金会员所需积分：1200，可参与网站指定会员活动，并可享受最低95%优惠</p><p>钻石卡VIP会员所需积分：5000，可参与网站指定会员活动，并可享受最低92%优惠</p><p>		&nbsp; &nbsp;				\n			</p><ul class=\"help2_right_ul3 list-paddingleft-2\"><br/></ul>'),(12,480,1337817665,1450587327,7,NULL,NULL,NULL,25,NULL,0,'订单状态','',NULL,100000,NULL,'订单状态','','<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 47px; overflow: hidden; _margin-left: 23px\"><li><p>\n		本商城的订单状态共有10种，下表为详细介绍：</p></li><li><p>\n		&nbsp;</p></li><li><p><span style=\"text-align: center; width: 150px; display: block; background: #999999; float: left; color: #ffffff; font-weight: bold; border-right: #cccccc 1px solid\">订单状态</span> <span style=\"text-align: center; width: 429px; display: block; background: #999999; float: left; color: #ffffff; font-weight: bold\">状态说明</span></p></li><li><p><span style=\"line-height: 86px; width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;1.待付款</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">除支付方式为货到付款的订单,均需要您在下订单后完成支付操作,您的订单才正式生效,本商城才会进行配货发货,由于您付款延迟造成的订单缺货,我们表示抱歉。<br/>\n		注：若您需要修改订单，需要自行取消订单，再重新下订单</span></p></li><li><p><span style=\"line-height: 43px; width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;2.已付款，待确认</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">您已成功提交订单，我们会在工作时间内尽快审核、确认您的订单，如长时间未被确认，请联系本商城客服或拨打客服热线4001-234-567；</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;3.已付款</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单货款我们已收到并核对。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;4.配货中</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单已处于配货环节，最晚将在3天内完成这个环节。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;5.配货完成，待发货</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单货物已完成配货待快递发出。</span></p></li><li><p><span style=\"line-height: 43px; width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;6.已发货</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您的订单货物已发出，您可以根据物流号在本站或相关物流公司网站查询您的订单配送状态。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;7.已收货</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您已收到、核对您所购买的商品并确认签收，此项订单交易成功。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;8.已完成</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示您已核对并签收您的商品30天。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;9.已取消</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">表示由您自己或委托客服取消的订单。</span></p></li><li><p><span style=\"width: 150px; display: block; float: left; overflow: hidden\">&nbsp;&nbsp;10.确认订单（货到付款）</span> <span style=\"border-left: #cccccc 1px solid; padding-left: 10px; width: 417px; display: block; float: left; overflow: hidden\">货到付款的订单需要本商城人员确认。</span></p></li></ul>'),(13,470,1337817975,1450590850,4,NULL,NULL,NULL,17,NULL,0,'积分规则','',NULL,100000,NULL,'积分规则','','<style type=\"text/css\">.jifenguize{width: 687px; display: block; float: left; margin-left: 47px;_margin-left: 23px; overflow: hidden}\n    .jifenguize a{text-decoration:none; color:#333333;}\n    .jifenguize a:hover{text-decoration:none; color:#333333;}</style><ul class=\"jifenguize list-paddingleft-2\"><li><p><strong>积分定义：</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		积分是本商城针对会员给予的购物奖励；<br/>\n		积分对应商品价格，成功购买1元钱商品可获1个积分；<br/>\n		购物金额如出现非整数，相应的积分取整数部分计算；<br/>\n		获取积分时消费积分等同于会员等级分，但消费积分使用后将被抵扣，会员等级分只做累计。<br/>\n		有效积分是指您通过注册、验证邮箱、完善个人资料、已完成订单、评论晒单、上传试戴图片、推荐好友等获取的消费积分与您的等级积分。</p></li><li><p><strong>获取积分途径：</strong></p></li></ul><p>\n	&nbsp;</p><ul class=\"jifenguize list-paddingleft-2\"><li><p>\n		1.有效购物</p></li><li><p>\n		1）通过在本商城的有效订单获得积分；积分对应商品价格，成功购买1元钱商品可获得1个积分；（积分核算不含订单运费部分）<br/>\n		2）购物金额如出现非整数，相应的积分取整数部分计算；<br/>\n		3）会员购物并生成有效订单后，相应积分将自动计入会员账户，但此时积分状态为冻结；当会员完成此笔订单后，积分将解冻。<br/>\n		&nbsp;&nbsp;&nbsp;您也可以在您确认收货后提前解冻和使用被冻结的积分，但与被冻结积分相关的订单商品，将不能进行退换货操作。此时积分<br/>\n		&nbsp;&nbsp;&nbsp;可兑换礼品或参与网站相关活动。（订单解冻周期见下：）<br/>\n		4）选择并完成网上支付获得10个积分。</p></li><li><p>\n		2. 注册登录：</p></li><li><p>\n		1）成功注册会员即可获得50个积分；<br/>\n		2）完成邮箱验证可获得20个积分；<br/>\n		3）完整填写会员资料可获得20个积分；<br/>\n		4）每天登录1次可获得5个积分。（封顶5分）<br/><a href=\"register.html\" style=\"color: rgb(140, 0, 0);\">马上注册！&gt;&gt;</a></p></li><li><p>\n		3. 评论晒单：</p></li></ul><p><br/></p><p><img style=\"width: 719px; height: 213px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201353535576.jpg\" title=\"show.jpg\" height=\"213\" width=\"719\"/></p><p><br/></p><ul class=\"jifenguize list-paddingleft-2\"><li><p>\n		1）文字评论1次获得10个积分；<br/>\n		2）上传图片评论1次获得30个积分；<br/>\n		3）每个商品ID首次评论额外获50个积分；<br/>\n		4）每个会员ID对于所购每一个商品拥有1次有效计分评论。</p></li><li><p><strong><a name=\"a1\"></a>积分状态：</strong></p></li><li><p>\n		&nbsp;&nbsp;冻结：因购物获得的积分在会员未完成有效购物之前，积分状态为冻结，此时积分暂时不可用，冻结周期为签收后30天。您可以提前解冻和使用被冻结的积分，但与被冻结积分相关的订单商品，将不能进行退换货操作。</p></li><li><p>\n		&nbsp;&nbsp;取消：当订单取消后，相应的购物冻结积分将被扣除。</p></li><li><p>\n		&nbsp;&nbsp;完成：购物产生的冻结积分，在您收到货物后30天将自动解冻。您也可以在确认收货后在会员中心将冻结积分提前解冻，计入会员帐户的可用积分，用于兑换礼品或参与活动，解冻积分对应的商品不能申请退换货。</p></li><li><p><a name=\"use\"></a><strong>积分用途：</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1）等同于会员升级的等级分，享受会员优惠；<br/>\n		2）可在积分商城兑换指定商品或现金券。</p></li><li><p>\n		本商城积分获得途径：</p></li><li><p>\n		1、购买积分，１元＝１积分，有非整数的取整数部分。<br/>\n		2、选择网上支付１０积分。<br/>\n		3、成功注册５０积分。<br/>\n		4、完成邮箱验证２０积分。<br/>\n		5、完善个人资料２０积分。<br/>\n		6、登录一次５积分，每天封顶５积分。<br/>\n		7、文字评论１次１０积分。<br/>\n		8、上传图片评论３０积分。<br/>\n		9、每个商品首次评论额外５０积分。<br/>\n		10、分享一次５积分，每天封顶１０积分。<br/>\n		11、推荐好友５０消费积分（推荐好友下订单时推荐人获得50冻结消费积分，推荐的好友购买后获得购买奖励积分解冻时，推荐<br/>\n		&nbsp;&nbsp;&nbsp;&nbsp;积分也解冻。） 本商城积分解冻规则： 每个订单的冻结周期都是订单状态为&amp;ldquo;已收货&amp;rdquo;后30天，积分解冻后则不能申请退<br/>\n		&nbsp;&nbsp;&nbsp;&nbsp;换货。 可以在会员中心提前解冻，但是解冻后则不能申请退换货。</p></li></ul>'),(14,460,1337818194,1450587261,7,NULL,NULL,NULL,23,NULL,0,'商品退换货保障','',NULL,100000,NULL,'商品退换货保障','','<ul class=\" list-paddingleft-2\" style=\"width:687px; float:left; overflow:hidden; display:block; margin-left:47px;_margin-left:23px;\"><li><p>\n		全商品30天无理由退换货保障:</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		在您收到商品后的30天之内，如果对商品不满意、不喜欢，且未拆封使用或质量问题的前提下，您可以无条件退货或置换您满意的其它商品。 注：退换货日期以客户签收日起算。</p></li><li><p>\n		正品原包，假一赔十！</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城的供应商全部是生产厂商或授权的总代理商或经销商，所售出的商品全部为通过正规进货渠道购进的正牌商品，与您亲临商场选购的商品享受同样的质量保证。本商城对销售产品的质量承担所有相应法律责任，发现假货十倍赔偿！</p></li><li><p>\n		送货上门，货到付款！</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		网上下订单，等商品送到您手上，您可以当场验货。 （本商城目前支持全国1052个城市货到付款，其它边远地区暂不支持。）</p></li><li><p>\n		使您购物满意，是我们最大的希望，我们在努力中，欢迎您给我们提出建议！</p></li></ul>'),(15,500,1337818334,1450587090,0,NULL,NULL,NULL,18,NULL,0,'游客购物通道','',NULL,100000,NULL,'游客购物通道','','<h2>\n		游客购物通道</h2><ol class=\" list-paddingleft-2\"><li><p>\n			我们提供非会员购物功能，在购物车下一步的时候，点击&amp;ldquo;直接购买&amp;rdquo;即可使用此功能。</p></li><li><p>\n			但是由于非会员无法享受购物积分等，所以我们建议您花一分钟时间注册成为会员，这样就能享受整个网站强大的会员功能和多种优惠措施。</p></li></ol><p>\n	&nbsp;</p>'),(16,490,1337818390,1450587240,5,NULL,NULL,NULL,23,NULL,0,'售后服务','',NULL,100000,NULL,'售后服务','','<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>体贴的售后服务</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>本网站所售产品均实行三包政策，请顾客保存好有效凭证，以确保我们为您更好服务。本公司的客户除享受国家规定&amp;ldquo;三包&amp;rdquo;。您可以更放心地在这里购物。</p></li><li><p><strong>保修细则</strong></p></li><li><p>\n		&nbsp;</p></li><li><h4>\n		一、在本网站购买的商品，自购买日起(以到货登记为准)7日内出现性能故障，您可以选择退货、换货或修理。</h4><h4>\n		二、在本公司购买的商品，自购日起(以到货登记为准)15日内出现性能故障，您可以选择换货或修理。(享受15天退换货无需理由的商品，按《15天退换货无需理由细则》办理)</h4><h4>\n		三、在本公司购买的商品，自购日起(以到货登记为准)一年之内出现非人为损坏的质量问题，本公司承诺免费保修。</h4></li><ol class=\" list-paddingleft-2\"><li><p>\n			在接到您的产品后，我公司将问题商品送厂商特约维修中心检测；</p></li><li><p>\n			检测报出来后，如非人为损坏的，是产品本身质量问题，我公司会及时按您的要求予以退款、换可或维修。</p></li><li><p>\n			如果检测结果是无故障或是人为因素造成的故障，我公司会及时通知您，并咨询您的处理意见。</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			在接到您的产品后，我公司将问题商品送厂商特约维修中心检测；</p></li><li><p>\n			检测报出来后，如非人为损坏的，是产品本身质量问题，我公司会及时按您的要求予以退款、换可或维修。</p></li><li><p>\n			如果检测结果是无故障或是人为因素造成的故障，我公司会及时通知您，并咨询您的处理意见。</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			在接到您的产品后，我公司将问题商品送厂商特约维修中心检测；</p></li><li><p>\n			检测报出来后，如非人为损坏的，是产品本身质量问题，我公司会及时按您的要求予以退款、换可或维修。</p></li><li><p>\n			如果检测结果是无故障或是人为因素造成的故障，我公司会及时通知您，并咨询您的处理意见。</p></li></ol><li><p><strong>收费维修</strong></p></li><li><p>\n		&nbsp;</p></li><li><h4>\n		一、对于人为造成的故障，本公司将采取收费维修，包括：</h4><h4>\n		二、符合以下条件，可以要求换货：</h4><h4>\n		三、符合以下条件，可以要求退货：</h4><p>\n	客户收到货物后两天之内，	</p></li><ol class=\" list-paddingleft-2\"><li><p>\n			发现商品有明显的制造缺陷的</p></li><li><p>\n			货物经过一次换货但仍然存在质量问题的</p></li><li><p>\n			由于人为原因造成超过我们承诺到货之日三天还没收到货物的</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			客户在收到货物时当面在送货员面前拆包检查，发现货物有质量问题的</p></li><li><p>\n			实际收到货物与网站上描述的有很大的出入的</p></li><li><p>\n			换货流程：客户当面要求送货人员退回货物，然后与我们联系。我们会在一个工作日内为您重新发货，货物到达时间顺延。</p></li></ol><ol class=\" list-paddingleft-2\"><li><p>\n			产品内部被私自拆开或其中任何部分被更替；</p></li><li><p>\n			商品里面的条码不清楚，无法成功判断；</p></li><li><p>\n			有入水、碎裂、损毁或有腐蚀等现象；</p></li><li><p>\n			过了保修期的商品。</p></li></ol><li><p><strong>退货流程</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	客户在收到货物后两天内与我们联系，我们会在两个工作日内通过银行汇款把您的货款退回。	</p><h4>\n		在以下情况我们有权拒绝客户的退换货要求：</h4></li><ol class=\" list-paddingleft-2\"><li><p>\n			货物出现破损，但没有在收货时当场要求送货人员换货的</p></li><li><p>\n			超过退换货期限的退换货要求</p></li><li><p>\n			退换货物不全或者外观受损</p></li><li><p>\n			客户发货单据丢失或者不全</p></li><li><p>\n			产品并非我们提供</p></li><li><p>\n			货物本身不存在质量问题的</p></li></ol></ul>'),(17,480,1337818441,1450587100,0,NULL,NULL,NULL,18,NULL,0,'网站使用条款','',NULL,100000,NULL,'网站使用条款','','<h2>\n	网站使用条款</h2><p>\n	如果您在本网站访问或购物，您便接受了以下条件。</p><h4>\n	版权</h4><p>\n	本网站上的所有内容诸如文字、图表、标识、按钮图标、图像、声音文件片段、数字下载、数据编辑和软件都是本网站提供者的财产，受中国和国际版权法的保护。 本网站上所有内容的汇编是本网站的排他财产，受中国和国际版权法的保护。本网站上所使用的所有软件都是本网站或其关联公司或其软件供应商的财产，受中国和 国际版权法的保护。</p><h4>\n	许可和网站进入</h4><p>\n	本网站授予您有限的许可进入和个人使用本网站，未经本网站的明确书面同意不许下载（除了页面缓存）或修改网站或其任何部分。这一许可不包括对本网站或其内 容的转售或商业利用、任何收集和利用产品目录、说明和价格、任何对本网站或其内容的衍生利用、任何为其他商业利益而下载或拷贝账户信息或使用任何数据采 集、 robots或类似的数据收集和摘录工具。未经本网站的书面许可，严禁对本网站的内容进行系统获取以直接或间接创建或编辑文集、汇编、数据库或人名地址录 （无论是否通过robots、spiders、自动仪器或手工操作）。另外，严禁为任何未经本使用条件明确允许的目的而使用本网站上的内容和材料。 未经本网站明确书面同意，不得以任何商业目的对本网站或其任何部分进行复制、复印、仿造、出售、转售、访问、或以其他方式加以利用。未经本网站明确书面同 意，您不得用设计或运用设计技巧把本网站或其关联公司的商标、标识或其他专有信息（包括图像、文字、网页设计或形式）据为己有。未经本网站明确书面同意， 您不可以meta tags或任何其他&amp;ldquo;隐藏文本&amp;rdquo;方式使用本网站的名字和商标。任何未经授权的使用都会终止本网站所授予的允许或许可。您被授予有限的、可撤销的和非独家的 权利建立链接到本网站主页的超链接，只要这个链接不以虚假、误导、贬毁或其他侵犯性方式描写本网站、其关联公司或它们的产品和服务。</p><h4>\n	评论、意见、消息和其他内容</h4><p>\n	访问者可以张贴评论、意见及其他内容，以及提出建议、主意、意见、问题或其他信息，只要内容不是非法、淫秽、威胁、诽谤、侵犯隐私、侵犯知识产权或以其他 形式对第三者构成伤害或侵犯或令公众讨厌，也不包含软件病毒、政治宣传、商业招揽、连锁信、大宗邮件或任何形式的&amp;ldquo;垃圾邮件&amp;rdquo;。您不可以使用虚假的电子邮 件地址、冒充任何他人或实体或以其它方式对卡片或其他内容的来源进行误导。本网站保留清除或编辑这些内容的权利（但非义务），但不对所张贴的内容进行经常 性的审查。如果您确实张贴了内容或提交了材料，除非我们有相反指示，您授予本网站及其关联公司非排他的、免费的、永久的、不可撤销的和完全的再许可权而在 全世界范围内任何媒体上使用、复制、修改、改写、出版、翻译、创作衍生作品、分发和展示这样的内容。您授予本网站及其关联公司和被转许可人使用您所提交的 与这些内容有关的名字的权利，如果他们选择这样做的话。您声明并担保您拥有或以其它方式控制您所张贴内容的权利，内容是准确的，对您所提供内容的使用不违 反本政策并不会对任何人和实体造成伤害。您声明并保证对于因您所提供的内容引起的对本网站或其关联公司损害进行赔偿。本网站有权监控和编辑或清除任何活动 或内容。本网站对您或任何第三方所张贴的内容不承担责任。</p><h4>\n	产品说明</h4><p>\n	本网站及其关联公司努力使产品说明尽可能准确。不过，由于实际条件限制，本网站并不保证产品说明或本网站上的其他内容是准确的、完整的、可靠的、最新的或无任何错误的。</p><h4>\n	电子通讯</h4><p>\n	当您访问本网站或给我们发送电子邮件时，您与我们用电子方式进行联系。您同意以电子方式接受我们的信息。我们将用电子邮件或通过在本网站上发布通知的方式 与您进行联系。您同意我们用电子方式提供给您的所有协议、通知、披露和其他信息是符合此类通讯必须是书面形式的法定要求的。如果并且当本网站能够证明以电 子形式的信息已经发送给您或者在本网站张贴这样的通知，将被视为您已收到所有协议、声明、披露和其他信息。</p>'),(18,470,1337818563,1450587250,5,NULL,NULL,NULL,23,NULL,0,'免责条款','',NULL,100000,NULL,'免责条款','','<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>免责声明</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n\n	如因不可抗力或其他无法控制的原因造成网站销售系统崩溃或无法正常使用，从而导致网上交易无法完成或丢失有关的信息、记录等，网站将不承担责任。但是我们将会尽合理的可能协助处理善后事宜，并努力使客户减少可能遭受的经济损失。<br/>\n	本 店可以按买方的要求代办相关运输手续，但我们的责任义务仅限于按时发货，遇到物流（邮政）意外时协助买方查询，不承担任何物流（邮政）提供给顾客之外的赔 偿，一切查询索赔事宜均按照物流（邮政）的规定办理。在物流（邮政）全程查询期限未满之前，买方不得要求赔偿。提醒买方一定核实好收货详细地址和收货人电 话，以免耽误投递。凡在本店购物，均视为如同意此声明。</p></li><li><p><strong>客户监督</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n	我们希望通过不懈努力，为客户提供最佳服务，我们在给客户提供服务的全程中接受客户的监督。</p></li><li><p><strong>争议处理</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n\n	如果客户与网站之间发生任何争议，可依据当时双方所认定的协议或相关法律来解决。</p></li></ul>'),(19,460,1337818664,1450587108,0,NULL,NULL,NULL,18,NULL,0,'购物流程','',NULL,100000,NULL,'购物流程','','<h2>\n		简单的购物流程</h2><h4>\n		怎样注册？</h4><p>\n		答：您可以直接点击&quot;会员注册&quot;进行注册。注册很简单，您只需按注册向导的要求输入一些基本信息即可。为了准确地为您服务，请务必在注册时填写您的真实信息，我们会为您保密。输入的帐号要4-10位，仅可使用英文字母、数字&quot;-&quot;。</p><h4>\n		怎样成为会员?</h4><p>\n		答：您可以直接点击&quot;会员登录与注册&quot;进行注册。注册很简单，您只需根据系统提示输入相关资料即可，请您填写完毕时，务必核对填写内容的准确性，并谨记您的会员账号和密码，以便您查询订单或是希望网站提供予您更多的服务时用以核对您的身份。</p><h4>\n		如何在网上下单购买，怎么一个操作流程呢？</h4><p>\n		答：这种方式和您逛商场的方式十分相似，您只要按照我们的商品分类页面或进入&quot;钻石珠宝&quot;、&quot;个性定制&quot;等逐页按照链接指明的路径浏览就可以了。 一旦看中了您喜欢的商品，您可以随时点击&quot;放入购物篮&quot;按钮将它放入&quot;购物篮&quot;。随后，您可以按&quot;去收银台&quot;。我们的商品十分丰富，不过您别担心，我们在 每一页中都设立了详细明白的导航条，您是不会迷路的。</p><p>\n	&nbsp;</p>'),(20,500,1337819564,1450591087,7,NULL,NULL,NULL,19,NULL,0,'支付方式','',NULL,100000,NULL,'支付方式','','<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;货到付款：</strong></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;指商品送到您手上后，您当场付款给送货人员（快递员）本商城开通全国2000多个城市货到付款，全部支持当场开箱验货再付款！</p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第三方支付</p><p><br/></p><p><img style=\"width: 660px; height: 92px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201357092474.jpg\" title=\"show.jpg\" height=\"92\" width=\"660\"/></p><p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</p><h3>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 16px;\">支持国内二十多家主流银行机构的储蓄卡</span></h3><p><br/></p><p><img style=\"width: 680px; height: 497px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201357442927.jpg\" title=\"show.jpg\" height=\"497\" width=\"680\"/></p><p><br/></p><p><br/></p><p><br/></p>'),(21,490,1337819705,1450591209,4,NULL,NULL,NULL,22,NULL,0,'配送方式','',NULL,100000,NULL,'配送方式','','<h2><span style=\"font-size: 16px;\">配送方式</span></h2><p>本网购物采用第三方快递配送。<br/>\n 用户可以在我的订单里查询分配的订单的快递，从而及时查阅物流信息。<br/>\n 用户可以登录第三方快递公司相应网站：</p><p><br/></p><h3>第三方配送公司</h3><p>登录相关物流网站，输入相应单号，即可查询货物配送状态。</p><p><br/></p><p><img style=\"width: 721px; height: 332px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201400010326.jpg\" title=\"show.jpg\" height=\"332\" width=\"721\"/></p><p><br/></p><p><br/></p>'),(23,460,1337819885,1450587216,3,NULL,NULL,NULL,22,NULL,0,'关于收货与验货','',NULL,100000,NULL,'关于收货与验货','','<ul style=\" margin-bottom:0px;\" class=\"help2_right_ul3 list-paddingleft-2\"><li><p><strong>签收商品时需要注意的问题</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>1、送货上门、货到付款订单：快递员送货上门时，请您务必当面对照发货单核对商品，如果出现商品数量缺少、商品破损，请您当场办理整单商品的退货。若订单中含有赠品，请一并退回。一旦您确认签字，我们将无法为您办理退换或补发。	\n	2、 邮局邮寄订单：请您在领取包裹时务必检查外包装，如果发现包裹破损，请您不要签收，随后请及时将包裹单原件邮寄给我们，您的包裹单原件将作为我们为您办理 补发或退款的唯一证明。收到包裹单后，我们将为您办理相关手续。如您未拆开外包装箱，也可以当场全部退货。平邮订单，在收到包裹时，如发现包裹破损，请您 要求邮局出具包裹破损证明。<span style=\"color: rgb(255, 0, 0);\">注：敬请您在验货签收时仔细核对发票，如果出现发票开错或漏开，请您及时联系我们，注明订单号、邮寄地址和收信人姓名，我们接到您的信息后会尽快为您开具，并邮寄给您。</span></p></li><ol class=\" list-paddingleft-2\"><li><p>\n		特别提示：		</p></li><li><p>\n			如果您的订单使用帐户余额或礼券支付，只有退货商品的金额小于实际应付款金额时才可办理。</p></li><li><p>\n			如果您的订单中含有赠品，将无法提供此项服务；如果是成套商品，您只能整套退货。如果是捆绑商品，您在退主商品的同时需要将赠品一起退回。</p></li></ol></ul>'),(24,500,1337820081,1450587167,0,NULL,NULL,NULL,20,NULL,0,'注册服务条款','',NULL,100000,NULL,'注册服务条款','','<p style=\"text-align:center;\"><strong>注册服务条款</strong></p><p>\n	尊敬的用户，欢迎您注册成为本网站用户。在注册前请您仔细阅读如下服务条款：<br/>\n	本服务协议双方为本网站与本网站用户，本服务协议具有合同效力。<br/>\n	您确认本服务协议后，本服务协议即在您和本网站之间产生法律效力。请您务必在注册之前认真阅读全部服务协议内容，如有任何疑问，可向本网站咨询。<br/>\n	无论您事实上是否在注册之前认真阅读了本服务协议，只要您点击协议正本下方的&quot;注册&quot;按钮并按照本网站注册程序成功注册为用户，您的行为仍然表示您同意并签署了本服务协议。</p><h4>\n	1．本网站服务条款的确认和接纳</h4><p>\n	本网站各项服务的所有权和运作权归本网站拥有。</p><h4>\n	2．用户必须：</h4><p>\n	(1)自行配备上网的所需设备， 包括个人电脑、调制解调器或其他必备上网装置。<br/>\n	(2)自行负担个人上网所支付的与此服务有关的电话费用、 网络费用。</p><h4>\n	3．用户在本网站上交易平台上不得发布下列违法信息：</h4><p>\n	(1)反对宪法所确定的基本原则的；<br/>\n	(2).危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/>\n	(3).损害国家荣誉和利益的；<br/>\n	(4).煽动民族仇恨、民族歧视，破坏民族团结的；<br/>\n	(5).破坏国家宗教政策，宣扬邪教和封建迷信的；<br/>\n	(6).散布谣言，扰乱社会秩序，破坏社会稳定的；<br/>\n	(7).散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/>\n	(8).侮辱或者诽谤他人，侵害他人合法权益的；<br/>\n	(9).含有法律、行政法规禁止的其他内容的。</p><h4>\n	4． 有关个人资料</h4><p>\n	用户同意：<br/>\n	(1) 提供及时、详尽及准确的个人资料。<br/>\n	(2).同意接收来自本网站的信息。<br/>\n	(3) 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。<br/>\n	(4)本网站不公开用户的姓名、地址、电子邮箱和笔名，以下情况除外：<br/>\n	（a）用户授权本网站透露这些信息。<br/>\n	（b）相应的法律及程序要求本网站提供用户的个人资料。如果用户提供的资料包含有不正确的信息，本网站保留结束用户使用本网站信息服务资格的权利。</p><h4>\n	5. 用户在注册时应当选择稳定性及安全性相对较好的电子邮箱，并且同意接受并阅读本网站发往用户的各类电子邮件。如用户未及时从自己的电子邮箱接受电子邮件或 因用户电子邮箱或用户电子邮件接收及阅读程序本身的问题使电子邮件无法正常接收或阅读的，只要本网站成功发送了电子邮件，应当视为用户已经接收到相关的电 子邮件。电子邮件在发信服务器上所记录的发出时间视为送达时间。</h4><h4>\n	6． 服务条款的修��</h4><p>\n	本网站有权在必要时修改服务条款，本 网站服务条款一旦发生变动，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息 服务，则视为接受服务条款的变动。本网站保留随时修改或中断服务而不需通知用户的权利。本网站行使修改或中断服务的权利，不需对用户或第三方负责。</p><h4>\n	7． 用户隐私制度</h4><p>\n	尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的：<br/>\n	(1) 遵守有关法律规定，遵从本网站合法服务程序。<br/>\n	(2) 保持维护本网站的商标所有权。<br/>\n	(3) 在紧急情况下竭力维护用户个人和社会大众的隐私安全。<br/>\n	(4)符合其他相关的要求。<br/>\n	本网站保留发布会员人口分析资询的权利。</p><h4>\n	8．用户的帐号、密码和安全性</h4><p>\n	你 一旦注册成功成为用户，你将得到一个密码和帐号。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全 责。你可随时根据指示改变你的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，请立即通告本网站。</p><h4>\n	9． 拒绝提供担保</h4><p>\n	用户明确同意信息服务的使用由用户个人承担风险。 本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p><h4>\n	10．有限责任</h4><p>\n	本网站对任何直接、间接、偶然、特殊及继起的损害不负责任，这些损害来自：不正当使用本网站服务，或用户传送的信息不符合规定等。这些行为都有可能导致本网站形象受损，所以本网站事先提出这种损害的可能性，同时会尽量避免这种损害的发生。</p><h4>\n	11．信息的储存及限制</h4><p>\n	本网站有判定用户的行为是否符合本网站服务条款的要求和精神的权利，如果用户违背本网站服务条款的规定，本网站有权中断其服务的帐号。</p><h4>\n	12．用户管理</h4><p><strong>用户必须遵循</strong>：<br/>\n	(1) 使用信息服务不作非法用途。<br/>\n	(2) 不干扰或混乱网络服务。<br/>\n	(3) 遵守所有使用服务的网络协议、规定、程序和惯例。用户的行为准则是以因特网法规，政策、程序和惯例为根据的。</p><h4>\n	13．保障</h4><p>\n	用户同意保障和维护本网站全体成员的利益，负责支付由用户使用超出服务范围引起的律师费用，违反服务条款的损害补偿费用，其它人使用用户的电脑、帐号和其它知识产权的追索费。</p><h4>\n	14．结束服务</h4><p>\n	用户或本网站可随时根据实际情况中断一项或多项服务。本网站不需对任何个人或第三方负责而随时中断服务。用户若反对任何服务条款的建议或对后来的条款修改有异议，或对本网站服务不满，用户可以行使如下权利：<br/>\n	(1) 不再使用本网站信息服务。<br/>\n	(2) 通知本网站停止对该用户的服务。<br/>\n	结束用户服务后，用户使用本网站服务的权利马上中止。从那时起，用户没有权利，本网站也没有义务传送任何未处理的信息或未完成的服务给用户或第三方。</p><h4>\n	15．通告</h4><p>\n	所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p><h4>\n	16．信息内容的所有权</h4><p>\n	本 网站定义的信息内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财 产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。</p><h4>\n	17．法律</h4><p>\n	本网站信息服务条款要与中华人民共和国的法律解释一致。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p><p>\n	&nbsp;</p>'),(25,490,1337820127,1450587176,0,NULL,NULL,NULL,20,NULL,0,'隐私保护政策','',NULL,100000,NULL,'隐私保护政策','','<h2>\n		隐私保护政策</h2><h4>\n		个人信息</h4><p>\n	一般情况下，您无须提供您的姓名或其它个人信息即可访问我们的站点。但有时我们可能需要您提供一些信息，例如为了处理订单、与您联系、提供预订服务或处理工作应聘。我们可能需要这些信息完成以上事务的处理或提供更好的服务。	</p><h4>\n		用途</h4><ol class=\" list-paddingleft-2\"><li><p>\n			供我们网站交易和沟通等相关方使用，以满足您的订单等购物服务；</p></li><li><p>\n			用于与您保持联系，以开展客户满意度调查、市场研究或某些事务的处理；</p></li><li><p>\n			用于不记名的数据分析（例如点击流量数据）；</p></li><li><p>\n			帮助发展我们的业务关系（如果您是我们网站的业务合作伙伴或批发商）；</p></li></ol><p>\n	&nbsp;</p>'),(26,200,1337911618,1450588984,1,NULL,NULL,NULL,24,NULL,0,'满百免运费','',NULL,100000,NULL,'满百免运费','','<p></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; float: left; overflow: hidden; display: block; margin-left: 47px;\"><li><p>\n		在本商城购物，使用款到发货支付方式（网上支付，银行转账）即可享受购物满100元免邮费优惠。<br/>\n		货到付款满180元免运费。<br/>\n		愿您购物愉快！！</p></li></ul>'),(27,190,1337911855,1450589119,2,NULL,NULL,NULL,24,NULL,0,'晒单免单','',NULL,100000,NULL,'晒单免单','','<p style=\"PADDING-BOTTOM: 20px; LINE-HEIGHT: 20px; PADDING-LEFT: 20px; PADDING-RIGHT: 20px\"><strong>一、 参与条件</strong><br/><span style=\"color:#333333\">只要您在本商城购买产品后就能参与晒分享。一个订单只有一次晒分享机会，多买多得。</span><br/><br/><strong>二、 参与流程</strong></p><p style=\"padding-bottom: 20px; line-height: 20px; padding-left: 20px; padding-right: 20px;\"><strong>三、 晒分享规则</strong><br/><span style=\"color:#333333\">1.分享内容需包含本商城字样以及提供链接</span><span style=\"color:#333333\">或者产品相应页面的链接。<br/>\n	2. 分享审核通过后不可擅自删除您的分享内容，否则我们有权取消您获得的奖励。<br/>\n	3. 使用优惠类礼券的订单不再享受免单奖励。</span><br/><br/><strong>四、 常见问题</strong><br/><span style=\"color:#333333\">1. 如何参与晒分享<br/>\n	如果您是本商城会员（不是会员？请先注册），成功购买产品后只要把您在本商城的购物经验或使用心得，分享到您的开心网、人人网、豆瓣、新浪微博、腾讯微博、QQ空间、豆瓣等平台，并向我们提交分享页面网址，即可获得免单机会！</span><br/><br/><span style=\"color:#333333\">2. 什么样的内容才能获得晒分享高额免单<br/>\n	（1）标题准确。标题表述清楚、能准确反映参与本商城晒分享活动主题内容。例如：本商城买的香水效果还真不错~晒下。<br/>\n	（2）主题明确、内容丰富。完整介绍在本商城的购买经历，并且内容表达合理，条理清晰。<br/>\n	（3）图片多彩。提供使用本商城产品后的自拍靓眼照、晒自己购买记录图片，增加说服力，达到图文并茂。<br/>\n	（4）评论数或转发数越高，则您获得的奖金也相应增加。</span><br/><br/><span style=\"color:#333333\">3. 参与晒分享后，需要多少时间审核？<br/>\n	在一个工作日内，本商城管理员会审核并给予回复。（工作日：上午9:00~下午5:30，节假日除外）<br/><br/>\n	4. 晒分享获得的会员账户款可以提现吗？<br/>\n	不可以。会员晒分享得到的免单奖励，本商城管理员会直接充值到您的会员帐户上，在您下次购买商品时，可用会员帐户上的余额进行支付货款。（例如：您在本商城帐户余额原有200元，通过晒分享活动获赠30元，帐户余额将有230元。）<br/><br/>\n	5. 为什么提交分享后却没有免单奖励？<br/>\n	（1）凡是通过购物返利类论坛发的晒单都没有现金奖励，涉及返利的平台有：51返利、易购、返还、比购等。<br/>\n	（2）在QQ、开心网等需互加好友或者需通过密码才能看见的晒分享，请先把密码取消并加本商城为好友，这样小编才能看到您的晒单，否则将作为无效分享。<br/>\n	（3）提交的网址有误。<br/>\n	（4）分享内容非自己原创。</span></p>'),(28,490,1337913013,1450587140,5,NULL,NULL,NULL,19,NULL,0,'付款常见问题','',NULL,100000,NULL,'付款常见问题','','<ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"_margin-left: 23px\"><li><p><strong>1.我没有支付宝帐号可以用支付宝付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		如您还没有支付宝帐号，尽量不要选择支付宝在线支付。推荐使用快钱或网上银行进行在线支付。</p></li><li><p><strong>2.本商城的支付宝跟我在淘宝买东西用的支付宝操作一样吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		操作基本相同。本商城是支付宝信任商家。请放心使用!</p></li><li><p><strong>3.我的订单付完款了，怎么通知你们？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1.可以直接通过在线客服告知。<br/>\n		2.如果是银行转账请您在完成支付页面提交支付凭证，以便我们核实。<br/>\n		3.请工作时间拨打我们的服务热线：4001-234-567 告知我们：订单号、付款银行帐号及付款金额即可。</p></li><li><p><strong>4.为什么我通过在线支付完成付款了，订单还是显示：未支付？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		可能是由于网络信号传输问题造成订单未能收到成功付款的信息，你不用着急，我们会手动帮您确认付款信息。 下面两种操作都可以通知我们：<br/>\n		1.通过客服告知我们：订单号、支付平台（指：快钱或支付宝）。<br/>\n		2.请工作时间拨打我们的服务热线：4001-234-567 告知我们：订单号、支付平台（快钱或支付宝）。</p></li><li><p><strong>5.我没有开通网上银行，可以让我的朋友帮我在线付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		可以，成功付款后下面两种操作都可以通知我们：<br/>\n		1. 通过客服告知我们：订单号、支付平台（指：快钱或支付宝）。<br/>\n		2.请工作时间拨打我们的服务热线：4001-234-567 告知我们：订单号、支付平台（指：快钱或支付宝）。</p></li><li><p><strong>6.退货或换货差价，你们的退款流程是怎么做的？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城售后服务部在收到您的退、换货商品后，会及时电话联系您，确定退款金额及帐号后，3个工作日内完成退款。</p></li><li><p><strong>7.我下了订单，选择款到发货（银行卡汇款或在线支付），不方便马上付款，可以等我几天再付吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		完全可以。查询我的订单完成支付操作。我们为每张订单提供7天的等待付款期。若您需要延长时间请电话通知我们客服人员。</p></li><li><p><strong>8.我在下单的时候选择了工商银行付款，已经提交订单，我还可以换成其他银行来支付吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		可以，完成付款后请通知我们您的订单号与实际付款银行。</p></li><li><p><strong>9.我的订单选择了款到发货，可以换成货到付款的方式吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		不可以。但您另下一张货到付款的订单即可。请别忘了取消原来已经下好的款到发货的订单哦!</p></li><li><p><strong>10.我的订单已经付款，还想修改订单怎么办？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		请工作时间联系在线客服或拨打我们的服务热线：4001-234-567 我们的客服会帮助您处理订单。</p></li><li><p><strong>11.我能用信用卡付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		我们目前已经开通信用卡在线支付，国内大多数银行的信用卡都支持。 信用卡在线支付无需开通网银。支付成功后需(1工作日内)由人工审核受理订单。</p></li></ul>'),(29,470,1337913200,1450591160,4,NULL,NULL,NULL,19,NULL,0,'索取发票','',NULL,100000,NULL,'索取发票','','<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		如何索取发票：</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1）在结算页面点击索取发票。</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201358374659.jpg\" title=\"show.jpg\"/></p><p><br/></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		2）选择发票抬头，个人或单位，单位需要填写单位完整名称。</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201358530136.jpg\" title=\"show.jpg\"/></p><p><br/></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		3）提交订单</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><img style=\"width: 715px; height: 407px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201358597128.jpg\" title=\"show.jpg\" height=\"407\" width=\"715\"/></p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		发票开具说明：</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城所有商品均可提供正规商业发票，此发票可用作单位报销使用。发票内容只能以您所实际购买的商品开具，发票金额为商品实际支付的金额（不包括促销折扣券所抵扣的部分及运费）。<br/><br/>\n		注：发票在您收到货后30天后通过平邮寄出，请注意查收。由于涉及退换货流程问题发票不能随商品一起发出，给你造成的不便尽请谅解，如需提交索取发票其联系在线客服或拨打客服热线4001-234-567。<br/><br/>\n		注：索取发票后请您妥善保管，如发生退换货的情况，须将相应发票一并寄回。</p></li></ul>'),(30,500,1337914746,1450588596,3,NULL,NULL,NULL,22,NULL,0,'配送范围','',NULL,100000,NULL,'配送范围','','<p><br/></p><ul class=\"help2_right_ul3 list-paddingleft-2\" style=\"margin-bottom: 0px;\"><li><p><strong>本商城配送范围：</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		本商城支持全国省、直辖市在内的2000多个城市的款到发货，1000多个城市的货到付款业务 <br/>您可以查询您所在城市是否在我们的配送范围之内， 如对配送范围有任何疑问，欢迎您致电本商城客户服务热线4001-234-567进行咨询</p></li></ul>'),(31,450,1337916717,1450587073,1,NULL,NULL,NULL,17,NULL,0,'常见问题','',NULL,100000,NULL,'常见问题','','<ul style=\"_margin-left: 23px\" class=\"help2_right_ul3 list-paddingleft-2\"><li><p><strong>1、本商城所售商品都是正品行货吗？售后服务怎样？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：本商城所售商品都是正品行货，免费提供发票。凭本商城销售凭证，所有商品都可以享受售后服务保障，本商城将严格针对所售商品履行换货和退货的义务。</p></li><li><p><strong>2、本商城的价格和实体店的售价为什么相差那么多？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：一件商品从生产商到总代理商、大小批发商、到租金昂贵装修豪华的实体店，每个环节层层加价，消费者只能被动接受虚高的价格，而本商城是厂家直供。</p></li><li><p><strong>3、如何在本商城购买下单？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：在本商城下单与大多数购物网站是一样的，如果您对网络购物不太了解可以点击<a style=\"color: #007eff\" href=\"help-17-32.html\">本商城购物流程</a>。</p></li><li><p><strong>4、运输造成损坏怎么办？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：因路上运输造成商品损坏或者丢件由我们承担商品损失，所以您无需担心运输问题。（经过长途运输产品外包装可能会有轻微的碰撞是正常的，但并不会损坏包装盒内的商品，本商城的包装是有名的强壮哦）</p></li><li><p><strong>5、请问运费是多少？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：（1）您可以点击→配送服务→运费说明。<br/>\n		&nbsp;&nbsp;&nbsp; （2）您点击商品购买后，提交订单过程中系统会告知您具体的运费运时。</p></li><li><p><strong>6、多少时间可以送到？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：通常我们仓库都有现货，每天16：30之前的订单当天就可以通过快递发货,普通快递全国范围内除云南、甘肃、海南、西藏、新疆、青海，约1-4天送达，货到付款约3-7天送达（快递上门送货前可能会与您电话联系），您也可以到会员中心&gt;我的订单查询快递情况。</p></li><li><p><strong>7、我收到商品不满意怎么办？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：在您收到商品后的30天之内，如果对商品不满意、不喜欢，且未拆封使用或质量问题的前提下，您可以无条件退货或置换您满意的其它商品。</p></li><li><p><strong>8、 给不给开发票？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：我们销售的所有商品都是免费提供正规发票的，在您下订单时结算时勾选索取发票，填写相关信息，我们会在您收到货后30天（因涉及退换货流程，发票不能随商品一起发出，给您造成不便尽请谅解）以平邮的方式将发票邮寄给您，如需提前索取发票请联系在线客服或拨打客服电话：4001-234-567。</p></li><li><p><strong>9、本商城都有哪些支付方式？ </strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：我们目前支持的付款方式包括网上支付，银行转账和活到付款，详情见：<a style=\"color: #007eff\" href=\"help-19-20.html\">支付方式</a>。</p></li><li><p><strong>10、退货换货的运费怎么算？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：（1）购买商品30天内(商品未拆封使用)，由于顾客自身原因退、换等值或超值的商品时，由顾客承担退回货物至本商城时所需的运费和本商城发送的运费。邮费通过支付宝支付到<span style=\"color: #007eff\">pay@yourdomain.com</span>或者银行转账到我们的银行卡号即可。<br/>\n		&nbsp;&nbsp;&nbsp; （2）购买商品30天内且由于商品的质量问题退换货时，由本商城补贴顾客退回货物的运费（已购物券的形式返还）及本商城承担再次发送的运费。</p></li><li><p><strong>11、我是在校学生，学校的地址可以货到付款吗？</strong></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		答：大学以下等级的学校不支持货到付款服务。但您可以选择款到发货。</p></li></ul>'),(32,455,1337916899,1450590990,4,NULL,NULL,NULL,17,NULL,0,'购物流程','',NULL,100000,NULL,'购物流程','','<ul class=\" list-paddingleft-2\" style=\"width: 687px; float: left; overflow: hidden; display: block; margin-left: 47px;\"><li><p>\n		商品订购流程</p><p><br/></p><p><br/></p><p>一、选择商品</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img style=\"width: 849px; height: 377px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201354357820.jpg\" title=\"show.jpg\" height=\"377\" width=\"849\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二、放入购物车</p><p><br/></p><p><br/></p><p><br/></p><p><img style=\"width: 699px; height: 237px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201355224770.jpg\" title=\"show.jpg\" height=\"237\" width=\"699\"/></p><p><br/></p><p><br/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三、填写收货人信息</p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201355539676.jpg\" title=\"show.jpg\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四、确认送货方式和付款方式</p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201356016913.jpg\" title=\"show.jpg\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;五、提交订单，完成支付</p><p><br/></p><p><br/></p><p><img style=\"width: 791px; height: 281px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201356157133.jpg\" title=\"show.jpg\" height=\"281\" width=\"791\"/></p>'),(33,500,1337918193,1450591293,1,NULL,NULL,NULL,25,NULL,0,'订单查询','',NULL,100000,NULL,'订单查询','','<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p>\n		订单查询方式：</p></li><li><p>\n		会员订单查询：</p></li></ul><p><br/></p><p><br/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登陆会员中心后，在我的订单中可以看到订单列表</p><p><br/></p><p><img style=\"width: 749px; height: 312px;\" alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201401041805.jpg\" title=\"show.jpg\" height=\"312\" width=\"749\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 在右侧的订单状态后面的订单状态查询输入框中输入要查询的订单号后，点击“查询（放大镜）”，就可用查询到相关订单</p><p><br/></p><p><img alt=\"show.jpg\" src=\"http://static.v5.javamall.com.cn/attachment/ueditor/201512201401276815.jpg\" title=\"show.jpg\"/></p><p><br/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单签收须知：</p><ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; margin-left: 23px; overflow: hidden;\"><li><p><br/></p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1. 验货说明： 请您收到商品后务必先对商品的外包装进行检查，如包裹外包装完好无损，请您放心签收；本商城不提供验货再付<br/>\n		&nbsp;&nbsp; 款收货的服务，这是由于物流合作方规定，本商城对此将会尽力改进，请您谅解。如有疑虑请及时联系在线客服或本商城客服<br/>\n		&nbsp;&nbsp; 中心4001-234-567进行查询，客服会及时为您处理。<br/>\n		2. 签收说明： 需要您先签收后验货。您签收后发现商品有破损，可以直接联系本商城在线客服或客服电话4001-234-567，我们可<br/>\n		&nbsp;&nbsp; 以为您做相关处理。</p></li><li><p>\n		配送异常情况说明：</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1. 快递配送：由于配送前不会与收件人电话联系，而是直接按收件地址进行配送，所以会出现未妥投（地址无人接收），或者他<br/>\n		&nbsp;&nbsp; 人代签收的情况。如果您一直没有收到商品，请及时查询订单快递详情，或联系本商城在线客服、本商城客服电话4001-234-<br/>\n		&nbsp;&nbsp;&nbsp;567进行查询。<br/>\n		2. 延迟投递：您的货物已经到达当地的配送点，但由于时间原因需延迟到第二天派件。请您再耐心等待一天。<br/>\n		3. 宅急送：由于宅急送有些地区的货到付款款项交接，所以时间会有延时，如出现任何配送问题请及时与本商城在线客服联系或<br/>\n		&nbsp;&nbsp;&nbsp;拨打客服电话4001-234-567。</p></li></ul>'),(34,450,1337919451,1450587340,2,NULL,NULL,NULL,25,NULL,0,'订单常见问题','',NULL,100000,NULL,'订单常见问题','','<ul class=\" list-paddingleft-2\" style=\"width: 687px; display: block; float: left; color: #333333; margin-left: 23px; overflow: hidden\"><li><p>\n		订单状态说明</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1、等待付款：除支付方式为货到付款的订单,均需要您在下订单后完成支付操作,您的订单才正式生效,本商城才会进行配货发<br/>\n		&nbsp;&nbsp;&nbsp;货,由于您付款延迟造成的订单缺货,我们表示抱歉。（注：若您需要修改订单，需要自行取消订单，再重新下订单）<br/>\n		2、已付款待确认：您已成功提交订单，我们会在工作时间内尽快审核、确认您的订单，如长时间未被确认，请联系商城客服或<br/>\n		&nbsp;&nbsp;&nbsp;拨打客服热线4001-234-567；<br/>\n		3、已付款：表示您的订单货款我们已收到并核对。<br/>\n		4、配货中：表示您的订单已处于配货环节，最晚将在3天内完成这个环节。<br/>\n		5、配货完成待发货：表示您的订单货物已完成配货待快递发出。<br/>\n		6、已发货：表示您的订单货物已发出，您可以根据物流号在本站或相关物流公司网站查询您的订单配送状态。<br/>\n		7、已收货：表示您已收到、核对您所购买的商品并确认签收，此项订单交易成功。<br/>\n		8、已完成：表示您已核对并签收您的商品30天。<br/>\n		9、已取消：表示由您自己或委托客户取消的订单。<br/>\n		10、已确认（货到付款）：货到付款的订单需要本商城人员确认。</p></li><li><p>\n		修改订单</p></li><li><p>\n		&nbsp;</p></li><li><p>\n		1、订单成功提交后，您在未支付前随时可修改或取消您的订单，如果您的订单已完成支付手续，请联络我们的客服人员为您修<br/>\n		&nbsp;&nbsp;&nbsp;改。<br/>\n		2、选择货到付款的客户，在订单状态为已确认之前随时可修改或取消您的订单，如果您的订单已确认请联络我们的客服人员为<br/>\n		&nbsp;&nbsp;&nbsp;您修改。<br/>\n		3、您可以进入&quot;在线客服&quot;向客服人员咨询,客服离线情况下可以给客服留言。或者通过拨打我们的客服热线4001-234-567来修<br/>\n		&nbsp;&nbsp;&nbsp;改您的订单。 &nbsp;</p></li><li><p>\n		Q：如何快速找到我喜欢的商品？<br/><span style=\"color: #808080\">A：除了通过导航栏的按钮、主页左侧的商品分类来浏览相关商品外，还可通过每页上部侧的搜索框来查找商品。</span><br/><br/>\n		Q: 我不清楚邮编号码怎么办？<br/><span style=\"color: #808080\">A: 请尽量填写，正确的邮编信息您可以通过拨打当地的邮政11185热线查询 。</span><br/><br/>\n		Q：我的订单选择了款到发货，可以换成货到付款的方式吗？<br/><span style=\"color: #808080\">A：您只需另下一张货到付款的订单即可。但别忘了取消原来已经下好的款到发货的订单哦!</span><br/><br/>\n		Q：我的订单已经付款，还想修改订单怎么办？<br/><span style=\"color: #808080\">A：请立即拨打服务热线：4001-234-567，我们的客服会帮助您修改订单。</span><br/><br/>\n		Q: 我没有固定的收货地址怎么办？<br/><span style=\"color: #808080\">A: 如您可以到离您最近的快递公司去取货也可以下订单，但需电话联系我们的客服。</span><br/><br/>\n		Q：我如何在本商城下订单购买？<br/><span style=\"color: #808080\">A：在本商城购物非常简单快捷。如果您还不是本商城的会员，可以直接购买或请您先注册成为我们的会员（可享受会员优惠和购<br/>\n		&nbsp;&nbsp;&nbsp;物礼券等优惠活动），如果您已经注册成为我们的会员请您先登录我们网站。然后在您所选择的商品页面选择您所要商品的规<br/>\n		&nbsp;&nbsp;&nbsp;格和数量，然后点击立刻购买按钮即可。然后就是按照你所选择的支付方式操作，本商城的工作人员会在后台看到您的<br/>\n		&nbsp;&nbsp;&nbsp;订单后尽快和您确认，我们在确认收到您的款项后会根据您在购物订单填写的地址和收件人给您配送货物。<br/>\n		&nbsp;&nbsp;&nbsp;如果您还有不明白的地方，请点击</span><a style=\"color: #000000\" href=\"help-17-32.html\">本商城购买流程</a>。<br/><br/><a name=\"order_merger\"></a>Q:我下了两张订单怎么合并订单？<br/><span style=\"color: #808080\">A:1.若两张订单均处于“待审核”状态，请直接删除两张订单后再重新下订单即可。<br/>\n		&nbsp;&nbsp;&nbsp;2.若其中一张订单已被受理，请工作时间联系本商城在线客服或拨打我们的服务热线：4001-234-567 ，我们的客服会帮助您处<br/>\n		&nbsp;&nbsp;&nbsp;理。</span></p></li></ul>');

/*Table structure for table `es_hot_keyword` */

DROP TABLE IF EXISTS `es_hot_keyword`;

CREATE TABLE `es_hot_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `lastmodified` bigint(20) DEFAULT NULL,
  `hit` bigint(20) DEFAULT NULL,
  `able_time` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `is_commend` int(11) DEFAULT NULL,
  `sys_lock` int(11) DEFAULT '0',
  `page_title` varchar(255) DEFAULT NULL,
  `page_keywords` varchar(255) DEFAULT NULL,
  `page_description` longtext,
  `site_code` int(11) DEFAULT '100000',
  `siteidlist` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `hot_searchword` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `es_hot_keyword` */

insert  into `es_hot_keyword`(`id`,`sort`,`add_time`,`lastmodified`,`hit`,`able_time`,`state`,`user_id`,`cat_id`,`is_commend`,`sys_lock`,`page_title`,`page_keywords`,`page_description`,`site_code`,`siteidlist`,`keyword`,`url`,`hot_searchword`,`title`) values (1,1,1330318000,1450586948,0,NULL,NULL,NULL,1,NULL,0,'炖锅','',NULL,100000,NULL,NULL,'goods_list.html?keyword=炖锅','炖锅',NULL),(2,2,1330318000,1450586872,0,NULL,NULL,NULL,1,NULL,0,'女装','',NULL,100000,NULL,NULL,'goods_list.html?keyword=女装','女装',NULL),(3,2,1330318000,1450586925,0,NULL,NULL,NULL,1,NULL,0,'香水','',NULL,100000,NULL,NULL,'goods_list.html?keyword=香水','香水',NULL);

/*Table structure for table `es_index_item` */

DROP TABLE IF EXISTS `es_index_item`;

CREATE TABLE `es_index_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `es_index_item` */

insert  into `es_index_item`(`id`,`title`,`url`,`sort`) values (1,'站点统计信息','/core/admin/indexItem/base.do',1),(2,'订单统计信息','/shop/admin/indexItem/order.do',2),(3,'商品统计信息','/shop/admin/indexItem/goods.do',3);

/*Table structure for table `es_limitbuy` */

DROP TABLE IF EXISTS `es_limitbuy`;

CREATE TABLE `es_limitbuy` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `end_time` int(11) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `is_index` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_limitbuy` */

/*Table structure for table `es_limitbuy_goods` */

DROP TABLE IF EXISTS `es_limitbuy_goods`;

CREATE TABLE `es_limitbuy_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `limitbuyid` int(10) DEFAULT NULL,
  `goodsid` int(10) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_limitbuy_goods` */

/*Table structure for table `es_logi_company` */

DROP TABLE IF EXISTS `es_logi_company`;

CREATE TABLE `es_logi_company` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `es_logi_company` */

insert  into `es_logi_company`(`id`,`name`,`code`) values (1,'圆通速递','yuantong'),(2,'宅急送','zhaijisong'),(3,'中通速递','zhongtong'),(4,'申通快递','shentong'),(5,'顺丰速递','shunfeng');

/*Table structure for table `es_member` */

DROP TABLE IF EXISTS `es_member`;

CREATE TABLE `es_member` (
  `member_id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` int(10) DEFAULT NULL,
  `parentid` int(10) DEFAULT '0',
  `lv_id` int(8) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `regtime` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(8) DEFAULT NULL,
  `birthday` bigint(20) DEFAULT NULL,
  `advance` decimal(20,2) DEFAULT '0.00',
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `town_id` int(10) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  `mp` int(10) DEFAULT '0',
  `QQ` varchar(50) DEFAULT NULL,
  `msn` varchar(50) DEFAULT NULL,
  `remark` longtext,
  `lastlogin` bigint(20) DEFAULT '1280629569',
  `is_agent` int(8) DEFAULT '0',
  `logincount` int(10) DEFAULT '0',
  `is_cheked` int(8) DEFAULT '0',
  `registerip` varchar(255) DEFAULT NULL,
  `recommend_point_state` int(8) DEFAULT '0',
  `last_send_email` int(10) DEFAULT NULL,
  `info_full` int(8) DEFAULT '0',
  `find_code` varchar(255) DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `midentity` int(8) DEFAULT NULL,
  `disabled` smallint(1) DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `ind_member_uname` (`uname`,`email`),
  KEY `ind_member_lvid` (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `es_member` */

insert  into `es_member`(`member_id`,`agentid`,`parentid`,`lv_id`,`uname`,`email`,`password`,`regtime`,`name`,`sex`,`birthday`,`advance`,`province_id`,`city_id`,`region_id`,`town_id`,`province`,`city`,`region`,`town`,`address`,`zip`,`mobile`,`tel`,`point`,`mp`,`QQ`,`msn`,`remark`,`lastlogin`,`is_agent`,`logincount`,`is_cheked`,`registerip`,`recommend_point_state`,`last_send_email`,`info_full`,`find_code`,`face`,`nickname`,`midentity`,`disabled`) values (1,NULL,0,1,'kingapex','kingapex@163.com','5996c4c3ceca2b93f9c0902547c245db',1330404354180,'kingapex',1,NULL,'0.00',1,2816,2862,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,0,0,NULL,NULL,NULL,1330404354,0,2,0,'0:0:0:0:0:0:0:1',0,NULL,0,NULL,'','kingapex',0,0),(2,NULL,0,1,'demowhj','sdkjfh1296356@qq.com','96e79218965eb72c92a549dd5a330112',1448325889,'demowhj',1,NULL,'0.00',1,2816,2862,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,65,65,NULL,NULL,NULL,1450586775,0,3,0,'0:0:0:0:0:0:0:1',0,NULL,0,NULL,'',NULL,0,0),(3,NULL,0,1,'haha','527587916@qq.com','e10adc3949ba59abbe56e057f20f883e',1529551641,'haha',1,NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,50,NULL,NULL,NULL,1529552523,0,2,0,'125.118.63.125',0,NULL,0,NULL,'','haha',0,0),(4,NULL,0,1,'smile','527587918@qq.com','e10adc3949ba59abbe56e057f20f883e',1529980756,'smile',1,NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,50,NULL,NULL,NULL,1529997711,0,7,0,'183.157.81.183',0,NULL,0,NULL,'','smile',0,0);

/*Table structure for table `es_member_address` */

DROP TABLE IF EXISTS `es_member_address`;

CREATE TABLE `es_member_address` (
  `addr_id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(8) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `province_id` int(10) DEFAULT NULL,
  `city_id` int(10) DEFAULT NULL,
  `region_id` int(10) DEFAULT NULL,
  `town_id` int(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `def_addr` int(10) DEFAULT '0',
  `isDel` int(10) DEFAULT '0',
  `shipAddressName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `ind_mem_addr` (`member_id`,`isDel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_member_address` */

/*Table structure for table `es_member_bonus` */

DROP TABLE IF EXISTS `es_member_bonus`;

CREATE TABLE `es_member_bonus` (
  `bonus_id` int(8) NOT NULL AUTO_INCREMENT,
  `bonus_type_id` int(10) DEFAULT NULL,
  `bonus_sn` varchar(30) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `used_time` bigint(20) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `emailed` int(8) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `binding` int(10) DEFAULT NULL,
  `member_name` varchar(100) DEFAULT NULL,
  `order_sn` varchar(100) DEFAULT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `bonus_type` int(8) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `used` int(2) DEFAULT '0',
  PRIMARY KEY (`bonus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_member_bonus` */

/*Table structure for table `es_member_comment` */

DROP TABLE IF EXISTS `es_member_comment`;

CREATE TABLE `es_member_comment` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `content` longtext,
  `img` varchar(255) DEFAULT NULL,
  `dateline` bigint(20) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reply` longtext,
  `replytime` bigint(20) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT NULL,
  `replystatus` int(8) DEFAULT NULL,
  `grade` int(10) DEFAULT NULL,
  `is_top` int(8) NOT NULL DEFAULT '0',
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_member_comment` */

/*Table structure for table `es_member_comment_gallery` */

DROP TABLE IF EXISTS `es_member_comment_gallery`;

CREATE TABLE `es_member_comment_gallery` (
  `img_id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_id` int(10) DEFAULT NULL,
  `original` varchar(255) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_member_comment_gallery` */

/*Table structure for table `es_member_coupon` */

DROP TABLE IF EXISTS `es_member_coupon`;

CREATE TABLE `es_member_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpnsid` int(10) DEFAULT NULL,
  `memberid` int(10) DEFAULT NULL,
  `used` int(8) DEFAULT NULL,
  `get_time` int(11) DEFAULT NULL,
  `cpns_sn` varchar(255) DEFAULT NULL,
  `cpns_name` varchar(255) DEFAULT NULL,
  `cat_ids` varchar(1000) DEFAULT NULL,
  `cat_names` varchar(1000) DEFAULT NULL,
  `goods_price` varchar(22) DEFAULT NULL,
  `discount_price` varchar(22) DEFAULT NULL,
  `allcat` int(8) DEFAULT '0',
  `end_time` int(11) DEFAULT NULL,
  `can_give` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_member_coupon` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_member_coupon` */

/*Table structure for table `es_member_lv` */

DROP TABLE IF EXISTS `es_member_lv`;

CREATE TABLE `es_member_lv` (
  `lv_id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `default_lv` int(8) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `point` int(10) DEFAULT '0',
  PRIMARY KEY (`lv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `es_member_lv` */

insert  into `es_member_lv`(`lv_id`,`name`,`default_lv`,`discount`,`point`) values (1,'普通会员',1,100,0),(2,'黄金会员',0,98,300),(3,'白金会员',0,95,1200),(4,'钻石卡VIP会员',0,92,5000);

/*Table structure for table `es_member_lv_discount` */

DROP TABLE IF EXISTS `es_member_lv_discount`;

CREATE TABLE `es_member_lv_discount` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `lv_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `es_ind_mem_lv_dis` (`lv_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_member_lv_discount` */

/*Table structure for table `es_member_order_item` */

DROP TABLE IF EXISTS `es_member_order_item`;

CREATE TABLE `es_member_order_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `commented` varchar(4) DEFAULT NULL,
  `comment_time` bigint(20) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_member_order_item_index` (`member_id`,`goods_id`,`order_id`,`item_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_member_order_item` */

/*Table structure for table `es_menu` */

DROP TABLE IF EXISTS `es_menu`;

CREATE TABLE `es_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `sorder` int(11) DEFAULT '50',
  `menutype` int(11) DEFAULT NULL,
  `datatype` varchar(50) DEFAULT NULL,
  `selected` int(6) DEFAULT '0',
  `deleteflag` int(6) DEFAULT '0',
  `canexp` int(6) DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `icon_hover` varchar(255) DEFAULT NULL,
  `is_display` int(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

/*Data for the table `es_menu` */

insert  into `es_menu`(`id`,`appid`,`pid`,`title`,`url`,`target`,`sorder`,`menutype`,`datatype`,`selected`,`deleteflag`,`canexp`,`icon`,`icon_hover`,`is_display`) values (1,'',0,'商品','/shop/admin/goods/list.do','',50,2,NULL,1,0,1,'/adminthemes/new/images/menu_01.gif',NULL,0),(2,'',1,'商品管理','','',50,2,NULL,0,0,1,'',NULL,0),(3,'',2,'商品列表','/shop/admin/goods/list.do','',50,2,NULL,0,0,1,'',NULL,0),(4,'',2,'添加商品','/shop/admin/goods/select-cat.do','',50,2,NULL,0,0,1,'',NULL,0),(5,'',2,'进货','/shop/admin/goods-store/list-goods-store.do?optype=purchase','',50,2,NULL,0,0,1,'',NULL,0),(6,'',2,'库存维护','/shop/admin/goods-store/list-goods-store.do?optype=view','',50,2,NULL,0,0,1,'',NULL,0),(7,'',2,'预警货品','/shop/admin/goods-warning-store/list-goods-warningstore.do?optype=view','',50,2,NULL,0,0,1,'',NULL,0),(8,'',1,'商品设置','','',50,2,NULL,0,0,1,'',NULL,0),(9,'',8,'分类列表','/shop/admin/cat/list.do','',50,2,NULL,0,0,1,'',NULL,0),(10,'',8,'品牌列表','/shop/admin/brand/list.do','',50,2,NULL,0,0,1,'',NULL,0),(11,'',8,'类型列表','/shop/admin/type/list.do','',50,2,NULL,0,0,1,'',NULL,0),(12,'',8,'规格列表','/shop/admin/spec/list.do','',50,2,NULL,0,0,1,'',NULL,0),(13,'',1,'商品评论','','',50,2,NULL,0,0,1,'',NULL,0),(14,'',13,'商品评论列表','/shop/admin/comments/list.do?type=1','',50,2,NULL,0,0,1,'',NULL,0),(15,'',13,'购买咨询列表','/shop/admin/comments/list.do?type=2','',50,2,NULL,0,0,1,'',NULL,0),(16,'',1,'标签管理','','',50,2,NULL,0,0,1,'',NULL,0),(17,'',16,'标签列表','/shop/admin/tag/list.do','',50,2,NULL,0,0,1,'',NULL,0),(18,'',16,'标签商品设置','/shop/admin/goods-show/tag-list.do','',50,2,NULL,0,0,1,'',NULL,0),(19,'',16,'标签品牌设置','/shop/admin/brands-show/list.do','',50,2,NULL,0,0,1,'',NULL,0),(20,'',0,'订单','/shop/admin/order/list.do','ajax',50,2,NULL,0,0,1,'/adminthemes/new/images/menu_default.gif',NULL,0),(21,'',20,'订单管理','','',50,2,NULL,0,0,1,'',NULL,0),(22,'',21,'订单列表','/shop/admin/order/list.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(23,'',21,'待结算订单','/shop/admin/order/not-pay-order.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(24,'',21,'待发货订单','/shop/admin/order/not-ship-order.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(25,'',21,'待收货订单','/shop/admin/order/not-rog-order.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(26,'',20,'单据管理','','',50,2,NULL,0,0,1,'',NULL,0),(27,'',26,'收款单','/shop/admin/order-report/payment-list.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(28,'',26,'发货单','/shop/admin/order-report/shipping-list.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(29,'',26,'退货单','/shop/admin/order-report/returned-list.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(30,'',26,'退款单','/shop/admin/order-report/refund-list.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(31,'',20,'订单申请','','',50,2,NULL,0,0,1,'',NULL,0),(32,'',31,'退款申请','/shop/admin/sell-back/refund-list.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(33,'',31,'退货申请','/shop/admin/order-report/returned-list.do?status=0','ajax',50,2,NULL,0,0,1,'',NULL,0),(34,'',20,'发票管理','','',50,2,NULL,0,0,1,'',NULL,0),(35,'',34,'历史发票 ','/shop/admin/receipt/history-list.do','ajax',50,2,NULL,0,0,1,'',NULL,0),(36,'',0,'会员','/shop/admin/member/member-list.do','',50,2,NULL,0,0,1,'/adminthemes/new/images/menu_03.gif',NULL,0),(37,'',36,'会员管理','','',50,2,NULL,0,0,1,'',NULL,0),(38,'',37,'会员列表','/shop/admin/member/member-list.do','',50,2,NULL,0,0,1,'',NULL,0),(39,'',37,'会员等级','/shop/admin/member/list-lv.do','',50,2,NULL,0,0,1,'',NULL,0),(40,'',37,'会员回收站','/shop/admin/member/list-recycle.do','',50,2,NULL,0,0,1,'',NULL,0),(41,'',36,'会员短消息','','',50,2,NULL,0,0,1,'',NULL,0),(42,'',41,'历史消息','/shop/admin/message/list.do','',50,2,NULL,0,0,1,'',NULL,0),(43,'',0,'促销','/shop/admin/activities/index.jsp','',50,2,NULL,0,0,1,'/adminthemes/new/images/menu_04.gif',NULL,0),(44,'',43,'促销活动管理','','',50,2,NULL,0,0,1,'',NULL,0),(45,'',44,'促销活动列表','/shop/admin/activity/list.do','',50,2,NULL,0,0,1,'',NULL,0),(46,'',43,'赠品管理','','',50,2,NULL,0,0,1,'',NULL,0),(47,'',46,'赠品列表','/shop/admin/gift/list.do','',50,2,NULL,0,0,1,'',NULL,0),(48,'',43,'优惠券管理','','',50,2,NULL,0,0,1,'',NULL,0),(49,'',48,'优惠券列表','/shop/admin/bonus-type/list.do','',50,2,NULL,0,0,1,'',NULL,0),(50,'',0,'页面','/core/admin/user/siteTheme.do','',50,2,NULL,0,0,1,'/adminthemes/new/images/menu_05.gif',NULL,0),(51,'',50,'装修','','',50,2,NULL,0,0,1,'',NULL,0),(52,'',51,'首页楼层管理','/core/admin/floor/list.do','',50,2,NULL,0,0,1,'',NULL,0),(53,'',51,'橱窗管理','/core/admin/showcase/list.do','',50,2,NULL,0,0,1,'',NULL,0),(54,'',51,'专题管理','/core/admin/subject/list.do','',50,2,NULL,0,0,1,'',NULL,0),(55,'',50,'广告管理','','',50,2,NULL,0,0,1,'',NULL,0),(56,'',55,'广告位','/core/admin/adColumn/list.do','',50,2,NULL,0,0,1,'',NULL,0),(57,'',55,'广告列表','/core/admin/adv/list.do','',50,2,NULL,0,0,1,'',NULL,0),(58,'',50,'页面设置','','',50,2,NULL,0,0,1,'',NULL,0),(59,'',58,'导航栏管理','/core/admin/site-menu/list.do','',50,2,NULL,0,0,1,'',NULL,0),(60,'',58,'热门关键字','/cms/admin/data/list.do?catid=1','',50,2,NULL,0,0,1,'',NULL,0),(61,'',58,'帮助中心','/cms/admin/data/help-list.do','',50,2,NULL,0,0,1,'',NULL,0),(62,'',0,'统计','','',50,2,NULL,0,0,1,'/adminthemes/new/images/menu_05.gif',NULL,0),(63,'',62,'会员分析','','',50,2,NULL,0,0,1,'',NULL,0),(64,'',63,'会员下单量统计','/shop/admin/memberStatistics/member-analysis-html.do','',50,2,NULL,0,0,1,'',NULL,0),(65,'',63,'新增会员统计','/shop/admin/memberStatistics/add-member-num-html.do','',50,2,NULL,0,0,1,'',NULL,0),(66,'',62,'商品统计','','',50,2,NULL,0,0,1,'',NULL,0),(67,'',66,'价格销量','/shop/admin/goodsStatis/price-sales.do','',50,2,NULL,0,0,1,'',NULL,0),(68,'',66,'热卖商品统计','/shop/admin/goodsStatis/hot-goods.do?statis_type=1','',50,2,NULL,0,0,1,'',NULL,0),(69,'',66,'商品销售明细','/shop/admin/goodsStatis/goods-sales-detail.do','',50,2,NULL,0,0,1,'',NULL,0),(70,'',66,'商品收藏统计','/shop/admin/goodsStatis/goods-collect.do','',50,2,NULL,0,0,1,'',NULL,0),(71,'',62,'行业分析','','',50,2,NULL,0,0,1,'',NULL,0),(72,'',71,'行业规模','/shop/admin/industryStatistics/show-page.do','',50,2,NULL,0,0,1,'',NULL,0),(73,'',71,'概括总览','/shop/admin/industryStatistics/show-collect.do?cat_id=0','',50,2,NULL,0,0,1,'',NULL,0),(74,'',62,'流量分析','','',50,2,NULL,0,0,1,'',NULL,0),(75,'',74,'流量分析','/shop/admin/flowStatistics/flow-statistics-html.do','',50,2,NULL,0,0,1,'',NULL,0),(76,'',74,'商品流量分析','/shop/admin/flowStatistics/goods-flow-statistics-html.do','',50,2,NULL,0,0,1,'',NULL,0),(77,'',62,'其他统计','','',50,2,NULL,0,0,1,'',NULL,0),(78,'',77,'订单统计','/shop/admin/salesStatis/order-statis.do?order_statis_type=1','',50,2,NULL,0,0,1,'',NULL,0),(79,'',77,'销售收入统计','/shop/admin/salesStatis/sale-income.do','',50,2,NULL,0,0,1,'',NULL,0),(80,'',77,'区域分析','/shop/admin/regionOrderStatistics/region-list.do','',50,2,NULL,0,0,1,'',NULL,0),(81,'',77,'客单价分布图','/shop/admin/memberStatistics/buy-analysis-html.do','',50,2,NULL,0,0,1,'',NULL,0),(82,'',77,'退款统计','/shop/admin/orderReturnedStatistics/returned-statistics.do','',50,2,NULL,0,0,1,'',NULL,0),(83,'',62,'日志管理','','',50,2,NULL,0,0,1,'',NULL,0),(84,'',83,'日志管理','/shop/admin/logs/list.do','',50,2,NULL,0,0,1,'',NULL,0),(85,'',0,'设置','/core/admin/setting/edit_input.do','',50,2,NULL,0,0,1,'/adminthemes/new/images/menu_06.gif',NULL,0),(86,'',85,'网店设置','','',50,2,NULL,0,0,1,'',NULL,0),(87,'',86,'系统设置','/core/admin/setting/edit-input.do','',50,2,NULL,0,0,1,'',NULL,0),(88,'',86,'smtp设置','/core/admin/smtp/list.do','',50,2,NULL,0,0,1,'',NULL,0),(89,'',86,'短信网关设置','/core/admin/sms/list.do','',50,2,NULL,0,0,1,'',NULL,0),(90,'',86,'快递平台设置','/shop/admin/express/list.do','',50,2,NULL,0,0,1,'',NULL,0),(91,'',86,'发票设置','/shop/admin/receipt/list.do','',50,2,NULL,0,0,1,'',NULL,0),(92,'',85,'配送和支付','','',50,2,NULL,0,0,1,'',NULL,0),(93,'',92,'支付方式','/shop/admin/payCfg/list.do','',50,2,NULL,0,0,1,'',NULL,0),(94,'',92,'配送方式','/shop/admin/dly-type/list.do','',50,2,NULL,0,0,1,'',NULL,0),(95,'',92,'物流公司','/shop/admin/logi/list-logi.do','',50,2,NULL,0,0,1,'',NULL,0),(96,'',92,'地区管理','/shop/admin/region/list.do','',50,2,NULL,0,0,1,'',NULL,0),(97,'',92,'仓库管理','/shop/admin/depot/list.do','',50,2,NULL,0,0,1,'',NULL,0),(98,'',85,'快递单管理','','',50,2,NULL,0,0,1,'',NULL,0),(99,'',98,'快递单模板管理','/shop/admin/print-tmpl/list.do','',50,2,NULL,0,0,1,'',NULL,0),(100,'',98,'发货信息管理','/shop/admin/dly-center/list.do','',50,2,NULL,0,0,1,'',NULL,0),(101,'',85,'权限管理','','',50,2,NULL,0,0,1,'',NULL,0),(102,'',101,'管理员管理','/core/admin/userAdmin/list.do','',50,2,NULL,0,0,1,'',NULL,0),(103,'',101,'角色管理','/core/admin/role/list.do','',50,2,NULL,0,0,1,'',NULL,0),(104,'',101,'权限点管理','/core/admin/auth/list.do','',50,2,NULL,0,0,1,'',NULL,0),(105,'',0,'开发者','/admin/setting/setting/edit_input.do','',50,2,NULL,0,0,1,'/adminthemes/new/images/menu_07.gif',NULL,0),(106,'',105,'工具','','',50,2,NULL,0,0,1,'',NULL,0),(107,'',106,'URL映射','/core/admin/themeUri/list.do','',50,2,NULL,0,0,1,'',NULL,0),(108,'',106,'菜单管理','/core/admin/menu/tree.do','',50,2,NULL,0,0,1,'',NULL,0),(109,'',106,'数据导出','/core/admin/data-export/export.do','',50,2,NULL,0,0,1,'',NULL,0),(110,'',105,'主题管理','','',50,2,NULL,0,0,1,'',NULL,0),(111,'',110,'站点前台主题','/core/admin/user/siteTheme/info.do','',50,2,NULL,0,0,1,'',NULL,0),(112,'',110,'站点后台主题','/core/admin/user/siteAdminTheme/info.do','',50,2,NULL,0,0,1,'',NULL,0),(113,'',105,'页面管理','','',50,2,NULL,0,0,1,'',NULL,0),(114,'',113,'文章模型','/cms/admin/model/list.do','',50,2,NULL,0,0,1,'',NULL,0),(115,'',113,'文章管理','/cms/admin/cat/list.do','',50,2,NULL,0,0,1,'',NULL,0),(116,'',105,'组件','','',50,2,NULL,0,0,1,'',NULL,0),(117,'',116,'组件管理','/core/admin/component/list.do','',50,2,NULL,0,0,1,'',NULL,0),(118,'',0,'浏览网站','../','_blank',50,2,NULL,0,0,1,'',NULL,0),(119,'',0,'退出','/admin/logout.do','_self',50,2,NULL,0,0,1,'',NULL,0);

/*Table structure for table `es_message` */

DROP TABLE IF EXISTS `es_message`;

CREATE TABLE `es_message` (
  `msg_id` int(8) NOT NULL AUTO_INCREMENT,
  `for_id` int(8) NOT NULL DEFAULT '0',
  `msg_from` varchar(30) NOT NULL DEFAULT 'anonymous',
  `from_id` int(8) DEFAULT '0',
  `from_type` int(5) NOT NULL DEFAULT '0',
  `to_id` int(8) NOT NULL DEFAULT '0',
  `msg_to` varchar(50) DEFAULT NULL,
  `to_type` int(5) NOT NULL DEFAULT '0',
  `unread` varchar(1) NOT NULL DEFAULT '0',
  `folder` varchar(6) NOT NULL DEFAULT 'inbox',
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `rel_order` bigint(20) DEFAULT '0',
  `date_line` bigint(20) NOT NULL DEFAULT '0',
  `is_sec` varchar(5) NOT NULL DEFAULT 'true',
  `del_status` varchar(1) DEFAULT '0',
  `disabled` varchar(5) NOT NULL DEFAULT 'false',
  `msg_ip` varchar(20) NOT NULL DEFAULT '',
  `msg_type` varchar(7) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_message` */

/*Table structure for table `es_message_bg` */

DROP TABLE IF EXISTS `es_message_bg`;

CREATE TABLE `es_message_bg` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_content` longtext NOT NULL,
  `msg_title` varchar(100) NOT NULL,
  `member_ids` varchar(255) DEFAULT NULL,
  `adminuser_id` int(10) NOT NULL,
  `send_time` bigint(20) NOT NULL,
  `send_type` int(10) NOT NULL,
  `adminuser_name` varchar(255) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_message_bg` */

/*Table structure for table `es_message_front` */

DROP TABLE IF EXISTS `es_message_front`;

CREATE TABLE `es_message_front` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_content` longtext NOT NULL,
  `msg_title` varchar(100) NOT NULL,
  `member_id` int(10) NOT NULL,
  `adminuser_id` int(10) NOT NULL,
  `send_time` bigint(20) NOT NULL,
  `is_delete` int(10) NOT NULL,
  `is_read` int(10) NOT NULL,
  `adminuser_name` varchar(255) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_message_front` */

/*Table structure for table `es_order` */

DROP TABLE IF EXISTS `es_order`;

CREATE TABLE `es_order` (
  `order_id` int(8) NOT NULL AUTO_INCREMENT,
  `sn` varchar(50) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `pay_status` int(8) DEFAULT NULL,
  `ship_status` int(8) DEFAULT NULL,
  `shipping_id` int(8) DEFAULT NULL,
  `shipping_type` varchar(255) DEFAULT NULL,
  `shipping_area` varchar(255) DEFAULT NULL,
  `payment_id` int(8) DEFAULT NULL,
  `payment_name` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_account` varchar(50) DEFAULT NULL,
  `paymoney` decimal(20,2) DEFAULT NULL,
  `goods` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `ship_name` varchar(255) DEFAULT NULL,
  `ship_addr` varchar(255) DEFAULT NULL,
  `ship_zip` varchar(20) DEFAULT NULL,
  `ship_email` varchar(50) DEFAULT NULL,
  `ship_mobile` varchar(50) DEFAULT NULL,
  `ship_tel` varchar(50) DEFAULT NULL,
  `ship_day` varchar(255) DEFAULT NULL,
  `ship_time` varchar(255) DEFAULT NULL,
  `is_protect` varchar(1) DEFAULT NULL,
  `protect_price` decimal(20,2) DEFAULT NULL,
  `goods_amount` decimal(20,2) DEFAULT NULL,
  `shipping_amount` decimal(20,2) DEFAULT NULL,
  `order_amount` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `goods_num` int(8) DEFAULT NULL,
  `gainedpoint` int(10) DEFAULT '0',
  `consumepoint` int(10) DEFAULT '0',
  `remark` longtext,
  `disabled` varchar(1) DEFAULT NULL,
  `discount` decimal(20,2) DEFAULT NULL,
  `imported` int(8) DEFAULT '0',
  `pimported` int(8) DEFAULT '0',
  `complete_time` int(11) DEFAULT '0',
  `cancel_reason` varchar(255) DEFAULT NULL,
  `signing_time` int(10) DEFAULT NULL,
  `the_sign` varchar(255) DEFAULT NULL,
  `allocation_time` int(10) DEFAULT NULL,
  `ship_provinceid` int(10) DEFAULT NULL,
  `ship_cityid` int(10) DEFAULT NULL,
  `ship_regionid` int(10) DEFAULT NULL,
  `ship_townid` int(10) DEFAULT NULL,
  `sale_cmpl` int(8) DEFAULT NULL,
  `sale_cmpl_time` int(11) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `admin_remark` varchar(1000) DEFAULT NULL,
  `need_pay_money` decimal(20,2) DEFAULT NULL,
  `ship_no` varchar(255) DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  `items_json` longtext,
  `logi_id` int(10) DEFAULT NULL,
  `logi_name` varchar(255) DEFAULT NULL,
  `gift_id` int(10) DEFAULT '0',
  `bonus_id` int(10) DEFAULT '0',
  `act_discount` decimal(20,2) DEFAULT NULL,
  `activity_point` int(10) DEFAULT '0',
  `is_cancel` int(10) DEFAULT '0',
  `is_online` int(10) DEFAULT '0',
  `receipt_content` varchar(50) DEFAULT NULL,
  `receipt_title` varchar(50) DEFAULT NULL,
  `receipt_duty` varchar(50) DEFAULT NULL,
  `receipt_type` int(10) DEFAULT NULL,
  `receipt` int(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `ind_order_sn` (`sn`),
  KEY `ind_order_state` (`status`,`pay_status`,`ship_status`),
  KEY `ind_order_memberid` (`member_id`),
  KEY `ind_order_term` (`disabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_order` */

/*Table structure for table `es_order_bonus` */

DROP TABLE IF EXISTS `es_order_bonus`;

CREATE TABLE `es_order_bonus` (
  `ob_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `bonus_id` int(10) DEFAULT NULL,
  `bonus_name` varchar(255) DEFAULT NULL,
  `bonus_money` decimal(20,2) DEFAULT NULL,
  `use_start_date` bigint(20) DEFAULT NULL,
  `use_end_date` bigint(20) DEFAULT NULL,
  `min_goods_amount` decimal(20,2) DEFAULT NULL,
  `send_type` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_order_bonus` */

/*Table structure for table `es_order_gift` */

DROP TABLE IF EXISTS `es_order_gift`;

CREATE TABLE `es_order_gift` (
  `og_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `gift_id` int(10) DEFAULT NULL,
  `gift_name` varchar(255) DEFAULT NULL,
  `gift_price` decimal(20,2) DEFAULT NULL,
  `gift_img` varchar(255) DEFAULT NULL,
  `gift_type` smallint(1) DEFAULT NULL,
  `gift_status` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`og_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_order_gift` */

/*Table structure for table `es_order_items` */

DROP TABLE IF EXISTS `es_order_items`;

CREATE TABLE `es_order_items` (
  `item_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `cat_id` int(8) DEFAULT NULL,
  `num` int(8) DEFAULT NULL,
  `ship_num` int(8) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `image` longtext,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `gainedpoint` int(10) DEFAULT '0',
  `addon` longtext,
  `state` int(8) DEFAULT '0',
  `change_goods_name` varchar(255) DEFAULT NULL,
  `change_goods_id` int(8) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `goods_type` smallint(1) DEFAULT '0',
  `snapshot_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `es_order_item` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_order_items` */

/*Table structure for table `es_order_log` */

DROP TABLE IF EXISTS `es_order_log`;

CREATE TABLE `es_order_log` (
  `log_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `op_id` int(8) DEFAULT NULL,
  `op_name` varchar(50) DEFAULT NULL,
  `message` longtext,
  `op_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `ind_order_log` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_order_log` */

/*Table structure for table `es_order_meta` */

DROP TABLE IF EXISTS `es_order_meta`;

CREATE TABLE `es_order_meta` (
  `metaid` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`metaid`),
  KEY `es_ind_orderex_orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_order_meta` */

/*Table structure for table `es_order_pmt` */

DROP TABLE IF EXISTS `es_order_pmt`;

CREATE TABLE `es_order_pmt` (
  `pmt_id` int(8) DEFAULT NULL,
  `order_id` int(8) DEFAULT NULL,
  `pmt_amount` decimal(20,2) DEFAULT NULL,
  `pmt_describe` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_order_pmt` */

/*Table structure for table `es_page` */

DROP TABLE IF EXISTS `es_page`;

CREATE TABLE `es_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `page_html` longtext,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `es_page` */

insert  into `es_page`(`id`,`name`,`path`,`page_html`,`type`) values (1,'PC首页','/index.html',NULL,0);

/*Table structure for table `es_payment_cfg` */

DROP TABLE IF EXISTS `es_payment_cfg`;

CREATE TABLE `es_payment_cfg` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `config` longtext,
  `biref` longtext,
  `pay_fee` decimal(20,2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `pay_img` varchar(255) DEFAULT NULL,
  `is_online` int(8) DEFAULT '1',
  `is_retrace` int(8) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `es_payment_cfg` */

insert  into `es_payment_cfg`(`id`,`name`,`config`,`biref`,`pay_fee`,`type`,`pay_img`,`is_online`,`is_retrace`) values (1,'支付宝','{\"callback_encoding\":\"\",\"return_encoding\":\"\",\"partner\":\"test\",\"seller_email\":\"test\",\"key\":\"test\"}','<p>\n	相关参数请到后台修改</p>\n',NULL,'alipayDirectPlugin',NULL,1,1),(2,'快钱','{\"callback_encoding\":\"UTF-8\",\"ajax\":\"yes\",\"return_encoding\":\"UTF-8\",\"privateKey\":\"123456\",\"keyPwd\":\"123456\",\"partner\":\"test\",\"key\":\"test\",\"url\":\"http://baidu.com\"}','<p>   keyPwd\n	请到后台修改相关参数</p>\n',NULL,'billPlugin','fs:/attachment/payment/kuaiqian.png',1,0),(3,'货到付款','{}','<p>\n	请到后台修改相应参数</p>\n',NULL,'cod',NULL,0,0),(4,'银行汇款','{}','<p>\n	工商银行：8888888，户名test</p>\n',NULL,'offline',NULL,0,0);

/*Table structure for table `es_payment_detail` */

DROP TABLE IF EXISTS `es_payment_detail`;

CREATE TABLE `es_payment_detail` (
  `detail_id` int(8) NOT NULL AUTO_INCREMENT,
  `payment_id` int(8) DEFAULT NULL,
  `pay_money` decimal(20,2) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `admin_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_payment_detail` */

/*Table structure for table `es_payment_logs` */

DROP TABLE IF EXISTS `es_payment_logs`;

CREATE TABLE `es_payment_logs` (
  `payment_id` int(8) NOT NULL AUTO_INCREMENT,
  `order_id` int(8) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `pay_method` varchar(50) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `pay_user` varchar(50) DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `remark` longtext,
  `type` int(8) DEFAULT NULL,
  `status` int(8) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `admin_user` varchar(50) DEFAULT NULL,
  `paymoney` decimal(20,2) DEFAULT '0.00',
  `market_point` decimal(20,2) DEFAULT '0.00',
  `credit` decimal(20,2) DEFAULT '0.00',
  `trasaction_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `ind_pay_log` (`order_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_payment_logs` */

/*Table structure for table `es_pmt_goods` */

DROP TABLE IF EXISTS `es_pmt_goods`;

CREATE TABLE `es_pmt_goods` (
  `pmt_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_pmt_goods` */

/*Table structure for table `es_pmt_member_lv` */

DROP TABLE IF EXISTS `es_pmt_member_lv`;

CREATE TABLE `es_pmt_member_lv` (
  `pmt_id` int(8) DEFAULT NULL,
  `lv_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_pmt_member_lv` */

/*Table structure for table `es_point_history` */

DROP TABLE IF EXISTS `es_point_history`;

CREATE TABLE `es_point_history` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `member_id` int(9) NOT NULL,
  `point` int(10) NOT NULL,
  `time` bigint(20) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `related_id` bigint(20) DEFAULT NULL,
  `type` int(8) NOT NULL,
  `operator` varchar(50) DEFAULT NULL,
  `point_type` int(8) DEFAULT '0',
  `mp` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind_ponit_history` (`member_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_point_history` */

/*Table structure for table `es_print_tmpl` */

DROP TABLE IF EXISTS `es_print_tmpl`;

CREATE TABLE `es_print_tmpl` (
  `prt_tmpl_id` int(10) NOT NULL AUTO_INCREMENT,
  `prt_tmpl_title` varchar(100) NOT NULL,
  `shortcut` varchar(5) DEFAULT 'false',
  `disabled` varchar(5) DEFAULT 'false',
  `prt_tmpl_width` varchar(10) NOT NULL DEFAULT '100',
  `prt_tmpl_height` varchar(10) NOT NULL DEFAULT '100',
  `prt_tmpl_data` longtext,
  `bgimage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`prt_tmpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `es_print_tmpl` */

insert  into `es_print_tmpl`(`prt_tmpl_id`,`prt_tmpl_title`,`shortcut`,`disabled`,`prt_tmpl_width`,`prt_tmpl_height`,`prt_tmpl_data`,`bgimage`) values (1,'宅急送','true','false','1250','2300','data','fs:/attachment/printTmpl/zhaijisong.jpg'),(2,'圆通速递','true','false','1250','2300','data','fs:/attachment/printTmpl/yuantong.jpg');

/*Table structure for table `es_product` */

DROP TABLE IF EXISTS `es_product`;

CREATE TABLE `es_product` (
  `product_id` int(8) NOT NULL AUTO_INCREMENT,
  `goods_id` int(8) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `store` int(8) DEFAULT '0',
  `enable_store` int(8) DEFAULT '0',
  `price` decimal(20,2) DEFAULT NULL,
  `specs` longtext,
  `cost` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `is_pack` int(8) DEFAULT '0',
  PRIMARY KEY (`product_id`),
  KEY `ind_product_goodsid` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=387 DEFAULT CHARSET=utf8;

/*Data for the table `es_product` */

insert  into `es_product`(`product_id`,`goods_id`,`name`,`sn`,`store`,`enable_store`,`price`,`specs`,`cost`,`weight`,`is_pack`) values (1,1,'test','G201201050120354236',0,0,'0.00',NULL,'0.00','0.00',0),(348,271,'olay玉兰油多效修护霜面霜50g*2瓶 保湿补水紧致护肤品化妆品套装','20151124010',333,333,'129.00',NULL,'0.00','0.00',0),(360,280,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ','2015112566789',333,333,'1680.00','红色、XXS','0.00','0.00',0),(361,280,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ','2015112566788',333,333,'1670.00','蓝色、XXS','0.00','0.00',0),(362,280,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ','2015112566787',333,333,'1660.00','粉紫色、XXS','0.00','0.00',0),(363,280,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ','2015112566786',333,333,'1650.00','黄色、XXS','0.00','0.00',0),(364,281,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ','2015112400123453',333,333,'430.00','西瓜红','0.00','0.00',0),(365,281,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ','2015112400123455',1332,1332,'420.00','灰色','0.00','0.00',0),(366,281,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ','2015112400123456',333,333,'410.00','黄色','0.00','0.00',0),(367,281,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ','2015112400123457',333,333,'400.00','粉红色','0.00','0.00',0),(368,282,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ','201511240089',111,111,'300.00','红色、XXS','0.00','0.00',0),(369,282,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ','201511240088',111,111,'310.00','红色、XS','0.00','0.00',0),(370,282,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ','201511240087',111,111,'320.00','黄色、XXS','0.00','0.00',0),(371,282,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ','201511240086',111,111,'330.00','黄色、XS','0.00','0.00',0),(372,282,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ','201511240085',111,111,'340.00','黑色、XXS','0.00','0.00',0),(373,282,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ','201511240084',111,111,'350.00','黑色、XS','0.00','0.00',0),(374,283,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ','201511240097',111,111,'310.00','粉黄色、均码','0.00','0.00',0),(375,283,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ','201511240096',111,111,'320.00','粉黄色、M','0.00','0.00',0),(376,283,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ','201511240095',111,111,'330.00','粉黄色、L','0.00','0.00',0),(377,283,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ','201511240094',111,111,'340.00','浅玫红、均码','0.00','0.00',0),(378,283,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ','201511240093',111,111,'350.00','浅玫红、M','0.00','0.00',0),(379,283,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ','201511240092',111,111,'360.00','浅玫红、L','0.00','0.00',0),(380,284,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ','201511243345',111,111,'270.00','红色、XXL','0.00','0.00',0),(381,284,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ','201511243345',111,111,'280.00','红色、85D','0.00','0.00',0),(382,284,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ','201511243345',111,111,'290.00','灰色、XXL','0.00','0.00',0),(383,284,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ','201511243345',111,111,'260.00','灰色、85D','0.00','0.00',0),(384,284,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ','201511243345',111,111,'290.00','黑色、XXL','0.00','0.00',0),(385,284,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ','201511243345',111,111,'300.00','黑色、85D','0.00','0.00',0),(386,285,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣','201511243123',217,215,'320.00','灰色、XXL','0.00','0.00',0);

/*Table structure for table `es_product_snapshot` */

DROP TABLE IF EXISTS `es_product_snapshot`;

CREATE TABLE `es_product_snapshot` (
  `snapshot_id` int(11) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `store` int(8) DEFAULT '0',
  `enable_store` int(8) DEFAULT '0',
  `price` decimal(20,2) DEFAULT NULL,
  `specs` longtext,
  `cost` decimal(20,2) DEFAULT NULL,
  `weight` decimal(20,2) DEFAULT NULL,
  `is_pack` int(8) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_product_snapshot` */

/*Table structure for table `es_product_store` */

DROP TABLE IF EXISTS `es_product_store`;

CREATE TABLE `es_product_store` (
  `storeid` int(8) NOT NULL AUTO_INCREMENT,
  `goodsid` int(8) DEFAULT NULL,
  `productid` int(8) DEFAULT NULL,
  `depotid` int(8) DEFAULT NULL,
  `store` int(8) DEFAULT NULL,
  `enable_store` int(8) DEFAULT '0',
  PRIMARY KEY (`storeid`),
  KEY `ind_product_store_proid` (`productid`),
  KEY `ind_product_store_roomid` (`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

/*Data for the table `es_product_store` */

insert  into `es_product_store`(`storeid`,`goodsid`,`productid`,`depotid`,`store`,`enable_store`) values (1,7,7,1,10,10),(2,7,7,2,9,9),(3,7,7,3,98,98),(4,6,6,1,100,100),(5,256,256,1,200,200),(6,255,255,1,200,200),(7,254,254,1,100,100),(8,55,55,1,100,100),(9,54,54,1,100,100),(10,53,53,1,100,100),(11,136,136,1,100,100),(12,132,132,1,200,200),(13,130,130,1,100,100),(14,131,131,1,100,98),(15,30,30,1,100,100),(16,129,129,1,100,100),(17,127,127,1,100,100),(18,118,118,1,200,200),(19,148,148,1,100,100),(20,128,128,1,100,100),(21,116,116,1,100,100),(22,123,123,1,100,100),(23,252,252,1,100,100),(24,251,251,1,100,100),(25,248,248,1,100,100),(26,247,247,1,100,100),(27,242,242,1,100,100),(28,241,241,1,100,100),(29,240,240,1,100,100),(30,239,239,1,100,100),(31,229,229,1,100,100),(32,233,233,1,100,100),(33,236,236,1,100,100),(34,230,230,1,100,100),(35,232,232,1,100,100),(36,257,257,1,5,5),(37,257,258,1,5,5),(38,257,259,1,5,5),(39,257,260,1,5,5),(40,257,261,1,5,5),(41,257,262,1,5,5),(42,257,263,1,5,5),(43,257,264,1,5,5),(44,257,265,1,5,5),(45,257,266,1,5,5),(46,257,267,1,5,5),(47,257,268,1,5,5),(48,257,269,1,5,5),(49,257,270,1,5,5),(50,257,271,1,5,5),(51,257,272,1,5,5),(52,262,339,1,111,111),(53,262,339,2,111,111),(54,262,339,3,111,111),(55,263,340,1,111,111),(56,263,340,2,111,111),(57,263,340,3,111,111),(58,264,341,1,111,111),(59,264,341,2,111,111),(60,264,341,3,111,111),(61,265,342,1,111,111),(62,265,342,2,111,111),(63,265,342,3,111,111),(64,266,343,1,111,111),(65,266,343,2,111,111),(66,266,343,3,111,111),(67,267,344,1,111,111),(68,267,344,2,111,111),(69,267,344,3,111,111),(70,268,345,1,111,111),(71,268,345,2,111,111),(72,268,345,3,111,111),(73,269,346,1,111,111),(74,269,346,2,111,111),(75,269,346,3,111,111),(76,270,347,1,111,111),(77,270,347,2,111,111),(78,270,347,3,111,111),(79,271,348,1,111,111),(80,271,348,2,111,111),(81,271,348,3,111,111),(82,272,349,1,111,111),(83,272,349,2,111,111),(84,272,349,3,111,111),(85,273,350,1,111,111),(86,273,350,2,111,111),(87,273,350,3,111,111),(88,274,351,1,111,111),(89,274,352,1,111,111),(90,274,353,1,111,111),(91,274,351,2,111,111),(92,274,352,2,111,111),(93,274,353,2,111,111),(94,274,351,3,111,111),(95,274,352,3,111,111),(96,274,353,3,111,111),(97,275,354,2,111,111),(98,275,355,2,111,111),(99,275,354,3,111,111),(100,275,355,3,111,111),(101,276,356,1,111,111),(102,276,356,2,111,111),(103,276,356,3,111,111),(104,277,357,1,111,111),(105,277,357,2,111,111),(106,277,357,3,111,111),(107,278,358,1,111,111),(108,278,358,2,111,111),(109,278,358,3,111,111),(110,279,359,1,111,111),(111,279,359,2,111,111),(112,279,359,3,111,111),(113,280,360,1,111,111),(114,280,361,1,111,111),(115,280,362,1,111,111),(116,280,363,1,111,111),(117,280,360,2,111,111),(118,280,361,2,111,111),(119,280,362,2,111,111),(120,280,363,2,111,111),(121,280,360,3,111,111),(122,280,361,3,111,111),(123,280,362,3,111,111),(124,280,363,3,111,111),(125,281,364,1,111,111),(126,281,365,1,111,111),(127,281,366,1,111,111),(128,281,367,1,111,111),(129,281,364,2,111,111),(130,281,365,2,1110,1110),(131,281,366,2,111,111),(132,281,367,2,111,111),(133,281,364,3,111,111),(134,281,365,3,111,111),(135,281,366,3,111,111),(136,281,367,3,111,111),(137,282,368,1,111,111),(138,282,369,1,111,111),(139,282,370,1,111,111),(140,282,371,1,111,111),(141,282,372,1,111,111),(142,282,373,1,111,111),(143,283,374,1,111,111),(144,283,375,1,111,111),(145,283,376,1,111,111),(146,283,377,1,111,111),(147,283,378,1,111,111),(148,283,379,1,111,111),(149,284,380,1,111,111),(150,284,381,1,111,111),(151,284,382,1,111,111),(152,284,383,1,111,111),(153,284,384,1,111,111),(154,284,385,1,111,111),(155,285,386,1,217,215),(159,285,386,2,0,0),(163,285,386,3,0,0);

/*Table structure for table `es_promotion` */

DROP TABLE IF EXISTS `es_promotion`;

CREATE TABLE `es_promotion` (
  `pmt_id` int(8) NOT NULL AUTO_INCREMENT,
  `pmts_id` varchar(255) NOT NULL,
  `pmta_id` int(8) DEFAULT NULL,
  `pmt_time_begin` bigint(20) DEFAULT NULL,
  `pmt_time_end` bigint(20) DEFAULT NULL,
  `order_money_from` decimal(20,2) NOT NULL DEFAULT '0.00',
  `order_money_to` decimal(20,2) NOT NULL DEFAULT '9999999.00',
  `seq` int(3) NOT NULL DEFAULT '0',
  `pmt_type` varchar(1) NOT NULL DEFAULT '0',
  `pmt_belong` varchar(1) NOT NULL DEFAULT '0',
  `pmt_bond_type` varchar(1) NOT NULL,
  `pmt_describe` longtext,
  `pmt_solution` longtext,
  `pmt_ifcoupon` int(3) NOT NULL DEFAULT '1',
  `pmt_update_time` bigint(20) DEFAULT '0',
  `pmt_basic_type` varchar(5) DEFAULT 'goods',
  `disabled` varchar(5) DEFAULT 'false',
  `pmt_ifsale` varchar(5) NOT NULL DEFAULT 'true',
  `pmt_distype` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pmt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_promotion` */

/*Table structure for table `es_promotion_activity` */

DROP TABLE IF EXISTS `es_promotion_activity`;

CREATE TABLE `es_promotion_activity` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `enable` int(8) DEFAULT NULL,
  `begin_time` bigint(20) DEFAULT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `brief` longtext,
  `disabled` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_promotion_activity` */

/*Table structure for table `es_receipt` */

DROP TABLE IF EXISTS `es_receipt`;

CREATE TABLE `es_receipt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT '',
  `content` varchar(50) DEFAULT '',
  `is_default` smallint(1) DEFAULT '0',
  `add_time` bigint(20) DEFAULT NULL,
  `duty` varchar(50) DEFAULT '',
  `type` smallint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_receipt` */

/*Table structure for table `es_receipt_content` */

DROP TABLE IF EXISTS `es_receipt_content`;

CREATE TABLE `es_receipt_content` (
  `contentid` int(10) NOT NULL AUTO_INCREMENT,
  `receipt_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_receipt_content` */

/*Table structure for table `es_refund` */

DROP TABLE IF EXISTS `es_refund`;

CREATE TABLE `es_refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) DEFAULT NULL,
  `sellback_id` int(10) DEFAULT NULL,
  `order_id` int(10) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `refund_time` bigint(20) DEFAULT NULL,
  `refund_money` decimal(20,2) DEFAULT NULL,
  `refund_way` varchar(255) DEFAULT NULL,
  `return_account` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `sndto` varchar(255) DEFAULT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  `refund_user` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `refund_type` varchar(255) DEFAULT NULL,
  `txn_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_refund` */

/*Table structure for table `es_refund_logs` */

DROP TABLE IF EXISTS `es_refund_logs`;

CREATE TABLE `es_refund_logs` (
  `refund_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `order_sn` varchar(255) DEFAULT NULL,
  `member_id` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT NULL,
  `pay_method` varchar(50) DEFAULT NULL,
  `pay_user` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `sn` varchar(50) DEFAULT NULL,
  `money` decimal(20,2) DEFAULT NULL,
  `op_user` varchar(10) DEFAULT NULL,
  `pay_date` bigint(20) DEFAULT NULL,
  `remark` longtext,
  `create_time` bigint(20) DEFAULT NULL,
  `txn_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `es_ind_refund_log` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_refund_logs` */

/*Table structure for table `es_regions` */

DROP TABLE IF EXISTS `es_regions`;

CREATE TABLE `es_regions` (
  `region_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_region_id` int(10) DEFAULT NULL,
  `region_path` varchar(255) DEFAULT NULL,
  `region_grade` int(8) DEFAULT NULL,
  `local_name` varchar(100) NOT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `cod` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51983 DEFAULT CHARSET=utf8;

/*Data for the table `es_regions` */

insert  into `es_regions`(`region_id`,`p_region_id`,`region_path`,`region_grade`,`local_name`,`zipcode`,`cod`) values (1,0,',1,',1,'北京','','1'),(2,0,',2,',1,'上海','','1'),(78,2,',2,78,',2,'黄浦区',NULL,'1'),(452,34,',1,34,452,',3,'燕郊','101601','1'),(967,965,',12,965,967,',3,'通州区',NULL,'1'),(2799,72,',1,72,2799,',3,'三环以内',NULL,'1'),(2800,1,',1,2800,',2,'海淀区','','1'),(2801,1,',1,2801,',2,'西城区',NULL,'1'),(2802,1,',1,2802,',2,'东城区',NULL,'1'),(2803,1,',1,2803,',2,'崇文区',NULL,'1'),(2804,1,',1,2804,',2,'宣武区',NULL,'1'),(2805,1,',1,2805,',2,'丰台区','','1'),(2806,1,',1,2806,',2,'石景山区',NULL,'1'),(2807,1,',1,2807,',2,'门头沟',NULL,'1'),(2808,1,',1,2808,',2,'房山区',NULL,'1'),(2810,1,',1,2810,',2,'大兴区',NULL,'1'),(2812,1,',1,2812,',2,'顺义区',NULL,'1'),(2813,2,',2,2813,',2,'徐汇区',NULL,'1'),(2814,1,',1,2814,',2,'怀柔区',NULL,'1'),(2815,2,',2,2815,',2,'长宁区',NULL,'1'),(2816,1,',1,2816,',2,'密云区','','1'),(2817,2,',2,2817,',2,'静安区',NULL,'1'),(2820,2,',2,2820,',2,'闸北区',NULL,'1'),(2821,2802,',1,2802,2821,',3,'内环到三环里',NULL,'1'),(2822,2,',2,2822,',2,'虹口区',NULL,'1'),(2823,2,',2,2823,',2,'杨浦区',NULL,'1'),(2825,2,',2,2825,',2,'闵行区',NULL,'1'),(2826,2,',2,2826,',2,'嘉定区',NULL,'1'),(2827,2801,',1,2801,2827,',3,'内环到二环里',NULL,'1'),(2828,2804,',1,2804,2828,',3,'内环到三环里',NULL,'1'),(2829,2803,',1,2803,2829,',3,'一环到二环',NULL,'1'),(2830,2,',2,2830,',2,'浦东新区',NULL,'1'),(2831,2806,',1,2806,2831,',3,'四环到五环内',NULL,'1'),(2832,2805,',1,2805,2832,',3,'四环到五环之间',NULL,'1'),(2833,2,',2,2833,',2,'青浦区',NULL,'1'),(2834,2,',2,2834,',2,'松江区',NULL,'1'),(2835,2,',2,2835,',2,'金山区',NULL,'1'),(2837,2,',2,2837,',2,'奉贤区',NULL,'1'),(2841,2,',2,2841,',2,'普陀区',NULL,'1'),(2848,2800,',1,2800,2848,',3,'三环以内',NULL,'1'),(2862,2816,',1,2816,2862,',3,'城区以外','','1'),(2901,1,',1,2901,',2,'昌平区',NULL,'1'),(2906,2901,',1,2901,2906,',3,'城区以外',NULL,'1'),(2919,2,',2,2919,',2,'崇明县',NULL,'1'),(2953,1,',1,2953,',2,'平谷区',NULL,'1'),(3065,1,',1,3065,',2,'延庆县',NULL,'1'),(3343,731,',10,731,3343,',3,'宝山区',NULL,'1'),(4194,2810,',1,2810,4194,',3,'四环至五环之间',NULL,'1'),(6115,2814,',1,2814,6115,',3,'城区以内',NULL,'1'),(6666,2953,',1,2953,6666,',3,'城区',NULL,'1'),(6667,2816,',1,2816,6667,',3,'城区',NULL,'1'),(33993,785,',10,782,785,33993,',4,'朝阳区',NULL,'1'),(49707,274,',5,274,49707,',3,'三河市','','1'),(50779,2919,',2,2919,50779,',3,'堡镇',NULL,'1'),(51125,2812,',1,2812,51125,',3,'北石槽镇',NULL,'1'),(51216,2809,',1,2809,51216,',3,'六环内（马驹桥镇）',NULL,'1'),(51505,3065,',1,3065,51505,',3,'延庆镇',NULL,'1'),(51528,2808,',1,2808,51528,',3,'城区',NULL,'1'),(51552,2807,',1,2807,51552,',3,'城区',NULL,'1'),(51800,2830,',2,2830,51800,',3,'城区',NULL,'1'),(51911,2824,',2,2824,51911,',3,'罗店镇',NULL,'1'),(51928,2837,',2,2837,51928,',3,'南桥镇',NULL,'1'),(51931,2825,',2,2825,51931,',3,'城区',NULL,'1'),(51941,2826,',2,2826,51941,',3,'城区',NULL,'1'),(51959,2833,',2,2833,51959,',3,'城区',NULL,'1'),(51960,2835,',2,2835,51960,',3,'城区',NULL,'1'),(51972,2820,',2,2820,51972,',3,'城区',NULL,'1'),(51973,2817,',2,2817,51973,',3,'城区',NULL,'1'),(51974,2823,',2,2823,51974,',3,'城区',NULL,'1'),(51975,2815,',2,2815,51975,',3,'城区',NULL,'1'),(51976,2813,',2,2813,51976,',3,'城区',NULL,'1'),(51978,78,',2,78,51978,',3,'城区',NULL,'1'),(51979,2822,',2,2822,51979,',3,'城区',NULL,'1'),(51980,2841,',2,2841,51980,',3,'城区',NULL,'1'),(51982,2834,',2,2834,51982,',3,'城区',NULL,'1');

/*Table structure for table `es_returns_order` */

DROP TABLE IF EXISTS `es_returns_order`;

CREATE TABLE `es_returns_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ordersn` varchar(50) DEFAULT NULL,
  `memberid` int(10) DEFAULT NULL,
  `state` int(6) DEFAULT NULL,
  `goodsns` longtext,
  `type` int(6) DEFAULT NULL,
  `add_time` bigint(20) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `refuse_reason` varchar(200) DEFAULT NULL,
  `apply_reason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_returns_order` */

/*Table structure for table `es_role` */

DROP TABLE IF EXISTS `es_role`;

CREATE TABLE `es_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `rolememo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `es_role` */

insert  into `es_role`(`roleid`,`rolename`,`rolememo`) values (1,'超级管理员','超级管理员'),(2,'产品部','产品部'),(3,'库管','库管'),(4,'财务部','财务部'),(5,'客服','客服');

/*Table structure for table `es_role_auth` */

DROP TABLE IF EXISTS `es_role_auth`;

CREATE TABLE `es_role_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `authid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `es_role_auth` */

insert  into `es_role_auth`(`id`,`roleid`,`authid`) values (1,1,1),(2,3,4),(3,4,5),(4,5,6),(5,2,2);

/*Table structure for table `es_second_half_activity_detail` */

DROP TABLE IF EXISTS `es_second_half_activity_detail`;

CREATE TABLE `es_second_half_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_second_half_activity_detail` */

/*Table structure for table `es_sellback_goodslist` */

DROP TABLE IF EXISTS `es_sellback_goodslist`;

CREATE TABLE `es_sellback_goodslist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(8) DEFAULT NULL,
  `recid` int(8) DEFAULT NULL,
  `goods_id` int(8) DEFAULT NULL,
  `product_id` int(8) DEFAULT NULL,
  `ship_num` int(8) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  `return_num` int(8) DEFAULT NULL,
  `storage_num` int(8) DEFAULT '0',
  `goods_remark` varchar(255) DEFAULT NULL,
  `goods_sn` varchar(100) DEFAULT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `goods_image` varchar(255) DEFAULT NULL,
  `spec_json` varchar(255) DEFAULT NULL,
  `return_type` int(8) DEFAULT NULL,
  `item_type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_sellback_goodslist` */

/*Table structure for table `es_sellback_list` */

DROP TABLE IF EXISTS `es_sellback_list`;

CREATE TABLE `es_sellback_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` int(10) DEFAULT NULL,
  `tradeno` varchar(100) DEFAULT NULL,
  `tradestatus` int(8) DEFAULT NULL,
  `ordersn` varchar(100) DEFAULT NULL,
  `regoperator` varchar(100) DEFAULT NULL,
  `regtime` bigint(20) DEFAULT NULL,
  `alltotal_pay` decimal(20,2) DEFAULT NULL,
  `apply_alltotal` decimal(20,2) DEFAULT NULL,
  `goodslist` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `seller_remark` varchar(255) DEFAULT NULL,
  `warehouse_remark` varchar(255) DEFAULT NULL,
  `finance_remark` varchar(255) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  `sndto` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `adr` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `refund_way` varchar(255) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  `return_account` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  `confirm_time` bigint(20) DEFAULT NULL,
  `gift_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_sellback_list` */

/*Table structure for table `es_sellback_log` */

DROP TABLE IF EXISTS `es_sellback_log`;

CREATE TABLE `es_sellback_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recid` int(10) DEFAULT NULL,
  `logtime` bigint(20) DEFAULT NULL,
  `logdetail` varchar(255) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_sellback_log` */

/*Table structure for table `es_settings` */

DROP TABLE IF EXISTS `es_settings`;

CREATE TABLE `es_settings` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `cfg_value` varchar(1000) DEFAULT NULL,
  `cfg_group` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `es_settings` */

insert  into `es_settings`(`id`,`code`,`cfg_value`,`cfg_group`) values (1,NULL,'{\"closereson\":\"\",\"keywords\":\"最好的Java网店系统,Java多用户商城,Java商城定制开发\",\"logofile\":\"fs://images/logo.gif\",\"sitename\":\"Javashop示例商城\",\"themeid\":\"2\",\"themepath\":\"kaben\",\"title\":\"Javashop示例商城\",\"descript\":\"Javashop提供优质的电子商务解决方案，提供最好的Java网店系统、Java多用户商城、Java商城定制开发。\",\"siteon\":\"1\",\"adminthemeid\":\"1\"}','site_seting'),(2,NULL,'{\"inventory_warning_count\":\"5\"}','inventory'),(3,NULL,'{\"cancel_order_day\":\"2\",\"rog_order_day\":\"14\",\"comment_order_day\":\"14\",\"cancel_sellback_day\":\"14\"}','order'),(4,NULL,'{\"thumbnail_pic_width\":\"180\",\"small_pic_height\":\"310\",\"big_pic_height\":\"800\",\"tiny_pic_width\":\"60\",\"small_pic_width\":\"310\",\"big_pic_width\":\"800\",\"tiny_pic_height\":\"60\",\"thumbnail_pic_height\":\"180\"}','photo'),(5,NULL,'{\"comment_num\":\"10\",\"register_num_mp\":\"50\",\"comment_img\":\"1\",\"login\":\"1\",\"onlinepay\":\"1\",\"first_comment\":\"1\",\"email_check\":\"1\",\"register_num\":\"50\",\"login_num_mp\":\"5\",\"comment_num_mp\":\"10\",\"buygoods\":\"1\",\"finish_profile_num\":\"20\",\"finish_profile\":\"1\",\"first_comment_num\":\"50\",\"parities_num_mp\":\"0\",\"email_check_num_mp\":\"20\",\"onlinepay_num\":\"10\",\"email_check_num\":\"20\",\"onlinepay_num_mp\":\"10\",\"comment_img_num_mp\":\"30\",\"buygoods_num\":\"1\",\"comment_img_num\":\"30\",\"first_comment_num_mp\":\"50\",\"login_num\":\"5\",\"comment\":\"1\",\"buygoods_num_mp\":\"1\",\"finish_profile_num_mp\":\"20\",\"register\":\"1\"}','point'),(6,NULL,'{\"backend_pagesize\":\"10\",\"default_img_url\":\"http://localhost:8080/b2c/statics/images/no_picture.jpg\",\"context_path\":\"/b2c\",\"wap_domain\":\"127.0.0.1\",\"wap_folder\":\"wap\",\"sms_reg_open\":\"0\",\"lucene\":\"0\",\"global_auth_key\":\"9c58702415b913469eb04c8ed04711ce\",\"test_mode\":\"0\",\"wap_open\":\"1\",\"static_server_path\":\"F:/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/b2c/statics\",\"static_server_domain\":\"http://localhost:8080/b2c/statics\",\"static_page_open\":\"0\"}','system');

/*Table structure for table `es_showcase` */

DROP TABLE IF EXISTS `es_showcase`;

CREATE TABLE `es_showcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_showcase` */

/*Table structure for table `es_single_reduction_activity_detail` */

DROP TABLE IF EXISTS `es_single_reduction_activity_detail`;

CREATE TABLE `es_single_reduction_activity_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT,
  `activity_id` int(10) DEFAULT NULL,
  `single_reduction_value` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_single_reduction_activity_detail` */

/*Table structure for table `es_site` */

DROP TABLE IF EXISTS `es_site`;

CREATE TABLE `es_site` (
  `siteid` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `themeid` int(11) DEFAULT NULL,
  `sitelevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_site` */

/*Table structure for table `es_site_menu` */

DROP TABLE IF EXISTS `es_site_menu`;

CREATE TABLE `es_site_menu` (
  `menuid` int(8) NOT NULL AUTO_INCREMENT,
  `parentid` int(8) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `es_site_menu` */

insert  into `es_site_menu`(`menuid`,`parentid`,`name`,`url`,`target`,`sort`) values (1,0,'商城首页','index.html','',1),(2,0,'进口食品','goods_list.html?cat=4','',2),(3,0,'美容化妆','goods_list.html?cat=38','',3),(4,0,'手机通讯','goods_list.html?cat=89','',5),(5,0,'服装鞋帽','goods_list.html?cat=86','',6),(6,2,'进口乳制品','goods_list.html?cat=5','',10),(7,2,'进口饼干糕点','goods_list.html?cat=24','',20),(8,2,'进口咖啡/茶品','goods_list.html?cat=27','',30),(9,3,'面部护理','goods_list.html?cat=39','',1),(10,3,'男士护理','goods_list.html?cat=47','',3),(11,0,'营养保健','goods_list.html?cat=85','',7),(12,0,'办公用品','goods_list.html?cat=88','',8),(13,0,'汽车维护','goods_list.html?cat=87','',9),(14,0,'食品饮料','goods_list.html?cat=1','',4),(15,14,'休闲零食','goods_list.html?cat=2','',10),(16,14,'糖果/巧克力','goods_list.html?cat=3','',20),(17,14,'饮料','goods_list.html?cat=13','',30),(18,14,'酒水','goods_list.html?cat=18','',40),(19,2,'进口休闲零食','goods_list.html?cat=31','',40),(20,5,'短裤','goods_list.html?cat=92','',6),(21,5,'裙子','goods_list.html?cat=93','',8);

/*Table structure for table `es_sms_platform` */

DROP TABLE IF EXISTS `es_sms_platform`;

CREATE TABLE `es_sms_platform` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(50) DEFAULT NULL,
  `is_open` int(8) DEFAULT NULL,
  `config` longtext,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_sms_platform` */

/*Table structure for table `es_smtp` */

DROP TABLE IF EXISTS `es_smtp`;

CREATE TABLE `es_smtp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_send_time` bigint(20) DEFAULT NULL,
  `send_count` int(11) DEFAULT '0',
  `max_count` int(11) DEFAULT NULL,
  `mail_from` varchar(255) DEFAULT NULL,
  `port` int(10) DEFAULT '0',
  `open_ssl` smallint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `es_smtp` */

insert  into `es_smtp`(`id`,`host`,`username`,`password`,`last_send_time`,`send_count`,`max_count`,`mail_from`,`port`,`open_ssl`) values (1,'smtp.exmail.qq.com','service1@javashop.cn','enation752513',1330404357,1,100,'service1@javashop.cn',0,0),(2,'smtp.exmail.qq.com','service2@javashop.cn','enation752513',0,0,100,'service2@javashop.cn',0,0);

/*Table structure for table `es_spec_values` */

DROP TABLE IF EXISTS `es_spec_values`;

CREATE TABLE `es_spec_values` (
  `spec_value_id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_id` int(8) DEFAULT NULL,
  `spec_value` varchar(100) DEFAULT NULL,
  `spec_image` varchar(255) DEFAULT NULL,
  `spec_order` int(8) DEFAULT NULL,
  `spec_type` int(8) DEFAULT NULL,
  `inherent_or_add` int(8) DEFAULT NULL,
  PRIMARY KEY (`spec_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

/*Data for the table `es_spec_values` */

insert  into `es_spec_values`(`spec_value_id`,`spec_id`,`spec_value`,`spec_image`,`spec_order`,`spec_type`,`inherent_or_add`) values (9,2,'均码','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(10,2,'XXS','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(11,2,'XS','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(12,2,'S','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(13,2,'M','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(14,2,'L','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(15,2,'XL','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(16,2,'XXL','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(17,2,'XXXL','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(29,2,'70B','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(30,2,'70C','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(31,2,'70D','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(32,2,'75B','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(33,2,'75C','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(34,2,'75D','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(35,2,'80C','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(36,2,'80D','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(37,2,'80E','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(38,2,'85C','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(39,2,'85D','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(40,2,'85E','http://static.v4.javamall.com.cn/spec/spec_def.gif',NULL,0,0),(41,1,'黄色','http://static.v4.javamall.com.cn/spec/201003231752553633.gif',NULL,1,0),(42,1,'绿色','http://static.v4.javamall.com.cn/spec/201003231753027271.gif',NULL,1,0),(43,1,'黑色','http://static.v4.javamall.com.cn/spec/201003231758466829.gif',NULL,1,0),(44,1,'红色','http://static.v4.javamall.com.cn/spec/201003231758540529.gif',NULL,1,0),(45,1,'蓝色','http://static.v4.javamall.com.cn/spec/201003231759056186.gif',NULL,1,0),(46,1,'白色','http://static.v4.javamall.com.cn/spec/201003231759165477.gif',NULL,1,0),(47,1,'花色','http://static.v4.javamall.com.cn/spec/201003231759251588.gif',NULL,1,0),(48,1,'灰色','http://static.v4.javamall.com.cn/spec/201003231759361219.gif',NULL,1,0),(49,1,'肤色','http://static.v4.javamall.com.cn/spec/201003231752553635.gif',NULL,1,0),(50,1,'粉黄色','http://static.v4.javamall.com.cn/spec/201005191140150035.jpg',NULL,1,0),(51,1,'橙色','http://static.v4.javamall.com.cn/spec/201005191141088633.jpg',NULL,1,0),(52,1,'浅绿','http://static.v4.javamall.com.cn/spec/201005191142251911.jpg',NULL,1,0),(53,1,'浅蓝','http://static.v4.javamall.com.cn/spec/201005191143231991.jpg',NULL,1,0),(54,1,'粉红色','http://static.v4.javamall.com.cn/spec/201005191144208127.jpg',NULL,1,0),(55,1,'浅玫红','http://static.v4.javamall.com.cn/spec/201005191145294591.jpg',NULL,1,0),(56,1,'西瓜红','http://static.v4.javamall.com.cn/spec/201005191146439979.jpg',NULL,1,0),(57,1,'粉紫色','http://static.v4.javamall.com.cn/spec/201005191147384601.jpg',NULL,1,0),(58,3,'1GB','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(59,3,'2GB','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(60,3,'4GB','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(61,3,'8GB','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(62,3,'16GB','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(63,3,'32GB','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(64,3,'64GB','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(65,4,'35','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(66,4,'35.5','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(67,4,'36','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(68,4,'36.5','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(69,4,'37','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(70,4,'37.5','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(71,4,'39.5','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(72,4,'40','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(73,4,'41','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(74,4,'42','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0),(75,4,'43','http://static.v4.javamall.com.cn/shop/admin/spec/image/spec_def.gif',NULL,0,0);

/*Table structure for table `es_specification` */

DROP TABLE IF EXISTS `es_specification`;

CREATE TABLE `es_specification` (
  `spec_id` int(8) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(50) DEFAULT NULL,
  `spec_show_type` int(8) DEFAULT NULL,
  `spec_type` int(8) DEFAULT NULL,
  `spec_memo` varchar(50) DEFAULT NULL,
  `spec_order` int(8) DEFAULT NULL,
  `disabled` int(8) DEFAULT NULL,
  PRIMARY KEY (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `es_specification` */

insert  into `es_specification`(`spec_id`,`spec_name`,`spec_show_type`,`spec_type`,`spec_memo`,`spec_order`,`disabled`) values (1,'颜色',NULL,1,'type_color',NULL,NULL),(2,'尺寸',NULL,0,'',NULL,NULL),(3,'容量',NULL,0,'U盘存储容量',NULL,NULL),(4,'选择尺码',NULL,0,'',NULL,NULL);

/*Table structure for table `es_store_log` */

DROP TABLE IF EXISTS `es_store_log`;

CREATE TABLE `es_store_log` (
  `logid` int(10) NOT NULL AUTO_INCREMENT,
  `goodsid` int(10) DEFAULT NULL,
  `productid` int(10) DEFAULT NULL,
  `goodsname` varchar(255) DEFAULT NULL,
  `depot_type` int(8) DEFAULT NULL,
  `op_type` int(2) DEFAULT '0',
  `num` int(10) DEFAULT NULL,
  `enable_store` int(10) DEFAULT '0',
  `remark` longtext,
  `dateline` int(10) DEFAULT NULL,
  `userid` int(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `depotid` int(10) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `ind_store_log_goodsid` (`goodsid`,`productid`),
  KEY `ind_store_log_depot` (`op_type`,`depotid`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

/*Data for the table `es_store_log` */

insert  into `es_store_log`(`logid`,`goodsid`,`productid`,`goodsname`,`depot_type`,`op_type`,`num`,`enable_store`,`remark`,`dateline`,`userid`,`username`,`depotid`) values (1,7,NULL,'test5',1,0,117,0,NULL,1325783768,1,'admin',0),(2,6,NULL,'test4',1,0,100,0,NULL,1325785144,2,'haidian',1),(3,256,NULL,'双立人TWIN I.V.I系列炖锅 奶锅 16cm 40415-161',1,0,100,0,NULL,1330412425,1,'admin',0),(4,255,NULL,'【ROICHEN】进口锅具 奶锅 不粘锅 18cm RNC-18S',1,0,100,0,NULL,1330412432,1,'admin',0),(5,254,NULL,'2529448_380x380.jpg',1,0,100,0,NULL,1330412439,1,'admin',0),(6,55,NULL,'【Baileys 】英国爱尔兰 百利甜酒 750ML',1,0,100,0,NULL,1330412459,1,'admin',0),(7,54,NULL,'法国进口洋酒 【Couronnier】富豪白兰地700ml',1,0,100,0,NULL,1330412467,1,'admin',0),(8,53,NULL,'百威 啤酒330ml*6/罐',1,0,100,0,NULL,1330412473,1,'admin',0),(9,136,NULL,'佰草集男仕君衡须后水150ml',1,0,100,0,NULL,1330412494,1,'admin',0),(10,132,NULL,'曼秀雷敦男士活力修护润肤乳50ml',1,0,100,0,NULL,1330412502,1,'admin',0),(11,130,NULL,'曼秀雷敦男士润唇膏（天然型）3.5g ',1,0,100,0,NULL,1330412508,1,'admin',0),(12,131,NULL,'曼秀雷敦男士冰爽活炭套装(冰爽活炭洁面乳150ml + 清爽沐浴露-天然活炭200ml)',1,0,100,0,NULL,1330412514,1,'admin',0),(13,30,NULL,'德芙 榛仁葡萄干巧克力碗装283.5g',1,0,100,0,NULL,1330412520,1,'admin',0),(14,129,NULL,'OLAY玉兰油男士焕能多效泡沫洁面乳100g',1,0,100,0,NULL,1330412526,1,'admin',0),(15,127,NULL,'相宜本草 男士洁面乳120g/支',1,0,100,0,NULL,1330412532,1,'admin',0),(16,118,NULL,'OLAY玉兰油 新生塑颜金纯眼霜15ml',1,0,100,0,NULL,1330412537,1,'admin',0),(17,148,NULL,'潘婷乳液修复洗发露 200ml',1,0,100,0,NULL,1330412551,1,'admin',0),(18,128,NULL,'资生堂吾诺黑炭强力劲爽洁面膏130g ',1,0,100,0,NULL,1330412556,1,'admin',0),(19,132,NULL,'曼秀雷敦男士活力修护润肤乳50ml',1,0,100,0,NULL,1330412561,1,'admin',0),(20,116,NULL,'玉兰油水感透白明眸走珠精华笔 6ml',1,0,100,0,NULL,1330412567,1,'admin',0),(21,118,NULL,'OLAY玉兰油 新生塑颜金纯眼霜15ml',1,0,100,0,NULL,1330412573,1,'admin',0),(22,123,NULL,'相宜本草 防皱消黑眼贴膜6对/盒',1,0,100,0,NULL,1330412579,1,'admin',0),(23,256,NULL,'双立人TWIN I.V.I系列炖锅 奶锅 16cm 40415-161',1,0,100,0,NULL,1330412606,1,'admin',0),(24,255,NULL,'【ROICHEN】进口锅具 奶锅 不粘锅 18cm RNC-18S',1,0,100,0,NULL,1330412612,1,'admin',0),(25,252,NULL,'张小泉母爱飘香 32CM炫动力时尚精铁炒锅 铁锅 C30040100',1,0,100,0,NULL,1330412621,1,'admin',0),(26,251,NULL,'张小泉 30CM中国小炒不锈精铁炒锅 铁锅 防锈 玻璃C30020200',1,0,100,0,NULL,1330412628,1,'admin',0),(27,248,NULL,'张小泉 紫气东来3.0L橄榄鸣壶 烧水壶 不锈钢茶壶 S80320800 ',1,0,100,0,NULL,1330412635,1,'admin',0),(28,247,NULL,'兴财4.0L不锈钢鸣笛水壶 电磁炉煤气炉适用',1,0,100,0,NULL,1330412640,1,'admin',0),(29,242,NULL,'爱仕达不锈钢汤锅Q1720 20cm',1,0,100,0,NULL,1330412646,1,'admin',0),(30,241,NULL,'双立人TWIN Select系列锅具 深炖锅 18cm 40426-180',1,0,100,0,NULL,1330412651,1,'admin',0),(31,240,NULL,'双立人TWIN I.V.I系列 深钝锅 炖锅 18cm 40416-181',1,0,100,0,NULL,1330412656,1,'admin',0),(32,239,NULL,'双立人 TWIN I.V.I 系列 不锈钢深烧锅24cm 40413-241',1,0,100,0,NULL,1330412662,1,'admin',0),(33,229,NULL,'喜亲宝 竹纤维抗菌毛巾 绿色 30*66cm',1,0,100,0,NULL,1330412668,1,'admin',0),(34,233,NULL,'liangliang 良良 麻棉抗菌两用浴巾 黄',1,0,100,0,NULL,1330412675,1,'admin',0),(35,236,NULL,'皇家宝贝 2011可加长可拆睡袋（50x70/105）613150008粉红色均码',1,0,100,0,NULL,1330412684,1,'admin',0),(36,230,NULL,'喜亲宝 竹纤维抗菌大浴巾 米黄 70*140cm',1,0,100,0,NULL,1330412690,1,'admin',0),(37,232,NULL,'爱得利 纱布大浴巾 纱布 DT-302',1,0,100,0,NULL,1330412696,1,'admin',0),(38,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(39,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(40,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(41,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(42,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(43,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(44,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(45,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(46,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(47,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(48,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(49,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(50,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(51,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957752,1,'admin',1),(52,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957753,1,'admin',1),(53,257,NULL,'Kingston 金士顿 DataTraveler 101 G2 优盘',0,1,80,0,NULL,1333957753,1,'admin',1),(54,262,NULL,'沃隆_每日坚果25g*30袋】精美礼盒原味混合干果综合坚果仁箱装',0,1,333,0,NULL,1448299035,1,'admin',1),(55,262,NULL,'沃隆_每日坚果25g*30袋】精美礼盒原味混合干果综合坚果仁箱装',0,1,333,0,NULL,1448299035,1,'admin',2),(56,262,NULL,'沃隆_每日坚果25g*30袋】精美礼盒原味混合干果综合坚果仁箱装',0,1,333,0,NULL,1448299035,1,'admin',3),(57,263,NULL,'绿岭新鲜有机生薄皮非新疆纸皮大核桃500G新货特产 原味坚果零食',0,1,333,0,NULL,1448301046,1,'admin',1),(58,263,NULL,'绿岭新鲜有机生薄皮非新疆纸皮大核桃500G新货特产 原味坚果零食',0,1,333,0,NULL,1448301046,1,'admin',2),(59,263,NULL,'绿岭新鲜有机生薄皮非新疆纸皮大核桃500G新货特产 原味坚果零食',0,1,333,0,NULL,1448301046,1,'admin',3),(60,264,NULL,'歌斐颂 纯可可脂纯黑巧克力320g 58%可可进口料休闲零食品黑巧',0,1,333,0,NULL,1448301054,1,'admin',1),(61,264,NULL,'歌斐颂 纯可可脂纯黑巧克力320g 58%可可进口料休闲零食品黑巧',0,1,333,0,NULL,1448301054,1,'admin',2),(62,264,NULL,'歌斐颂 纯可可脂纯黑巧克力320g 58%可可进口料休闲零食品黑巧',0,1,333,0,NULL,1448301054,1,'admin',3),(63,265,NULL,'【三只松鼠_碧根果210gx2袋】零食坚果山核桃长寿果干果奶油味 ',0,1,333,0,NULL,1448301062,1,'admin',1),(64,265,NULL,'【三只松鼠_碧根果210gx2袋】零食坚果山核桃长寿果干果奶油味 ',0,1,333,0,NULL,1448301062,1,'admin',2),(65,265,NULL,'【三只松鼠_碧根果210gx2袋】零食坚果山核桃长寿果干果奶油味 ',0,1,333,0,NULL,1448301062,1,'admin',3),(66,266,NULL,'牛叉叉蜜汁猪肉脯烟熏炭烤猪肉干正宗靖江猪肉铺浦特产零食200g',0,1,333,0,NULL,1448301070,1,'admin',1),(67,266,NULL,'牛叉叉蜜汁猪肉脯烟熏炭烤猪肉干正宗靖江猪肉铺浦特产零食200g',0,1,333,0,NULL,1448301070,1,'admin',2),(68,266,NULL,'牛叉叉蜜汁猪肉脯烟熏炭烤猪肉干正宗靖江猪肉铺浦特产零食200g',0,1,333,0,NULL,1448301070,1,'admin',3),(69,267,NULL,'哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食',0,1,333,0,NULL,1448301077,1,'admin',1),(70,267,NULL,'哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食',0,1,333,0,NULL,1448301077,1,'admin',2),(71,267,NULL,'哎呦喂和田红枣 新疆特产大枣骏枣 干果玉枣一等大红枣子500g零食',0,1,333,0,NULL,1448301077,1,'admin',3),(72,268,NULL,'Dior/迪奥香水明星Q版5件套装 真我花漾粉魅永恒的爱迪奥之韵礼盒 ',0,1,333,0,NULL,1448304494,1,'admin',1),(73,268,NULL,'Dior/迪奥香水明星Q版5件套装 真我花漾粉魅永恒的爱迪奥之韵礼盒 ',0,1,333,0,NULL,1448304494,1,'admin',2),(74,268,NULL,'Dior/迪奥香水明星Q版5件套装 真我花漾粉魅永恒的爱迪奥之韵礼盒 ',0,1,333,0,NULL,1448304494,1,'admin',3),(75,269,NULL,'Ck/凯文克莱 CK One summer2015夏日新款中性男女士香水100ML ',0,1,333,0,NULL,1448304503,1,'admin',1),(76,269,NULL,'Ck/凯文克莱 CK One summer2015夏日新款中性男女士香水100ML ',0,1,333,0,NULL,1448304503,1,'admin',2),(77,269,NULL,'Ck/凯文克莱 CK One summer2015夏日新款中性男女士香水100ML ',0,1,333,0,NULL,1448304503,1,'admin',3),(78,270,NULL,'innisfree/悦诗风吟旗舰店 真萃鲜润面膜贴套装18片 补水保湿亮白',0,1,333,0,NULL,1448304515,1,'admin',1),(79,270,NULL,'innisfree/悦诗风吟旗舰店 真萃鲜润面膜贴套装18片 补水保湿亮白',0,1,333,0,NULL,1448304515,1,'admin',2),(80,270,NULL,'innisfree/悦诗风吟旗舰店 真萃鲜润面膜贴套装18片 补水保湿亮白',0,1,333,0,NULL,1448304515,1,'admin',3),(81,271,NULL,'olay玉兰油多效修护霜面霜50g*2瓶 保湿补水紧致护肤品化妆品套装',0,1,333,0,NULL,1448304525,1,'admin',1),(82,271,NULL,'olay玉兰油多效修护霜面霜50g*2瓶 保湿补水紧致护肤品化妆品套装',0,1,333,0,NULL,1448304525,1,'admin',2),(83,271,NULL,'olay玉兰油多效修护霜面霜50g*2瓶 保湿补水紧致护肤品化妆品套装',0,1,333,0,NULL,1448304525,1,'admin',3),(84,272,NULL,'百雀羚爽肤水女水嫩倍现精华水化妆水补水保湿控油滋润化妆品正品 ',0,1,333,0,NULL,1448304536,1,'admin',1),(85,272,NULL,'百雀羚爽肤水女水嫩倍现精华水化妆水补水保湿控油滋润化妆品正品 ',0,1,333,0,NULL,1448304536,1,'admin',2),(86,272,NULL,'百雀羚爽肤水女水嫩倍现精华水化妆水补水保湿控油滋润化妆品正品 ',0,1,333,0,NULL,1448304536,1,'admin',3),(87,273,NULL,'SUHU尚惠烟紫漾彩唇乳 持久保湿滋润唇彩唇蜜 不易掉色口红正品',0,1,333,0,NULL,1448304549,1,'admin',1),(88,273,NULL,'SUHU尚惠烟紫漾彩唇乳 持久保湿滋润唇彩唇蜜 不易掉色口红正品',0,1,333,0,NULL,1448304549,1,'admin',2),(89,273,NULL,'SUHU尚惠烟紫漾彩唇乳 持久保湿滋润唇彩唇蜜 不易掉色口红正品',0,1,333,0,NULL,1448304549,1,'admin',3),(90,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',1),(91,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',1),(92,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',1),(93,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',2),(94,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',2),(95,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',2),(96,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',3),(97,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',3),(98,274,NULL,'张小盒拉杆箱盒子世界旅行箱万向轮登机行李箱TSA密码锁硬箱 ',0,1,999,0,NULL,1448328150,1,'admin',3),(99,275,NULL,'uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱',0,1,444,0,NULL,1448328161,1,'admin',2),(100,275,NULL,'uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱',0,1,444,0,NULL,1448328161,1,'admin',2),(101,275,NULL,'uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱',0,1,444,0,NULL,1448328162,1,'admin',3),(102,275,NULL,'uniwalker韩国复古旅行箱万向轮拉杆箱行李箱女24寸26寸密码皮箱',0,1,444,0,NULL,1448328162,1,'admin',3),(103,276,NULL,'花花公子男包商务 单肩包休闲横款大包 潮男皮包公文包手提包男士',0,1,333,0,NULL,1448328171,1,'admin',1),(104,276,NULL,'花花公子男包商务 单肩包休闲横款大包 潮男皮包公文包手提包男士',0,1,333,0,NULL,1448328171,1,'admin',2),(105,276,NULL,'花花公子男包商务 单肩包休闲横款大包 潮男皮包公文包手提包男士',0,1,333,0,NULL,1448328171,1,'admin',3),(106,277,NULL,'千百惠女包2015秋冬新款迷你手提包波士顿枕头包单肩斜挎包女小包 ',0,1,333,0,NULL,1448328181,1,'admin',1),(107,277,NULL,'千百惠女包2015秋冬新款迷你手提包波士顿枕头包单肩斜挎包女小包 ',0,1,333,0,NULL,1448328181,1,'admin',2),(108,277,NULL,'千百惠女包2015秋冬新款迷你手提包波士顿枕头包单肩斜挎包女小包 ',0,1,333,0,NULL,1448328181,1,'admin',3),(109,278,NULL,'GUY LAROCHE/姬龙雪女包2015秋冬新款潮牛皮奢侈品手提包女手柄包 ',0,1,333,0,NULL,1448328191,1,'admin',1),(110,278,NULL,'GUY LAROCHE/姬龙雪女包2015秋冬新款潮牛皮奢侈品手提包女手柄包 ',0,1,333,0,NULL,1448328191,1,'admin',2),(111,278,NULL,'GUY LAROCHE/姬龙雪女包2015秋冬新款潮牛皮奢侈品手提包女手柄包 ',0,1,333,0,NULL,1448328191,1,'admin',3),(112,279,NULL,'【甄选】七款可选周大福首饰3D福星宝宝足金黄金吊坠R ',0,1,333,0,NULL,1448328201,1,'admin',1),(113,279,NULL,'【甄选】七款可选周大福首饰3D福星宝宝足金黄金吊坠R ',0,1,333,0,NULL,1448328201,1,'admin',2),(114,279,NULL,'【甄选】七款可选周大福首饰3D福星宝宝足金黄金吊坠R ',0,1,333,0,NULL,1448328201,1,'admin',3),(115,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',1),(116,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',1),(117,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',1),(118,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',1),(119,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',2),(120,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',2),(121,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',2),(122,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',2),(123,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',3),(124,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',3),(125,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',3),(126,280,NULL,'威摩士2015双面呢大衣纯羊毛女士毛呢大衣毛呢外套高端大衣外套女 ',0,1,1332,0,NULL,1448339404,1,'admin',3),(127,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',1),(128,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',1),(129,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',1),(130,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',1),(131,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',2),(132,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',2),(133,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',2),(134,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',2),(135,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',3),(136,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',3),(137,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',3),(138,281,NULL,'sofa2015秋冬新款纯色不对称宽松版型九分袖套头针织衫 ',0,1,2331,0,NULL,1448339433,1,'admin',3),(139,282,NULL,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ',0,1,666,0,NULL,1448339450,1,'admin',1),(140,282,NULL,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ',0,1,666,0,NULL,1448339450,1,'admin',1),(141,282,NULL,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ',0,1,666,0,NULL,1448339450,1,'admin',1),(142,282,NULL,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ',0,1,666,0,NULL,1448339450,1,'admin',1),(143,282,NULL,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ',0,1,666,0,NULL,1448339450,1,'admin',1),(144,282,NULL,'云思木想2015秋冬新款修身女装毛呢外套纯黑时尚中长款外套71355 ',0,1,666,0,NULL,1448339450,1,'admin',1),(145,283,NULL,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ',0,1,666,0,NULL,1448339466,1,'admin',1),(146,283,NULL,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ',0,1,666,0,NULL,1448339466,1,'admin',1),(147,283,NULL,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ',0,1,666,0,NULL,1448339466,1,'admin',1),(148,283,NULL,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ',0,1,666,0,NULL,1448339466,1,'admin',1),(149,283,NULL,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ',0,1,666,0,NULL,1448339466,1,'admin',1),(150,283,NULL,'2015秋冬新款女装套装裙长袖打底裙两件套套装熟女冬季连衣裙 冬 ',0,1,666,0,NULL,1448339466,1,'admin',1),(151,284,NULL,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ',0,1,666,0,NULL,1448339481,1,'admin',1),(152,284,NULL,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ',0,1,666,0,NULL,1448339481,1,'admin',1),(153,284,NULL,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ',0,1,666,0,NULL,1448339481,1,'admin',1),(154,284,NULL,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ',0,1,666,0,NULL,1448339481,1,'admin',1),(155,284,NULL,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ',0,1,666,0,NULL,1448339481,1,'admin',1),(156,284,NULL,'大码男装加肥加大韩版羽绒衣男士羽绒服外套冬 ',0,1,666,0,NULL,1448339481,1,'admin',1),(157,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,444,0,NULL,1448339493,1,'admin',1),(158,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,444,0,NULL,1448339493,1,'admin',1),(159,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,444,0,NULL,1448339493,1,'admin',1),(160,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,444,0,NULL,1448339493,1,'admin',1),(161,131,131,'曼秀雷敦男士冰爽活炭套装(冰爽活炭洁面乳150ml + 清爽沐浴露-天然活炭200ml)',0,1,0,-1,'创建订单[144836452687]，减少可用库存',1448364526,0,'系统',1),(162,131,131,'曼秀雷敦男士冰爽活炭套装(冰爽活炭洁面乳150ml + 清爽沐浴露-天然活炭200ml)',0,1,0,-1,'创建订单[144842244810]，减少可用库存',1448422448,0,'系统',1),(163,285,386,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,0,-1,'创建订单[144842244810]，减少可用库存',1448422448,0,'系统',1),(164,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',1),(165,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',1),(166,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',1),(167,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',1),(168,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',2),(169,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',2),(170,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',2),(171,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',2),(172,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',3),(173,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',3),(174,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',3),(175,285,NULL,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,439,0,NULL,1529554615,1,'admin',3),(176,285,386,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,0,-1,'创建订单[152998248315]，减少可用库存',1529982484,0,'系统',1),(177,285,387,'THEPANG 韩版大码男装秋季加肥加大针织衫开衫 潮胖子男士毛衣',0,1,0,-2,'创建订单[152998248315]，减少可用库存',1529982484,0,'系统',1);

/*Table structure for table `es_style` */

DROP TABLE IF EXISTS `es_style`;

CREATE TABLE `es_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `is_top_style` int(11) DEFAULT NULL,
  `is_default_style` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `es_style` */

insert  into `es_style`(`id`,`style`,`path`,`is_top_style`,`is_default_style`,`page_id`) values (1,'new_storey','/floorstyle/new_style.html',1,1,1),(2,'style1','/floorstyle/style1.html',0,1,1),(3,'style2','/floorstyle/style2.html',0,0,1);

/*Table structure for table `es_subject` */

DROP TABLE IF EXISTS `es_subject`;

CREATE TABLE `es_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_display` int(11) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `goods_ids` longtext,
  `picture_path` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_subject` */

/*Table structure for table `es_tag_rel` */

DROP TABLE IF EXISTS `es_tag_rel`;

CREATE TABLE `es_tag_rel` (
  `tag_id` int(8) DEFAULT NULL,
  `rel_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL,
  KEY `ind_tag_rel_1` (`tag_id`,`rel_id`),
  KEY `ind_tag_rel_2` (`ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_tag_rel` */

insert  into `es_tag_rel`(`tag_id`,`rel_id`,`ordernum`) values (1,284,0),(1,283,0),(1,282,0),(1,281,0),(1,280,0),(1,285,NULL);

/*Table structure for table `es_tag_relb` */

DROP TABLE IF EXISTS `es_tag_relb`;

CREATE TABLE `es_tag_relb` (
  `tag_id` int(8) DEFAULT NULL,
  `rel_id` int(8) DEFAULT NULL,
  `ordernum` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_tag_relb` */

/*Table structure for table `es_tags` */

DROP TABLE IF EXISTS `es_tags`;

CREATE TABLE `es_tags` (
  `tag_id` int(8) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) DEFAULT NULL,
  `rel_count` int(8) DEFAULT NULL,
  `type` int(8) DEFAULT '0',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `es_tags` */

insert  into `es_tags`(`tag_id`,`tag_name`,`rel_count`,`type`) values (1,'热卖排行',0,0);

/*Table structure for table `es_theme` */

DROP TABLE IF EXISTS `es_theme`;

CREATE TABLE `es_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `themename` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `thumb` varchar(50) DEFAULT NULL,
  `siteid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `es_theme` */

insert  into `es_theme`(`id`,`appid`,`themename`,`path`,`author`,`version`,`deleteflag`,`thumb`,`siteid`) values (1,NULL,'模板v1','default',NULL,NULL,0,'preview.png',0),(2,NULL,'模板v2','kaben',NULL,NULL,0,'preview.png',0);

/*Table structure for table `es_themeuri` */

DROP TABLE IF EXISTS `es_themeuri`;

CREATE TABLE `es_themeuri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `themeid` int(11) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `deleteflag` int(6) DEFAULT '0',
  `pagename` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `sitemaptype` int(11) DEFAULT '0',
  `keywords` varchar(255) DEFAULT NULL,
  `description` longtext,
  `httpcache` int(8) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `es_themeuri` */

insert  into `es_themeuri`(`id`,`themeid`,`uri`,`path`,`deleteflag`,`pagename`,`point`,`sitemaptype`,`keywords`,`description`,`httpcache`) values (1,NULL,'/index.jsp','/index.html',0,'首页',0,0,NULL,NULL,1),(2,NULL,'/index.html','/index.html',0,'首页',0,1,NULL,NULL,1),(3,NULL,'/goods-(\\d+).html','/goods.html',0,'商品详情',0,0,NULL,NULL,1),(4,NULL,'/snapshot-(\\d+).html','/snapshot.html',0,'商品快照',0,0,NULL,NULL,1),(5,NULL,'/search-(.*).html','/goods_list.html',0,'商品搜索',0,0,NULL,NULL,1),(6,NULL,'/help-(\\d+)-(\\d+).html','/help.html',0,'帮助',0,0,NULL,NULL,1),(7,NULL,'/(.*)_payment-result.html','/payment_result.html',0,' 支付结果',0,0,NULL,NULL,0),(8,NULL,'/(.*)_payment-wap-result.html','/payment_wap_result.html',0,'app支付结果',0,0,NULL,NULL,0),(9,NULL,'/subject-(\\d+).html','/subject/subject.html',0,'专题页面',0,0,NULL,NULL,0),(10,NULL,'/subject-index.html','/subject/subject-index.html',0,'专题首页',0,0,NULL,NULL,0);

/*Table structure for table `es_transaction_record` */

DROP TABLE IF EXISTS `es_transaction_record`;

CREATE TABLE `es_transaction_record` (
  `record_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `goods_num` int(10) DEFAULT NULL,
  `rog_time` bigint(20) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `member_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `index_goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_transaction_record` */

/*Table structure for table `es_type_brand` */

DROP TABLE IF EXISTS `es_type_brand`;

CREATE TABLE `es_type_brand` (
  `type_id` int(8) DEFAULT NULL,
  `brand_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_type_brand` */

insert  into `es_type_brand`(`type_id`,`brand_id`) values (2,7),(2,4),(3,4),(3,7),(4,3),(4,5),(4,6),(5,8),(5,9),(5,10),(5,11),(6,18),(6,17),(6,16),(7,21),(7,20),(7,19),(9,24),(8,12),(8,13),(9,22),(9,23),(10,22),(10,23),(10,24),(10,14),(11,14),(11,23),(11,22),(11,24),(12,26),(12,25),(12,15),(13,27),(13,28),(13,29),(14,31),(14,30),(14,29),(15,32),(15,33),(15,34),(16,33),(16,34),(17,37),(17,36),(17,35),(18,40),(18,39),(18,38),(19,43),(19,42),(19,41),(20,44),(20,45),(20,46),(21,48),(21,46),(21,45),(22,51),(22,50),(22,49),(23,55),(23,54),(23,53),(27,59),(27,60),(27,61),(27,52),(28,66),(28,65),(28,64),(28,63),(28,62),(29,67),(29,68),(29,69),(29,70),(29,71),(30,70),(30,69),(30,67),(30,71),(31,74),(31,73),(31,72),(32,77),(32,76),(32,75),(32,66),(33,77),(33,75),(34,75),(34,76),(34,77),(35,84),(35,83),(35,82),(35,81),(36,81),(36,84),(36,79),(37,85),(37,81),(37,79),(37,78),(38,82),(38,78),(38,72),(38,73),(23,86),(23,87),(39,89),(39,88),(39,73),(39,81),(39,72),(40,82),(40,88),(40,89),(41,92),(41,91),(41,90),(42,94),(42,93),(42,90),(43,93),(43,94),(43,91),(43,90),(43,92),(44,90),(44,91),(44,92),(44,93),(44,94),(45,95),(25,47),(25,52),(25,56),(25,57),(25,58),(25,53),(25,54),(25,55),(24,52),(24,56),(24,57),(24,58),(24,97),(24,98),(24,99),(24,100),(50,101),(50,102),(50,103),(50,104),(50,105),(50,106),(50,107),(50,108),(53,109),(53,110),(53,111),(53,112),(53,113),(53,114),(53,115),(53,116);

/*Table structure for table `es_type_spec` */

DROP TABLE IF EXISTS `es_type_spec`;

CREATE TABLE `es_type_spec` (
  `type_id` int(8) DEFAULT NULL,
  `spec_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_type_spec` */

/*Table structure for table `es_url_server` */

DROP TABLE IF EXISTS `es_url_server`;

CREATE TABLE `es_url_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_url_server` */

/*Table structure for table `es_user_role` */

DROP TABLE IF EXISTS `es_user_role`;

CREATE TABLE `es_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `es_user_role` */

insert  into `es_user_role`(`id`,`userid`,`roleid`) values (7,6,3),(16,2,2),(17,3,3),(18,4,4),(19,5,5);

/*Table structure for table `es_warn_num` */

DROP TABLE IF EXISTS `es_warn_num`;

CREATE TABLE `es_warn_num` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `warn_num` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `es_warn_num` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
