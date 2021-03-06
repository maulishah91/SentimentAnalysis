-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: stressAnalytics
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Current Database: `stressAnalytics`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `stressAnalytics` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `stressAnalytics`;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `email` varchar(200) DEFAULT NULL,
  `twitter_handle` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universityScore`
--

DROP TABLE IF EXISTS `universityScore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universityScore` (
  `university` varchar(200) DEFAULT NULL,
  `positiveScore` int(20) DEFAULT NULL,
  `negativeScore` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universityScore`
--

LOCK TABLES `universityScore` WRITE;
/*!40000 ALTER TABLE `universityScore` DISABLE KEYS */;
INSERT INTO `universityScore` VALUES ('UCLA',10,45),('USC',35,123),('Harvard',67,11),('Stanford',440,233),('Yale',5,343),('CMU',76,545),('UCI',55,44),('NCSU',40,66),('UCSB',350,23),('TAMU',79,566);
/*!40000 ALTER TABLE `universityScore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universityStateMapping`
--

DROP TABLE IF EXISTS `universityStateMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universityStateMapping` (
  `university` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universityStateMapping`
--

LOCK TABLES `universityStateMapping` WRITE;
/*!40000 ALTER TABLE `universityStateMapping` DISABLE KEYS */;
INSERT INTO `universityStateMapping` VALUES ('UCLA','CA'),('USC','CA'),('TAMU','TX'),('UCI','CA'),('NCSU','NC');
/*!40000 ALTER TABLE `universityStateMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wordCloud`
--

DROP TABLE IF EXISTS `wordCloud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wordCloud` (
  `tagName` varchar(200) DEFAULT NULL,
  `word` varchar(200) DEFAULT NULL,
  `size` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wordCloud`
--

LOCK TABLES `wordCloud` WRITE;
/*!40000 ALTER TABLE `wordCloud` DISABLE KEYS */;
INSERT INTO `wordCloud` VALUES ('ucla','Bruins',50),('ucla','Pauley Pavilion',30),('ucla','Exams',70),('ucla','Powell',40),('ucla','BruinWalk',40),('ucla','Henry Samueli',10),('ucla','Ronald Reagan',40);
/*!40000 ALTER TABLE `wordCloud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


--
-- Table structure for table `timeVis`
--

DROP TABLE IF EXISTS `timeVis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeVis` (
  `university` varchar(200),
  `dailyNegativeTweetCount` float(7,2),
  `startTime` varchar(200)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeVis`
--

LOCK TABLES `timeVis` WRITE;
/*!40000 ALTER TABLE `wordCloud` DISABLE KEYS */;
INSERT INTO `timeVis` VALUES ('UCLA',50,"1465945816"),('USC',30,"1465945816"),('UCLA',70,"1466943072"),('USC',40,"1466943072");
/*!40000 ALTER TABLE `wordCloud` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE IF NOT EXISTS `hashtags` (
  `id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  `university` varchar(50) DEFAULT NULL,
  `hashtags` varchar(100) DEFAULT NULL,
  `since_id` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `tweets` (
  id INT(20) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tweetId varchar(30),
  university varchar(50),
  raw_timestamp varchar(30),
  normalized_timestamp varchar(30),
  sentiment TINYINT(2)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into hashtags values(1, 'UCLA', '#UCLA','1'), (2, 'Stanford', '#Stanford','1'), (3, 'MIT', '#MIT','1'), (4, 'NYU', '#NYU','1'), (5, 'UCB', '#UCB','1'), (6, 'USC','#USC','1'), (7, 'Columbia', '#Columbia','1'), (8, 'Cornell', '#Cornell','1'), (9, 'CMU', '#CMU','1'), (10, 'Yale', '#Yale','1');