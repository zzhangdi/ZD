-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户',6,'add_user'),(22,'Can change 用户',6,'change_user'),(23,'Can delete 用户',6,'delete_user'),(24,'Can view 用户',6,'view_user'),(25,'Can add 收货地址',7,'add_addr'),(26,'Can change 收货地址',7,'change_addr'),(27,'Can delete 收货地址',7,'delete_addr'),(28,'Can view 收货地址',7,'view_addr'),(29,'Can add 轮播图',8,'add_banner'),(30,'Can change 轮播图',8,'change_banner'),(31,'Can delete 轮播图',8,'delete_banner'),(32,'Can view 轮播图',8,'view_banner'),(33,'Can add 商品',9,'add_goods'),(34,'Can change 商品',9,'change_goods'),(35,'Can delete 商品',9,'delete_goods'),(36,'Can view 商品',9,'view_goods'),(37,'Can add 商品分类',10,'add_goods_type'),(38,'Can change 商品分类',10,'change_goods_type'),(39,'Can delete 商品分类',10,'delete_goods_type'),(40,'Can view 商品分类',10,'view_goods_type'),(41,'Can add 订单',11,'add_order'),(42,'Can change 订单',11,'change_order'),(43,'Can delete 订单',11,'delete_order'),(44,'Can view 订单',11,'view_order'),(45,'Can add 支付平台',12,'add_pay_type'),(46,'Can change 支付平台',12,'change_pay_type'),(47,'Can delete 支付平台',12,'delete_pay_type'),(48,'Can view 支付平台',12,'view_pay_type'),(49,'Can add 购物车',13,'add_shop_cart'),(50,'Can change 购物车',13,'change_shop_cart'),(51,'Can delete 购物车',13,'delete_shop_cart'),(52,'Can view 购物车',13,'view_shop_cart'),(53,'Can add 订单详情',14,'add_order_goods'),(54,'Can change 订单详情',14,'change_order_goods'),(55,'Can delete 订单详情',14,'delete_order_goods'),(56,'Can view 订单详情',14,'view_order_goods'),(57,'Can add 商品分类',15,'add_goods_type'),(58,'Can change 商品分类',15,'change_goods_type'),(59,'Can delete 商品分类',15,'delete_goods_type'),(60,'Can view 商品分类',15,'view_goods_type'),(61,'Can add 商品',16,'add_goods'),(62,'Can change 商品',16,'change_goods'),(63,'Can delete 商品',16,'delete_goods'),(64,'Can view 商品',16,'view_goods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_shopping_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_shopping_user_id` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-02-24 16:47:47.704893','1','新鲜水果',1,'[{\"added\": {}}]',10,1),(2,'2019-02-24 16:47:59.103555','1','草莓',1,'[{\"added\": {}}]',9,1),(3,'2019-02-24 16:48:59.591707','2','海鲜水产',1,'[{\"added\": {}}]',10,1),(4,'2019-02-24 16:49:48.492945','3','猪牛羊肉',1,'[{\"added\": {}}]',10,1),(5,'2019-02-24 16:50:24.538978','4','禽类蛋品',1,'[{\"added\": {}}]',10,1),(6,'2019-02-24 16:50:51.133043','5','新鲜蔬菜',1,'[{\"added\": {}}]',10,1),(7,'2019-02-24 16:51:16.804030','6','速冻食品',1,'[{\"added\": {}}]',10,1),(8,'2019-02-24 16:52:36.334154','2','葡萄',1,'[{\"added\": {}}]',9,1),(9,'2019-02-24 16:54:00.930409','3','柠檬',1,'[{\"added\": {}}]',9,1),(10,'2019-02-24 16:55:34.426255','4','奇异果',1,'[{\"added\": {}}]',9,1),(11,'2019-02-24 16:57:12.641848','5','青岛野生海捕大青虾',1,'[{\"added\": {}}]',9,1),(12,'2019-02-24 16:58:18.085843','6','扇贝',1,'[{\"added\": {}}]',9,1),(13,'2019-02-24 17:00:03.393585','7','冷冻秋刀鱼',1,'[{\"added\": {}}]',9,1),(14,'2019-02-24 17:00:48.323278','8','基围虾',1,'[{\"added\": {}}]',9,1),(15,'2019-02-24 17:02:43.707570','9','澳洲进口原切菲力牛排',1,'[{\"added\": {}}]',9,1),(16,'2019-02-24 17:03:51.870560','10','恒都 羔羊排',1,'[{\"added\": {}}]',9,1),(17,'2019-02-24 17:04:44.522722','11','精气神 猪肉馅',1,'[{\"added\": {}}]',9,1),(18,'2019-02-24 17:05:55.300669','12','精品牛排',1,'[{\"added\": {}}]',9,1),(19,'2019-02-24 17:07:04.578694','13','边大哥 散养鲜鹅蛋',1,'[{\"added\": {}}]',9,1),(20,'2019-02-24 17:07:57.783559','14','春朝 新鲜鸽子蛋',1,'[{\"added\": {}}]',9,1),(21,'2019-02-24 17:08:57.484000','15','高邮神邮牌咸鸭蛋（熟65g/只）',1,'[{\"added\": {}}]',9,1),(22,'2019-02-24 17:09:58.335896','16','德青源 爱的鲜鸡蛋',1,'[{\"added\": {}}]',9,1),(23,'2019-02-24 17:11:12.172198','17','蔡家园北京密云茴香菜 饺子馅新鲜蔬菜',1,'[{\"added\": {}}]',9,1),(24,'2019-02-24 17:12:24.529968','18','有机汇 有机蔬菜套餐 宅配',1,'[{\"added\": {}}]',9,1),(25,'2019-02-24 17:13:29.734565','19','富爸爸 韩国风味泡菜 切件瓶装白菜泡菜',1,'[{\"added\": {}}]',9,1),(26,'2019-02-24 17:14:20.597787','20','聚怀斋 焦作温县沙土铁棍山药 3kg礼盒',1,'[{\"added\": {}}]',9,1),(27,'2019-02-24 17:15:07.588216','21','元祖 GANSO 奶油水果鲜奶蛋糕 生日蛋糕同城配送',1,'[{\"added\": {}}]',9,1),(28,'2019-02-24 17:15:55.232441','22','八喜 冰淇淋 甜筒组合装 巧克力口味',1,'[{\"added\": {}}]',9,1),(29,'2019-02-24 17:16:50.642748','23','伊利 畅轻 风味发酵乳 燕麦+黄桃口味酸奶酸牛奶',1,'[{\"added\": {}}]',9,1),(30,'2019-02-24 17:17:40.026909','24','一品奶黄包',1,'[{\"added\": {}}]',9,1),(31,'2019-02-24 17:18:53.497914','25','智利进口车厘子',1,'[{\"added\": {}}]',9,1),(32,'2019-02-24 17:20:02.258680','26','秘鲁蓝莓',1,'[{\"added\": {}}]',9,1),(33,'2019-02-24 17:21:04.137676','27','荷兰青啤梨  梨子水果新鲜',1,'[{\"added\": {}}]',9,1),(34,'2019-02-24 17:22:05.333904','28','进口凤梨',1,'[{\"added\": {}}]',9,1),(35,'2019-02-24 17:22:51.048664','29','泰国黑金刚莲雾',1,'[{\"added\": {}}]',9,1),(36,'2019-02-24 17:23:49.160251','30','澳洲进口脐橙',1,'[{\"added\": {}}]',9,1),(37,'2019-02-24 17:24:38.230677','31','进口香蕉',1,'[{\"added\": {}}]',9,1),(38,'2019-02-24 17:25:18.232347','32','泰国进口红毛丹',1,'[{\"added\": {}}]',9,1),(39,'2019-02-24 17:26:49.839551','1','水果',1,'[{\"added\": {}}]',8,1),(40,'2019-02-24 17:27:11.130848','2','肉类',1,'[{\"added\": {}}]',8,1),(41,'2019-02-24 17:27:24.658682','3','蔬菜',1,'[{\"added\": {}}]',8,1),(42,'2019-02-24 17:27:41.999310','4','海鲜',1,'[{\"added\": {}}]',8,1),(43,'2019-02-24 17:28:07.604557','5','吃货暑假趴',1,'[{\"added\": {}}]',8,1),(44,'2019-02-24 17:28:43.742376','6','盛夏尝鲜季',1,'[{\"added\": {}}]',8,1),(45,'2019-02-24 17:30:13.432237','1','货到付款',1,'[{\"added\": {}}]',12,1),(46,'2019-02-24 17:30:21.572377','2','微信支付',1,'[{\"added\": {}}]',12,1),(47,'2019-02-24 17:30:30.348269','3','支付宝',1,'[{\"added\": {}}]',12,1),(48,'2019-02-24 17:30:39.588534','4','银行卡支付',1,'[{\"added\": {}}]',12,1),(49,'2019-02-25 10:48:41.673948','6','盛夏尝鲜季',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(50,'2019-02-25 10:48:46.726642','5','吃货暑假趴',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(51,'2019-02-25 10:48:50.592688','4','海鲜',2,'[]',8,1),(52,'2019-02-25 10:48:53.856125','3','蔬菜',2,'[]',8,1),(53,'2019-02-25 10:49:00.364874','2','肉类',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(54,'2019-02-25 10:49:05.137689','1','水果',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(55,'2019-02-25 10:49:48.016665','6','盛夏尝鲜季',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(56,'2019-02-25 10:49:52.468018','5','吃货暑假趴',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(57,'2019-02-25 10:50:12.282500','2','肉类',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(58,'2019-02-25 10:50:20.825388','1','水果',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',8,1),(59,'2019-02-26 02:02:29.691968','28','Shop_cart object (28)',2,'[{\"changed\": {\"fields\": [\"count\"]}}]',13,1),(60,'2019-02-26 22:27:12.966320','7','Order object (7)',3,'',11,1),(61,'2019-02-26 22:27:12.983067','6','Order object (6)',3,'',11,1),(62,'2019-02-26 22:27:12.994039','5','Order object (5)',3,'',11,1),(63,'2019-02-26 22:27:13.002016','4','Order object (4)',3,'',11,1),(64,'2019-02-26 22:27:13.009481','3','Order object (3)',3,'',11,1),(65,'2019-02-26 22:27:13.019969','2','Order object (2)',3,'',11,1),(66,'2019-02-26 22:27:13.026949','1','Order object (1)',3,'',11,1),(67,'2019-02-27 15:57:01.297153','9','Order object (9)',2,'[{\"changed\": {\"fields\": [\"order_status\"]}}]',11,1),(68,'2019-02-27 15:57:11.708683','10','Order object (10)',2,'[{\"changed\": {\"fields\": [\"order_status\"]}}]',11,1),(69,'2019-02-27 15:57:34.695259','10','Order object (10)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(70,'2019-02-27 15:57:42.017112','9','Order object (9)',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',11,1),(71,'2019-02-28 11:08:15.759027','1','Order object (1)',2,'[{\"changed\": {\"fields\": [\"order_status\", \"status\"]}}]',11,1),(72,'2019-02-28 13:47:48.739721','33','烟台红富士苹果',1,'[{\"added\": {}}]',9,1),(73,'2019-02-28 13:50:12.668973','34','台湾释迦果',1,'[{\"added\": {}}]',9,1),(74,'2019-02-28 13:53:17.124749','35','砂糖橘',1,'[{\"added\": {}}]',9,1),(75,'2019-02-28 14:09:03.958250','36','红心火龙果',1,'[{\"added\": {}}]',9,1),(76,'2019-02-28 14:19:47.632712','36','红心火龙果',2,'[{\"changed\": {\"fields\": [\"img1\"]}}]',9,1),(77,'2019-02-28 14:19:57.645330','35','砂糖橘',2,'[{\"changed\": {\"fields\": [\"img1\"]}}]',9,1),(78,'2019-02-28 14:20:07.676626','34','台湾释迦果',2,'[{\"changed\": {\"fields\": [\"img1\"]}}]',9,1),(79,'2019-02-28 14:21:12.780506','33','烟台红富士苹果',2,'[{\"changed\": {\"fields\": [\"img1\"]}}]',9,1),(80,'2019-02-28 21:48:09.293513','6','Order_goods object (6)',3,'',14,1),(81,'2019-02-28 21:48:09.350459','5','Order_goods object (5)',3,'',14,1),(82,'2019-02-28 21:48:26.136698','6','Order object (6)',3,'',11,1),(83,'2019-02-28 21:48:26.185567','5','Order object (5)',3,'',11,1),(84,'2019-02-28 21:48:45.335918','4','Order object (4)',3,'',11,1),(85,'2019-02-28 21:48:57.991092','4','Order_goods object (4)',3,'',14,1),(86,'2019-02-28 21:49:49.551060','3','Order_goods object (3)',3,'',14,1),(87,'2019-02-28 21:50:00.846802','3','Order object (3)',3,'',11,1),(88,'2019-03-01 11:49:53.152845','22','八喜 冰淇淋',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(89,'2019-03-01 11:50:14.158741','15','高邮神邮牌咸鸭蛋',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(90,'2019-03-01 11:50:37.272932','23','伊利 畅轻 风味发酵乳牛奶',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(91,'2019-03-01 11:50:51.768543','21','元祖 GANSO 奶油水果鲜奶蛋糕',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(92,'2019-03-01 11:51:02.652391','20','聚怀斋 焦作温县沙土铁棍山药',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(93,'2019-03-01 11:51:08.685399','19','富爸爸 韩国风味泡菜',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(94,'2019-03-01 11:51:29.713610','17','密云茴香菜 饺子馅新鲜蔬菜',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1),(95,'2019-03-01 11:51:50.673369','18','有机汇 有机蔬菜套餐',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(16,'admins','goods'),(15,'admins','goods_type'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(7,'shopping','addr'),(8,'shopping','banner'),(9,'shopping','goods'),(10,'shopping','goods_type'),(11,'shopping','order'),(14,'shopping','order_goods'),(12,'shopping','pay_type'),(13,'shopping','shop_cart'),(6,'shopping','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-24 16:29:38.926986'),(2,'contenttypes','0002_remove_content_type_name','2019-02-24 16:29:39.139417'),(3,'auth','0001_initial','2019-02-24 16:29:39.804639'),(4,'auth','0002_alter_permission_name_max_length','2019-02-24 16:29:39.929307'),(5,'auth','0003_alter_user_email_max_length','2019-02-24 16:29:39.943268'),(6,'auth','0004_alter_user_username_opts','2019-02-24 16:29:39.968202'),(7,'auth','0005_alter_user_last_login_null','2019-02-24 16:29:39.984160'),(8,'auth','0006_require_contenttypes_0002','2019-02-24 16:29:39.994133'),(9,'auth','0007_alter_validators_add_error_messages','2019-02-24 16:29:40.005103'),(10,'auth','0008_alter_user_username_max_length','2019-02-24 16:29:40.018070'),(11,'auth','0009_alter_user_last_name_max_length','2019-02-24 16:29:40.031033'),(12,'shopping','0001_initial','2019-02-24 16:29:42.153359'),(13,'admin','0001_initial','2019-02-24 16:29:42.478490'),(14,'admin','0002_logentry_remove_auto_add','2019-02-24 16:29:42.496442'),(15,'admin','0003_logentry_add_action_flag_choices','2019-02-24 16:29:42.514394'),(16,'admin','0004_auto_20190215_1808','2019-02-24 16:29:42.809606'),(17,'admin','0005_auto_20190215_1819','2019-02-24 16:29:42.985135'),(18,'sessions','0001_initial','2019-02-24 16:29:43.071903'),(19,'shopping','0002_auto_20190225_0044','2019-02-24 16:44:13.200801'),(20,'shopping','0003_auto_20190225_0851','2019-02-25 00:51:29.541904'),(21,'shopping','0004_order_itme','2019-02-26 15:19:30.134798'),(22,'shopping','0005_auto_20190226_1647','2019-02-26 16:47:11.435721'),(23,'shopping','0006_shop_cart_ljgm','2019-02-26 17:43:19.300038'),(24,'shopping','0007_auto_20190226_1852','2019-02-26 18:52:34.964097'),(25,'shopping','0008_auto_20190228_1051','2019-02-28 10:51:56.107769'),(26,'shopping','0009_auto_20190228_1057','2019-02-28 10:57:31.781127'),(27,'shopping','0010_auto_20190228_1101','2019-02-28 11:02:11.456267'),(28,'admins','0001_initial','2019-03-01 09:25:37.197193');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0j8jpw7jrcb76q1u036kuyt7ydvfzwla','ZmEwYzkwNTUyZmVmYjIwZjAyODViODBmMmE5NGNhYjZjYTQ3NjIxMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NGRmOWQwODhhNDgyOTRhYmM0NDA2NGY4NTlmOTIzZjdhNzlkZjQ2In0=','2019-03-16 11:51:53.680573'),('6q7dx6sxyl9qx73805hgcqux0cigew59','ZjcxZjI0N2ZhMzEyMDRkZmFjZjZkMWU2Y2M4YjczOGNiOTM2YTQ5ZTp7Im51bSI6MSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjllNTFiNzBjYmM4ZjMwYTc1NThkMzQ0OTdlZGU3OTg3YTgzOGYxMDgifQ==','2019-03-10 18:01:03.814782'),('7xyhfno2ff8xw27jnd3lqug52l4kvmvp','NWQxZjllY2QwYzUyYTNjYmFkMzcwMzhlYWYyNDNkZDZjOWQ1NzYzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTUxYjcwY2JjOGYzMGE3NTU4ZDM0NDk3ZWRlNzk4N2E4MzhmMTA4In0=','2019-03-14 10:44:21.182760'),('hierthn9vtauhwljq8kfwu4st96g4yqb','NWQxZjllY2QwYzUyYTNjYmFkMzcwMzhlYWYyNDNkZDZjOWQ1NzYzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTUxYjcwY2JjOGYzMGE3NTU4ZDM0NDk3ZWRlNzk4N2E4MzhmMTA4In0=','2019-03-11 15:58:55.938667'),('i702wr71b1yaajmkjsnqptogkq4z07p9','ZmEwYzkwNTUyZmVmYjIwZjAyODViODBmMmE5NGNhYjZjYTQ3NjIxMTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NGRmOWQwODhhNDgyOTRhYmM0NDA2NGY4NTlmOTIzZjdhNzlkZjQ2In0=','2019-03-16 12:02:11.818421'),('iblqrot0el8gb2razhematk6sdg6324l','NWQxZjllY2QwYzUyYTNjYmFkMzcwMzhlYWYyNDNkZDZjOWQ1NzYzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTUxYjcwY2JjOGYzMGE3NTU4ZDM0NDk3ZWRlNzk4N2E4MzhmMTA4In0=','2019-03-13 23:19:33.064319'),('ijeeesfxe4gv8dodpu6rgv3ht94csv6i','NWQxZjllY2QwYzUyYTNjYmFkMzcwMzhlYWYyNDNkZDZjOWQ1NzYzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTUxYjcwY2JjOGYzMGE3NTU4ZDM0NDk3ZWRlNzk4N2E4MzhmMTA4In0=','2019-03-12 17:46:43.496445'),('vajnzlrhktst4e3pzbgi2phxgk2w6841','NWQxZjllY2QwYzUyYTNjYmFkMzcwMzhlYWYyNDNkZDZjOWQ1NzYzMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZTUxYjcwY2JjOGYzMGE3NTU4ZDM0NDk3ZWRlNzk4N2E4MzhmMTA4In0=','2019-03-14 11:32:06.399099'),('z3js0ol8jv0ieqi2d3xu5j828bnkij1z','OGEyYzUwMGEzMTQ4MGE0NDI0YjJkMGRkOTA2YjhlNGJmZDY5NmY3OTp7Im51bSI6NywiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjllNTFiNzBjYmM4ZjMwYTc1NThkMzQ0OTdlZGU3OTg3YTgzOGYxMDgifQ==','2019-03-11 01:59:28.398939');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_addr`
--

DROP TABLE IF EXISTS `shopping_addr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_addr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `site` varchar(150) DEFAULT NULL,
  `Zip_Code` int(11) DEFAULT NULL,
  `tel` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_addr_user_id_5ba9b246_fk_shopping_user_id` (`user_id`),
  CONSTRAINT `shopping_addr_user_id_5ba9b246_fk_shopping_user_id` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_addr`
--

LOCK TABLES `shopping_addr` WRITE;
/*!40000 ALTER TABLE `shopping_addr` DISABLE KEYS */;
INSERT INTO `shopping_addr` VALUES (1,'张迪','陕西宝鸡',721400,'15812341234',1),(2,'张迪','陕西 宝鸡',721400,'15812341234',2);
/*!40000 ALTER TABLE `shopping_addr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_banner`
--

DROP TABLE IF EXISTS `shopping_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `title` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_banner`
--

LOCK TABLES `shopping_banner` WRITE;
/*!40000 ALTER TABLE `shopping_banner` DISABLE KEYS */;
INSERT INTO `shopping_banner` VALUES (1,'水果','img/slide02_sZtp3hR.jpg',1,1),(2,'肉类','img/slide03_aHNEqZM.jpg',1,1),(3,'蔬菜','img/slide_RCAqHVC.jpg',1,1),(4,'海鲜','img/slide04_glh3x94.jpg',1,1),(5,'吃货暑假趴','img/adv01_NPqMSH3.jpg',0,1),(6,'盛夏尝鲜季','img/adv02_uu92WAR.jpg',0,1);
/*!40000 ALTER TABLE `shopping_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_goods`
--

DROP TABLE IF EXISTS `shopping_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `seller` int(11) NOT NULL,
  `goods_info` varchar(255) DEFAULT NULL,
  `is_buy` int(11) NOT NULL,
  `zyxs` int(11) NOT NULL,
  `tj` int(11) NOT NULL,
  `price` double NOT NULL,
  `unit` varchar(50) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_goods_goods_id_60d269f2_fk_shopping_goods_type_id` (`goods_id`),
  CONSTRAINT `shopping_goods_goods_id_60d269f2_fk_shopping_goods_type_id` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_goods`
--

LOCK TABLES `shopping_goods` WRITE;
/*!40000 ALTER TABLE `shopping_goods` DISABLE KEYS */;
INSERT INTO `shopping_goods` VALUES (1,'草莓','img/goods003_gsoRsz6.jpg',1,'草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。',1,1,0,30,'500g',1),(2,'葡萄','img/goods002_j0Il4jF.jpg',1,'商品名称：【顺丰空运】巨峰葡萄 非提子 孕妇新鲜水果 2斤装商品编号：35181253商品毛重：1.5kg商品产地：中国大陆货号：1国产/进口：国产分类：葡萄原产地：中国大陆',1,1,0,10,'500g',1),(3,'柠檬','img/goods001_Waq01Vm.jpg',1,'商品名称：天天生鲜一级大果8颗商品编号：3685961商品毛重：0.8kg商品产地：四川安岳国产/进口：国产分类：黄柠檬重量：1kg-2kg',1,1,0,5,'2个',1),(4,'奇异果','img/goods012_n8su8Fw.jpg',1,'商品名称：佳沛佳沛新西兰绿奇异果 12个商品编号：3976754商品毛重：1.36kg商品产地：新西兰重量：1kg以下国产/进口：进口分类：绿果包装：简装原产地：新西兰',1,1,1,25.8,'1.3kg',1),(5,'青岛野生海捕大青虾','img/goods018_Sr6KiML.jpg',1,'商品名称：青岛野生海捕大青虾 商品编号：2282300商品毛重：2.25kg商品产地：青岛 保存状态：冷冻重量：2kg-5kg烹饪建议：火锅，炒菜，煎炸，蒸菜，烧烤',1,1,0,48,'500g',2),(6,'扇贝','img/goods019_vhoWFPc.jpg',1,'商品名称：商品名称：Ωmega新西兰 全壳 1.15KG商品编号：3532764商品毛重：1.22kg商品产地：新西兰保存状态：冷冻重量：1kg-2kg烹饪建议：火锅，烧烤，加热即食国产/进口：进口包装：简装分类：青口贝原产地：新西兰 全壳 1.15KG商品编号：3532764商品毛重：1.22kg商品产地：新西兰保存状态：冷冻重量：1kg-2kg烹饪建议：火锅，烧烤，加热即食国产/进口：进口包装：简装分类：青口贝原产地：新西兰',1,1,0,46,'1kg',2),(7,'冷冻秋刀鱼','img/goods020_InWrIFL.jpg',1,'商品名称：商品名称：Ocean Gala黄金鲽鱼商品编号：3196564商品毛重：1.17kg商品产地：山东青岛保存状态：冷冻原产地：中国大陆重量：500g-1kg海水/淡水：海水国产/进口：国产包装：简装分类：鲽鱼烹饪建议：炒菜，炖菜，蒸菜 商品编号：3196564商品毛重：1.17kg商品产地：山东青岛保存状态：冷冻原产地：中国大陆重量：500g-1kg海水/淡水：海水国产/进口：国产包装：简装分类 烹饪建议：炒菜，炖菜，蒸菜',1,1,0,19,'500g',2),(8,'基围虾','img/goods021_Anez14Y.jpg',1,'商品名称：大洋世家阿根廷冰冻基围虾商品编号：2282300商品毛重：2.25kg商品产地：阿根廷保存状态：冷冻重量：2kg-5kg烹饪建议：火锅，炒菜，煎炸，蒸菜，烧烤国产/进口：进口包装：简装分类',1,1,0,25,'500g',2),(9,'澳洲进口原切菲力牛排','img/rou01_V6QhidQ.jpg',1,'澳洲进口整切，蔬菜汁微腌制，顺丰空运配送',1,1,1,265,'1.5kg',3),(10,'恒都 羔羊排','img/rou02_MsugdUH.jpg',1,'商品名称：恒都内蒙古乌兰浩特黑头羊 羔羊排 1000g/袋商品编号：3332179商品毛重：1.22kg商品产地：中国大陆保存状态：冷冻品种：其它重量：1kg以上饲养方式：散养国产/进口：国产包装：简装原产地：中国（内蒙古）烹饪建议：炒菜，烧烤',1,1,0,59,'1kg',3),(11,'精气神 猪肉馅','img/rou03_jLLGH9R.jpg',1,'商品名称：精气神山黑猪肉商品编号：1308692商品毛重：420.00g商品产地：天津市静海县保存状态：冷冻品种：黑猪重量：250g-500g国产/进口：国产包装：简装分类：猪肉馅原产地：中国大陆',1,1,0,9.9,'500g',3),(12,'精品牛排','img/niurou_xHD9KXR.jpg',1,'商品名称：恒都菲力西冷牛排套餐10片装(含料包）1.5kg商品编号：3262416商品毛重：2.04kg商品产地：重庆保存状态：冷冻重量：1kg以上国产/进口：国产烹饪建议：炒菜，煎炸品种：其它饲养方式：草饲分类：调理牛排原产地：中国大陆包装：简装',1,1,0,98.8,'1.5kg',3),(13,'边大哥 散养鲜鹅蛋','img/dan01_sz7s9Qz.jpg',1,'河北基地直供 健康营养 新鲜到家 宝宝孕妇食品 滋补佳品 厂家直送 顺丰速运 24小时内发货',1,1,0,109,'12枚',4),(14,'春朝 新鲜鸽子蛋','img/dan02_4jwXqHM.jpg',1,'宿迁基地直供 蛋壳干净 蛋清透亮 蛋黄细腻 营养丰富 特别推荐 早餐 宝宝 孕妇食品 滋补佳品',1,1,0,57,'10枚',4),(15,'高邮神邮牌咸鸭蛋','img/dan03_OpHULxV.jpg',1,'闪电发货 开袋即食 多黄多沙 餐桌必备 鸭蛋黄 烧烤 早餐 下饭菜 端午礼盒 粽子节 送礼',1,1,0,39.9,'20枚',4),(16,'德青源 爱的鲜鸡蛋','img/dan04_Jj7FvYo.jpg',1,'十六年老品牌 北京延庆松山基地直供 安心健康 蛋黄 早餐西餐 烘焙必备 火锅凉拌 烧烤出行必备食材',1,1,0,36.5,'25枚',4),(17,'密云茴香菜 饺子馅新鲜蔬菜','img/cai01_d4U3PU7.jpg',1,'新鲜时令蔬菜，八折优惠',1,1,0,11.2,'500g',5),(18,'有机汇 有机蔬菜套餐','img/cai02_nL4ZuXz.jpg',1,'欧盟有机认证 美国有机认证 中国有机认证 供港澳蔬菜基地',1,1,0,67,'3kg',5),(19,'富爸爸 韩国风味泡菜','img/cai03_CQskOlz.jpg',1,'商品名称：富爸爸切件瓶装白菜泡菜商品编号：3041089商品毛重：0.81kg商品产地：山东潍坊分类：泡菜重量：500-1kg烹饪建议：卤菜，火锅，炒菜，炖',1,1,0,19.9,'1瓶',5),(20,'聚怀斋 焦作温县沙土铁棍山药','img/cai04_YtKd3Ls.jpg',1,'商品名称：聚怀斋六斤装礼盒商品编号：3461641商品毛重：3.35kg商品产地：河南焦作温县包装：礼盒装重量：2.5kg以上烹饪建议：卤菜，火锅，炒菜，炖菜',1,1,0,59,'3kg',5),(21,'元祖 GANSO 奶油水果鲜奶蛋糕','img/dong01_tJ1VS6G.jpg',1,'奶油水果鲜奶蛋糕 生日蛋糕同城配送',1,1,0,158,'16寸',6),(22,'八喜 冰淇淋','img/dong02_CPJQCzk.jpg',1,'清凉延续，冰爽加时，冰淇淋部分满199减100，酷爽一夏',1,1,0,29,'5支',6),(23,'伊利 畅轻 风味发酵乳牛奶','img/dong03_5FZDpfn.jpg',1,'【伊利低温好酸奶】领券满199减50。酷暑一夏，嗨购不停，速速加入购物车！三种丹麦益生菌，王凯&高圆圆伴你体验轻生活，一身轻！',1,1,0,8.5,'1瓶',6),(24,'一品奶黄包','img/dong04_LuwaxQA.jpg',1,'商品名称：湾仔码头一品奶黄包 350g商品编号：1425805商品毛重：400.00g商品产地：中国上海净含量：300-500g分类：包子国产/进口：国产风味：中式',1,1,0,11.9,'350g',6),(25,'智利进口车厘子','img/guo01_m6XVayH.jpg',1,'产地: 智利是否为有机食品: 否同城服务: 同城24小时物流送货上门直径: 26mm(含)-28mm(不含)包装方式: 包装售卖方式: 单品套餐份量: 3人份套餐周期: 1周配送频次: 1周2次热卖时间: 1月 2月 3月 11月 12月食品品种: 宾莹/冰/Bing净含量: 1000g生鲜储存温度: 0-8℃',1,0,0,298,'1kg',1),(26,'秘鲁蓝莓','img/guo02_TcrGIfZ.jpg',1,'厂址：黑龙江省伊春市汤旺河区河北社区893沿河路32号厂家联系方式：4000567842配料表：野生蓝莓 白砂糖 植物油储藏方法：置于阴凉避光处，密封保存保质期：365 天食品添加剂：无净含量: 500g包装方式: 包装品牌: 萃林系列: 野生蓝莓果干商品条形码: 6941525209568是否为有机食品: 否食品工艺: 果干类',1,0,0,79.8,'4盒(约125g/盒)',1),(27,'荷兰青啤梨  梨子水果新鲜','img/guo03_RM7OWT5.jpg',1,'梨',1,0,0,29,'6个',1),(28,'进口凤梨','img/guo04_3UBXFo1.jpg',1,'水果新鲜菲律宾进口凤梨',1,0,0,59.9,'500g',1),(29,'泰国黑金刚莲雾','img/guo05_bh3BIXD.jpg',1,'厂名：升森水果厂址：榴岛大道255厂家联系方式：18805767699配料表：黑金刚莲雾储藏方法：冷藏保质期：9 天',1,0,0,90.4,'1.5kg',1),(30,'澳洲进口脐橙','img/guo06_VdS9ZsC.jpg',1,'厂名：炫果多厂址：上海市奉贤区厂家联系方式：021-20249391保质期：7 天品牌: 炫果多产地: 澳大利亚包装方式: 散装净含量: 2000g',1,0,0,29.9,'10个',1),(31,'进口香蕉','img/guo07_yssd0Ct.jpg',1,'厂名：Dole都乐厂址：上海市浦东新区海徐路1105号厂家联系方式：4009208177储藏方法：13℃-14℃常温保质期：3 天品牌: Dole/都乐系列: 高地蕉规格: 2把产地: 菲律宾',1,0,0,59.9,'5kg',1),(32,'泰国进口红毛丹','img/guo09_nrVp2Pr.jpg',1,'厂名：升森水果厂址：榴岛大道厂家联系方式：18805767699配料表：红毛丹储藏方法：冷藏保质期：9 天',1,0,0,79,'5kg',1),(33,'烟台红富士苹果','img/pingguo_fiNuTL9.jpg',1,'商品名称：天天生鲜12个烟台红富士商品编号：3756271商品毛重：3.11kg商品产地：山东烟台国产/进口：国产分类：红富士包装：简装原产地：中国（山东）',1,0,0,36.7,'2.6kg',1),(34,'台湾释迦果','img/释迦_z9tWkT0.png',1,'商品名称：【进口水果】台湾释迦果2kg 精品大果3-5个 番荔枝佛头果4斤商品编号：36984356941店铺： 鲜台旗舰店商品毛重：2.0kg商品产地：中国台湾国产/进口：进口单箱规格：1-10售卖方式：单品热卖时间：1月，2月，3月，4月，12月分类：释迦包装：盒装',1,0,0,88,'2kg',1),(35,'砂糖橘','img/砂糖橘_m0EXEqz.jpg',1,'商品名称：天天生鲜砂糖桔5斤商品编号：4213326商品毛重：2.72kg商品产地：广西国产/进口：国产分类：砂糖桔重量：2kg-4kg',1,0,0,49.9,'2.5kg',1),(36,'红心火龙果','img/火龙果_S45WTsQ.jpg',1,'商品名称：天天生鲜越南火龙果商品编号：5383292商品毛重：1.79kg商品产地：越南重量：1kg-2kg国产/进口：进口分类：红心火龙果包装：简装原产地：越南',1,0,0,49.9,'4个',1);
/*!40000 ALTER TABLE `shopping_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_goods_type`
--

DROP TABLE IF EXISTS `shopping_goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `ctime` datetime(6) NOT NULL,
  `icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_goods_type`
--

LOCK TABLES `shopping_goods_type` WRITE;
/*!40000 ALTER TABLE `shopping_goods_type` DISABLE KEYS */;
INSERT INTO `shopping_goods_type` VALUES (1,'新鲜水果','img/banner01_Vy1q47n.jpg','时令水果','2019-02-24 16:47:47.703915','fruit'),(2,'海鲜水产','img/banner02_f8ry0Vi.jpg','海鲜盛宴','2019-02-24 16:48:59.590684','seafood'),(3,'猪牛羊肉','img/banner03_rnkFYuy.jpg','新鲜','2019-02-24 16:49:48.490954','meet'),(4,'禽类蛋品','img/banner04_PbTRx26.jpg','原地出产','2019-02-24 16:50:24.537982','egg'),(5,'新鲜蔬菜','img/banner05_9yMekew.jpg','绿色有机','2019-02-24 16:50:51.132073','vegetables'),(6,'速冻食品','img/banner06_MCdXm3R.jpg','酷爽冰品','2019-02-24 16:51:16.803058','ice');
/*!40000 ALTER TABLE `shopping_goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_order`
--

DROP TABLE IF EXISTS `shopping_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ctime` datetime(6) NOT NULL,
  `order_status` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `itmes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_order_user_id_f1e8258a_fk_shopping_user_id` (`user_id`),
  CONSTRAINT `shopping_order_user_id_f1e8258a_fk_shopping_user_id` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_order`
--

LOCK TABLES `shopping_order` WRITE;
/*!40000 ALTER TABLE `shopping_order` DISABLE KEYS */;
INSERT INTO `shopping_order` VALUES (1,'2019-02-28 11:03:20.359712',0,0,1,'1551323000355333'),(2,'2019-02-28 11:04:29.710311',1,1,1,'15513230697012268'),(7,'2019-02-28 21:51:08.680179',1,1,1,'15513618686831780'),(8,'2019-02-28 21:51:59.683657',1,1,1,'15513619196836880'),(9,'2019-03-02 12:14:17.311106',1,1,2,'15515000573155228'),(10,'2019-03-02 12:14:38.603336',1,1,2,'15515000786057357');
/*!40000 ALTER TABLE `shopping_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_order_goods`
--

DROP TABLE IF EXISTS `shopping_order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total1` double DEFAULT NULL,
  `num1` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `itme_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_order_goods_goods_id_83b0c5d8` (`goods_id`),
  KEY `shopping_order_goods_itme_id_id_40e484ad` (`itme_id_id`),
  CONSTRAINT `shopping_order_goods_goods_id_83b0c5d8_fk_shopping_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods` (`id`),
  CONSTRAINT `shopping_order_goods_itme_id_id_40e484ad_fk_shopping_order_id` FOREIGN KEY (`itme_id_id`) REFERENCES `shopping_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_order_goods`
--

LOCK TABLES `shopping_order_goods` WRITE;
/*!40000 ALTER TABLE `shopping_order_goods` DISABLE KEYS */;
INSERT INTO `shopping_order_goods` VALUES (1,30,3,1,1),(2,29.9,18,30,2),(7,79.8,3,26,7),(8,59.9,1,28,8),(9,298,1,25,8),(10,90.4,3,29,9),(11,49.9,1,36,9),(12,79.8,1,26,10);
/*!40000 ALTER TABLE `shopping_order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_pay_type`
--

DROP TABLE IF EXISTS `shopping_pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_pay_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `img` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_pay_type`
--

LOCK TABLES `shopping_pay_type` WRITE;
/*!40000 ALTER TABLE `shopping_pay_type` DISABLE KEYS */;
INSERT INTO `shopping_pay_type` VALUES (1,'货到付款',1,'cash'),(2,'微信支付',1,'weixin'),(3,'支付宝',1,'zhifubao'),(4,'银行卡支付',1,'bank');
/*!40000 ALTER TABLE `shopping_pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_shop_cart`
--

DROP TABLE IF EXISTS `shopping_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_shop_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `is_del` int(11) NOT NULL,
  `goods1_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ljgm` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopping_shop_cart_goods1_id_5f270330_fk_shopping_goods_id` (`goods1_id`),
  KEY `shopping_shop_cart_user_id_010760dd_fk_shopping_user_id` (`user_id`),
  CONSTRAINT `shopping_shop_cart_goods1_id_5f270330_fk_shopping_goods_id` FOREIGN KEY (`goods1_id`) REFERENCES `shopping_goods` (`id`),
  CONSTRAINT `shopping_shop_cart_user_id_010760dd_fk_shopping_user_id` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_shop_cart`
--

LOCK TABLES `shopping_shop_cart` WRITE;
/*!40000 ALTER TABLE `shopping_shop_cart` DISABLE KEYS */;
INSERT INTO `shopping_shop_cart` VALUES (53,3,1,0,25,1,0),(54,1,1,0,18,1,0),(55,1,1,0,9,1,0);
/*!40000 ALTER TABLE `shopping_shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_user`
--

DROP TABLE IF EXISTS `shopping_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick` varchar(30) DEFAULT NULL,
  `ctime` datetime(6) DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `tel` varchar(11) NOT NULL,
  `age` smallint(6) DEFAULT NULL,
  `sex` smallint(6) NOT NULL,
  `home_addr` varchar(255) NOT NULL,
  `account` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_user`
--

LOCK TABLES `shopping_user` WRITE;
/*!40000 ALTER TABLE `shopping_user` DISABLE KEYS */;
INSERT INTO `shopping_user` VALUES (1,'pbkdf2_sha256$120000$uwUBRQ3PmTlf$fMu8LTwSYuIgSgXk4FeqZHe8QogKSTmiO2lBs3rwedw=','2019-03-01 18:01:12.864575',1,'zd','','','1078443803@qq.com',1,1,'2019-02-24 16:40:07.450028',NULL,'2019-02-24 16:40:07.611632',NULL,'',NULL,0,'',''),(2,'pbkdf2_sha256$120000$wmoI7OsHtJqI$3eGiO96gLz/VBf6mt+651fV6DLUWAuoDP5Gu4CekmkI=','2019-03-02 12:02:11.811439',0,'zhangdi','','','1078443803@qq.com',0,1,'2019-03-02 11:51:43.073657',NULL,'2019-03-02 11:51:43.242263',NULL,'',NULL,0,'','');
/*!40000 ALTER TABLE `shopping_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_user_groups`
--

DROP TABLE IF EXISTS `shopping_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopping_user_groups_user_id_group_id_70678d97_uniq` (`user_id`,`group_id`),
  KEY `shopping_user_groups_group_id_b2db589f_fk_auth_group_id` (`group_id`),
  CONSTRAINT `shopping_user_groups_group_id_b2db589f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `shopping_user_groups_user_id_5e3984ec_fk_shopping_user_id` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_user_groups`
--

LOCK TABLES `shopping_user_groups` WRITE;
/*!40000 ALTER TABLE `shopping_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_user_user_permissions`
--

DROP TABLE IF EXISTS `shopping_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shopping_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopping_user_user_permi_user_id_permission_id_667ad0c0_uniq` (`user_id`,`permission_id`),
  KEY `shopping_user_user_p_permission_id_dc32aa17_fk_auth_perm` (`permission_id`),
  CONSTRAINT `shopping_user_user_p_permission_id_dc32aa17_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `shopping_user_user_p_user_id_10463480_fk_shopping_` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_user_user_permissions`
--

LOCK TABLES `shopping_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `shopping_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-02 14:05:10
