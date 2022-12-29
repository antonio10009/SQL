-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'Marge','Turner','78961857','reymundo05@example.com'),(2,'Maribel','Corwin','93057543','ferry.elva@example.org'),(3,'Cleve','Harvey','01142294','kertzmann.leora@example.com'),(4,'Alexa','Hauck','14832495','block.dayne@example.net'),(5,'Ruthie','Wuckert','53810684','davis.constance@example.net'),(6,'Aurelie','Bosco','55607835','jlittle@example.org'),(7,'Harmon','Schmidt','16761467','ubarton@example.net'),(8,'Rickie','Feil','97124381','lavern.willms@example.org'),(9,'Jaquelin','Daniel','66936614','nestor.carter@example.com'),(10,'Lemuel','Schiller','12002806','taryn92@example.net'),(11,'Dane','Effertz','52798319','jaycee.quitzon@example.org'),(12,'Braeden','Douglas','51356627','qschulist@example.net'),(13,'Jessy','Wolff','80108056','vilma.o\'keefe@example.com'),(14,'Nelda','Connelly','60808905','immanuel85@example.org'),(15,'Waylon','Cronin','04269563','alvina50@example.com'),(16,'Alfredo','Considine','81717608','santina56@example.net'),(17,'Terence','Predovic','87023256','hessel.horace@example.net'),(18,'Lily','Reichert','84421857','keyon34@example.org'),(19,'Clemens','Sawayn','64510716','ehowe@example.net'),(20,'Ernestine','Ferry','33533021','yost.caleigh@example.com'),(21,'Sammy','Harris','26776434','pjohnston@example.net'),(22,'Xzavier','McCullough','31428262','mthiel@example.net'),(23,'Georgiana','Larson','69971340','tremblay.hilma@example.net'),(24,'Adelia','Dooley','88082088','bartholome01@example.net'),(25,'Filiberto','Metz','96832524','eleonore.volkman@example.org'),(26,'Georgianna','McGlynn','04998487','logan52@example.com'),(27,'Ocie','Torp','50463885','lueilwitz.oral@example.com'),(28,'Tania','Metz','84935084','hoeger.johanna@example.net'),(29,'Sven','Hane','81528616','tressie.toy@example.org'),(30,'Leonardo','Stracke','93035371','muller.maureen@example.org');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-05 22:05:59
