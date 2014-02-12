/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.12-log : Database - dbproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbproject` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbproject`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `pin_id` int(11) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  KEY `comments_ibfk_2` (`pin_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`pin_id`) REFERENCES `pins` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `comments` */

LOCK TABLES `comments` WRITE;

UNLOCK TABLES;

/*Table structure for table `follow_pinboard` */

DROP TABLE IF EXISTS `follow_pinboard`;

CREATE TABLE `follow_pinboard` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stream_id` int(11) DEFAULT NULL,
  `pinboard_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `follow_pinboard_ibfk_3` (`pinboard_id`),
  KEY `follow_pinboard_ibfk_2` (`stream_id`),
  CONSTRAINT `follow_pinboard_ibfk_2` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `follow_pinboard_ibfk_3` FOREIGN KEY (`pinboard_id`) REFERENCES `pinboards` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `follow_pinboard` */

LOCK TABLES `follow_pinboard` WRITE;

insert  into `follow_pinboard`(`row_id`,`created`,`stream_id`,`pinboard_id`) values (1,'2013-11-24 20:12:39',1,1),(2,'2013-11-24 20:12:57',1,2),(3,'2013-11-24 20:13:13',1,4),(4,'2013-11-25 03:55:57',2,1),(5,'2013-11-25 03:55:57',2,2),(6,'2013-11-25 03:55:57',2,4);

UNLOCK TABLES;

/*Table structure for table `friend_request` */

DROP TABLE IF EXISTS `friend_request`;

CREATE TABLE `friend_request` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `friend_id` varchar(50) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `status` enum('Rejected','Pending') DEFAULT 'Pending',
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `friend_request_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `friend_request_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `friend_request` */

LOCK TABLES `friend_request` WRITE;

insert  into `friend_request`(`row_id`,`created`,`user_id`,`friend_id`,`message`,`status`) values (1,'2013-11-24 20:06:38','Bharath','prasad','Accept my request','Pending'),(2,'2013-11-24 20:07:14','prasad','Santosh','For testing','Rejected'),(3,'2013-12-12 17:28:27','Pavan','Bharath','Test','Rejected'),(4,'2013-12-13 15:29:19','Sunay','Bharath','Test','Pending');

UNLOCK TABLES;

/*Table structure for table `friends` */

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `friend_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  KEY `friend_id` (`friend_id`),
  CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `friends` */

LOCK TABLES `friends` WRITE;

insert  into `friends`(`row_id`,`created`,`user_id`,`friend_id`) values (3,'2013-11-24 20:04:44','Pavan','prasad'),(4,'2013-11-24 20:04:59','prasad','Pavan'),(5,'2013-11-24 20:05:54','Santosh','Sunay'),(6,'2013-11-24 20:06:18','Sunay','Santosh'),(9,'2013-11-25 03:42:32','Bharath','Rohith'),(10,'2013-11-25 03:42:32','Rohith','Bharath'),(13,'2013-12-13 12:59:01','Brat','Bharath'),(14,'2013-12-13 12:59:01','Bharath','Brat');

UNLOCK TABLES;

/*Table structure for table `likes` */

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pin_id` int(11) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `root_pin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  KEY `likes_ibfk_3` (`pin_id`),
  KEY `likes_ibfk_5` (`root_pin_id`),
  CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`pin_id`) REFERENCES `pins` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_5` FOREIGN KEY (`root_pin_id`) REFERENCES `pins` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `likes` */

LOCK TABLES `likes` WRITE;

insert  into `likes`(`row_id`,`created`,`pin_id`,`user_id`,`root_pin_id`) values (7,'2013-12-12 22:07:15',9,'Bharath',9),(10,'2013-12-13 02:00:54',1,'Bharath',1),(13,'2013-12-13 14:55:51',29,'Bharath',29);

UNLOCK TABLES;

/*Table structure for table `pictures` */

DROP TABLE IF EXISTS `pictures`;

CREATE TABLE `pictures` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `file_name` varchar(50) DEFAULT NULL,
  `url_pic` varchar(1000) DEFAULT NULL,
  `url_site` varchar(1000) DEFAULT NULL,
  `total_likes` int(11) DEFAULT '0',
  `user_id` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pictures_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

/*Data for the table `pictures` */

LOCK TABLES `pictures` WRITE;

insert  into `pictures`(`row_id`,`created`,`file_name`,`url_pic`,`url_site`,`total_likes`,`user_id`,`title`,`description`) values (1,'2013-12-13 02:00:54','1.jpg','http://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Emma_Watson_2013.jpg/220px-Emma_Watson_2013.jpg','http://en.wikipedia.org/wiki/Emma_Watson',1,'Bharath','Emma','Cool Pics'),(2,'2013-12-12 12:21:22','2.jpg','http://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Lady_Gaga_BTW_Ball_Antwerp_02.jpg/220px-Lady_Gaga_BTW_Ball_Antwerp_02.jpg','http://en.wikipedia.org/wiki/Lady_Gaga',1,'prasad','Singers','Fav Singer Female'),(3,'2013-12-12 09:52:15','3.jpg','http://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Believe_Tour_7%2C_2012.jpg/220px-Believe_Tour_7%2C_2012.jpg','http://en.wikipedia.org/wiki/Justin_Bieber',1,'prasad','Singers','Fav Singer Male'),(4,'2013-12-01 21:18:51','4.jpg','http://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Brad_Pitt_5%2C_2013.jpg/220px-Brad_Pitt_5%2C_2013.jpg','http://en.wikipedia.org/wiki/Brad_Pitt',1,'Bharath','Pitt','Cool Pics'),(5,'2013-12-12 05:40:37','5.jpg','http://upload.wikimedia.org/wikipedia/en/thumb/d/d8/Game_of_Thrones_title_card.jpg/250px-Game_of_Thrones_title_card.jpg','http://en.wikipedia.org/wiki/Game_of_Thrones',3,'Santosh','GOT',NULL),(6,'2013-12-01 21:19:28','6.jpg','http://upload.wikimedia.org/wikipedia/commons/7/74/Mutthuraj.jpg','http://en.wikipedia.org/wiki/Rajkumar_%28actor%29',2,'Sunay','Dr. Raj',NULL),(7,'2013-12-01 21:19:44','7.jpg','http://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Modern_WhiteBullyKutta.jpg/220px-Modern_WhiteBullyKutta.jpg','http://en.wikipedia.org/wiki/Bully_Cutha',0,'Pavan','Dog','Bully Kutta'),(8,'2013-12-12 22:07:15','8.jpg','http://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Kimi_Raikkonen_won_2007_Brazil_GP.jpg/800px-Kimi_Raikkonen_won_2007_Brazil_GP.jpg','http://en.wikipedia.org/wiki/File:Kimi_Raikkonen_won_2007_Brazil_GP.jpg',1,'Rohith','Ferrari','Cool Cars'),(64,'2013-12-13 13:55:58','64.','http://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Jackie_Chan_by_Gage_Skidmore.jpg/220px-Jackie_Chan_by_Gage_Skidmore.jpg','http://en.wikipedia.org/wiki/Jackie_Chan',0,'Bharath','Jackie',''),(65,'2013-12-13 14:55:52','65.jpg','','',1,'Bharath','Demo 1',''),(66,'2013-12-13 15:10:07','66.','http://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Jackie_Chan_by_Gage_Skidmore.jpg/220px-Jackie_Chan_by_Gage_Skidmore.jpg','http://en.wikipedia.org/wiki/Jackie_Chan',0,'Sunay','Just Me','asvs'),(67,'2013-12-13 15:54:23','67.jpg','','',0,'Bharath','Gohan',''),(68,'2013-12-13 17:04:21','68.','http://upload.wikimedia.org/wikipedia/commons/f/f8/Western_Derby_Eland_(Taurotragus_derbianus_derbianus)_3_crop.jpg','scc',0,'Bharath','Bharath','sddvssdaf'),(69,'2013-12-13 17:27:27','69.','http://upload.wikimedia.org/wikipedia/commons/f/f8/Western_Derby_Eland_(Taurotragus_derbianus_derbianus)_3_crop.jpg','',0,'Bharath','Animal','sdvsv');

UNLOCK TABLES;

/*Table structure for table `pinboards` */

DROP TABLE IF EXISTS `pinboards`;

CREATE TABLE `pinboards` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `board_name` varchar(50) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `comment_status` enum('Friends','Public','Private') DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pinboards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `pinboards` */

LOCK TABLES `pinboards` WRITE;

insert  into `pinboards`(`row_id`,`created`,`user_id`,`board_name`,`description`,`comment_status`) values (1,'2013-11-24 20:03:52','Bharath','Celebrities','Favourite Celebrities','Private'),(2,'2013-11-24 19:38:42','prasad','Singers','Favourite Singers','Public'),(3,'2013-11-24 20:03:47','Santosh','Serials','Favourite Serials','Public'),(4,'2013-11-24 20:14:29','Sunay','Actors','Favourite Actors','Friends'),(5,'2013-11-24 20:03:11','Pavan','Random','Random stuff','Friends'),(6,'2013-11-24 20:14:46','Pavan','Kannada Actors','Favourite Kannada Actors','Public'),(7,'2013-11-25 03:05:05','Rohith','Cars','Cool Cars','Public'),(9,'2013-11-25 03:59:25','Rohith','Hot Celebs','Emma','Public'),(13,'2013-12-13 01:03:09','Bharath','Cats','Love cats','Public'),(14,'2013-12-13 01:06:16','Bharath','Anime','Anime wallpapers','Public'),(15,'2013-12-13 12:33:17','Sunay','Cats','Love Cats!!','Public'),(16,'2013-12-13 14:54:29','Bharath','Demo','Demo','Public'),(17,'2013-12-13 14:58:26','Bharath','Cars','','Public');

UNLOCK TABLES;

/*Table structure for table `pins` */

DROP TABLE IF EXISTS `pins`;

CREATE TABLE `pins` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pinboard_id` int(11) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `tags` varchar(1000) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `parent_row_id` int(11) DEFAULT NULL,
  `local_likes` int(11) DEFAULT '0',
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  KEY `pins_ibfk_7` (`picture_id`),
  KEY `pins_ibfk_4` (`pinboard_id`),
  KEY `pins_ibfk_6` (`parent_row_id`),
  CONSTRAINT `pins_ibfk_4` FOREIGN KEY (`pinboard_id`) REFERENCES `pinboards` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `pins_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `pins_ibfk_6` FOREIGN KEY (`parent_row_id`) REFERENCES `pins` (`row_id`) ON DELETE CASCADE,
  CONSTRAINT `pins_ibfk_7` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`row_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `pins` */

LOCK TABLES `pins` WRITE;

insert  into `pins`(`row_id`,`created`,`pinboard_id`,`user_id`,`tags`,`picture_id`,`parent_row_id`,`local_likes`) values (1,'2013-12-13 02:00:54',1,'Bharath','Actress, Celebrities',1,1,1),(9,'2013-12-12 22:07:15',7,'Rohith','Cars, Fast Cars',8,9,1),(27,'2013-12-13 13:55:58',1,'Bharath','Actor Famous',64,27,0),(29,'2013-12-13 14:55:52',16,'Bharath','Demo 2',65,29,1),(30,'2013-12-13 15:10:07',4,'Sunay','ascacs',66,30,0),(32,'2013-12-13 17:04:22',1,'Bharath','sdvsdv',68,32,0),(33,'2013-12-13 17:27:27',14,'Bharath','sdvgd',69,33,0);

UNLOCK TABLES;

/*Table structure for table `streams` */

DROP TABLE IF EXISTS `streams`;

CREATE TABLE `streams` (
  `row_id` int(11) NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `keyword_query` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `streams_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `streams` */

LOCK TABLES `streams` WRITE;

insert  into `streams`(`row_id`,`created`,`user_id`,`name`,`keyword_query`,`description`) values (1,'2013-12-01 23:35:55','Bharath','All Celebrities',NULL,'All celebrities (Actors, Singers etc)'),(2,'2013-11-25 03:54:28','Rohith','Famous People','Celebrities','All celebrities'),(3,'2013-12-13 14:57:59','Bharath','Demo','Demo','kjnknsdc');

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varbinary(50) DEFAULT NULL,
  `gender` enum('Male','Female','Not declared') DEFAULT NULL,
  `profile_pic_path` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `language` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`user_id`,`created`,`fname`,`lname`,`email`,`gender`,`profile_pic_path`,`password`,`last_updated`,`language`,`country`,`status`) values ('Bharath','2013-11-24 19:05:16','Bharath','Swamy','bvs233@nyu.edu','Male',NULL,'12345','2013-11-24 18:58:40','English','USA','Active'),('Brat','2013-12-13 05:39:20','brat','brat','brat@brat.com','Male',NULL,'brat','2013-12-13 05:39:20',NULL,NULL,''),('Pavan','2013-11-24 19:08:52','Pavan','Atri','pat213@nyu.edu','Male',NULL,'zxcvb','2013-11-24 19:08:52','English','USA','Active'),('prasad','2013-12-12 09:36:58','Prasad','TV','ptv205@nyu.edu','Male',NULL,'abcde','2013-11-24 19:04:37','English','USA','Active'),('Rohith','2013-11-25 03:03:23','Rohith','BS','rsb408@nyu.edu','Male',NULL,'54321','2013-11-25 02:56:12','English','USA','Active'),('Santosh','2013-11-24 19:05:54','Santosh','Naiker','snk123@nyu.edu','Male',NULL,'qwerty','2013-11-24 19:05:54','English','USA','Active'),('Sunay','2013-11-24 19:07:01','Sunay','SP','snp321@nyu.edu','Male',NULL,'asdfg','2013-11-24 19:07:01','English','USA','Active');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
