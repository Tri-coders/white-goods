-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: whitegood
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `billing_id` int(10) NOT NULL AUTO_INCREMENT,
  `request_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL,
  PRIMARY KEY (`billing_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(20) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Samsung'),(2,'LG'),(3,'Godrej'),(4,'Whirlpool');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_role`
--

DROP TABLE IF EXISTS `employee_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_role` (
  `user_id` int(4) NOT NULL,
  `install` varchar(1) NOT NULL,
  `inventory` varchar(1) NOT NULL,
  `demo` varchar(1) NOT NULL,
  `upgrade` varchar(1) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `employee_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role`
--

LOCK TABLES `employee_role` WRITE;
/*!40000 ALTER TABLE `employee_role` DISABLE KEYS */;
INSERT INTO `employee_role` VALUES (9,'0','0','0','0'),(10,'1','0','1','1'),(11,'0','0','0','1'),(12,'0','0','1','0');
/*!40000 ALTER TABLE `employee_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `product_id` varchar(15) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text,
  `price` int(10) NOT NULL,
  `quantity` varchar(10) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_details` (
  `user_id` int(4) NOT NULL,
  `password` varchar(200) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` VALUES (8,'$2b$10$jwj/rz0sj7kw6LgFG7d6WeyWJiixq6qKcgQreznr1ShrlgtjcnQf.'),(9,'$2b$10$HYZ6BlJ8v63gDQUthubUx.MAj.3gkDNSUHg.7Rcr5pSFMjq./EgaO'),(10,'$2b$10$4v7up9pw.OAkoqfiSfZ6aOPbyIHhn3rIbf6tiviwT3E4CBSYgWJsW'),(9,'$2b$10$0fkbXizzv7UTE4gSlkJpUOetJOED.e4ljPy3tFztzf5T0YF.ytY7a'),(9,'$2b$10$Ab4OdmUcon5Lk6WQU6JxNuTNcwygBlqXTsditNqi7tmXTTemogX9O'),(11,'$2b$10$zet8wo1hfBA863cIvuLXjud.q61l9tbfomkYBsPxtJ6pS7yRGHFgO'),(9,'$2b$10$QlqzKYk2MoNuVEWWxktOWeNJyRJ9PR5fke92MLvDIPJastiyFgmU6'),(9,'$2b$10$cN4wa9pNYGhZaRJ3Z2ClJeUW0XHtUpapiOpmPSY6WkMnw0yU3.rcO'),(12,'$2b$10$A788pSDkTboNgKUW6whT0u8XRhUDxllIxvusbUvu5DiNffoUkhW8u');
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_no` varchar(100) NOT NULL,
  `model_price` int(11) NOT NULL,
  `model_img` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `whitegoodcategory_id` int(11) NOT NULL,
  `quantity` varchar(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`model_id`),
  KEY `brand_id` (`brand_id`),
  KEY `whitegoodcategory_id` (`whitegoodcategory_id`),
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `model_ibfk_2` FOREIGN KEY (`whitegoodcategory_id`) REFERENCES `whitegoodcategory` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
INSERT INTO `model` VALUES (1,'Samsung 253 LRT28T3032SE/HL ',20490,'http://128.199.30.114:9000/model/1.jpg',1,2,'1'),(2,'Samsung 324 L RT34T4513S8/HL',32290,'http://128.199.30.114:9000/model/2.jpg',1,2,'1'),(3,'Samsung 700 L RS72R5001M9/TL',74990,'http://128.199.30.114:9000/model/3.jpg',1,2,'1'),(4,'Samsung 192 L RR19T271BR2/NL',12990,'http://128.199.30.114:9000/model/4.jpg',1,2,'1'),(5,'LG 284 Litres GL-T302RPZY',36190,'https://drive.google.com/file/d/1hJG0Cp_EwV1BiSUzKBRquwYoW2GqqDbz/view?usp=sharing',2,2,'1'),(6,'LG 188 Litres GL-B191KPDD',16990,'https://drive.google.com/file/d/1LJvdhwVbswkNtV-cFn1DrkIhdTd7w_Wn/view?usp=sharing',2,2,'1'),(7,'LG 188 Litres GL-B191KSDD     ',15990,'https://drive.google.com/file/d/1FTsWg_PZ-4kaIAHDZu1SBxGBW4HBgk0H/view?usp=sharing',2,2,'1'),(8,'LG 374 Litres GC-B459NLFF ',46990,'https://drive.google.com/file/d/1PEZJ2JRBfLgiCrVumGALL1ANUSxY3-qi/view?usp=sharing',2,2,'1'),(9,'Godrej 236 L RF EON 236B 25 HI RY DR',18290,'https://drive.google.com/file/d/1O3ZZ8LVDL3BCQmJf-H7HjYgzLWh9GPXT/view?usp=sharing',3,2,'1'),(10,'Godrej 190 L RD 1905 PTDI 53 GL BL',16190,'https://drive.google.com/file/d/1RoayNoAc8qY7o6BRnpHOWcHLG4HNawFY/view?usp=sharing',3,2,'1'),(11,'Godrej 231 L RF EON 245A 15 HF SI ST',16790,'https://drive.google.com/file/d/1guKQYNNSnYOdsD5aqkp80MF8Nij7ugqQ/view?usp=sharing',3,2,'1'),(12,'Godrej 260 L RF EON 260C 35 RCIF ST RH',22990,'https://drive.google.com/file/d/19Qk1J9jTIIKjKUjQ6-JN9F3eW3IYu5b2/view?usp=sharing',3,2,'1'),(13,'Whirlpool 190 L WDE 205 CLS 2S',11290,'https://drive.google.com/file/d/1fJf61hB-kj6luHNkPBL3qKt0hm3VFQ_e/view?usp=sharing',4,2,'1'),(14,'Whirlpool 265 L IF INV CNV 278',24240,'https://drive.google.com/file/d/1Fd6_pJ_iq2Md03UjjgYs_lMCq5GviCWa/view?usp=sharing',4,2,'1'),(15,'Whirlpool 340 L IF INV CNV 355',30990,'https://drive.google.com/file/d/11fNenz1gGr1kc7g3ztt7YThCY_RpUZo4/view?usp=sharing',4,2,'1'),(16,'Whirlpool 245 L NEO 258H ROY WINE ABYSS (2S)-N',19490,'https://drive.google.com/file/d/1biP2GfvzNLsT31ox84-wmzyDg4BHrq1b/view?usp=sharing',4,2,'1'),(17,'AR18TV5HLTU Split AC powered by Triple Inverter with Convertible Mode 5.00kW (1.5T)',34990,'https://drive.google.com/file/d/1H6cFW9JE51vEYV3foqKQuiyfjRHkyJhW/view?usp=sharing',1,1,'1'),(18,'AR18TY3CAWK Inverter Split AC powered by AI Auto Cooling 5.00kW (1.5T)',52000,'https://drive.google.com/file/d/10kVpHKzts-W35_odKAbwpJP9wwpNti5I/view?usp=sharing',1,1,'1'),(19,'AR18TY3QBBU Inverter Split AC powered by Digital Inverter with Faster Cooling 4.98kW (1.5T)',39000,'https://drive.google.com/file/d/1hmT-TdpzKFSEVs8pgJovuuvtooljTaPR/view?usp=sharing',1,1,'1'),(20,'AR12RG3BAWK On-Off Split AC powered by long lasting cooling 3.30kW (1.0T)',45000,'https://drive.google.com/file/d/1HhWqdaheA00aI0LU7U8WlWf8jM175h7J/view?usp=sharing',1,1,'1'),(21,'Whirlpool 0.8 Ton 3 Star Split Inverter AC - White (0.8T MAGICOOL INVERTER 3S COPR-W-I/ODU, Copper C',34990,'https://drive.google.com/file/d/1oJBOTKnV40Vo1qpF_DTO3iDWiK0mIlzD/view?usp=sharing',4,1,'1'),(22,'Whirlpool 1 Ton 3 Star Split AC - White, Grey',52000,'https://drive.google.com/file/d/1QWYKW8T1-1iGw1TByM6PJEqIdtPYfwSr/view?usp=sharing',4,1,'1'),(23,'Whirlpool 1.5 Ton 3 Star Window AC ',39000,'https://drive.google.com/file/d/1fcFEczijWgZ5lSk_YBIJJC4l2OwDC8Ga/view?usp=sharing',4,1,'1'),(24,'Whirlpool 1 Ton 3 Star Split Inverter AC - White',45000,'https://drive.google.com/file/d/1mPQOS65NszCBkhx2YLeXdVGqPj_nZSiJ/view?usp=sharing',4,1,'1'),(25,'GIC 24 MGP5 WRA',34990,'https://drive.google.com/file/d/19PObl_TDc02R8M5P3yHXDduuTiiQD3_4/view?usp=sharing',3,1,'1'),(26,'GSC 12NTC3 WTA',52000,'https://drive.google.com/file/d/12XEXDd0MKgiBfA6hjjqo_n7BXVdTAbCO/view?usp=sharing',3,1,'1'),(27,'GIC 12FTC3-WSA',39000,'https://drive.google.com/file/d/1BcYfLZPmN-pW1iCN3u4Cb1-_Pc_JreD-/view?usp=sharing',3,1,'1'),(28,'GIC 18JTC3-WTA',45000,'https://drive.google.com/file/d/1H7Qn8qTNa_htPgtCUUt5fY7xD9aB8bqa/view?usp=sharing',3,1,'1'),(29,'Dual Inverter Hot & Cold Split Air Conditioner with 4 Way Swing LS-H18VNXD',34990,'https://drive.google.com/file/d/1YEj7O5IgMJheo0VxJOaj9EQRuAk-fmaq/view?usp=sharing',2,1,'1'),(30,'DUAL Inverter Window Air Conditioner with Ocean Black Protection JW-Q09WUZA',52000,'https://drive.google.com/file/d/1Zn6GWNDnxh4M71-bJS2YUbK3l4-1_0ZA/view?usp=sharing',2,1,'1'),(31,'Dual Inverter 3 Star Split Air Conditioner with 4-in-1 Convertible Cooling & Ocean Black Fin LS-Q18P',39000,'https://drive.google.com/file/d/1YEj7O5IgMJheo0VxJOaj9EQRuAk-fmaq/view?usp=sharing',2,1,'1'),(32,'Dual Inverter 5 Star Split Air Conditioner with Anti Allergic Filter & 4-in1 Convertible Cooling LS-',45000,'https://drive.google.com/file/d/1B5NAISe_vNfKH_yINBRwOHWkuhyvZC9q/view?usp=sharing',2,1,'1'),(33,'CE78JDM Convection MWO with SlimFry™, 21L',11900,'https://drive.google.com/file/d/1FnlpouTn4peNdOUuEQcwP8AHJ1YXMI4v/view?usp=sharing',1,3,'1'),(34,'MC28M6036CK Convection MWO with Masala & Sun-Dry, 28L',16800,'https://drive.google.com/file/d/1v1qUEdvznlPokYIYS1O3tH0H9n2bap_i/view?usp=sharing',1,3,'1'),(35,'MC28H5013AK Convection MWO with Curd Any Time 28L',9990,'https://drive.google.com/file/d/14pppot6-sFduea5_VrppPp6Tx2tn9O0W/view?usp=sharing',1,3,'1'),(36,'MC32K7056CC Convection MWO with Masala & Sun Dry™, 32L',22600,'https://drive.google.com/file/d/1t5JR441hmxyPjom9UwcYTnOvGzDGfayU/view?usp=sharing',1,3,'1'),(37,'Godrej 23 L Convection Microwave Oven GME 523 CF1 RM',8896,'https://drive.google.com/file/d/1IMa75TxNVDz0Wd62epP4nlNpQiXZibqg/view?usp=sharing',3,3,'1'),(38,'Godrej 20 L Solo Microwave Oven GMX 20SA2BLM',4990,'https://drive.google.com/file/d/1Eq5PnMIp0JdIs9paYSrY8qsCHqbTeSDw/view?usp=sharing',3,3,'1'),(39,'Godrej 20 L Grill Microwave Oven GME 720 GF1 PZ',7800,'https://drive.google.com/file/d/1_QbRqBW9IQhm3PHY4fAlUAydQ06hps6c/view?usp=sharing',3,3,'1'),(40,'Godrej 28 L Convection Microwave Oven GME 728 CF1 PM',13900,'https://drive.google.com/file/d/1CDsRLEEWHlWHe1sZy93zoP1l9MX85nPL/view?usp=sharing',3,3,'1'),(41,'Whirlpool 20 L Solo Microwave Oven MAGICOOK PRO 20SE black',6400,'https://drive.google.com/file/d/1q2-Ke-T9ANSrPZ2CZ6oC04ZTzMAkzPcS/view?usp=sharing',4,3,'1'),(42,'Whirlpool 30 L Convection Microwave Oven MAGICOOK 30L Wine Magnolia',15900,'https://drive.google.com/file/d/1WsTMuHWJsBpv8lcaayZhgJ_p8b3W1Hjg/view?usp=sharing',4,3,'1'),(43,'Whirlpool 20 L Convection Microwave Oven Magicook Pro 22CE',9150,'https://drive.google.com/file/d/1BFDQQlv8YvwK7o64VpeRoZenyqa_xURI/view?usp=sharing',4,3,'1'),(44,'Whirlpool 25 L Convection Microwave Oven GT-288 (25 L Jet Crisp)',11099,'https://drive.google.com/file/d/1lJ53O_WEi4xK7oShCTuAamwXO1eEQ9ol/view?usp=sharing',4,3,'1'),(45,'LG All In One Microwave Oven MJEN326SF',30790,'https://drive.google.com/file/d/1Xg7FnsvyUmylymZDRILEkFZ6vosBycqD/view?usp=sharing',2,3,'1'),(46,'LG Microwave Oven with Diet Fry™ and 251 Auto cook Menu MC2886BLT',15890,'https://drive.google.com/file/d/1GPCj8N9d9-Sqo2HFwFFYdSrrnFiLgu0c/view?usp=sharing',2,3,'1'),(47,'42L NeoChef Microwave with Smart Inverter MS4295DIS',14490,'https://drive.google.com/file/d/1J0Mr-Wj7iGbg0Qpm0_fm9__o6J0JtRjz/view?usp=sharing',2,3,'1'),(48,'20 L Grill with Glass Door MH2044DB',8090,'https://drive.google.com/file/d/1K7l8AftXhmNqskOgNoHP4q2He1SaexHw/view?usp=sharing',2,3,'1'),(49,'WA65T4560NS Top Loading with ActivWash 6.5 Kg',21300,'https://drive.google.com/file/d/12nJfSeSe02kVoqdnBBBmA9xpB4EtjWWY/view?usp=sharing',1,4,'1'),(50,'WA10T5260BV Top Loading with Inverter Motor 10.0Kg',32100,'https://drive.google.com/file/d/1ow3e-kity2FiXlLH-3h8EuljYzM87092/view?usp=sharing',1,4,'1'),(51,'WA65N4261SS Top Loading with Digital Inverter motor 6.5Kg',21800,'https://drive.google.com/file/d/1w8xGK8G8tbYYJ1K-YHUVwltmXaBfhhmA/view?usp=sharing',1,4,'1'),(52,'WA70T4262BS Top Loading with Wobble Technology 7.0Kg',22200,'https://drive.google.com/file/d/1w08wlpw5qv2qadgzSeFarSrRx7BgTP4z/view?usp=sharing',1,4,'1'),(53,'Wash 8Kg and Spin 6 Kg, 5 Star, Rust Free Body, Roller Jet Pulsator, P8030SGAZ',14990,'https://drive.google.com/file/d/14lW7ep_7CZV7HTyp4KEqy4LU03fp79RA/view?usp=sharing',2,4,'1'),(54,'8.0Kg, AI Direct Drive™ Washer with Steam™ & TurboWash™ FHV1408ZWB',47990,'https://drive.google.com/file/d/1xeApqjscIGv-Y18rejSy_HXoz1vTyZN2/view?usp=sharing',2,4,'1'),(55,'8.0kg, 5 Star, Amber Steel, Jet Spray+, Punch+ 3, TurboDrum T80SJAS1Z',31290,'https://drive.google.com/file/d/1SWs0Ddn6rKqTS0yTlFIFF4qq8etMzShH/view?usp=sharing',2,4,'1'),(56,'8.0 Kg, 6 Motion Direct Drive, Touch Panel, Fuzzy Logic, Baby Care, Sports wear, Child Lock, Front L',34990,'https://drive.google.com/file/d/1Tb-fXcH8PaOu-FJMAsDfKkciqysmYz-y/view?usp=sharing',2,4,'1'),(57,'Whirlpool 6.2 kg Hard Water wash Fully Automatic Top Load Grey',12499,'https://drive.google.com/file/d/1fT4SPw1FSE98rDVhtFDcabm9hfkjN7bA/view?usp=sharing',4,4,'1'),(58,'Whirlpool 7 kg 5 Star,Turbo Scrub Technology Semi Automatic Top Load Grey SUPERB ATOM 70S GREY DAZZL',9299,'https://drive.google.com/file/d/1lxu8kU5nIdz0_m3nGISDnKhzo4FwN9vL/view?usp=sharing',4,4,'1'),(59,'Whirlpool 7.5 kg 5 Star, Ace Wash Station Semi Automatic Top Load Grey ACE 7.5 SUPREME GREY DAZZLE',9990,'https://drive.google.com/file/d/14hVWsbJHlgiyMq6xcdrxvWvQQmoYjITM/view?usp=sharing',4,4,'1'),(60,'Whirlpool 8.2 kg Supersoak Technology Semi Automatic Top Load Pink ACE 8.2 SUPER SOAK (TULIP PINK) (',11499,'https://drive.google.com/file/d/1i1a0Lc8kcrt1kHm7KEVtZuFUopKT71YA/view?usp=sharing',4,4,'1'),(61,'Godrej 7 kg Fully Automatic Top Load Grey WTEON 700 AD 5.0 ROGR',14790,'https://drive.google.com/file/d/11qk96W-o5KyzFvwyETrd-LC98VLz5TVJ/view?usp=sharing',3,4,'1'),(62,'Godrej 6.2 kg Fully Automatic Top Load Grey WT EON 620 A Gp Gr',11990,'https://drive.google.com/file/d/1aehegvbEOWx7sWGHxpFG4FBLtJqqK0f-/view?usp=sharing',3,4,'1'),(63,'Godrej 8.5 kg Semi Automatic Top Load Red, White WS EDGE 8.5 TB3 M',12999,'https://drive.google.com/file/d/1LkK5QphMLwpGhU3DUXI6uhe2Ox8_KatY/view?usp=sharing',3,4,'1'),(64,'Godrej 7 kg Semi Automatic Top Load White, Blue WSAXIS 70 5.SN2 T BL',9190,'https://drive.google.com/file/d/1yqtGzANOHgr_UIzO1JV2uRRaFOcGENr8/view?usp=sharing',3,4,'1');
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `part_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_no` varchar(50) NOT NULL,
  `part_name` varchar(100) NOT NULL,
  `part_price` int(11) NOT NULL,
  `part_img` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `whitegoodcategory_id` int(11) NOT NULL,
  `quantity` varchar(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`part_id`),
  KEY `brand_id` (`brand_id`),
  KEY `whitegoodcategory_id` (`whitegoodcategory_id`),
  CONSTRAINT `parts_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  CONSTRAINT `parts_ibfk_2` FOREIGN KEY (`whitegoodcategory_id`) REFERENCES `whitegoodcategory` (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'SMR01','Compressor',2500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',1,2,'1'),(2,'SMR02','Compressor',3000,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',1,2,'1'),(3,'SMR03','Compressor',3500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',1,2,'1'),(4,'SMR04','Compressor',1500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',1,2,'1'),(5,'SMR10','Condenser Coil',300,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',1,2,'1'),(6,'SMR11','Condenser Coil',500,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',1,2,'1'),(7,'SMR12','Condenser Coil',800,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',1,2,'1'),(8,'SMR13','Condenser Coil',1500,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',1,2,'1'),(9,'SMR20','Refrigerator Lamp',50,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',1,2,'1'),(10,'SMR21','Refrigerator Lamp',80,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',1,2,'1'),(11,'SMR22','Refrigerator Lamp',100,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',1,2,'1'),(12,'SMR30','Refrigerator Thermostat',300,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',1,2,'1'),(13,'SMR31','Refrigerator Thermostat',500,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',1,2,'1'),(14,'SMR23','Refrigerator Lamp',150,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',1,2,'1'),(15,'SMR32','Refrigerator Thermostat',550,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',1,2,'1'),(16,'SMR33','Refrigerator Thermostat',750,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',1,2,'1'),(17,'LGR01','Compressor',2500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',2,2,'1'),(18,'LGR02','Compressor',3000,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',2,2,'1'),(19,'LGR03','Compressor',3500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',2,2,'1'),(20,'LGR04','Compressor',1500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',2,2,'1'),(21,'LGR10','Condenser Coil',300,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',2,2,'1'),(22,'LGR11','Condenser Coil',500,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',2,2,'1'),(23,'LGR12','Condenser Coil',550,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',2,2,'1'),(24,'LGR13','Condenser Coil',800,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',2,2,'1'),(25,'LGR20','Refrigerator Lamp',50,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',2,2,'1'),(26,'LGR21','Refrigerator Lamp',80,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',2,2,'1'),(27,'LGR22','Refrigerator Lamp',100,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',2,2,'1'),(28,'LGR23','Refrigerator Lamp',150,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',2,2,'1'),(29,'LGR30','Refrigerator Thermostat',300,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',2,2,'1'),(30,'LGR31','Refrigerator Thermostat',500,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',2,2,'1'),(31,'LGR32','Refrigerator Thermostat',550,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',2,2,'1'),(32,'LGR33','Refrigerator Thermostat',750,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',2,2,'1'),(33,'GR01','Compressor',2500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',3,2,'1'),(34,'GR02','Compressor',3000,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',3,2,'1'),(35,'GR03','Compressor',3500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',3,2,'1'),(36,'GR04','Compressor',1500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',3,2,'1'),(37,'GR10','Condenser Coil',300,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',3,2,'1'),(38,'GR11','Condenser Coil',500,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',3,2,'1'),(39,'GR12','Condenser Coil',800,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',3,2,'1'),(40,'GR13','Condenser Coil',150,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',3,2,'1'),(41,'GR20','Refrigerator Lamp',50,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',3,2,'1'),(42,'GR21','Refrigerator Lamp',80,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',3,2,'1'),(43,'GR22','Refrigerator Lamp',100,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',3,2,'1'),(44,'GR23','Refrigerator Lamp',150,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',3,2,'1'),(45,'GR30','Refrigerator Thermostat',300,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',3,2,'1'),(46,'GR31','Refrigerator Thermostat',500,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',3,2,'1'),(47,'GR32','Refrigerator Thermostat',550,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',3,2,'1'),(48,'GR33','Refrigerator Thermostat',750,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',3,2,'1'),(49,'WR01','Compressor',2500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',4,2,'1'),(50,'WR02','Compressor',3000,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',4,2,'1'),(51,'WR03','Compressor',3500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',4,2,'1'),(52,'WR04','Compressor',1500,'https://drive.google.com/file/d/142EepSFDTGhdiPL2YmNkM6H8vqmdojs5/view?usp=sharing',4,2,'1'),(53,'WR10','Condenser Coil',300,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',4,2,'1'),(54,'WR11','Condenser Coil',500,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',4,2,'1'),(55,'WR12','Condenser Coil',800,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',4,2,'1'),(56,'WR13','Condenser Coil',1500,'https://drive.google.com/file/d/16lnnROojVFFK8TTzIOIBppAb3h32_2Hf/view?usp=sharing',4,2,'1'),(57,'WR20','Refrigerator Lamp',50,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',4,2,'1'),(58,'WR21','Refrigerator Lamp',80,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',4,2,'1'),(59,'WR22','Refrigerator Lamp',100,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',4,2,'1'),(60,'WR23','Refrigerator Lamp',150,'https://drive.google.com/file/d/1zf0RwXIYjnnTuwEYp3MJQSdgxi1912Qe/view?usp=sharing',4,2,'1'),(61,'WR30','Refrigerator Thermostat',300,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',4,2,'1'),(62,'WR31','Refrigerator Thermostat',500,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',4,2,'1'),(63,'WR32','Refrigerator Thermostat',550,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',4,2,'1'),(64,'WR33','Refrigerator Thermostat',750,'https://drive.google.com/file/d/1t6nJgaGhCdeBYNHlPAfy4kiOmQtTQ8XP/view?usp=sharing',4,2,'1'),(65,'SMA01','Ac Copper Pipe',540,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',1,1,'1'),(66,'SMA02','Ac Copper Pipe',600,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',1,1,'1'),(67,'SMA03','Ac Copper Pipe',640,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',1,1,'1'),(68,'SMA04','Ac Copper Pipe',700,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',1,1,'1'),(69,'SMA10','AC Condensers',1500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',1,1,'1'),(70,'SMA11','AC Condensers',1800,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',1,1,'1'),(71,'SMA12','AC Condensers',2000,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',1,1,'1'),(72,'SMA13','AC Condensers',2500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',1,1,'1'),(73,'SMA20','PVC Blue Drain Pipe',120,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',1,1,'1'),(74,'SMA21','PVC Blue Drain Pipe',150,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',1,1,'1'),(75,'SMA22','PVC Blue Drain Pipe',180,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',1,1,'1'),(76,'SMA23','PVC Blue Drain Pipe',200,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',1,1,'1'),(77,'WA01','Ac Copper Pipe',540,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',4,1,'1'),(78,'WA02','Ac Copper Pipe',600,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',4,1,'1'),(79,'WA03','Ac Copper Pipe',640,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',4,1,'1'),(80,'WA04','Ac Copper Pipe',700,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',4,1,'1'),(81,'WA10','AC Condensers',1500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',4,1,'1'),(82,'WA11','AC Condensers',1800,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',4,1,'1'),(83,'WA12','AC Condensers',2000,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',4,1,'1'),(84,'WA13','AC Condensers',2500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',4,1,'1'),(85,'WA20','PVC Blue Drain Pipe',120,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',4,1,'1'),(86,'WA21','PVC Blue Drain Pipe',180,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',4,1,'1'),(87,'WA22','PVC Blue Drain Pipe',150,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',4,1,'1'),(88,'WA23','PVC Blue Drain Pipe',200,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',4,1,'1'),(89,'GA01','Ac Copper Pipe',540,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',3,1,'1'),(90,'GA02','Ac Copper Pipe',600,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',3,1,'1'),(91,'GA03','Ac Copper Pipe',640,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',3,1,'1'),(92,'GA04','Ac Copper Pipe',700,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',3,1,'1'),(93,'GA10','AC Condensers',1500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',3,1,'1'),(94,'GA11','AC Condensers',1800,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',3,1,'1'),(95,'GA12','AC Condensers',2000,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',3,1,'1'),(96,'GA13','AC Condensers',2500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',3,1,'1'),(97,'GA20','PVC Blue Drain Pipe',120,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',3,1,'1'),(98,'GA21','PVC Blue Drain Pipe',150,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',3,1,'1'),(99,'GA22','PVC Blue Drain Pipe',180,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',3,1,'1'),(100,'GA23','PVC Blue Drain Pipe',200,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',3,1,'1'),(101,'LGA01','Ac Copper Pipe',540,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',2,1,'1'),(102,'LGA02','Ac Copper Pipe',600,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',2,1,'1'),(103,'LGA03','Ac Copper Pipe',640,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',2,1,'1'),(104,'LGA04','Ac Copper Pipe',700,'https://drive.google.com/file/d/1yZgIBPorTHSG9ln09Ufq77XfJJTn0Je7/view?usp=sharing',2,1,'1'),(105,'LGA10','AC Condensers',1500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',2,1,'1'),(106,'LGA11','AC Condensers',1800,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',2,1,'1'),(107,'LGA12','AC Condensers',2000,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',2,1,'1'),(108,'LGA13','AC Condensers',2500,'https://drive.google.com/file/d/1R6baUJdg7ZqYCKkjOeEebp-3PvQAQQlX/view?usp=sharing',2,1,'1'),(109,'LGA20','PVC Blue Drain Pipe',120,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',2,1,'1'),(110,'LGA21','PVC Blue Drain Pipe',150,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',2,1,'1'),(111,'LGA22','PVC Blue Drain Pipe',180,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',2,1,'1'),(112,'LGA23','PVC Blue Drain Pipe',200,'https://drive.google.com/file/d/1rvqo76SWsOjmgcAmBpSRvezZ4ylkc9dc/view?usp=sharing',2,1,'1'),(113,'SMO01','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',1,3,'1'),(114,'SMO02','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',1,3,'1'),(115,'SMO03','Magnetron',1200,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',1,3,'1'),(116,'SMO04','Magnetron',1500,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',1,3,'1'),(117,'SMO10','Capacitor',100,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',1,3,'1'),(118,'SMO11','Capacitor',120,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',1,3,'1'),(119,'SMO12','Capacitor',150,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',1,3,'1'),(120,'SMO13','Capacitor',180,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',1,3,'1'),(121,'SMO20','MicroWave Fuse',250,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',1,3,'1'),(122,'SMO21','MicroWave Fuse',280,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',1,3,'1'),(123,'SMO22','MicroWave Fuse',300,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',1,3,'1'),(124,'SMO23','MicroWave Fuse',320,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',1,3,'1'),(125,'GO01','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',3,3,'1'),(126,'GO02','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',3,3,'1'),(127,'GO03','Magnetron',1200,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',3,3,'1'),(128,'GO04','Magnetron',1500,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',3,3,'1'),(129,'GO10','Capacitor',100,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',3,3,'1'),(130,'GO11','Capacitor',120,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',3,3,'1'),(131,'GO12','Capacitor',150,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',3,3,'1'),(132,'GO13','Capacitor',180,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',3,3,'1'),(133,'GO20','MicroWave Fuse',250,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',3,3,'1'),(134,'GO21','MicroWave Fuse',280,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',3,3,'1'),(135,'GO22','MicroWave Fuse',300,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',3,3,'1'),(136,'GO23','MicroWave Fuse',320,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',3,3,'1'),(137,'WO01','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',4,3,'1'),(138,'WO02','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',4,3,'1'),(139,'WO03','Magnetron',1200,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',4,3,'1'),(140,'WO04','Magnetron',1500,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',4,3,'1'),(141,'WO10','Capacitor',100,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',4,3,'1'),(142,'WO11','Capacitor',120,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',4,3,'1'),(143,'WO12','Capacitor',150,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',4,3,'1'),(144,'WO13','Capacitor',180,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',4,3,'1'),(145,'WO20','MicroWave Fuse',250,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',4,3,'1'),(146,'WO21','MicroWave Fuse',280,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',4,3,'1'),(147,'WO22','MicroWave Fuse',300,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',4,3,'1'),(148,'WO23','MicroWave Fuse',320,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',4,3,'1'),(149,'LGO01','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',2,3,'1'),(150,'LGO02','Magnetron',999,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',2,3,'1'),(151,'LGO03','Magnetron',1200,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',2,3,'1'),(152,'LGO04','Magnetron',1500,'https://drive.google.com/file/d/15VMn5KeWcAqOrM-xsanqa7j9ava39CIV/view?usp=sharing',2,3,'1'),(153,'LGO10','Capacitor',100,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',2,3,'1'),(154,'LGO11','Capacitor',120,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',2,3,'1'),(155,'LGO12','Capacitor',150,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',2,3,'1'),(156,'LGO13','Capacitor',180,'https://drive.google.com/file/d/1MgEQ0e_hMdhUselGP1iqRvY_WtiJp5QY/view?usp=sharing',2,3,'1'),(157,'LGO20','MicroWave Fuse',250,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',2,3,'1'),(158,'LGO21','MicroWave Fuse',280,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',2,3,'1'),(159,'LGO22','MicroWave Fuse',300,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',2,3,'1'),(160,'LGO22','MicroWave Fuse',300,'https://drive.google.com/file/d/1T8xPff-qkN5CivLh6Ej6VZY77szLrgMa/view?usp=sharing',2,3,'1'),(161,'SMW01','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',1,4,'1'),(162,'SMW02','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',1,4,'1'),(163,'SMW03','Washing Machine Motor',470,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',1,4,'1'),(164,'SMW04','Washing Machine Motor',500,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',1,4,'1'),(165,'SMW10','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',1,4,'1'),(166,'SMW11','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',1,4,'1'),(167,'SMW12','Washing Machine pcb',2200,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',1,4,'1'),(168,'SMW13','Washing Machine pcb',2500,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',1,4,'1'),(169,'SMW20','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',1,4,'1'),(170,'SMW21','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',1,4,'1'),(171,'SMW22','Washing Machine Timer',150,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',1,4,'1'),(172,'SMW23','Washing Machine Timer',180,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',1,4,'1'),(173,'LGW01','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',2,4,'1'),(174,'LGW02','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',2,4,'1'),(175,'LGW03','Washing Machine Motor',470,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',2,4,'1'),(176,'LGW04','Washing Machine Motor',500,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',2,4,'1'),(177,'LGW10','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',2,4,'1'),(178,'LGW11','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',2,4,'1'),(179,'LGW12','Washing Machine pcb',2200,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',2,4,'1'),(180,'LGW13','Washing Machine pcb',2500,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',2,4,'1'),(181,'LGW20','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',2,4,'1'),(182,'LGW21','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',2,4,'1'),(183,'LGW22','Washing Machine Timer',150,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',2,4,'1'),(184,'LGW23','Washing Machine Timer',180,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',2,4,'1'),(185,'WW01','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',4,4,'1'),(186,'WW02','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',4,4,'1'),(187,'WW03','Washing Machine Motor',470,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',4,4,'1'),(188,'WW04','Washing Machine Motor',500,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',4,4,'1'),(189,'WW10','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',4,4,'1'),(190,'WW11','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',4,4,'1'),(191,'WW12','Washing Machine pcb',2200,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',4,4,'1'),(192,'WW13','Washing Machine pcb',2500,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',4,4,'1'),(193,'WW20','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',4,4,'1'),(194,'WW21','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',4,4,'1'),(195,'WW22','Washing Machine Timer',150,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',4,4,'1'),(196,'WW23','Washing Machine Timer',180,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',4,4,'1'),(197,'GW01','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',3,4,'1'),(198,'GW02','Washing Machine Motor',450,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',3,4,'1'),(199,'GW03','Washing Machine Motor',470,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',3,4,'1'),(200,'GW04','Washing Machine Motor',500,'https://drive.google.com/file/d/1GkZtmTVxfxAhjZtfo9BF3c2LqibJ03Jk/view?usp=sharing',3,4,'1'),(201,'GW10','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',3,4,'1'),(202,'GW11','Washing Machine pcb',2000,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',3,4,'1'),(203,'GW12','Washing Machine pcb',2200,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',3,4,'1'),(204,'GW13','Washing Machine pcb',2500,'https://drive.google.com/file/d/1O9WWPhGSQM4vatLo9CSi7S0mC4CEQNtf/view?usp=sharing',3,4,'1'),(205,'GW20','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',3,4,'1'),(206,'GW21','Washing Machine Timer',130,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',3,4,'1'),(207,'GW22','Washing Machine Timer',150,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',3,4,'1'),(208,'GW23','Washing Machine Timer',180,'https://drive.google.com/file/d/1yPqa5RTAvYITwdzTc5zv_5c70EBoy7oe/view?usp=sharing',3,4,'1');
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `request_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(4) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` text,
  `name` varchar(35) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` varchar(10) NOT NULL,
  `time` varchar(8) NOT NULL,
  `service_charge` int(11) NOT NULL,
  `item_cost` int(11) NOT NULL,
  `is_discount` varchar(1) NOT NULL,
  `discount_percent` varchar(5) NOT NULL,
  `total_amount` double NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(5) NOT NULL,
  `otp` int(6) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,11,'Title1','Description1','Prabodh','I.U.D.P','Washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/12/05','12:20',20,20,'5','1',20,'2020-12-03 11:11:00','00',NULL),(2,11,'Title1','Description1','Prabodh','I.U.D.P','Washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/12/20','12:20',20,20,'5','1',20,'2020-12-03 11:11:31','00',NULL),(3,11,'title1','description1','name','address','city','444505','1234567890','prabodh.shewalkar@gmail.com','2020/12/28','20:20',20,20,'1','50',20,'2020-12-03 12:18:01','00',NULL),(4,11,'title1','description1','name','address','city','444505','1234567890','prabodh.shewalkar@gmail.com','2020/12/18','20:20',20,20,'1','5',38,'2020-12-04 15:25:41','11',NULL),(5,11,'title1','description1','name','address','city','444505','1234567890','prabodh.shewalkar@gmail.com','2020/12/18','20:20',20,20,'1','3',38.8,'2020-12-03 12:23:19','00',NULL),(6,11,'title1','description1234','prabodh','iudp','washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/11/11','18:30',50,1000,'1','33.0',703.5,'2020-12-04 15:25:27','10',NULL),(7,11,'New req','New des','Pra','prabodh cha ghar','washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/10/17','07:20',20,500,'1','9.0',473.2,'2020-12-09 12:09:38','00',NULL),(8,10,'New sanket','sanket desc','Sanket','sanket ka ghar','mumbai','444505','1234567890','sanket@gmail.com','2020/10/14','11:00',60,650,'1','20.0',568,'2020-12-09 12:16:58','00',NULL),(9,11,'Title11','Description11','Prabodh','I.U.D.P 11','Washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/12/05','15:40',20,20,'5','1',20,'2020-12-16 18:30:00','11',NULL),(10,11,'New 11','New des','Pra','prabodh cha ghar 11','washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/10/17','07:20',20,500,'1','9.0',473.2,'2020-12-09 12:09:38','11',NULL),(11,11,'title11title','description111','name','address11','city','444505','1234567890','prabodh.shewalkar@gmail.com','2020/12/18','20:20',20,20,'1','3',38.8,'2020-12-03 12:23:19','11',NULL),(12,11,'new11Prab','Prabodh11 desc','Prabodh','prabodh11 house','mumbai','444505','1234567890','sanket@gmail.com','2020/10/14','11:00',60,650,'1','20.0',568,'2020-12-17 09:51:40','11',NULL),(13,11,'Title10','Description10','Prabodh','I.U.D.P 10','Washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/12/05','15:40',20,20,'5','1',20,'2020-12-17 09:53:47','10',NULL),(14,11,'New 10','New des 10','Pra','prabodh cha ghar 10','washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/10/17','07:20',20,500,'1','9.0',473.2,'2020-12-09 12:09:38','10',NULL),(15,11,'title10title','description110','name','address10','city','444505','1234567890','prabodh.shewalkar@gmail.com','2020/12/18','20:20',20,20,'1','3',38.8,'2020-12-03 12:23:19','10',NULL),(16,11,'new10Prab','Prabodh10 desc','Prabodh','prabodh10 house','mumbai','444505','1234567890','sanket@gmail.com','2020/10/14','11:00',60,650,'1','20.0',568,'2020-12-09 12:16:58','10',NULL),(17,11,'Title01','Description01','Prabodh','I.U.D.P 01','Washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/12/05','15:40',20,20,'5','1',20,'2020-12-17 09:53:47','01',NULL),(18,11,'pra','New des 01','Pra','prabodh cha ghar 01','washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/10/17','07:20',20,500,'1','9.0',473.2,'2020-12-09 12:09:38','01',NULL),(19,11,'title01title','description01','name','address01','city','444505','1234567890','prabodh.shewalkar@gmail.com','2020/12/18','20:20',20,20,'1','3',38.8,'2020-12-03 12:23:19','01',NULL),(20,11,'new01Prab','Prabodh01 desc','Prabodh','prabodh10 house','mumbai','444505','1234567890','sanket@gmail.com','2020/10/14','11:00',60,650,'1','20.0',568,'2020-12-09 12:16:58','01',NULL),(21,11,'title1','description1234','prabodh','iudp','washim','444505','8208023919','prabodh.shewalkar@gmail.com','2020/11/11','18:30',50,1000,'1','33.0',703.5,'2020-12-04 15:25:27','01',NULL);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sells` (
  `request_id` int(10) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  KEY `request_id` (`request_id`),
  CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sells`
--

LOCK TABLES `sells` WRITE;
/*!40000 ALTER TABLE `sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `address` varchar(75) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pin` varchar(8) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` int(1) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `is_deleted` varchar(1) DEFAULT NULL,
  `token` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (8,'Admin','Automobile Premier Road, Kurla (West)','Mumbai','400070','9702717188','sanketdeveloper00@gmail.com',0,NULL,'0','dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ'),(9,'Sameer SIngh','Khindipada, Bhandup (West)','Mumbai','400078','9082171403','sanketdeshmukh880@gmail.com',1,'http://128.199.30.114:9000/images/Manager.png','0','dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ'),(10,'Sanket Deshmukh','2, Jatadhari Chawl, New Sanjay Niwas, Bhandup (West)','Mumbai','400078','9702717188','meetsanket24@gmail.com',2,'http://128.199.30.114:9000/images/sanket.jpg','0','dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ'),(11,'Prabodh','I.U.D.P. colony washim ','Washim','444505','8208023919','prabodh.shewalkar@gmail.com',2,'http://128.199.30.114:9000/images/Prabodh.jpg','0','e_qFpS3eRsaCPyrtaarp6O:APA91bGwu7oQYAMp8IH5dmECHsq1I86XNwU-ZAdSFRKvpRmhr-GO3oAffSeve0SItEwGvhl9TwmGOMS2xQ3evw5zY5gPD-ij3oPU66HOTSRqjBa8kdh4UG9iElQp5v7OW5empambwvQY'),(12,'Afif Shaikh','MK Residency Kurla West','Mumbai','400070','9769320992','shaikhafif48@gmail.com',2,'http://128.199.30.114:9000/images/afif.png','0','dI6cdpk1QFCvwaOrCvynKR:APA91bE32QHs3DVgSYKoXFC8nk-9enTEGUegtMixepBT24920T2lJwMyonJiSiBBm69_AIIL6CWfYqbKElWscMDpduFohSm_g3g5PjhmXTUI9UaV6t1DuGlbwBmzC75plXzT9XEUHcMZ');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitegoodcategory`
--

DROP TABLE IF EXISTS `whitegoodcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitegoodcategory` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(20) NOT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitegoodcategory`
--

LOCK TABLES `whitegoodcategory` WRITE;
/*!40000 ALTER TABLE `whitegoodcategory` DISABLE KEYS */;
INSERT INTO `whitegoodcategory` VALUES (1,'AC'),(2,'Refrigerator'),(3,'Oven'),(4,'WashingMachine');
/*!40000 ALTER TABLE `whitegoodcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 16:46:08
