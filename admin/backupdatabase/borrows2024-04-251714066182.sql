-- mysqldump-php https://github.com/ifsnop/mysqldump-php
--
-- Host: localhost	Database: borrows
-- ------------------------------------------------------
-- Server version 	8.2.0
-- Date: Thu, 25 Apr 2024 17:29:42 +0000

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_admin`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `login_session` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_admin`
--

LOCK TABLES `tbl_admin` WRITE;
/*!40000 ALTER TABLE `tbl_admin` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_admin` VALUES (1,'admin','admin',1);
/*!40000 ALTER TABLE `tbl_admin` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_admin` with 1 row(s)
--

--
-- Table structure for table `tbl_borrower`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_borrower` (
  `borrower_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `middle_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department_id` int NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int NOT NULL,
  `status_approval` int NOT NULL,
  `front_id_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `back_id_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `login_session` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`borrower_id`),
  KEY `fk_tbl_department` (`department_id`),
  CONSTRAINT `fk_tbl_department` FOREIGN KEY (`department_id`) REFERENCES `tbl_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_borrower`
--

LOCK TABLES `tbl_borrower` WRITE;
/*!40000 ALTER TABLE `tbl_borrower` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_borrower` VALUES ('202312018','johny','nalla','decosta','639552532653',6,'Student',1,1,'../static/front/202312018.png','../static/back/202312018.png','john123','12345','0000-00-00 00:00:00',0),('20231208','Hernan','Minda','Triollano','639556338225',2,'Student',1,1,'../static/front/20231208.png','../static/back/20231208.png','hernan123','12345','0000-00-00 00:00:00',0),('20231209','Ile Nathaniel','Nimo','Flores','6398876534345',6,'Student',1,1,'../static/front/20231209.png','../static/back/20231209.png','ile123','12345','0000-00-00 00:00:00',0),('20231210','Ma. Anjelly','Espino','Fusingan','639552532653',2,'Student',1,1,'../static/front/20231210.png','../static/back/20231210.png','anj123','12345','0000-00-00 00:00:00',0),('20231277','Maria','Espino','Fusingan','639552532653',10,'Faculty',1,1,'../static/front/20231277.png','../static/back/20231277.png','mar123','12345','0000-00-00 00:00:00',0),('20231390','Towie','Lala','Lawa','63988564323',2,'Student',0,0,'../static/front/20231390.png','../static/back/20231390.png','tow','12345','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `tbl_borrower` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_borrower` with 6 row(s)
--

--
-- Table structure for table `tbl_cart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `borrower_id` varchar(100) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_item_code` (`item_code`),
  KEY `fk_cart_borrower_id` (`borrower_id`),
  CONSTRAINT `fk_cart_borrower_id` FOREIGN KEY (`borrower_id`) REFERENCES `tbl_borrower` (`borrower_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_item_code` FOREIGN KEY (`item_code`) REFERENCES `tbl_item` (`item_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cart`
--

LOCK TABLES `tbl_cart` WRITE;
/*!40000 ALTER TABLE `tbl_cart` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `tbl_cart` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_cart` with 0 row(s)
--

--
-- Table structure for table `tbl_category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_category` VALUES (3,'SAFETY APPARATUS',1),(4,'GENERAL LABORATORY APPARATUS',1),(9,'BASIC GLASSWARE',1);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_category` with 3 row(s)
--

--
-- Table structure for table `tbl_department`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department`
--

LOCK TABLES `tbl_department` WRITE;
/*!40000 ALTER TABLE `tbl_department` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_department` VALUES (2,'CICT',0),(6,'CAF',1),(8,'CBGG',1),(9,'CCJE',1),(10,'CE',1);
/*!40000 ALTER TABLE `tbl_department` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_department` with 5 row(s)
--

--
-- Table structure for table `tbl_item`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_item` (
  `item_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `item_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category_id` int NOT NULL,
  `size_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `status` int NOT NULL,
  `description` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_code`),
  KEY `fk_category_id` (`category_id`),
  KEY `fk_size_id` (`size_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_size_id` FOREIGN KEY (`size_id`) REFERENCES `tbl_size` (`size_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_item`
--

LOCK TABLES `tbl_item` WRITE;
/*!40000 ALTER TABLE `tbl_item` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_item` VALUES ('5hmj2o','GRADUATED CYLINDER',9,8,28,1,'Economical, high-quality borosilicate cylinders that meet ASTM standards. Single metric scale. 50 mL','GRADUATED CYLINDER1710663605.png','2024-03-17 16:20:05'),('7p920q','BEAKER',9,2,0,0,'Designed with uniformity of heavy walls and bottom plus rugged construction of the rim to withstand ','BEAKER1710662989.png','2024-03-17 16:09:49'),('9ztfly','LAB GOWN',3,10,29,1,'Notched lapel collar and four-button closure .Two roomy lower patch pockets and one chest pocket wit','LAB GOWN1710664103.png','2024-03-17 16:28:23'),('b43xpr','THERMOMETER',4,7,0,0,'dasdasdas','no-image.png','2024-04-25 21:42:01'),('fvband','TEST TUBE',9,9,17,1,'Elkay sterile culture tubes come with pre-assembled press snap caps. Irradiated in accordance with A','TEST TUBE1710663293.png','2024-03-17 16:14:53'),('k5gsdh','SAFETY GOOGLES',3,7,17,1,'Indirect ventilation goggles with acetate lens material, suitable for chemical use.','SAFETY GOOGLES1710663863.png','2024-03-17 16:24:23'),('ma14u8','MICROSCOPE',4,7,10,1,'The Barska AY11240 Monocular Compound Microscope is a budget-friendly option for beginners. Featurin','MICROSCOPE1710664518.png','2024-03-17 16:35:18'),('z5y1tx','ERLENMEYER FLASK',9,2,0,0,'These 250mL PYREX Erlenmeyer flasks are designed with heavy duty rims to reduce chipping. Their unif','ERLENMEYER FLASK1710663171.png','2024-03-17 16:12:26');
/*!40000 ALTER TABLE `tbl_item` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_item` with 8 row(s)
--

--
-- Table structure for table `tbl_penalty`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_penalty` (
  `penalty_id` int NOT NULL AUTO_INCREMENT,
  `transaction_no` int NOT NULL,
  `amount` double(50,2) DEFAULT '100.00',
  `status` int NOT NULL DEFAULT '0',
  `date_paid` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`penalty_id`),
  KEY `fk_pen_trans_no` (`transaction_no`),
  CONSTRAINT `fk_pen_trans_no` FOREIGN KEY (`transaction_no`) REFERENCES `tbl_transaction_header` (`transaction_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_penalty`
--

LOCK TABLES `tbl_penalty` WRITE;
/*!40000 ALTER TABLE `tbl_penalty` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_penalty` VALUES (7,93456178,100,1,'2024-04-26');
/*!40000 ALTER TABLE `tbl_penalty` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_penalty` with 1 row(s)
--

--
-- Table structure for table `tbl_retirement`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_retirement` (
  `retirement_id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `quantity` int NOT NULL,
  `remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_retirement` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`retirement_id`),
  KEY `fk_item_code2` (`item_code`),
  CONSTRAINT `fk_item_code2` FOREIGN KEY (`item_code`) REFERENCES `tbl_item` (`item_code`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_retirement`
--

LOCK TABLES `tbl_retirement` WRITE;
/*!40000 ALTER TABLE `tbl_retirement` DISABLE KEYS */;
SET autocommit=0;
/*!40000 ALTER TABLE `tbl_retirement` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_retirement` with 0 row(s)
--

--
-- Table structure for table `tbl_size`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_size` (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `size_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_size`
--

LOCK TABLES `tbl_size` WRITE;
/*!40000 ALTER TABLE `tbl_size` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_size` VALUES (2,'250 ml'),(5,'100 ml'),(6,'60 mm'),(7,'NO SIZE'),(8,'50 ml'),(9,'12 mm x 75 mm'),(10,'MEDIUM');
/*!40000 ALTER TABLE `tbl_size` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_size` with 7 row(s)
--

--
-- Table structure for table `tbl_stock_in`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_stock_in` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(100) NOT NULL,
  `old_quantity` int NOT NULL,
  `added_quantity` int NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_id`),
  KEY `fk_stock_item_code` (`item_code`),
  CONSTRAINT `fk_stock_item_code` FOREIGN KEY (`item_code`) REFERENCES `tbl_item` (`item_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_stock_in`
--

LOCK TABLES `tbl_stock_in` WRITE;
/*!40000 ALTER TABLE `tbl_stock_in` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_stock_in` VALUES (10,'7p920q',0,20,'2024-03-17 16:37:49'),(11,'z5y1tx',0,15,'2024-03-17 16:38:02'),(12,'5hmj2o',0,25,'2024-03-17 16:38:15'),(13,'9ztfly',0,30,'2024-03-17 16:38:32'),(14,'ma14u8',0,10,'2024-03-17 16:38:43'),(15,'k5gsdh',0,20,'2024-03-17 16:38:56'),(16,'fvband',0,20,'2024-03-17 16:39:09'),(17,'b43xpr',0,1,'2024-04-25 21:42:18'),(18,'b43xpr',0,1,'2024-04-25 23:02:41'),(19,'z5y1tx',-5,10,'2024-04-25 23:42:28'),(20,'z5y1tx',-5,6,'2024-04-25 23:48:28');
/*!40000 ALTER TABLE `tbl_stock_in` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_stock_in` with 11 row(s)
--

--
-- Table structure for table `tbl_transaction_detail`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_transaction_detail` (
  `trans_item_id` int NOT NULL AUTO_INCREMENT,
  `transaction_no` int NOT NULL,
  `item_code` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `return_quantity` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '4',
  PRIMARY KEY (`trans_item_id`),
  KEY `fk_dtl_item_code` (`item_code`),
  KEY `fk_dtl_transaction_no` (`transaction_no`),
  CONSTRAINT `fk_dtl_item_code` FOREIGN KEY (`item_code`) REFERENCES `tbl_item` (`item_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dtl_transaction_no` FOREIGN KEY (`transaction_no`) REFERENCES `tbl_transaction_header` (`transaction_no`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction_detail`
--

LOCK TABLES `tbl_transaction_detail` WRITE;
/*!40000 ALTER TABLE `tbl_transaction_detail` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_transaction_detail` VALUES (88,93456178,'fvband',4,4,0),(89,93456178,'5hmj2o',3,3,0);
/*!40000 ALTER TABLE `tbl_transaction_detail` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_transaction_detail` with 2 row(s)
--

--
-- Table structure for table `tbl_transaction_header`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_transaction_header` (
  `transaction_no` int NOT NULL,
  `borrower_id` varchar(100) NOT NULL,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `expected_return_date` date NOT NULL DEFAULT '0000-00-00',
  `return_date` date NOT NULL DEFAULT '0000-00-00',
  `status` int DEFAULT '6',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_no`),
  KEY `fk_head_borrower_id` (`borrower_id`),
  CONSTRAINT `fk_head_borrower_id` FOREIGN KEY (`borrower_id`) REFERENCES `tbl_borrower` (`borrower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_transaction_header`
--

LOCK TABLES `tbl_transaction_header` WRITE;
/*!40000 ALTER TABLE `tbl_transaction_header` DISABLE KEYS */;
SET autocommit=0;
INSERT INTO `tbl_transaction_header` VALUES (34146942,'20231277','2024-04-26','2024-05-01','2024-04-26',0,'2024-04-26 01:11:19'),(93456178,'20231277','2024-04-20','2024-04-25','2024-04-26',0,'2024-04-26 01:16:51');
/*!40000 ALTER TABLE `tbl_transaction_header` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;

-- Dumped table `tbl_transaction_header` with 2 row(s)
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET AUTOCOMMIT=@OLD_AUTOCOMMIT */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on: Thu, 25 Apr 2024 17:29:42 +0000
