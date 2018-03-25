/*
SQLyog Enterprise - MySQL GUI v7.02 
MySQL - 5.0.45-community-nt : Database - pgi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`pgi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pgi`;

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL auto_increment,
  `notification` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`notification_id`),
  KEY `notify_user_id` (`user_id`),
  CONSTRAINT `notify_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `notifications` */

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL auto_increment,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`status_id`,`status`) values (1,'Sent'),(2,'Received'),(3,'Pending'),(4,'Failed'),(5,'Added');

/*Table structure for table `transaction_histories` */

DROP TABLE IF EXISTS `transaction_histories`;

CREATE TABLE `transaction_histories` (
  `transaction_id` int(11) NOT NULL auto_increment,
  `status_id` int(11) NOT NULL,
  `amount_sent` decimal(5,2) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`transaction_id`),
  KEY `status_id` (`status_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `transaction_histories_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`),
  CONSTRAINT `transaction_histories_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `transaction_histories_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `transaction_histories` */

insert  into `transaction_histories`(`transaction_id`,`status_id`,`amount_sent`,`sender_id`,`receiver_id`,`date`) values (1,1,'18.00',2,1,'2018-03-25 02:49:06'),(2,1,'123.00',1,2,'2018-03-25 03:02:03'),(3,1,'232.00',2,1,'2018-03-25 03:10:13'),(4,1,'120.00',2,1,'2018-03-25 03:16:59'),(5,1,'231.00',1,2,'2018-03-25 03:30:21'),(6,1,'850.00',2,1,'2018-03-25 15:50:52'),(7,1,'550.00',1,2,'2018-03-25 15:57:47'),(8,1,'250.00',1,2,'2018-03-25 16:04:18'),(9,1,'350.00',1,2,'2018-03-25 16:05:50'),(10,1,'450.00',1,2,'2018-03-25 16:07:42'),(11,1,'420.00',1,2,'2018-03-25 16:16:49'),(12,1,'25.00',2,1,'2018-03-25 23:14:36'),(13,1,'150.00',1,2,'2018-03-25 23:20:59'),(14,1,'121.00',2,1,'2018-03-25 23:25:43'),(15,1,'240.00',2,1,'2018-03-25 23:27:19'),(16,1,'124.00',2,1,'2018-03-25 23:38:48'),(17,1,'221.00',1,2,'2018-03-25 23:40:17'),(18,1,'160.00',2,1,'2018-03-25 23:43:03'),(19,1,'200.00',3,2,'2018-03-25 23:49:30'),(20,1,'100.00',3,1,'2018-03-25 23:49:44'),(21,1,'400.00',1,2,'2018-03-25 23:51:27'),(22,1,'300.00',1,3,'2018-03-25 23:51:46'),(23,1,'114.00',2,3,'2018-03-25 23:52:55'),(24,1,'250.00',1,3,'2018-03-26 00:32:20');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(50) NOT NULL,
  `mobile_no` decimal(10,0) default NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `login_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `logout_time` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_name`,`mobile_no`,`email_id`,`password`,`login_time`,`logout_time`) values (1,'Aditya','7987286318','adi@gmail.com','12121993','2018-03-26 00:32:24','2018-03-26 00:32:24'),(2,'nicky','9876543210','nick.vishwa@gmail.com','18021994','2018-03-26 00:24:56','2018-03-26 00:24:56'),(3,'ganesh','9999911111','neel.up3@gmail.com','01012001','2018-03-26 00:33:39','2018-03-26 00:33:39');

/*Table structure for table `wallets` */

DROP TABLE IF EXISTS `wallets`;

CREATE TABLE `wallets` (
  `wallet_id` int(11) NOT NULL auto_increment,
  `balance` decimal(5,2) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`wallet_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wallets` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
