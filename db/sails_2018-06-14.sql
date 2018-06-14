# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: sails
# Generation Time: 2018-06-14 10:05:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table archive
# ------------------------------------------------------------

DROP TABLE IF EXISTS `archive`;

CREATE TABLE `archive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` bigint(20) DEFAULT NULL,
  `fromModel` varchar(255) DEFAULT NULL,
  `originalRecord` longtext,
  `originalRecordId` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`createdAt`, `updatedAt`, `id`, `name`, `email`, `state`)
VALUES
	(1528958409728,1528970568321,1,'Sinh 2','sinhpv86@gmail.com','HN'),
	(1528958556511,1528958556511,2,'PHP','phpsinhpv@gmail.com','SG'),
	(1528967023879,1528967023879,3,'Sinh','dev2@gmail.com','NB'),
	(1528967129909,1528967129909,4,'Sinh','dev@gmail.com','NB'),
	(1528967376801,1528967376801,6,'Sinh','admin@gmail.com','NB'),
	(1528968118785,1528968118785,7,'Tay','thattu74@gmail.com','HT');

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `createdAt` bigint(20) DEFAULT NULL,
  `updatedAt` bigint(20) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `isSuperAdmin` tinyint(1) DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetTokenExpiresAt` double DEFAULT NULL,
  `stripeCustomerId` varchar(255) DEFAULT NULL,
  `hasBillingCard` tinyint(1) DEFAULT NULL,
  `billingCardBrand` varchar(255) DEFAULT NULL,
  `billingCardLast4` varchar(255) DEFAULT NULL,
  `billingCardExpMonth` varchar(255) DEFAULT NULL,
  `billingCardExpYear` varchar(255) DEFAULT NULL,
  `emailProofToken` varchar(255) DEFAULT NULL,
  `emailProofTokenExpiresAt` double DEFAULT NULL,
  `emailStatus` varchar(255) DEFAULT NULL,
  `emailChangeCandidate` varchar(255) DEFAULT NULL,
  `tosAcceptedByIp` varchar(255) DEFAULT NULL,
  `lastSeenAt` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`createdAt`, `updatedAt`, `id`, `emailAddress`, `password`, `fullName`, `isSuperAdmin`, `passwordResetToken`, `passwordResetTokenExpiresAt`, `stripeCustomerId`, `hasBillingCard`, `billingCardBrand`, `billingCardLast4`, `billingCardExpMonth`, `billingCardExpYear`, `emailProofToken`, `emailProofTokenExpiresAt`, `emailStatus`, `emailChangeCandidate`, `tosAcceptedByIp`, `lastSeenAt`)
VALUES
	(1528954917782,1528954917782,1,'admin@example.com','$2a$10$nFM.KmUcgn/6OpXam/kjRu2fBf30telZF6ieVUfcTYf1lSKqpqK.m','Ryan Dahl',1,'',0,'',0,'','','','','',0,'confirmed','','',0),
	(1528956143710,1528963951508,2,'sinhpv86@gmail.com','$2a$10$3JyWvZ3OMgaa8YIcgpVIVeKKbaedDO8PNPu0696GxEKG0/xqD/VvW','Sinh',0,'',0,'',0,'','','','','',0,'confirmed','','::1',1528963951507);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
