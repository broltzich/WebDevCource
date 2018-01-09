-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: first_db
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add computer model',7,'add_computermodel'),(20,'Can change computer model',7,'change_computermodel'),(21,'Can delete computer model',7,'delete_computermodel'),(22,'Can add customer model',8,'add_customermodel'),(23,'Can change customer model',8,'change_customermodel'),(24,'Can delete customer model',8,'delete_customermodel'),(25,'Can add order model',9,'add_ordermodel'),(26,'Can change order model',9,'change_ordermodel'),(27,'Can delete order model',9,'delete_ordermodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$no7kmIjswiRh$IoOsX2utoQoF80Y3Tt+RmDPW1trPQhiSUf7XQR2et7Y=','2017-12-01 12:00:57.451710',1,'admin','','','vpupkin9208@gmail.com',1,1,'2017-11-03 12:14:58.516983'),(2,'pbkdf2_sha256$36000$VPFXRvLH92fU$kTvGlTuduNGOmEwX7UMSxppY3Jz331yCsgvx3TM1yY4=','2017-11-29 19:51:00.031667',0,'V.VASYA','','','',0,1,'2017-11-24 09:57:26.529406'),(3,'pbkdf2_sha256$36000$hRzipYKtZtGb$8O6bGC8SE/FQsWUaxPA61WmVNXBFTpY+6TcEjab+CBE=',NULL,0,'I.Ivanov','','','casfdsf@mail.ru',0,1,'2017-12-01 12:05:57.888936'),(5,'pbkdf2_sha256$36000$xNP0fcoHIRZJ$zHjFiG3sgn7gA2LRscIla0cpuYxbEbmqVbMGAjpSWsw=','2017-12-01 13:18:24.597873',0,'I.IvanovIvan','','','casfdsf@mail.ru',0,1,'2017-12-01 12:12:23.752354');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-11-03 12:21:00.928603','1','\'name\':Asus n550jk, \'description\':Asus n550jk, 15,6 1920x1080 ips display, intel core i5-4600 2,8GHz, 8Gb RAM, 128Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',1,'[{\"added\": {}}]',7,1),(2,'2017-11-03 12:21:06.455535','1','\'name\':Asus n550jk, \'description\':Asus n550jk, 15,6 1920x1080 ips display, intel core i5-4600 2,8GHz, 8Gb RAM, 128Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',2,'[]',7,1),(3,'2017-11-03 12:22:47.708971','1','\'name\':Вася, \'email\':vasya@mail1.com, \'password\':111111',1,'[{\"added\": {}}]',8,1),(4,'2017-11-03 12:23:35.782380','1','OrderModel object',1,'[{\"added\": {}}]',9,1),(5,'2017-11-03 13:28:33.963242','2','\'name\':Компутер 1, \'description\':Описание компутера 1',1,'[{\"added\": {}}]',7,1),(6,'2017-11-03 13:29:31.226074','3','\'name\':Asus n751jv, \'description\':17,3 1920x1080 ips display, intel core i7-4800 3,2GHz, 16Gb RAM, 256Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',1,'[{\"added\": {}}]',7,1),(7,'2017-11-03 13:29:32.695541','3','\'name\':Asus n751jv, \'description\':17,3 1920x1080 ips display, intel core i7-4800 3,2GHz, 16Gb RAM, 256Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',2,'[]',7,1),(8,'2017-11-04 15:08:51.679110','4','\'name\':asus ux303ub, \'description\':1920x1080 ips 13.3, intel core i5 2,3GHz, 8Gb RAM,1Tb HDD, NVidea GeForce 940M, wifi, bluetooth 4.0',1,'[{\"added\": {}}]',7,1),(9,'2017-11-04 15:22:19.568113','1','\'name\':Asus n551jk, \'description\':Asus n550jk, 15,6 1920x1080 ips display, intel core i5-4600 2,8GHz, 8Gb RAM, 128Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(10,'2017-11-04 15:22:26.898122','3','\'name\':Asus n751jk, \'description\':17,3 1920x1080 ips display, intel core i7-4800 3,2GHz, 16Gb RAM, 256Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',7,1),(11,'2017-11-05 17:07:29.268938','1','OrderModel object',3,'',9,1),(12,'2017-11-24 09:57:26.609411','2','V.VASYA',1,'[{\"added\": {}}]',4,1),(13,'2017-11-26 09:09:27.931063','1','OrderModel object',1,'[{\"added\": {}}]',9,1),(14,'2017-11-26 09:10:00.413210','2','OrderModel object',1,'[{\"added\": {}}]',9,1),(15,'2017-11-26 09:10:30.907817','3','OrderModel object',1,'[{\"added\": {}}]',9,1),(16,'2017-11-27 20:41:43.496438','4','customer:login:Y.VANOV, secondname:ИВАНОВ, firstname:ИВАН, email:Yvan_Yvanov@gmail.com, password:25d55ad283aa400af464c76d713c07ad, computer:name:Asus n551jk, description:Asus n550jk, 15,6 1920x1080 ip',1,'[{\"added\": {}}]',9,1),(17,'2017-11-27 20:42:07.341299','5','customer:login:V.VASYA, secondname:ВАСИЛЬЕВ, firstname:ВАСЯ, email:vasya.petrov@gmail.com, password:97db1846570837fce6ff62a408f1c26a, computer:name:Asus n551jk, description:Asus n550jk, 15,6 1920x1080',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'my_app','computermodel'),(8,'my_app','customermodel'),(9,'my_app','ordermodel'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-11-02 09:49:04.813675'),(2,'auth','0001_initial','2017-11-02 09:49:08.360878'),(3,'admin','0001_initial','2017-11-02 09:49:08.744900'),(4,'admin','0002_logentry_remove_auto_add','2017-11-02 09:49:08.805903'),(5,'contenttypes','0002_remove_content_type_name','2017-11-02 09:49:09.018915'),(6,'auth','0002_alter_permission_name_max_length','2017-11-02 09:49:09.121921'),(7,'auth','0003_alter_user_email_max_length','2017-11-02 09:49:09.265929'),(8,'auth','0004_alter_user_username_opts','2017-11-02 09:49:09.284931'),(9,'auth','0005_alter_user_last_login_null','2017-11-02 09:49:09.769958'),(10,'auth','0006_require_contenttypes_0002','2017-11-02 09:49:09.774959'),(11,'auth','0007_alter_validators_add_error_messages','2017-11-02 09:49:09.790959'),(12,'auth','0008_alter_user_username_max_length','2017-11-02 09:49:09.907966'),(13,'my_app','0001_initial','2017-11-02 09:50:16.773205'),(14,'sessions','0001_initial','2017-11-02 09:50:16.927214'),(15,'my_app','0002_auto_20171103_1455','2017-11-03 11:56:21.182433'),(16,'my_app','0003_auto_20171105_2106','2017-11-05 18:10:18.076013'),(17,'my_app','0004_auto_20171117_1531','2017-11-17 12:31:49.625007'),(18,'my_app','0005_computermodel_picpath','2017-11-22 15:35:06.488031'),(19,'my_app','0006_auto_20171126_1204','2017-11-26 09:05:20.338805'),(20,'my_app','0007_auto_20171126_1207','2017-11-26 09:08:03.192097'),(21,'my_app','0008_auto_20171130_0248','2017-11-29 23:48:10.920551'),(22,'my_app','0009_auto_20171201_1507','2017-12-01 12:08:00.658890');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2nho29uhugr3lhin7g8oh9x2x391bnsr','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-12-11 20:41:04.327266'),('32knmecdpshjabgl4kqos3z1xe4w3fhw','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-11-17 12:15:22.421306'),('3o2t1b7ggrxzzqfccmek968sxgywadok','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-12-08 10:57:20.699383'),('f12qny33skmk5bcc1zmt4m2hasvgqsl0','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-11-17 22:14:03.526629'),('ij3u2nlwgrbfktlckw16j9bpnfsoi2q9','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-11-17 15:28:19.380419'),('izmcflanc0vtt0mokchceefv2efuiydn','NmRiZTAxMzUyMTIxNDFmM2JjMWJkM2ZlMGQyMWYzZmVmMjRkZmYyMDp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZDI0MWViYjNkNTkzMDEwNzgwYzYxMTYyM2M1ZmMzYWYxMGM4ZWY0In0=','2017-12-15 13:18:24.612874'),('nzplydqzq561izfed00z0nckognw248b','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-11-19 17:06:33.828472'),('sd8njtdjatvjuu8s0v8xrouhpq8xkw83','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-11-19 22:17:12.410499'),('wq5ne59a77aa4s6eac5wmwjx53xy4gzo','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-12-11 16:06:46.173163'),('z225h9tncwjukxn13kfvhsnj9blxzfrh','OWY3NTY3OWYxN2M2NzEwYzVlNTE3NDNkMTE3NTMzNDE0ODhhNGYyODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjRmNjAwMzBmZjdhYjlhNDAzZDk1MzMzNWY1ZjlmYmFlNjgwNGFiIn0=','2017-12-09 21:29:30.628450'),('z6bosegwi4i2mj3wtgic7s84738pxlkd','Mzc3OGQ0ZDdkZDNhN2ZmZjQwNzg3MmVkODY2YWE0ZTY1M2UyMjk0Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZjdjNzA4YWE2YTkxNDg4MWNlZjRiMzFhNDRhNWU1MDUyZWI3NDJmIn0=','2017-12-01 12:57:14.268953');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_app_computer`
--

DROP TABLE IF EXISTS `my_app_computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_app_computer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picpath` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_app_computer`
--

LOCK TABLES `my_app_computer` WRITE;
/*!40000 ALTER TABLE `my_app_computer` DISABLE KEYS */;
INSERT INTO `my_app_computer` VALUES (1,'Asus n551jk','Asus n550jk, 15,6 1920x1080 ips display, intel core i5-4600 2,8GHz, 8Gb RAM, 128Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',''),(2,'Компутер 1','Описание компутера 1',''),(3,'Asus n751jk','17,3 1920x1080 ips display, intel core i7-4800 3,2GHz, 16Gb RAM, 256Gb SSD, wifi 2,4GHz bgn+ac, bluetooth 4.0',''),(4,'asus ux303ub','1920x1080 ips 13.3, intel core i5 2,3GHz, 8Gb RAM,1Tb HDD, NVidea GeForce 940M, wifi, bluetooth 4.0',''),(5,'Lenovo X1 Carbon','Something for description','path'),(6,'Dell latitude 7480','Something for description','path'),(7,'Dell xps 13','Something for description','path'),(8,'Lenovo X1 Carbon','Something for description','path'),(9,'Toshiba Satellite 110cs','intel pentium 100Mhz,  8MB RAM, 810MB HDD',''),(10,'Acer aspire 15','Something for description',''),(11,'gpd pocket umpc','Something for description',''),(12,'gpd win umpc','Something for description',''),(13,'Asus n550jv','Something for description',''),(14,'Asus n550jv','Something for description',''),(15,'Asus n550jv','Something for description',''),(16,'Asus n550jv','Something for description',''),(17,'gpd win 2','Something for description',''),(18,'dell xps 15 9560','Something for description',''),(19,'dell xps 15 9560','Something for description',''),(20,'Oqo model 02 umpc','Something for description',''),(21,'HP 15-bw037ur','AMD A6 9220 2500 MHz/15.6\"/1920x1080/4Gb/1000Gb HDD/DVD нет/AMD Radeon 520/Wi-Fi/Bluetooth/',''),(22,'Toshiba Satellite 110cs','Something for description',''),(23,'Asus n552vx','Something for description','');
/*!40000 ALTER TABLE `my_app_computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_app_customer`
--

DROP TABLE IF EXISTS `my_app_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_app_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(300) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `secondname` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_app_customer`
--

LOCK TABLES `my_app_customer` WRITE;
/*!40000 ALTER TABLE `my_app_customer` DISABLE KEYS */;
INSERT INTO `my_app_customer` VALUES (1,'vasya@mail1.com','e1e6ad8b03784d386c82c3817b718efa52cd92352ce50c700f4faa01be9a7d64','Вася','',''),(2,'yvanyvanov@qwe.rty','25d55ad283aa400af464c76d713c07ad','Ivan_ivanov','',''),(3,'r','25d55ad283aa400af464c76d713c07ad','qwertyname','qwerty','w'),(4,'sdfgsdfgsdf','a020cf88bb7e4477036226bb5869e8ec','sdgsdgdfgsd','dfgsdfg','dsgsdfgsdfg'),(5,'Yvan_Yvanov@gmail.com','','','',''),(6,'Yvan_Yvanov@gmail.com','','','',''),(7,'Yvan_Yvanov@gmail.com','<md5 HASH object @ 0x036E9E18>','','',''),(8,'Yvan_Yvanov@gmail.com','<md5 HASH object @ 0x03A0B4A0>','','',''),(9,'Yvan_Yvanov@gmail.com','25d55ad283aa400af464c76d713c07ad','','',''),(10,'Yvan_Yvanov@gmail.com','25d55ad283aa400af464c76d713c07ad','ИВАН','Y.VANOV','ИВАНОВ'),(11,'vasya.petrov@gmail.com','97db1846570837fce6ff62a408f1c26a','ВАСЯ','V.VASYA','ВАСИЛЬЕВ'),(12,'casfdsf@mail.ru','pbkdf2_sha256$36000$xNP0fcoHIRZJ$zHjFiG3sgn7gA2LRscIla0cpuYxbEbmqVbMGAjpSWsw=','Иван','I.IvanovIvan','Иванов');
/*!40000 ALTER TABLE `my_app_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_app_order`
--

DROP TABLE IF EXISTS `my_app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_app_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_received` date NOT NULL,
  `date_completed` date NOT NULL,
  `computer_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `my_app_order_computer_id_07873c2c_fk_my_app_computer_id` (`computer_id`),
  KEY `my_app_order_customer_id_c3a85a1c_fk_my_app_customer_id` (`customer_id`),
  CONSTRAINT `my_app_order_computer_id_07873c2c_fk_my_app_computer_id` FOREIGN KEY (`computer_id`) REFERENCES `my_app_computer` (`id`),
  CONSTRAINT `my_app_order_customer_id_c3a85a1c_fk_my_app_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `my_app_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_app_order`
--

LOCK TABLES `my_app_order` WRITE;
/*!40000 ALTER TABLE `my_app_order` DISABLE KEYS */;
INSERT INTO `my_app_order` VALUES (1,'2017-11-26','2017-11-30',1,11,0),(2,'2017-11-26','2017-11-29',3,10,0),(3,'2017-11-26','2017-11-30',4,11,0),(4,'2017-11-27','2017-11-30',1,10,0),(5,'2017-11-27','2017-11-29',1,11,0),(6,'2017-11-30','2017-12-15',6,11,0),(7,'2017-12-01','2018-01-11',20,11,0);
/*!40000 ALTER TABLE `my_app_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01 16:28:49
