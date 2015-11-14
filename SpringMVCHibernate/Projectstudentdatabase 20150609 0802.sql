-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.42


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema studentdatabase
--

CREATE DATABASE IF NOT EXISTS studentdatabase;
USE studentdatabase;

--
-- Definition of table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gender` char(1) DEFAULT 'M',
  `dob` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`,`name`,`address`,`gender`,`dob`,`email`,`mobile`,`phone`) VALUES 
 (15,'Md. Anowar Hossain','Comilla','M','1988-06-15 00:00:00','anowar.cu88@gmail.com','01813097183',NULL),
 (17,'Md. Saiful Islam','Comilla','M','1988-07-07 00:00:00','anowar.cu88@gmail.com','01724967573',NULL),
 (18,'Md. Limon ','dhaka','M','1988-06-15 00:00:00','anowar.cu88@gmail.com','01724967573',NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;


--
-- Definition of table `sivalabs`
--

DROP TABLE IF EXISTS `sivalabs`;
CREATE TABLE `sivalabs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `gender` char(1) DEFAULT 'M',
  `dob` datetime DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sivalabs`
--

/*!40000 ALTER TABLE `sivalabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sivalabs` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
