/*
Navicat MySQL Data Transfer

Source Server         : AMPPS
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : interview_tasks

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-11-25 21:02:56
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `site_event`
-- ----------------------------
DROP TABLE IF EXISTS `site_event`;
CREATE TABLE `site_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `duration` int(11) DEFAULT NULL,
  `maxcapacity` int(11) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_event_title` (`title`),
  KEY `idx_event_deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of site_event
-- ----------------------------
INSERT INTO site_event VALUES ('1', 'Kids Disco', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.', '90', '100', '0');
INSERT INTO site_event VALUES ('2', 'Craft Sessions', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.', '120', '20', '0');
INSERT INTO site_event VALUES ('3', 'Recently Deleted Event', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.', '60', '45', '1');

-- ----------------------------
-- Table structure for `site_performance`
-- ----------------------------
DROP TABLE IF EXISTS `site_performance`;
CREATE TABLE `site_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) NOT NULL,
  `performancetime` datetime NOT NULL,
  `venueid` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_performance_time` (`performancetime`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of site_performance
-- ----------------------------
INSERT INTO site_performance VALUES ('1', '1', '2019-12-03 18:00:00', '1', '35');
INSERT INTO site_performance VALUES ('2', '1', '2019-12-04 18:00:00', '1', '20');
INSERT INTO site_performance VALUES ('3', '1', '2019-12-05 18:00:00', '1', '100');
INSERT INTO site_performance VALUES ('4', '1', '2019-12-06 18:00:00', '2', '25');
INSERT INTO site_performance VALUES ('5', '1', '2019-12-07 18:00:00', '2', '65');
INSERT INTO site_performance VALUES ('6', '2', '2019-12-03 12:00:00', '3', '7');
INSERT INTO site_performance VALUES ('7', '2', '2019-12-05 18:00:00', '3', '12');
INSERT INTO site_performance VALUES ('8', '2', '2019-12-06 18:00:00', '3', '0');
INSERT INTO site_performance VALUES ('9', '3', '2019-12-01 18:00:00', '1', '0');
INSERT INTO site_performance VALUES ('10', '3', '2019-12-03 18:00:00', '1', '0');

-- ----------------------------
-- Table structure for `site_venue`
-- ----------------------------
DROP TABLE IF EXISTS `site_venue`;
CREATE TABLE `site_venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_venue_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of site_venue
-- ----------------------------
INSERT INTO site_venue VALUES ('3', 'Kids Club');
INSERT INTO site_venue VALUES ('2', 'Seaside Stage');
INSERT INTO site_venue VALUES ('1', 'Sunshine Bar');
