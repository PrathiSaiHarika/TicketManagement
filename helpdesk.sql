-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: helpdesk
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

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
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `skillid` varchar(20) NOT NULL,
  `skillname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`skillid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES ('e1001','Electrician'),('p1001','Plumber'),('t2001','PC technician');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `tid` int(20) NOT NULL AUTO_INCREMENT,
  `pendingWith` varchar(20) DEFAULT 'm101',
  `createdBy` varchar(20) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(30) DEFAULT 'new',
  PRIMARY KEY (`tid`),
  KEY `pendingWith` (`pendingWith`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`pendingWith`) REFERENCES `user` (`uid`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`createdBy`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'w102','c101','fan problem','noise','2017-06-09 08:21:00','closed'),(2,'w102','c102','current problem','short circuit','2017-06-09 08:23:11','pending'),(13,'w101','c101','fan problem','In the room 101','2017-06-08 11:53:57','pending'),(14,'m101','c101','Tube lights not working','In room no.103','2017-06-09 04:22:48','new'),(15,'w102','c101','xyz','xyz','2017-06-09 08:41:15','closed');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketflow`
--

DROP TABLE IF EXISTS `ticketflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticketflow` (
  `tfid` int(20) NOT NULL AUTO_INCREMENT,
  `tid` int(20) DEFAULT NULL,
  `updateBy` varchar(20) DEFAULT NULL,
  `updatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tfid`),
  KEY `tid` (`tid`),
  KEY `updateBy` (`updateBy`),
  CONSTRAINT `ticketflow_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `ticket` (`tid`),
  CONSTRAINT `ticketflow_ibfk_2` FOREIGN KEY (`updateBy`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketflow`
--

LOCK TABLES `ticketflow` WRITE;
/*!40000 ALTER TABLE `ticketflow` DISABLE KEYS */;
INSERT INTO `ticketflow` VALUES (2,1,'w102','2017-06-08 11:44:18','Please do as early as possible.'),(7,1,'w102','2017-06-08 13:15:48','Please do as early as possible.'),(9,1,'w102','2017-06-09 04:23:37','Please do early'),(12,2,'w102','2017-06-09 08:23:11','Please do as early as possible.'),(13,15,'w102','2017-06-09 08:40:59','do');
/*!40000 ALTER TABLE `ticketflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uname` varchar(30) DEFAULT NULL,
  `uid` varchar(20) NOT NULL,
  `password` varbinary(500) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `phno` varchar(20) DEFAULT NULL,
  `typeofuser` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('jyothi','c101','ÆË“K9paO\në⁄≤õM‰','jyothi@gmail.com','9876554435','client'),('pooja','c102','ÆË“K9paO\në⁄≤õM‰','pooja@gmail.com','9876554476','client'),('nikhitha','c103','ÆË“K9paO\në⁄≤õM‰','nikitha@gmail.com','9876554548','client'),('shravani','c104','QósÎ≈ZıyÏv]3ke','shravani@gmail.com','9876554648','client'),('nithya','m101',' -b˜µóÂ;≤uç∞w','nithya@gmail.com','9876554467','admin'),('harika','w101','P…àÆPKûÖœ g<œ“','harika@gmail.com','9876554498','resolver'),('nithisha','w102','P…àÆPKûÖœ g<œ“','nithisha@gmail.com','9876551234','resolver'),('niharika','w103','P…àÆPKûÖœ g<œ“','niharika@gmail.c0m','9988597260','resolver'),('vidya','w104','‰ú¯ M-rb∫ÆjèÕü¡ı','vidya@gmail.c0m','9988595260','resolver');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userskill`
--

DROP TABLE IF EXISTS `userskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userskill` (
  `uid` varchar(20) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `skillname` varchar(20) DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `userskill_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userskill`
--

LOCK TABLES `userskill` WRITE;
/*!40000 ALTER TABLE `userskill` DISABLE KEYS */;
INSERT INTO `userskill` VALUES ('w101','niharika','plumber'),('w102','harika','Electrician'),('w103','nithisha','PC technician');
/*!40000 ALTER TABLE `userskill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-09 14:21:56
