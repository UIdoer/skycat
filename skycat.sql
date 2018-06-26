/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.6.38-log : Database - skycat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`skycat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `skycat`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_code` varchar(20) NOT NULL COMMENT 'admin登录名',
  `admin_password` varchar(50) NOT NULL COMMENT 'admin登录密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`admin_code`,`admin_password`) values 
(1,'lzw','202cb962ac59075b964b07152d234b70'),
(2,'hhs','b2ca678b4c936f905fb82f2733f5297f'),
(3,'xlj','202cb962ac59075b964b07152d234b70'),
(4,'xzm','202cb962ac59075b964b07152d234b70'),
(5,'lyh','202cb962ac59075b964b07152d234b70'),
(8,'houhuashi','202cb962ac59075b964b07152d234b70'),
(9,'hhsa','202cb962ac59075b964b07152d234b70'),
(10,'hhsb','202cb962ac59075b964b07152d234b70'),
(11,'admin','21232f297a57a5a743894a0e4a801fc3'),
(15,'manager','1d0258c2440a8d19e716292b231e3190'),
(16,'xiezong','202cb962ac59075b964b07152d234b70');

/*Table structure for table `admin_role` */

DROP TABLE IF EXISTS `admin_role`;

CREATE TABLE `admin_role` (
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `admin_role_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `admin_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin_role` */

insert  into `admin_role`(`admin_id`,`role_id`) values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(8,1),
(9,1),
(10,1),
(11,2),
(15,2),
(16,1);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL COMMENT '类别名',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类目的id',
  `del` int(11) DEFAULT NULL COMMENT '状态0-正常,1-逻辑删除',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`category_id`,`category_name`,`parent_id`,`del`) values 
(1,'电子',0,NULL),
(2,'日用',0,NULL),
(7,'食品',0,NULL),
(8,'手机数码',1,NULL),
(9,'摄影摄像',1,NULL),
(10,'影音娱乐',1,NULL),
(11,'厨房厨具',2,NULL),
(12,'床上用品',2,NULL),
(13,'母婴玩具',2,NULL),
(14,'生鲜',7,NULL),
(15,'熟食',7,NULL),
(16,'好bu吃的',7,NULL),
(17,'美妆',2,NULL),
(18,'服装',2,NULL),
(19,'平板',7,NULL),
(20,'家具',0,NULL),
(21,'衣柜\\橱柜',20,NULL),
(22,'床',20,NULL),
(23,'鲜花/宠物',0,NULL),
(24,'运动/户外',0,NULL),
(25,'办公/DIY',0,NULL),
(26,'美妆/洗护',0,NULL),
(27,'玫瑰花',23,NULL),
(28,'跑鞋',24,NULL),
(29,'打印机',25,NULL),
(30,'洗面奶',26,NULL),
(31,'休闲零食',7,NULL);

/*Table structure for table `direct_car` */

DROP TABLE IF EXISTS `direct_car`;

CREATE TABLE `direct_car` (
  `id` int(11) DEFAULT NULL COMMENT '栏目的id',
  `img1` varchar(100) DEFAULT NULL COMMENT '图片1的路径',
  `urla` varchar(200) DEFAULT NULL COMMENT '图片1对应的地址',
  `img2` varchar(100) DEFAULT NULL COMMENT '图片2的路径',
  `urlb` varchar(200) DEFAULT NULL COMMENT '图片2对应的地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `direct_car` */

/*Table structure for table `good` */

DROP TABLE IF EXISTS `good`;

CREATE TABLE `good` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_title` varchar(50) NOT NULL COMMENT '商品标题',
  `store_id` int(11) NOT NULL COMMENT '商品属于哪家店铺',
  `default_price` double NOT NULL COMMENT '默认显示的价格',
  `img1` varchar(100) DEFAULT NULL COMMENT '缩略图片',
  `img2` varchar(100) DEFAULT NULL COMMENT '缩略图片',
  `img3` varchar(100) DEFAULT NULL COMMENT '缩略图片',
  `img4` varchar(100) DEFAULT NULL COMMENT '缩略图片',
  `img5` varchar(100) DEFAULT NULL COMMENT '缩略图片',
  `grade` int(11) DEFAULT NULL COMMENT '评分',
  `volume` int(11) DEFAULT NULL COMMENT '总销量',
  `category_id` int(11) NOT NULL COMMENT '类目id',
  `status` int(11) NOT NULL COMMENT '0-正常,1-下架,2-删除,3-待审核,,4-修改中',
  `be_hot` int(11) NOT NULL DEFAULT '1' COMMENT '0-参加热门活动,1-不是热门',
  `be_top` int(11) NOT NULL DEFAULT '1' COMMENT '0-参加直通车,1-不参加直通车',
  `post_free` int(11) DEFAULT '1' COMMENT '0-包邮,1-不包邮',
  `post_fee` int(11) DEFAULT '0' COMMENT '邮费价格',
  `put_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `down_time` timestamp NULL DEFAULT NULL COMMENT '下架时间',
  `big_img1` varchar(100) DEFAULT NULL COMMENT '商品详情的图片',
  `big_img2` varchar(100) DEFAULT NULL COMMENT '商品详情的图片',
  `big_img3` varchar(100) DEFAULT NULL COMMENT '商品详情的图片',
  `big_img4` varchar(100) DEFAULT NULL COMMENT '商品详情的图片',
  `big_img5` varchar(100) DEFAULT NULL COMMENT '商品详情的图片',
  `big_img6` varchar(100) DEFAULT NULL COMMENT '商品详情的图片',
  PRIMARY KEY (`good_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `good_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `good` */

insert  into `good`(`good_id`,`good_title`,`store_id`,`default_price`,`img1`,`img2`,`img3`,`img4`,`img5`,`grade`,`volume`,`category_id`,`status`,`be_hot`,`be_top`,`post_free`,`post_fee`,`put_time`,`down_time`,`big_img1`,`big_img2`,`big_img3`,`big_img4`,`big_img5`,`big_img6`) values 
(1,'苹果x',2,7800,'small/1529054487897860acfaf-7b57-4212-bd15-b34dfd12858d.jpg','small/1529054488616f0cf9ef3-0091-4968-901b-87e2f22c38b0.jpg','small/1529054488864289943ac-f278-42e2-bc7a-6373b25a45f9.jpg','small/1529054490197ee95d0f0-7702-4559-9035-6c9637275033.jpg','small/15290544917287147154b-2af7-4b62-977e-bd32003b57ab.jpg',88,77,8,0,0,0,0,0,'2018-06-02 15:58:07','2018-06-05 15:35:59','big/1529054494536331b8406-04de-4656-8b5d-f0dfd39413ba.jpg','big/15290544953097f676be0-247d-4fae-879a-13df692c07ef.jpg','big/15290544966911e6e0765-cc28-4ede-9405-5b624e223923.jpg','big/15290544970755dce076e-9056-4f93-950a-ab252c596f7a.jpg','big/15290544986159d060934-3628-4724-a8ea-9704d66a5016.jpg','big/152870264828634c5e8dd-8a61-43b3-90b7-827ac44b5643.png'),
(3,'爱疯8',2,5000,'small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/1528703098979b2acbe12-ba70-4022-9682-760bf8f1097c.jpg','small/152870309909195a5be0b-89b6-4ff5-b9a1-67844421dff1.jpg','small/1528703099178ef177b07-0b2c-4733-a8fa-646dd9229d8c.png','small/1528703099311701705bc-7e6a-445f-8681-c113af865107.png',88,77,8,0,0,0,1,10,'2018-06-05 19:04:36','2018-06-05 19:04:39','big/15287030994922e9d3edf-5aae-49f2-9f74-9d6b3c62b797.jpg','big/1528703099568a0e9bcb3-254a-48fa-8a66-8c04e8a1575e.jpg','big/15287030997331e6294be-bf79-4995-808d-da33dd89d68f.png','big/15287030998617967d3af-87a3-4e1a-910c-cbfeda4102ab.png','big/1528703100109457c6c79-1417-453e-acb0-658002337711.png',NULL),
(4,'华为P30pro',3,6800,'small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png',NULL,NULL,NULL,NULL,77,88,8,0,0,0,1,10,'2018-06-02 15:58:51','2018-06-05 15:36:04','',NULL,NULL,NULL,NULL,NULL),
(5,'apple7',3,6000,'small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png',NULL,NULL,NULL,NULL,88,77,8,0,0,0,1,10,'2018-06-05 19:04:36','2018-06-05 19:04:39',NULL,NULL,NULL,NULL,NULL,NULL),
(6,'佳能相机',2,6500,'small/1529053925672f7ccf953-11d6-4e78-aa41-37e0dcb9e9eb.jpg','small/1529053925988f7645742-1c89-46f1-a510-12b81a44f78c.jpg','small/15290539261881960bab8-e282-4fc8-9fda-c2ebc3975fd3.jpg','small/1529053926430813ab42b-803d-4a5f-a92b-6e28ad6559e2.jpg','small/15290524160105cd352d9-675c-4e60-b2ea-9c87d27655ce.jpg',88,77,9,0,0,0,1,10,'2018-06-05 19:04:36','2018-06-05 19:04:39','big/1529053926645592d9a64-5feb-46ea-b024-aafd927be557.jpg','big/1529053987842fc53fc1c-17e0-48a8-b08c-34ca000c9d7d.jpg','big/1529054001046ac3b8ddf-70fa-4bd6-889a-7fac99790a77.jpg','big/152905400143227d3c66a-f95f-4c49-822a-a442080f9fae.jpg','big/15290540016474f4309d4-7179-40b7-8e78-5ff54c08fde9.jpg',NULL),
(7,'冰箱',2,4000,'small/152905196599858962e2d-cfe1-42a5-ac22-461d71a95c8f.jpg','small/15290519662167de2efb7-0de1-4a20-a738-fdd376283a1c.jpg','small/1529051966388a626e975-9381-435f-b9f6-e03e25e95ec2.jpg','small/152905196673857f8d3e5-61fa-46e6-a581-5fca83f4ec3d.jpg','small/1529051966806be1126a3-fe34-4870-9e81-28a70a7544b8.jpg',88,77,10,0,0,0,1,10,'2018-06-05 19:04:36','2018-06-05 19:04:39','big/1529051966917f77c334b-786e-4109-940b-b29086f49034.jpg','big/15290519672077842bf89-8b76-4c35-a35e-ac67775782e8.jpg','big/152905196748659a103ed-0d25-4c25-8985-43a096bf4e18.jpg','big/152905196802504f2a829-5888-4430-a464-5e8f143eb6f1.jpg','big/1529051968343b2e3980a-67a3-43b1-8d45-f5d857dca047.gif',NULL),
(8,'婴儿奶粉',2,4000,'small/1529051853870f0922911-3d2a-4262-a63b-ad1a90f328bc.jpg','small/1529051853977124d0df1-6a57-4522-9c70-1ee6556cc229.jpg','small/15290518541945cf22788-3e20-43ab-b548-dc082be22733.jpg','small/1529051854249ae15839c-3e2c-4444-bb2d-855a52844142.jpg','small/1529051854324f1bd7a64-4b4c-486c-bb5b-428b59111589.jpg',88,77,8,0,0,0,1,10,'2018-06-05 19:04:36','2018-06-05 19:04:39','big/1529051854391d49545b4-0435-42da-b012-1171d8f43af3.jpg','big/152905185463916e1728d-3904-4ce9-93ae-6f80b5510187.jpg','big/15290518547759933b963-6228-4cf4-9ee9-9bc8f949c889.jpg','big/152905185509091cc3602-6ede-4974-98e1-eee922055965.jpg','big/152905185516872b87a6c-e5bc-4fff-a5f1-ba76f9474e95.jpg','big/152870311707547572745-2747-436a-a747-211fcb0a7a0e.png'),
(10,'锤子10',2,5566,'small/152870266600296ed4add-4679-468e-80dc-41065ff65481.jpg','small/1528702666081a5685dc8-2b6e-43f0-a146-5d4b589eb85e.jpg','small/152870266614299068104-2130-4972-9054-b93fb0a66750.jpg','small/152870266627432006108-3a17-4173-a4a2-b0a84bddfa65.png','small/152870266649758f687e4-bc18-4662-9ac8-357332be0ac4.png',NULL,NULL,8,0,0,0,1,20,'2018-06-07 11:32:15','2018-06-29 15:03:21','big/15287026669634345b28b-ae63-4a6b-b423-5b8d45b20ec4.png','big/1528702667494b90afb21-0623-4db7-9a59-5738c874706f.png','big/1528702667840fd94e11d-d0d8-4111-bb7a-42cabd2a29b5.png','big/1528702668572c9c0e352-ad3a-48e4-998d-cb62e30d4d24.png','big/1528702669301468cd218-bf20-4f52-affc-811b70a4b395.jpg',NULL),
(11,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤1',2,500,'small/1528956966565580651c8-fdf5-4d2f-8667-f9614fdebb2d.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,0,0,0,1,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(12,'诺基亚A001',2,100,'small/1528702702377818a9c16-fd8c-4419-a004-d47892b7962f.jpg','small/15287027024868751c967-2dda-43f0-9f25-cdf789aeb6e1.jpg','small/1528702702554dc45421f-3d58-4b9c-94f9-6568068e7ad7.jpg','small/15287027026419446642d-9b9e-4a8e-901b-996bab8daf27.png','small/1528702702867d7a32e3d-5fd8-4c9f-a2fe-af5b30173750.png',NULL,NULL,8,0,0,0,1,10,'2018-06-08 17:33:57',NULL,'big/1528702703368b8736086-5169-4237-8a3a-5fed5c3e7ebe.png','big/1528702703876d1173d29-8b9d-41da-9267-5c3d27180894.png','big/15287027045540106da67-21fb-460c-b5f5-5f1446c9fbb2.png','big/1528702705253455e83d0-33db-476a-8f56-b9921d40266b.jpg','big/1528702705333a06fa926-99f0-4e32-97f5-accdc344e580.jpg',NULL),
(13,'图片测试',2,123123,'small/15288765779711995d712-0fab-4356-9ed5-17269b48cdaf.png','small/15288765789663bae855a-5c8f-4ae7-a95c-faeb42f024bf.jpg','small/1528876579143a1804596-2e5b-4f70-afd4-51e0182a3e71.jpg',NULL,NULL,NULL,NULL,8,4,1,0,0,0,'2018-06-11 15:18:49',NULL,'big/15288765792232d294a97-8d1f-40d9-b034-fa24e50c5cf4.png','big/152887657950931525755-f9f5-47cf-87bd-2b67fc547138.png','big/15288765795797acf75c5-04d0-461b-9b59-6e2b0a840a8c.jpg','big/1528876579764574aad69-97a5-4de1-9166-c95813037714.jpg','big/15288765798636a11525b-f5c0-4ab6-b1d2-980458df22b5.png',NULL),
(14,'图片测试3.0',2,1231,'small/1528702570717d764bcfe-7fcc-4ee9-a600-56bcf6a73218.png',NULL,NULL,NULL,NULL,NULL,NULL,8,1,0,0,1,10,'2018-06-11 15:30:52',NULL,'big/152870257127473450720-e004-4e8f-80d4-75db150906b2.jpg','big/152870226716537eab8d9-5dba-4094-a244-81cd72f1ea71.png','big/15287022679217b6d7ce2-86f2-4549-bd4d-2c4b94bfb9b5.jpg',NULL,NULL,NULL),
(15,'大菜刀',2,45,'small/152870435634708aead04-325d-4da1-aef1-7afecd5952d9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,11,0,1,1,0,15,'2018-06-11 16:05:56',NULL,'big/15287043568598adc71d1-2e32-4180-a955-5eb0982c2baa.jpg',NULL,NULL,NULL,NULL,NULL),
(16,'7仓速配 莫高冰酒冰葡萄酒 冰红葡萄酒 甜葡萄酒红酒整箱6支装',3,199,'small/152895380169432236a89-4233-4458-98ab-a886750b112c.jpg','small/15289538034331038c33f-731b-4222-bba4-408e25be46e7.jpg','small/1528953803730d601815a-773e-4567-af2a-cf568347629e.jpg','small/1528953804213f2911b64-078b-41b6-9289-23473193aee7.jpg',NULL,NULL,NULL,16,0,0,0,0,0,'2018-06-14 13:23:25',NULL,'big/15289538047516150041e-2871-4551-a9d8-8620b27e5ace.jpg','big/152895380508938a6e434-d937-4d95-bbd9-788f7a417de0.jpg','big/15289538051859ff34624-f92f-4a84-b2af-2fbbb821482f.jpg','big/1528953805298291a157e-4674-49e6-b811-a4a8efdf4a99.jpg','big/1528953805475c179ce3c-ecf6-4e99-9542-db7bf24575f2.jpg',NULL),
(17,'衣品乐原创大码宽松中长款印花拼接短袖连衣裙女2018夏装新款',2,149,'small/1528956966565580651c8-fdf5-4d2f-8667-f9614fdebb2d.jpg','small/15289569686801b035be5-74c0-4d09-899a-10014a660af6.jpg','small/15289569698638b88b6c8-cc37-4d0f-b41b-3268fe161328.jpg','small/1528956970609ffe2f46f-cdd6-4ec5-9049-6e0ed6eca521.jpg',NULL,NULL,NULL,18,0,0,0,1,10,'2018-06-14 14:16:16',NULL,'big/1528956971274b304f468-8f1f-4df5-bda9-4112b8f1a26c.jpg','big/1528956971724a84d0933-3234-4586-b0be-5a00787814d2.jpg','big/15289569722414adfdd9a-c69d-458e-a611-f2bb19ddda88.jpg','big/15289569730587da1270e-2908-427a-b2e1-ad4c16150c9d.jpg','big/1528956974585e8a40391-089f-42c5-8718-37ffee97d2fe.jpg',NULL),
(18,'99朵玫瑰花束鲜花速递同城北京上海广州苏州南京杭州花店送花生日',2,88,'small/1528959548569672bf2d6-184c-49fb-94b5-c46438472796.jpg','small/1528959550113416e85d1-5dab-4649-a482-5be013e970a2.jpg','small/1528959550973e1791ab0-0b4e-4789-9dda-2e31d4fa1c31.jpg','small/15289595518882c7944d8-e592-4323-a631-1965eb2dd35c.jpg',NULL,NULL,NULL,27,0,0,0,1,15,'2018-06-14 14:59:17',NULL,'big/15289595528081a325495-4512-4d82-88d3-4cadee731fa4.jpg','big/15289595539855e19a634-51f5-4765-997e-f5c41bcffe6e.jpg','big/15289595551902d0229b3-ebaa-4923-897d-a6fab3f59452.jpg','big/15289595563089cff57d7-c7ae-4171-b286-f01d1b4f33bc.jpg',NULL,NULL),
(19,'鲜花速递同城红玫瑰花束礼盒生日北京上海广州深圳南京花店配送花',2,34,'small/1528959670177f2401b22-8510-498a-8a17-426f4545e1eb.jpg','small/15289596712324f0ecee0-38c7-4995-9b37-53c6ac7174a2.jpg','small/15289596721133fbe9c7f-6092-4392-bd08-e12a9bb4a073.jpg','small/152895967301156eac755-dfaf-4c5b-a61a-46a36ef2fbe6.jpg',NULL,NULL,NULL,27,0,1,0,0,0,'2018-06-14 15:01:15',NULL,'big/152895967390008cd2a26-7867-4522-838e-b4c1dcf08b2e.jpg','big/1528959674966f0dd38cc-a602-46fc-abe4-2c64e6119554.jpg',NULL,NULL,NULL,NULL),
(20,'苹果9',2,7800,'small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287026468971b8e2761-1f4c-43b8-8860-5bca770d1b96.png','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png',88,77,8,2,0,0,0,0,'2018-06-02 15:58:07','2018-06-05 15:35:59','big/1528702647860cc0194b8-3d6a-4e7e-b8fb-44719f31179f.jpg','big/1528702647934afb67560-4027-41ab-bc19-3095e7eefdfa.jpg','big/1528702648049353ae789-756e-45ba-b0f3-5eb573ac19cb.png','big/152870264828634c5e8dd-8a61-43b3-90b7-827ac44b5643.png','big/152870264828634c5e8dd-8a61-43b3-90b7-827ac44b5643.png','big/152870264828634c5e8dd-8a61-43b3-90b7-827ac44b5643.png'),
(21,'苹果7x',2,7800,'small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287026468971b8e2761-1f4c-43b8-8860-5bca770d1b96.png','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png',88,77,8,2,0,0,0,0,'2018-06-02 15:58:07','2018-06-05 15:35:59','big/1528702647860cc0194b8-3d6a-4e7e-b8fb-44719f31179f.jpg','big/1528702647934afb67560-4027-41ab-bc19-3095e7eefdfa.jpg','big/1528702648049353ae789-756e-45ba-b0f3-5eb573ac19cb.png','big/152870264828634c5e8dd-8a61-43b3-90b7-827ac44b5643.png','big/152870264828634c5e8dd-8a61-43b3-90b7-827ac44b5643.png','big/152870264828634c5e8dd-8a61-43b3-90b7-827ac44b5643.png'),
(22,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤6',2,500,'small/1529052179944b24eb323-e379-48f6-8145-d608aa332157.jpg','small/1529052180006d0d59ad3-4b8b-4d86-87c9-00e469041fd1.jpg','small/1529052180079398282a1-1798-4b1f-b96c-d2c3f19051b9.jpg','small/1529052180131af43bfb1-31b5-499c-b0b2-bc890857124b.jpg','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,1,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/152905218022651aa7b60-a441-4f3f-b073-3e2003987a98.jpg','big/15290521804560935be09-5cf7-47c2-bb1c-b4c7114a3ed5.jpg','big/15290521805299e066d4b-7e1c-4fbf-a784-b54d55939a77.jpg','big/15290521807939012e191-9899-410b-9a50-19cbd6475e7c.jpg','big/1529052180939bd224321-84a9-4284-b3f3-9b2b86a55e4b.jpg',NULL),
(23,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤8',2,500,'small/1528956966565580651c8-fdf5-4d2f-8667-f9614fdebb2d.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,0,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(24,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤10',2,500,'small/1528956966565580651c8-fdf5-4d2f-8667-f9614fdebb2d.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,0,0,0,1,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(25,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤9',2,500,'small/1528956966565580651c8-fdf5-4d2f-8667-f9614fdebb2d.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,0,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(26,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤7',2,500,'small/1528956966565580651c8-fdf5-4d2f-8667-f9614fdebb2d.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,0,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(27,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤5',2,500,'small/1528956966565580651c8-fdf5-4d2f-8667-f9614fdebb2d.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,3,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(28,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤4',2,500,'small/1529052141275c0aabcdf-26b6-4e93-a1dc-779b502c9bed.jpg','small/15290521415622bfbb8c2-536c-4ce4-8429-db2c283566fc.jpg','small/1529052141808e1a60be7-66af-4caa-ad78-d42ab548befb.jpg','small/152905214213283dfef34-47d7-46f2-8d9b-b934ecfec072.jpg','small/1529052142315a3100532-0490-41fa-a689-1f3a85ca3a82.jpg',NULL,NULL,18,0,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1529052142372873f4ed2-5674-45f7-9b2e-2e434f3935a0.jpg','big/152905214260091ed65da-4a96-4594-a4cf-852ecd52c790.jpg','big/15290521427459fc5c37b-dcc8-429e-857a-51cd03322777.jpg','big/15290521428798b9d2f1c-2d6c-4748-a13f-48d13739a2ba.jpg','big/1529052143076c0a1a391-16e7-4ef2-806a-1ecc0f521609.jpg',NULL),
(29,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤3',2,500,'small/15287031569457ac6ce43-e806-4c62-9683-da6b3f7986ae.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,3,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(30,'魏彦妮Santa Rita2018春装新款高腰显瘦甜美蕾丝连体裤女夏短裤2',2,500,'small/15287031569457ac6ce43-e806-4c62-9683-da6b3f7986ae.jpg','small/152870315717459687e28-c5aa-468c-a503-beaf26a41f41.jpg','small/1528703157518dcd17c1a-b30c-450d-9aa1-9d5ddbce073a.jpg','small/1528702647318e90b1288-183c-4645-b8cf-5d29d9a93267.png','small/15287031577341db617ca-70bc-4fd0-8d91-baa7db956f7c.png',NULL,NULL,18,3,0,0,0,50,'2018-06-07 14:36:47','2018-06-29 15:03:21','big/1528703157970dd5d6181-f9c9-4a79-8e8e-cf3e309c3930.png','big/15287031580678de4b7ac-5e82-4b38-8830-d5d350d172c8.png','big/1528703158168c3772c64-4e52-44f6-8f03-176ec0d9352a.png','big/152870315827989b5d726-a104-4f3e-8536-116caa381d61.png','big/152870315836628cce993-8e76-4053-a4d4-9e2cdc8ffac8.png',NULL),
(31,'sumsung s9',2,888,'small/1529073506355eaa68505-7ef0-42d1-a4ee-ea768b0bd6ff.jpg','small/152907350688863249ffb-f960-4026-95f0-af1174d886e4.jpg',NULL,NULL,NULL,NULL,NULL,8,3,0,0,0,0,'2018-06-15 22:38:27',NULL,'big/152907350697175d0b1de-c36f-43ea-bd02-b70619656cd8.jpg','big/1529073507062468a3537-1dfd-4852-82ca-b4b7f5978add.jpg','big/152907350715314fcfaa3-a0c3-4334-bb09-975beb2325d3.jpg',NULL,NULL,NULL);

/*Table structure for table `good_comment` */

DROP TABLE IF EXISTS `good_comment`;

CREATE TABLE `good_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `com_grade` int(11) NOT NULL COMMENT '0-好评,1-中评,2-差评',
  `com_text` varchar(500) NOT NULL DEFAULT '系统默认评论' COMMENT '评价文本',
  `com_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评价发表时间',
  `img1` varchar(50) DEFAULT NULL COMMENT '评价图片',
  `img2` varchar(50) DEFAULT NULL COMMENT '评价图片',
  `img3` varchar(50) DEFAULT NULL COMMENT '评价图片',
  `img4` varchar(50) DEFAULT NULL COMMENT '评价图片',
  PRIMARY KEY (`comment_id`),
  KEY `good_id` (`good_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `good_comment_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`),
  CONSTRAINT `good_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `good_comment` */

insert  into `good_comment`(`comment_id`,`good_id`,`user_id`,`com_grade`,`com_text`,`com_time`,`img1`,`img2`,`img3`,`img4`) values 
(1,1,1,0,'系统默认评论','2018-06-02 16:03:34',NULL,NULL,NULL,NULL),
(2,1,2,1,'一般般，给个中评吧','2018-06-02 16:03:48',NULL,NULL,NULL,NULL),
(3,1,3,2,'差评','2018-06-13 15:57:14',NULL,NULL,NULL,NULL),
(8,1,2,0,'超级喜欢','2018-06-14 16:13:18','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/20620e5c-42e6-4334-891b-49c647de57cd.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg'),
(9,1,2,0,'超级喜欢','2018-06-14 16:13:19','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/20620e5c-42e6-4334-891b-49c647de57cd.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg'),
(10,1,2,0,'超级喜欢','2018-06-14 16:13:20','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/20620e5c-42e6-4334-891b-49c647de57cd.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg'),
(11,1,2,0,'超级喜欢','2018-06-14 16:13:21','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/20620e5c-42e6-4334-891b-49c647de57cd.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg'),
(12,1,2,0,'超级喜欢','2018-06-14 16:13:23','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/20620e5c-42e6-4334-891b-49c647de57cd.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg'),
(13,1,2,0,'超级喜欢','2018-06-14 16:13:33','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/075a44b4-08b1-4fd8-9d1e-dc626f0f3a21.jpg',NULL),
(14,1,2,0,'超级喜欢','2018-06-14 16:13:27','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/20620e5c-42e6-4334-891b-49c647de57cd.jpg','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg'),
(16,1,11,0,'sadfsdfdsa','2018-06-14 16:13:40','comment/075a44b4-08b1-4fd8-9d1e-dc626f0f3a21.jpg',NULL,NULL,NULL),
(17,1,11,0,'sadfsdfdsa','2018-06-14 13:28:07',NULL,NULL,NULL,NULL),
(18,1,11,0,'sadfsdfdsa','2018-06-14 13:28:07',NULL,NULL,NULL,NULL),
(19,1,11,0,'sadfsdfdsa','2018-06-14 13:28:08',NULL,NULL,NULL,NULL),
(20,1,11,0,'sadfsdfdsa','2018-06-14 13:28:08',NULL,NULL,NULL,NULL),
(22,1,11,0,'hao','2018-06-14 14:04:06',NULL,NULL,NULL,NULL),
(23,1,11,0,'hao','2018-06-14 14:04:07',NULL,NULL,NULL,NULL),
(24,1,11,0,'hao','2018-06-14 14:04:07',NULL,NULL,NULL,NULL),
(25,1,11,0,'hao','2018-06-14 14:04:07',NULL,NULL,NULL,NULL),
(26,1,11,0,'超级好','2018-06-14 14:06:27',NULL,NULL,NULL,NULL),
(27,1,11,0,'超级好','2018-06-14 14:06:27',NULL,NULL,NULL,NULL),
(28,1,11,0,'超级好','2018-06-14 14:06:27',NULL,NULL,NULL,NULL),
(29,1,11,0,'超级好','2018-06-14 14:06:27',NULL,NULL,NULL,NULL),
(30,1,11,0,'五星','2018-06-14 14:10:36',NULL,NULL,NULL,NULL),
(31,1,11,0,'五星','2018-06-14 14:10:36',NULL,NULL,NULL,NULL),
(32,1,11,0,'五星','2018-06-14 14:10:36',NULL,NULL,NULL,NULL),
(33,1,11,0,'五星','2018-06-14 14:10:36',NULL,NULL,NULL,NULL),
(34,1,11,0,'五星好评','2018-06-14 14:12:04',NULL,NULL,NULL,NULL),
(35,1,11,0,'默认好评','2018-06-14 14:22:18',NULL,NULL,NULL,NULL),
(36,1,11,0,'超级好','2018-06-14 14:28:10',NULL,NULL,NULL,NULL),
(37,1,11,0,'好评','2018-06-14 14:35:47',NULL,NULL,NULL,NULL),
(39,1,11,0,'大时代发生','2018-06-14 16:13:45','comment/075a44b4-08b1-4fd8-9d1e-dc626f0f3a21.jpg',NULL,NULL,NULL),
(40,1,11,0,'大时代发生','2018-06-14 16:06:03','comment/772f82c6-d08d-4c92-a488-d7cb107fa77a.png','comment/882b5e9e-e28b-4739-90da-41b4d3ca770d.png','comment/5fbd5b16-6e3a-40f2-9308-08888a286f85.png','comment/602676e9-171f-4b1a-b36f-bdaaf3ef23bd.png'),
(41,1,11,0,'好','2018-06-14 16:06:05','comment/72434513-4f27-4137-a2e8-4dedf4e36e7b.jpg',NULL,NULL,NULL),
(42,1,11,0,'好','2018-06-14 16:06:09','comment/98d2f053-7cdb-4fcb-8b6e-d116ecb4e09c.jpg',NULL,NULL,NULL),
(43,1,11,0,'的发生的发','2018-06-14 16:06:12','comment/d1178dbb-2d0c-426d-9791-4a05c7e4cdee.jpg',NULL,NULL,NULL),
(45,1,11,0,'爱上的发生的发','2018-06-14 16:06:13','comment/9a5d65b3-8683-4ccf-b809-3bad5ee3b25c.jpg',NULL,NULL,NULL),
(46,1,11,0,'的发生的发','2018-06-14 16:06:15','comment/5c19a633-b0ec-4f9d-8fde-723d49586691.jpg',NULL,NULL,NULL),
(47,1,11,0,'好地方','2018-06-14 16:06:18','comment/f0ea2798-b4a3-43a2-a963-f1e96bae4a2a.jpg',NULL,NULL,NULL),
(48,15,11,0,'刀子非常锋利，很棒棒哦！','2018-06-14 15:44:47',NULL,NULL,NULL,NULL),
(49,1,11,0,'超级喜欢','2018-06-14 16:12:16','comment/95a5c743-3e05-4b4e-b189-e95d2b6fcfa8.jpg','comment/075a44b4-08b1-4fd8-9d1e-dc626f0f3a21.jpg','comment/20620e5c-42e6-4334-891b-49c647de57cd.jpg',NULL),
(50,3,22,0,'超级超级好','2018-06-15 16:14:31','comment/ec140803-2d16-48dc-8315-afe70e4fd0f2.jpg','comment/9c031282-38d6-47ef-92c6-e8ade6d9f6bd.jpg',NULL,NULL),
(51,3,22,0,'五星好评','2018-06-15 16:16:22','comment/6bbfd46f-bfbd-4005-b493-e73d7dd77738.jpg','comment/456da009-4328-4573-81c4-9207c2a54848.jpg',NULL,NULL),
(52,14,22,0,'52zxcfb42dfgb4ff15','2018-06-15 19:24:17','comment/50d5413d-dc2d-4b6a-a441-8797f44fa1bc.png',NULL,NULL,NULL),
(53,3,11,1,'mamahuhu','2018-06-15 22:22:21','comment/84652250-860b-4b53-9a49-bb475f128a7e.jpg','comment/99c3e32e-251e-45ae-bc74-d09631a932e2.jpg',NULL,NULL);

/*Table structure for table `good_property` */

DROP TABLE IF EXISTS `good_property`;

CREATE TABLE `good_property` (
  `good_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL COMMENT '商品id',
  `p1_id` int(11) NOT NULL COMMENT '属性1的id',
  `p1_value` varchar(50) NOT NULL COMMENT '属性1的属性值',
  `p2_id` int(11) NOT NULL COMMENT '属性2的id',
  `p2_value` varchar(50) NOT NULL COMMENT '属性2的属性值',
  `stock` int(11) NOT NULL COMMENT '该属性商品的库存',
  `price` double NOT NULL COMMENT '该属性商品的价格',
  PRIMARY KEY (`good_property_id`),
  KEY `p1_id` (`p1_id`),
  KEY `p2_id` (`p2_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `good_property_ibfk_1` FOREIGN KEY (`p1_id`) REFERENCES `property` (`property_id`),
  CONSTRAINT `good_property_ibfk_2` FOREIGN KEY (`p2_id`) REFERENCES `property` (`property_id`),
  CONSTRAINT `good_property_ibfk_3` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `good_property` */

insert  into `good_property`(`good_property_id`,`good_id`,`p1_id`,`p1_value`,`p2_id`,`p2_value`,`stock`,`price`) values 
(1,1,1,'黑色',2,'一亿G',88,6700),
(2,1,1,'黑色',1,'32G',87,6800),
(3,1,1,'白色',2,'16G',78,6769),
(4,1,1,'白色',2,'32G',77,6781),
(5,3,1,'土豪金',2,'16G',100,7000),
(6,3,1,'土豪金',2,'32G',5,5900),
(7,3,1,'基佬紫',2,'16G',100,6999),
(8,5,1,'基佬紫',2,'32G',10,8000),
(9,11,1,'米白色',2,'SS',100,349),
(10,1,3,'透明',2,'128G',20,10000),
(13,1,1,'黑色',2,'10086G',88,6700),
(16,1,3,'情侣专属版',1,'粉色*2',10,16880),
(17,10,1,'黑色',2,'1G',10000,1000),
(18,8,1,'速度发顺丰',2,'阿斯顿发生',13532,123),
(19,12,2,'512M',1,'灰色',50,105),
(20,14,1,'盛辉银',2,'16G',88,888),
(21,16,4,'默认规格',4,'默认规格',999,199),
(22,17,5,'碎花',6,'S',90,89),
(23,19,7,'999',7,'99',88,1314),
(24,18,7,'99',7,'99',90,3344),
(25,15,18,'金色',18,'泰合精钢',89,99),
(26,18,7,'88',7,'88',99,87),
(27,8,1,'婴儿奶粉',2,'500g',88,99);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(50) NOT NULL COMMENT '消息标题',
  `message_info` varchar(200) NOT NULL COMMENT '消息内容',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '消息发送时间',
  `messager_id` int(11) DEFAULT NULL COMMENT '店铺的id',
  `receiver_id` int(11) DEFAULT NULL COMMENT '0-收藏店铺的人',
  `message_type` int(11) DEFAULT NULL COMMENT '0-通知信息,1-促销信息',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`message_id`,`message_title`,`message_info`,`time`,`messager_id`,`receiver_id`,`message_type`) values 
(1,'小米促销1','本店的小米6打折至95折，赶快来购买吧！','2018-06-05 09:39:20',NULL,2,1),
(3,'小米促销2','奥术大师多','2018-06-05 10:27:44',NULL,NULL,NULL),
(4,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-11 14:17:11',2,1,0),
(5,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-11 14:47:50',2,1,0),
(6,'消息2','爱仕达大大大所','2018-06-11 14:52:41',NULL,NULL,NULL),
(7,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-13 14:15:07',2,27,0),
(8,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-13 14:17:17',2,27,0),
(9,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-13 14:19:50',2,1,0),
(10,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-14 11:10:11',2,11,0),
(11,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-14 11:10:27',2,27,0),
(12,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-14 11:10:35',2,11,0),
(13,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-14 11:10:44',2,11,0),
(14,'在吗','哈哈','2018-06-14 14:04:16',NULL,NULL,NULL),
(15,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-14 16:07:09',2,28,0),
(16,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 10:39:33',2,27,0),
(17,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 10:39:38',2,27,0),
(18,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 10:39:41',2,28,0),
(19,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 10:39:45',2,28,0),
(20,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 10:39:48',2,11,0),
(21,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 10:39:51',2,11,0),
(22,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 10:39:57',2,11,0),
(23,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 18:26:50',2,11,0),
(24,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 19:16:15',2,22,0),
(25,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 22:20:26',2,11,0),
(26,'发货消息','您购买的商品已经在路上~~~~~~','2018-06-15 22:36:07',2,11,0);

/*Table structure for table `message_read_status` */

DROP TABLE IF EXISTS `message_read_status`;

CREATE TABLE `message_read_status` (
  `message_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0-已读,1-未读'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message_read_status` */

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '条目id',
  `order_id` int(11) NOT NULL COMMENT '订单的id',
  `good_property_id` int(11) NOT NULL COMMENT '商品属性组合的id',
  `item_count` int(11) NOT NULL COMMENT '数量',
  `order_item_total` double NOT NULL COMMENT '本条目的总价',
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `good_property_id` (`good_property_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`good_property_id`) REFERENCES `good_property` (`good_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Data for the table `order_item` */

insert  into `order_item`(`item_id`,`order_id`,`good_property_id`,`item_count`,`order_item_total`) values 
(63,55,1,1,6700),
(64,56,5,1,7000),
(65,57,18,1,123),
(66,58,18,2,246),
(67,59,20,33,29304),
(68,59,1,4,26800),
(69,59,5,2,14000),
(70,60,24,1,3344),
(71,61,5,4,28000),
(72,61,10,42,420000),
(73,62,5,4,28000),
(74,62,18,1,123),
(75,62,25,1,99),
(76,63,5,1,7000);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) NOT NULL COMMENT '用户的id',
  `add_id` int(11) NOT NULL COMMENT '收货地址id',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺的地址',
  `total` double NOT NULL COMMENT '订单总价',
  `remark` varchar(50) DEFAULT NULL COMMENT '订单的备注',
  `status` int(11) DEFAULT NULL COMMENT '-1-交易关闭,0-未付款,1-已付款,2-已发货,3-已完成,4-退款中',
  `logistic_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `is_commented` int(2) DEFAULT '2' COMMENT '是否已评论： 0未评论  1已评论 2交易未完成无权评论',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `add_id` (`add_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`add_id`) REFERENCES `user_address` (`address_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`user_id`,`add_id`,`store_id`,`total`,`remark`,`status`,`logistic_no`,`order_time`,`is_commented`) values 
(54,27,16,2,21000,'',0,NULL,'2018-06-15 14:59:33',0),
(55,27,16,2,6700,'xian zi ming 送手机壳啊',0,NULL,'2018-06-15 15:37:19',2),
(56,27,16,2,7000,'',0,NULL,'2018-06-15 17:56:39',2),
(57,27,16,2,123,'',1,NULL,'2018-06-15 17:57:39',2),
(58,11,12,2,246,'',2,NULL,'2018-06-15 18:25:20',2),
(59,22,20,2,70104,'fffa',3,NULL,'2018-06-15 19:21:34',2),
(60,11,12,2,3344,'',2,NULL,'2018-06-15 20:47:34',2),
(61,11,12,2,448000,'发顺丰',0,NULL,'2018-06-15 22:11:13',2),
(62,11,12,2,28222,'方法',3,NULL,'2018-06-15 22:21:01',2),
(63,11,12,2,7000,'esr',-1,NULL,'2018-06-15 22:17:12',2);

/*Table structure for table `privilege` */

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `privilege_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(50) NOT NULL COMMENT '访问的url',
  `name` varchar(20) NOT NULL COMMENT '权限名',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级权限的id',
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `privilege` */

insert  into `privilege`(`privilege_id`,`url`,`name`,`parent_id`) values 
(1,'/checkGood/find','checkGood:find',NULL),
(2,'/checkGood/updateGoodStatus','checkGood:update',NULL),
(3,'/user/find','user:find',NULL),
(4,'/user/findByCondition','user:findByCondition',NULL),
(5,'/user/toModify','user:toModify',NULL),
(6,'/user/doModify','user:doModify',NULL),
(7,'/store/find','store:find',NULL),
(8,'/store/toModify','store:toModify',NULL),
(9,'/store/checkManagerId','store:checkManagerId',NULL),
(10,'/store/doModify','store:doModify',NULL),
(11,'/category/find','category:find',NULL),
(12,'/category/toModify','category:toModify',NULL),
(13,'/category/doModify','category:doModify',NULL),
(14,'/category/toAdd','category:toAdd',NULL),
(15,'/admin/find','admin:find',NULL),
(16,'/admin/toAdd','admin:toAdd',NULL),
(17,'/admin/doAdd','admin:doAdd',NULL),
(18,'/admin/toModifyPwd','admin:toModifyPwd',NULL),
(19,'/admin/doModifyPwd','admin:doModifyPwd',NULL);

/*Table structure for table `property` */

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `category_id` int(11) NOT NULL COMMENT '所属类目的id',
  `property_name` varchar(50) NOT NULL COMMENT '属性名',
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `property` */

insert  into `property`(`property_id`,`category_id`,`property_name`) values 
(1,8,'颜色'),
(2,8,'内存'),
(3,8,'版本'),
(4,16,'规格'),
(5,18,'颜色'),
(6,18,'尺码'),
(7,27,'朵数'),
(8,28,'颜色'),
(9,28,'尺码'),
(10,29,'型号'),
(11,30,'容量'),
(12,22,'尺寸'),
(13,22,'形状'),
(14,21,'尺寸'),
(15,21,'颜色'),
(16,19,'容量'),
(17,20,'版本'),
(18,11,'长度');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`) values 
(1,'storeManager'),
(2,'systemManager');

/*Table structure for table `role_privilege` */

DROP TABLE IF EXISTS `role_privilege`;

CREATE TABLE `role_privilege` (
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `privilege_id` (`privilege_id`),
  CONSTRAINT `role_privilege_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_privilege_ibfk_2` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_privilege` */

insert  into `role_privilege`(`role_id`,`privilege_id`) values 
(2,15),
(2,2),
(2,3),
(2,4),
(2,5),
(2,6),
(2,7),
(2,8),
(2,9),
(2,10),
(2,11),
(2,12),
(2,13),
(2,14),
(2,15),
(2,16),
(2,17),
(2,18),
(2,19);

/*Table structure for table `roll_image` */

DROP TABLE IF EXISTS `roll_image`;

CREATE TABLE `roll_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(50) NOT NULL COMMENT '图片地址',
  `url` varchar(50) NOT NULL COMMENT '图片点击进入的url',
  `status` int(11) NOT NULL COMMENT '0-展示,1-不展示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `roll_image` */

insert  into `roll_image`(`id`,`img_src`,`url`,`status`) values 
(1,'banner01.jpg','good/findCategoryGood?CategoryId=7',0),
(2,'banner02.jpg','good/findCategoryGood?CategoryId=17',0),
(3,'banner03.jpg','good/findCategoryGood?CategoryId=11',0),
(4,'banner04.jpg','good/findCategoryGood?CategoryId=13',0);

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(50) NOT NULL COMMENT '商品名称',
  `store_descr` varchar(100) DEFAULT NULL COMMENT '商铺简介',
  `status` int(11) NOT NULL COMMENT '商品状态0-正常,1-关闭',
  `store_add` varchar(20) NOT NULL COMMENT '商铺所在地',
  `phone` varchar(20) NOT NULL COMMENT '商家练习方式',
  `grade` int(11) NOT NULL COMMENT '商家总评分',
  `manager_id` int(11) DEFAULT NULL COMMENT '店铺管理员的id',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `store` */

insert  into `store`(`store_id`,`store_name`,`store_descr`,`status`,`store_add`,`phone`,`grade`,`manager_id`) values 
(1,'苏宁电器','苏宁官方自营店',1,'北京','0108888888',10,4),
(2,'Apple自营店','Apple官方自营店',0,'广州','0209999999',88,1),
(3,'HWAWEI','华为手机旗舰店',0,'上海','0407777777',77,8),
(4,'小米店铺','小米旗舰店',0,'深圳','0561164665',10,2);

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `receive_name` varchar(20) NOT NULL COMMENT '收货人姓名',
  `receive_phone` varchar(20) NOT NULL COMMENT '收货人电话',
  `is_default` varchar(1) DEFAULT '0' COMMENT '是否默认地址',
  `specific_address` varchar(50) NOT NULL,
  `receive_detail` varchar(50) NOT NULL COMMENT '收货详细地址',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `user_address` */

insert  into `user_address`(`address_id`,`user_id`,`receive_name`,`receive_phone`,`is_default`,`specific_address`,`receive_detail`) values 
(1,1,'张大大','15555555555','0','','北京'),
(2,2,'蛤蟆','88888888888','0','','上海'),
(11,11,'夏日和','15217618782','0','','太平天国广东/广州市/从化区/太平镇'),
(12,11,'小白','15217618782','0','广东/广州市/越秀区','太平天国'),
(14,11,'侯骅十','188888888','1','','南云五路广东/广州市/天河区'),
(15,27,'冼子明','11555554644066','0','广东/深圳市/福田区','太平天国南云五路'),
(16,27,'张清风','15217618782','1','北京/丰台区/五环到六环之间','北京街 龙头镇 五里亭 凤鸣路813号'),
(17,27,'侯骅十','15888899999','0','广东/广州市/萝岗区/九龙镇','阿斯蒂芬'),
(18,28,'侯骅十','18024168541','1','广东/广州市/天河区','猎德村3横1巷4号'),
(19,28,'侯骅十','18025111111','0','广东/广州市/番禺区/城区','长隆水上乐园'),
(20,22,'asdf','asdf','1','安徽/淮南市/淮南高新技术开发区','asdf'),
(21,11,'小白','15217618782','0','广东/深圳市/福田区','太平天国');

/*Table structure for table `user_cart` */

DROP TABLE IF EXISTS `user_cart`;

CREATE TABLE `user_cart` (
  `user_id` int(11) DEFAULT NULL,
  `good_property_id` int(11) DEFAULT NULL COMMENT '商品-属性表的id,代表选定属性的商品',
  `number` int(11) DEFAULT NULL COMMENT '商品的数量',
  `total` double DEFAULT NULL COMMENT '这条的小计总价',
  KEY `user_id` (`user_id`),
  KEY `good_property_id` (`good_property_id`),
  CONSTRAINT `user_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `user_cart_ibfk_2` FOREIGN KEY (`good_property_id`) REFERENCES `good_property` (`good_property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_cart` */

insert  into `user_cart`(`user_id`,`good_property_id`,`number`,`total`) values 
(3,2,11,74800),
(2,4,2,100);

/*Table structure for table `user_good` */

DROP TABLE IF EXISTS `user_good`;

CREATE TABLE `user_good` (
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `good_id` int(11) DEFAULT NULL COMMENT '收藏商品的id',
  KEY `user_id` (`user_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `user_good_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `user_good_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `good` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_good` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `sex` char(1) NOT NULL COMMENT '0-male,1-female',
  `picture` varchar(100) NOT NULL DEFAULT '/default_head_pic.jpg' COMMENT '头像图片的路径,有默认值',
  `telephone` varchar(20) NOT NULL COMMENT '用户的电话',
  `email` varchar(50) NOT NULL COMMENT '用户的email',
  `status` int(11) NOT NULL COMMENT '0-用户正常，1-锁定,2-封禁',
  `question1` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `question2` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `question3` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `answer1` varchar(50) DEFAULT NULL COMMENT '密保答案',
  `answer2` varchar(50) DEFAULT NULL COMMENT '密保答案',
  `answer3` varchar(50) DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

insert  into `user_info`(`user_id`,`user_name`,`user_password`,`sex`,`picture`,`telephone`,`email`,`status`,`question1`,`question2`,`question3`,`answer1`,`answer2`,`answer3`) values 
(1,'houhuashi','202cb962ac59075b964b07152d234b70','0','headpic/head1.jpg','1888888888','971245595@qq.com',1,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'xianziming','d41d8cd98f00b204e9800998ecf8427e','0','headpic/head2.jpg','1999999999','xianziming@qq.com',0,'籍贯','兴趣','喜欢什么味道','广州深圳','打豆豆','柠檬味'),
(3,'xuelijun','d41d8cd98f00b204e9800998ecf8427e','0','headpic/head3.jpg','1777777777','xuelijun@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'liaozongwei','962012d09b8170d912f0669f6d7d9d07','0','headpic/head4.jpg','1666666666','liaozongwei@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'luyongheng','d41d8cd98f00b204e9800998ecf8427e','0','headpic/head5.jpg','1555555556','luyongheng@qq.com',1,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'qqq','111','0','headpic/73b2eeec-bbb6-433b-ae9a-c98506c419a2.jpg','15200000000','1065357291@qq.com',1,'家乡','学历','专业','ccc','ssss','cc'),
(13,'sssss','1111111','0','headpic/head5.jpg','15555555345','aaaa@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'tomi','123456','0','headpic/head5.jpg','15555555567','sssss@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(22,'aaaa','111','0','headpic/head3.jpg','15555555588','s1@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(23,'aaaaaaa','d41d8cd98f00b204e9800998ecf8427e','0','headpic/default_head_pic.jpg','15555555999','aa@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(27,'xzm','xzm','0','headpic/head5.jpg','15217618782','1234@qq.ca',0,NULL,NULL,NULL,NULL,NULL,NULL),
(28,'laohou','123','0','headpic/head5.jpg','18024168888','971245594@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(31,'ccc','123456','0','/default_head_pic.jpg','15555555553','ddd1@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(33,'lzw','1234','0','/default_head_pic.jpg','15555555552','aaa@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(34,'aaa','202cb962ac59075b964b07152d234b70','0','/default_head_pic.jpg','15555555551','aaaaaa@qq.com',0,'家庭','背景','','aa','bb',''),
(35,'wasea','123','0','/default_head_pic.jpg','18899998876','971245594@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(36,'aaaaaaa','111','0','/default_head_pic.jpg','15622288888','www@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `user_info_copy` */

DROP TABLE IF EXISTS `user_info_copy`;

CREATE TABLE `user_info_copy` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `sex` char(1) NOT NULL COMMENT '0-male,1-female',
  `picture` varchar(50) NOT NULL DEFAULT '/default_head_pic.jpg' COMMENT '头像图片的路径,有默认值',
  `telephone` varchar(20) NOT NULL COMMENT '用户的电话',
  `email` varchar(50) NOT NULL COMMENT '用户的email',
  `status` int(11) NOT NULL COMMENT '0-用户正常，1-锁定,2-封禁',
  `question1` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `question2` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `question3` varchar(50) DEFAULT NULL COMMENT '密保问题',
  `answer1` varchar(50) DEFAULT NULL COMMENT '密保答案',
  `answer2` varchar(50) DEFAULT NULL COMMENT '密保答案',
  `answer3` varchar(50) DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `user_info_copy` */

insert  into `user_info_copy`(`user_id`,`user_name`,`user_password`,`sex`,`picture`,`telephone`,`email`,`status`,`question1`,`question2`,`question3`,`answer1`,`answer2`,`answer3`) values 
(1,'houhuashi','123','0','/default_head_pic.jpg','1888888888','971245595@qq.com',1,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'xianziming','d41d8cd98f00b204e9800998ecf8427e','0','/default_head_pic.jpg','1999999999','xianziming@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'xuelijun','123','0','/default_head_pic.jpg','1777777777','xuelijun@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'liaozongwei','962012d09b8170d912f0669f6d7d9d07','0','/default_head_pic.jpg','1666666666','liaozongwei@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'luyongheng','qqq','0','/default_head_pic.jpg','1555555556','luyongheng@qq.com',1,NULL,NULL,NULL,NULL,NULL,NULL),
(11,'qqq','111','0','/qqq_head.jpg','1520000000','5555@qq.com',1,NULL,NULL,NULL,NULL,NULL,NULL),
(13,'sssss','1111111','0','/default_head_pic.jpg','15555555555','aaaa@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(18,'tomi','123456','0','/default_head_pic.jpg','15555555555','sssss@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL),
(19,'aaaaaaa','111111','0','/default_head_pic.jpg','15555555555','sssss@qq.com',0,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `user_store` */

DROP TABLE IF EXISTS `user_store`;

CREATE TABLE `user_store` (
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `store_id` int(11) DEFAULT NULL COMMENT '收藏的店铺的id',
  KEY `user_id` (`user_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `user_store_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `user_store_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_store` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
