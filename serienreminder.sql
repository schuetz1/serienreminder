-- MySQL dump 10.15  Distrib 10.0.20-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: serienreminder
-- ------------------------------------------------------
-- Server version	10.0.20-MariaDB

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
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (9,'franz','franz','franz@web.de','franz@web.de',1,'r1jm3lu0tdwgw48swwg4gcccco8kg04','$2y$13$7Rfft0p.kGZxKMXInCekKO9aAVGsI5D2DH4JEXC56ziAqrChYVKL6','2016-03-08 22:35:19',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(10,'ksc','ksc','karstenschuetz@web.de','karstenschuetz@web.de',1,'raf0u3vvtass4gsosgs44ggo48s4cs8','$2y$13$wUGBEFcDJipqKEXCvGOH.uAjzlMdD7aaYAc3rPvrGyxj8ogCAb6Se','2016-03-08 22:37:15',0,0,NULL,'XGC_LnWJ7PAZZLMLC8wn7r8tcPoBOmO9V7xxxCF0K9U','2016-04-01 09:22:52','a:0:{}',0,NULL),(11,'123','123','biblabaf@web.de','biblabaf@web.de',1,'2s40p0an11wkowsko0owgggog40g4sw','$2y$13$FCfTFd0Zkmldgz/C8Eulk.bKaeMakmE6NoeyQS3NgfvjViz3RUYoa','2016-03-08 23:51:35',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(12,'1234','','schuetz2011@gmail.com','schuetz2011@gmail.com',1,'hcza3wy92n4g44okwowc8ws0o4004oc','$2y$13$w./CXxipf4axnrz7ao4Ujer6fCZ0xsjxLQxTwCOXqeVPAgFfzl7OW','2016-03-29 13:26:45',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(13,'schuetz','schuetz','schuetz.sarah@web.de','schuetz.sarah@web.de',1,'dkpvflinbrc4wwkcgocwc84c8go44o8','$2y$13$c4QaR1BP566QZ4mzd1tKEuyydOAzDDOQduHJjyySMMKnfewBTP8Uy','2016-03-12 10:00:49',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL),(14,'test1','test1','test1@web.de','test1@web.de',1,'cmy2rhq3kxcsks84w8goc4k4gs08kwg','$2y$13$cCb8wnFGOvpZhkMM.3UyJeCYrZG42TAx7leiHNyg4qC4SkLM6Cwkq','2016-04-04 16:00:22',0,0,NULL,'NULl','2016-04-01 09:08:28','a:0:{}',0,NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `publish_date` datetime NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (2,'Lost And Found Music Studios','de','2016-04-04 00:00:00','http://serienjunkies.org/lost-and-found-music-studios/lost-and-found-music-studios-staffel-1-web-sd720p/'),(3,'Der Prinz Von Bel Air','de','2016-04-04 00:00:00','http://serienjunkies.org/der-prinz-von-bel-air/der-prinz-von-bel-air-staffel-6-dvd-sddvd9/'),(4,'Supernatural','de','2016-04-04 00:00:00','http://serienjunkies.org/supernatural/supernatural-staffel-9-blu-ray-sd720p1080p/'),(5,'Devil May Cry','de','2016-04-03 00:00:00','http://serienjunkies.org/devil-may-cry/devil-may-cry-staffel-1-dvdrip-xvid/'),(6,'Mit Schirm Charme Und Melone','de','2016-04-03 00:00:00','http://serienjunkies.org/mit-schirm-charme-und-melone/mit-schirm-charme-und-melone-staffel-6-dtv-xvid/'),(7,'Relic Hunter','de','2016-03-27 00:00:00','http://serienjunkies.org/relic-hunter/'),(8,'Bloodline','de','2016-03-28 00:00:00','http://serienjunkies.org/bloodline/bloodline-staffel-1-web-sd720p1080p/'),(9,'Game Of Thrones','de','2016-03-31 00:00:00','http://serienjunkies.org/game-of-thrones/game-of-thrones-staffel-5-blu-rayweb-dl-sd720p1080p/'),(10,'The Guardian','de','2016-03-29 00:00:00','http://serienjunkies.org/the-guardian/the-guardian-retter-mit-herz-staffel-1-dvdhdtv-sd720p/'),(11,'Freaks And Geeks','en','2016-04-03 00:00:00','http://serienjunkies.org/freaks-and-geeks/freaks-and-geeks-season-1-dvdrip-xvid/'),(12,'Greys Anatomy','de','2016-03-23 00:00:00','http://serienjunkies.org/greys-anatomy/greys-anatomy-staffel-11-dvdweb-dl-sd720p1080p/'),(13,'The Ranch','de','2016-04-02 00:00:00','http://serienjunkies.org/the-ranch/the-ranch-staffel-1-web-dl-sd720p/'),(14,'Chips','de','2016-03-28 00:00:00','http://serienjunkies.org/chips/chips-staffel-3-6-hdtvweb-dl-sd720p1080p/'),(15,'Grosstadtrevier','de','2016-03-27 00:00:00','http://serienjunkies.org/grosstadtrevier/grosstadtrevier-staffeln-1-5-dvd-sd/'),(16,'Hart Aber Herzlich','de','2016-04-02 00:00:00','http://serienjunkies.org/hart-aber-herzlich/hart-aber-herzlich-staffel-5-dtv-xvid/'),(17,'The Night Manager','de','2016-04-02 00:00:00','http://serienjunkies.org/the-night-manager/the-night-manager-staffel-1-bd-sd720p1080p/'),(18,'Dusk Maiden Of Amnesia','de','2016-04-01 00:00:00','http://serienjunkies.org/dusk-maiden-of-amnesia/dusk-maiden-of-amnesia-staffel-1-blu-ray-720p1080p/'),(19,'Ehe Ist','de','2016-04-01 00:00:00','http://serienjunkies.org/ehe-ist/ehe-ist-staffel-1-dvdrip-xvid/'),(20,'Rage Of Bahamut Genesis','de','2016-04-01 00:00:00','http://serienjunkies.org/rage-of-bahamut-genesis/rage-of-bahamut-genesis-complete-blu-ray-sd720p/'),(21,'Tengen Toppa Gurren Lagann','de','2016-04-01 00:00:00','http://serienjunkies.org/tengen-toppa-gurren-lagann/tengen-toppa-gurren-lagann-maiking-break-through-gurren-lagann-volume-1-dvdrip-h264/'),(22,'Sons Of Anarchy','de','2016-03-31 00:00:00','http://serienjunkies.org/sons-of-anarchy/sons-of-anarchy-staffel-7-blu-ray-720p1080p/'),(23,'To Love Ru','de','2016-04-01 00:00:00','http://serienjunkies.org/to-love-ru/to-love-ru-complete-hdtv-h264/'),(24,'100 Things To Do Before High School','en','2016-04-01 00:00:00','http://serienjunkies.org/100-things-to-do-before-high-school/100-things-to-do-before-high-school-season-1-hdtvweb-dl-sd720p/'),(25,'The Cyanide And Happiness Show','en','2016-04-01 00:00:00','http://serienjunkies.org/the-cyanide-and-happiness-show/the-cyanide-and-happiness-show-season-2-web-dl-1080p/'),(26,'Dr Klein','de','2016-03-31 00:00:00','http://serienjunkies.org/dr-klein/dr-klein-staffel-2-hdtv-sd720p/'),(27,'Die Profis','de','2016-03-29 00:00:00','http://serienjunkies.org/die-profis/die-profis-staffel-1-dvd-sddvd9/'),(28,'Seaquest Dsv','en','2016-03-31 00:00:00','http://serienjunkies.org/seaquest-dsv/seaquest-dsv-season-1-3-dvd-sd/'),(29,'Sally Bollywood','de','2016-03-30 00:00:00','http://serienjunkies.org/sally-bollywood/sally-bollywood-staffel-1-dvd-sd/'),(30,'Seaquest Dsv','de','2016-03-30 00:00:00','http://serienjunkies.org/seaquest-dsv/seaquest-dsv-staffel-1-2-dtv-sd/'),(31,'Das Geheimnis Des Sagala','de','2016-03-29 00:00:00','http://serienjunkies.org/das-geheimnis-des-sagala/das-geheimnis-des-sagala-complete-dtv-xvid/'),(32,'Magi Nation','de','2016-03-29 00:00:00','http://serienjunkies.org/magi-nation/magi-nation-complete-dtv-xvid/'),(33,'Ruby Gloom','de','2016-03-29 00:00:00','http://serienjunkies.org/ruby-gloom/ruby-gloom-staffel-1-dvd-sd/'),(34,'Ein Schloss Am Worthersee','de','2016-03-23 00:00:00','http://serienjunkies.org/ein-schloss-am-worthersee/ein-schloss-am-worthersee-staffel-1-dvd-sd/'),(35,'Verruckt Nach Clara','de','2016-03-28 00:00:00','http://serienjunkies.org/verruckt-nach-clara/verruckt-nach-clara-complete-dtv-xvid/'),(36,'Mord Auf Shetland','de','2016-03-28 00:00:00','http://serienjunkies.org/mord-auf-shetland/mord-auf-shetland-staffel-1-dvdhdtv-sd720p/'),(37,'Under The Dome','de','2016-03-28 00:00:00','http://serienjunkies.org/under-the-dome/under-the-dome-staffel-3-web-dlblu-ray-sd720p1080pbd50/'),(38,'Faking It 2014','en','2016-03-28 00:00:00','http://serienjunkies.org/faking-it-2014/faking-it-2014-season-2-hdtvweb-dl-sd720p/'),(39,'Serie','de','2016-03-27 00:00:00','http://serienjunkies.org/serie/grosstadtrevier/'),(40,'Izombie','de','2016-03-27 00:00:00','http://serienjunkies.org/izombie/izombie-staffel-1-hdtvweb-dl-sd720p1080p/'),(41,'House Of Cards','en','2016-03-27 00:00:00','http://serienjunkies.org/house-of-cards/house-of-cards-season-3-blu-ray-sd720p1080p/'),(42,'The Next Step','en','2016-03-27 00:00:00','http://serienjunkies.org/the-next-step/'),(43,'Modern Family','de','2016-03-25 00:00:00','http://serienjunkies.org/modern-family/modern-family-staffel-5-web-sd720p1080p/'),(44,'Men In Black','de','2016-03-25 00:00:00','http://serienjunkies.org/men-in-black/men-in-black-staffel-3-4-dtv-sd/'),(45,'Parades End','de','2016-03-25 00:00:00','http://serienjunkies.org/parades-end/parades-end-der-letzte-gentleman-staffel-1-hdtv-xvid720p/'),(46,'Sofies Welt','de','2016-03-25 00:00:00','http://serienjunkies.org/sofies-welt/sofies-welt-complete-dvd-sd/'),(47,'Rookie Blue','en','2016-03-25 00:00:00','http://serienjunkies.org/rookie-blue/rookie-blue-season-5-6-dvdweb-sd/'),(48,'The Expanse','en','2016-03-23 00:00:00','http://serienjunkies.org/the-expanse/the-expanse-season-1-hdtvweb-dl-sd720p1080p/'),(49,'So Weit Die Fuse Tragen','de','2016-03-24 00:00:00','http://serienjunkies.org/so-weit-die-fuse-tragen/so-weit-die-fuse-tragen-1959-complete-vhsrip-xvid-2/'),(50,'Angie Tribeca','de','2016-03-24 00:00:00','http://serienjunkies.org/angie-tribeca/angie-tribeca-staffel-1-hdtv-sd720p/'),(51,'Die Wir An Jenem Tag Sahen','de','2016-03-24 00:00:00','http://serienjunkies.org/die-wir-an-jenem-tag-sahen/anohana-die-blume-die-wir-an-jenem-tag-sahen-staffel-1-blu-ray-sd720p/'),(52,'Die Fantastische Welt Von Gumball','de','2016-03-24 00:00:00','http://serienjunkies.org/die-fantastische-welt-von-gumball/die-fantastische-welt-von-gumball-staffel-3-web-dl-sd720p/'),(53,'Mr Robot','de','2016-03-23 00:00:00','http://serienjunkies.org/mr-robot/mr-robot-staffel-1-web-dl-sd720p1080p/'),(54,'Party Of Five','de','2016-03-24 00:00:00','http://serienjunkies.org/party-of-five/party-of-five-staffel-2-dvdrip-xvid/'),(55,'Power Rangers Megaforce','de','2016-03-24 00:00:00','http://serienjunkies.org/power-rangers-megaforce/power-rangers-super-megaforce-staffel-2-hdtv-sd720p/'),(56,'Task Force Police','de','2016-03-24 00:00:00','http://serienjunkies.org/task-force-police/task-force-police-volume-1-dvd-sd/'),(57,'Tom Jerry','de','2016-03-24 00:00:00','http://serienjunkies.org/tom-jerry/tom-jerry-staffel-1-dvd-sd/'),(58,'Hawaii Five 0','de','2016-04-04 00:00:00','http://serienjunkies.org/hawaii-five-0/hawaii-five-0-staffel-5-web-dl-sd720p1080p/');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `series_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,14,58);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-04 23:26:55
