/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: toca
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `app_cidade`
--

DROP TABLE IF EXISTS `app_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_cidade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cidade`
--

LOCK TABLES `app_cidade` WRITE;
/*!40000 ALTER TABLE `app_cidade` DISABLE KEYS */;
INSERT INTO `app_cidade` VALUES
(1,'Curitiba'),
(2,'São Paulo');
/*!40000 ALTER TABLE `app_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_festa`
--

DROP TABLE IF EXISTS `app_festa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_festa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `data` date NOT NULL,
  `carimbo_data_hora` datetime(6) DEFAULT NULL,
  `email_responsavel` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_festa`
--

LOCK TABLES `app_festa` WRITE;
/*!40000 ALTER TABLE `app_festa` DISABLE KEYS */;
INSERT INTO `app_festa` VALUES
(1,'Festa do Verão','https://festaverano.com','2025-04-17',NULL,NULL),
(2,'Festa da Lucy','https://lucyparty.com.br','2025-07-17',NULL,NULL);
/*!40000 ALTER TABLE `app_festa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_festa_cidades`
--

DROP TABLE IF EXISTS `app_festa_cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_festa_cidades` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `festa_id` bigint(20) NOT NULL,
  `cidade_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_festa_cidades_festa_id_cidade_id_e3758e21_uniq` (`festa_id`,`cidade_id`),
  KEY `app_festa_cidades_cidade_id_a7d0de5e_fk_app_cidade_id` (`cidade_id`),
  CONSTRAINT `app_festa_cidades_cidade_id_a7d0de5e_fk_app_cidade_id` FOREIGN KEY (`cidade_id`) REFERENCES `app_cidade` (`id`),
  CONSTRAINT `app_festa_cidades_festa_id_e12aa131_fk_app_festa_id` FOREIGN KEY (`festa_id`) REFERENCES `app_festa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_festa_cidades`
--

LOCK TABLES `app_festa_cidades` WRITE;
/*!40000 ALTER TABLE `app_festa_cidades` DISABLE KEYS */;
INSERT INTO `app_festa_cidades` VALUES
(1,1,1),
(2,2,2);
/*!40000 ALTER TABLE `app_festa_cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_festa_generos`
--

DROP TABLE IF EXISTS `app_festa_generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_festa_generos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `festa_id` bigint(20) NOT NULL,
  `genero_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_festa_generos_festa_id_genero_id_c5e9a2a2_uniq` (`festa_id`,`genero_id`),
  KEY `app_festa_generos_genero_id_d0b3d537_fk_app_genero_id` (`genero_id`),
  CONSTRAINT `app_festa_generos_festa_id_052d3f44_fk_app_festa_id` FOREIGN KEY (`festa_id`) REFERENCES `app_festa` (`id`),
  CONSTRAINT `app_festa_generos_genero_id_d0b3d537_fk_app_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `app_genero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_festa_generos`
--

LOCK TABLES `app_festa_generos` WRITE;
/*!40000 ALTER TABLE `app_festa_generos` DISABLE KEYS */;
INSERT INTO `app_festa_generos` VALUES
(1,1,1),
(2,2,2);
/*!40000 ALTER TABLE `app_festa_generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_genero`
--

DROP TABLE IF EXISTS `app_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_genero` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_genero`
--

LOCK TABLES `app_genero` WRITE;
/*!40000 ALTER TABLE `app_genero` DISABLE KEYS */;
INSERT INTO `app_genero` VALUES
(1,'Eletrônica'),
(2,'Pop'),
(3,'Rock');
/*!40000 ALTER TABLE `app_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario`
--

DROP TABLE IF EXISTS `app_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `apelido` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `consentimento` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario`
--

LOCK TABLES `app_usuario` WRITE;
/*!40000 ALTER TABLE `app_usuario` DISABLE KEYS */;
INSERT INTO `app_usuario` VALUES
(1,'pbkdf2_sha256$870000$lUN1aLtiXKI80jJsrCs9eN$D/GY9c9ovCktmNq+a6Fu/uIJcVuxGTEhAEVVje0hCB4=','2025-02-03 19:17:59.294849',1,'admin','','',1,1,'2025-01-30 18:15:23.493724',NULL,'admin@email.com',0),
(5,'pbkdf2_sha256$870000$KNfuc8yUDPBmUR7t61WUaL$KOBRbdljk/TZeWob9G49XofZckh9vLmdakN9QoEbSpI=','2025-02-03 17:07:32.428932',0,'teste','','',0,1,'2025-02-01 17:43:07.980240',NULL,'teste@email.com',0);
/*!40000 ALTER TABLE `app_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario_cidades`
--

DROP TABLE IF EXISTS `app_usuario_cidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_usuario_cidades` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `cidade_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_usuario_cidades_usuario_id_cidade_id_530a00fe_uniq` (`usuario_id`,`cidade_id`),
  KEY `app_usuario_cidades_cidade_id_dd73b823_fk_app_cidade_id` (`cidade_id`),
  CONSTRAINT `app_usuario_cidades_cidade_id_dd73b823_fk_app_cidade_id` FOREIGN KEY (`cidade_id`) REFERENCES `app_cidade` (`id`),
  CONSTRAINT `app_usuario_cidades_usuario_id_e251fed2_fk_app_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario_cidades`
--

LOCK TABLES `app_usuario_cidades` WRITE;
/*!40000 ALTER TABLE `app_usuario_cidades` DISABLE KEYS */;
INSERT INTO `app_usuario_cidades` VALUES
(14,5,2);
/*!40000 ALTER TABLE `app_usuario_cidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario_generos_favoritos`
--

DROP TABLE IF EXISTS `app_usuario_generos_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_usuario_generos_favoritos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `genero_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_usuario_generos_favoritos_usuario_id_genero_id_0668496b_uniq` (`usuario_id`,`genero_id`),
  KEY `app_usuario_generos__genero_id_77b9d7bb_fk_app_gener` (`genero_id`),
  CONSTRAINT `app_usuario_generos__genero_id_77b9d7bb_fk_app_gener` FOREIGN KEY (`genero_id`) REFERENCES `app_genero` (`id`),
  CONSTRAINT `app_usuario_generos__usuario_id_ee58af6e_fk_app_usuar` FOREIGN KEY (`usuario_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario_generos_favoritos`
--

LOCK TABLES `app_usuario_generos_favoritos` WRITE;
/*!40000 ALTER TABLE `app_usuario_generos_favoritos` DISABLE KEYS */;
INSERT INTO `app_usuario_generos_favoritos` VALUES
(15,5,1),
(16,5,3);
/*!40000 ALTER TABLE `app_usuario_generos_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario_groups`
--

DROP TABLE IF EXISTS `app_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_usuario_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_usuario_groups_usuario_id_group_id_0f4abc88_uniq` (`usuario_id`,`group_id`),
  KEY `app_usuario_groups_group_id_b38b0d6e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app_usuario_groups_group_id_b38b0d6e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app_usuario_groups_usuario_id_691971dd_fk_app_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario_groups`
--

LOCK TABLES `app_usuario_groups` WRITE;
/*!40000 ALTER TABLE `app_usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario_user_permissions`
--

DROP TABLE IF EXISTS `app_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_usuario_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_usuario_user_permiss_usuario_id_permission_id_6fd11793_uniq` (`usuario_id`,`permission_id`),
  KEY `app_usuario_user_per_permission_id_fbaf8fa8_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_usuario_user_per_permission_id_fbaf8fa8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app_usuario_user_per_usuario_id_d2c76ed5_fk_app_usuar` FOREIGN KEY (`usuario_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario_user_permissions`
--

LOCK TABLES `app_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `app_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add cidade',6,'add_cidade'),
(22,'Can change cidade',6,'change_cidade'),
(23,'Can delete cidade',6,'delete_cidade'),
(24,'Can view cidade',6,'view_cidade'),
(25,'Can add genero',7,'add_genero'),
(26,'Can change genero',7,'change_genero'),
(27,'Can delete genero',7,'delete_genero'),
(28,'Can view genero',7,'view_genero'),
(29,'Can add festa',8,'add_festa'),
(30,'Can change festa',8,'change_festa'),
(31,'Can delete festa',8,'delete_festa'),
(32,'Can view festa',8,'view_festa'),
(33,'Can add user',9,'add_usuario'),
(34,'Can change user',9,'change_usuario'),
(35,'Can delete user',9,'delete_usuario'),
(36,'Can view user',9,'view_usuario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2025-01-30 18:15:49.966814','1','Eletrônica',1,'[{\"added\": {}}]',7,1),
(2,'2025-01-30 18:15:52.755272','2','Pop',1,'[{\"added\": {}}]',7,1),
(3,'2025-01-30 18:15:58.807098','3','Rock',1,'[{\"added\": {}}]',7,1),
(4,'2025-01-30 18:16:28.842904','1','Curitiba',1,'[{\"added\": {}}]',6,1),
(5,'2025-01-30 18:16:32.085190','2','São Paulo',1,'[{\"added\": {}}]',6,1),
(6,'2025-01-30 18:16:50.527093','1','Festa do Verão',1,'[{\"added\": {}}]',8,1),
(7,'2025-01-30 18:17:09.119896','2','Festa da Lucy',1,'[{\"added\": {}}]',8,1),
(8,'2025-01-30 18:41:10.946404','2','teste',3,'',9,1),
(9,'2025-02-01 15:47:13.589396','3','teste',3,'',9,1),
(10,'2025-02-01 15:51:06.348102','4','teste1',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',9,1),
(11,'2025-02-01 17:48:49.358224','4','teste1',3,'',9,1),
(12,'2025-02-01 17:48:49.358251','6','teste2',3,'',9,1),
(13,'2025-02-01 17:48:49.358265','7','teste3',3,'',9,1),
(14,'2025-02-01 17:52:23.835779','8','teste2',3,'',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(6,'app','cidade'),
(8,'app','festa'),
(7,'app','genero'),
(9,'app','usuario'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'contenttypes','contenttype'),
(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2025-01-30 18:13:35.284885'),
(2,'contenttypes','0002_remove_content_type_name','2025-01-30 18:13:35.307718'),
(3,'auth','0001_initial','2025-01-30 18:13:35.392100'),
(4,'auth','0002_alter_permission_name_max_length','2025-01-30 18:13:35.410890'),
(5,'auth','0003_alter_user_email_max_length','2025-01-30 18:13:35.414440'),
(6,'auth','0004_alter_user_username_opts','2025-01-30 18:13:35.419931'),
(7,'auth','0005_alter_user_last_login_null','2025-01-30 18:13:35.423239'),
(8,'auth','0006_require_contenttypes_0002','2025-01-30 18:13:35.424303'),
(9,'auth','0007_alter_validators_add_error_messages','2025-01-30 18:13:35.427774'),
(10,'auth','0008_alter_user_username_max_length','2025-01-30 18:13:35.431440'),
(11,'auth','0009_alter_user_last_name_max_length','2025-01-30 18:13:35.434415'),
(12,'auth','0010_alter_group_name_max_length','2025-01-30 18:13:35.445988'),
(13,'auth','0011_update_proxy_permissions','2025-01-30 18:13:35.449832'),
(14,'auth','0012_alter_user_first_name_max_length','2025-01-30 18:13:35.454117'),
(15,'app','0001_initial','2025-01-30 18:13:35.721788'),
(16,'admin','0001_initial','2025-01-30 18:13:35.762419'),
(17,'admin','0002_logentry_remove_auto_add','2025-01-30 18:13:35.768231'),
(18,'admin','0003_logentry_add_action_flag_choices','2025-01-30 18:13:35.773771'),
(19,'sessions','0001_initial','2025-01-30 18:13:35.791792'),
(20,'app','0002_rename_cidades_usuario_cidade','2025-01-30 18:23:11.845930'),
(21,'app','0003_rename_cidade_usuario_cidades','2025-01-30 18:27:17.529768'),
(22,'app','0004_rename_cidades_usuario_cidade','2025-01-30 18:42:06.066024'),
(23,'app','0005_rename_cidade_usuario_cidades','2025-01-30 18:42:42.780477'),
(24,'app','0006_remove_usuario_cidades_usuario_cidades','2025-02-01 16:18:49.481011'),
(25,'app','0007_festa_carimbo_data_hora_festa_email_responsavel_and_more','2025-02-01 18:57:30.382769');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-02-21 13:54:52
