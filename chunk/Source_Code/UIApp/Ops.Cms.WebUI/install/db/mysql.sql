﻿
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_archives
-- ----------------------------
DROP TABLE IF EXISTS `cms_archives`;
CREATE TABLE `cms_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strid` varchar(16) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `outline` varchar(255) DEFAULT NULL,
  `content` text,
  `viewcount` int(50) DEFAULT '0',
  `agree` int(11) DEFAULT NULL,
  `disagree` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastmodifydate` datetime DEFAULT NULL,
  `flags` varchar(100) DEFAULT '{st:''''0'''',sc:''''0'''',v:''''1'''',p:''''0''''}',
  `thumbnail` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `id_index` (`id`,`alias`),
  KEY `cid_index` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_archives
-- ----------------------------
INSERT INTO `cms_archives` VALUES ('1', 'welcome', 'welcome', '2', 'admin', '欢迎使用Ops Cms .NET', null, null, null, '<div style=\"text-align:center;font-size:30px\"><h2>欢迎使用Ops Cms .NET!</h2></div>', '1', '0', '0', '2013-01-01 01:01:01', '2013-01-01 01:01:01', '{st:\'0\',sc:\'0\',v:\'1\',p:\'0\'}', null);

-- ----------------------------
-- Table structure for cms_categories
-- ----------------------------
DROP TABLE IF EXISTS `cms_categories`;
CREATE TABLE `cms_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(10) DEFAULT '1',
  `moduleid` int(11) NOT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `pagetitle` varchar(200) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL COMMENT '跳转到的地址',
  `orderindex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_categories
-- ----------------------------
INSERT INTO `cms_categories` VALUES ('1', '1', '1', 'root', '根栏目', '','1', '4', null, null, null, null, '0');
INSERT INTO `cms_categories` VALUES ('2', '1', '1', 'cms', '欢迎使用','', '2', '3', null, null, null, null, '0');

-- ----------------------------
-- Table structure for cms_categoryExtend
-- ----------------------------
DROP TABLE IF EXISTS `cms_categoryExtend`;
CREATE TABLE `cms_categoryExtend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `extendId` int(11) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cms_categoryExtend
-- ----------------------------

-- ----------------------------
-- Table structure for cms_comments
-- ----------------------------
DROP TABLE IF EXISTS `cms_comments`;
CREATE TABLE `cms_comments` (
  `id` int(16) NOT NULL,
  `archiveid` varchar(16) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `content` text,
  `recycle` tinyint(1) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comments
-- ----------------------------

-- ----------------------------
-- Table structure for cms_extendField
-- ----------------------------
DROP TABLE IF EXISTS `cms_extendField`;
CREATE TABLE `cms_extendField` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultValue` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regex` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cms_extendField
-- ----------------------------

-- ----------------------------
-- Table structure for cms_extendValue
-- ----------------------------
DROP TABLE IF EXISTS `cms_extendValue`;
CREATE TABLE `cms_extendValue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relationId` int(11) NOT NULL,
  `relationType` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldValue` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cms_extendValue
-- ----------------------------

-- ----------------------------
-- Table structure for cms_links
-- ----------------------------
DROP TABLE IF EXISTS `cms_links`;
CREATE TABLE `cms_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `siteid` int(10) DEFAULT '1',
  `type` int(11) NOT NULL,
  `text` varchar(100) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `bind` varchar(20) DEFAULT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_links
-- ----------------------------
INSERT INTO `cms_links` VALUES ('1', '0', '1', '2', 'SPC.NET', 'http://www.ops.cc/cms/', '_blank', null, null, '2', '1');
INSERT INTO `cms_links` VALUES ('2', '0', '1', '1', '首页', '/', null, null, null, '1', '1');
INSERT INTO `cms_links` VALUES ('3', '0', '1', '1', '欢迎使用', '/cms/welcome.html', null, null, null, '2', '1');

-- ----------------------------
-- Table structure for cms_logs
-- ----------------------------
DROP TABLE IF EXISTS `cms_logs`;
CREATE TABLE `cms_logs` (
  `id` varchar(30) NOT NULL,
  `typeid` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` text,
  `helplink` varchar(255) DEFAULT NULL,
  `recorddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_logs
-- ----------------------------

-- ----------------------------
-- Table structure for cms_memberdetails
-- ----------------------------
DROP TABLE IF EXISTS `cms_memberdetails`;
CREATE TABLE `cms_memberdetails` (
  `uid` int(11) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `regip` varchar(15) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_memberdetails
-- ----------------------------

-- ----------------------------
-- Table structure for cms_members
-- ----------------------------
DROP TABLE IF EXISTS `cms_members`;
CREATE TABLE `cms_members` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `sex` varchar(7) DEFAULT NULL,
  `nickname` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telphone` varchar(20) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `usergroupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_members
-- ----------------------------

-- ----------------------------
-- Table structure for cms_message
-- ----------------------------
DROP TABLE IF EXISTS `cms_message`;
CREATE TABLE `cms_message` (
  `id` int(16) NOT NULL,
  `senduid` int(11) DEFAULT NULL,
  `receiveuid` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `hasread` tinyint(1) DEFAULT NULL,
  `recycle` tinyint(1) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_message
-- ----------------------------

-- ----------------------------
-- Table structure for cms_modules
-- ----------------------------
DROP TABLE IF EXISTS `cms_modules`;
CREATE TABLE `cms_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(1) DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `issystem` tinyint(1) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT NULL,
  `extid1` int(11) DEFAULT '0',
  `extid2` int(11) DEFAULT '0',
  `extid3` int(11) DEFAULT '0',
  `extid4` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_modules
-- ----------------------------
INSERT INTO `cms_modules` VALUES ('1', '0', '自定义页面', '1', '0', '0', '0', '0', '0');
INSERT INTO `cms_modules` VALUES ('2', '0', '文档', '1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for cms_operations
-- ----------------------------
DROP TABLE IF EXISTS `cms_operations`;
CREATE TABLE `cms_operations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_operations
-- ----------------------------
INSERT INTO `cms_operations` VALUES ('44', '友情链接', 'link?view=list&type=friendlink', '1');
INSERT INTO `cms_operations` VALUES ('45', '分类->分类列表', 'catalog?view=list', '1');
INSERT INTO `cms_operations` VALUES ('46', '系统->网站设置', 'config?id=1', '1');
INSERT INTO `cms_operations` VALUES ('47', '系统->网站基本资料修改', 'config?id=2', '1');
INSERT INTO `cms_operations` VALUES ('48', '系统->网站优化设置', 'config?id=3', '1');
INSERT INTO `cms_operations` VALUES ('49', '错误日志', 'system?view=errorlog', '1');
INSERT INTO `cms_operations` VALUES ('50', '内容->页面管理', 'archive?view=list&type=1', '1');
INSERT INTO `cms_operations` VALUES ('51', '内容->添加页面', 'archive?view=create&type=1', '1');
INSERT INTO `cms_operations` VALUES ('52', '内容->信息列表', 'archive?view=list&type=2', '1');
INSERT INTO `cms_operations` VALUES ('53', '内容->发布信息', 'archive?view=create&type=2', '1');
INSERT INTO `cms_operations` VALUES ('54', '分类->删除分类', 'app.axd?do=catalog:delete', '1');
INSERT INTO `cms_operations` VALUES ('55', '分类->修改分类', 'app.axd?do=catalog:update', '1');
INSERT INTO `cms_operations` VALUES ('56', '会员>会员列表', 'user?view=member', '1');
INSERT INTO `cms_operations` VALUES ('57', '会员>删除会员', 'app.axd?do=member:delete', '1');
INSERT INTO `cms_operations` VALUES ('58', '系统用户管理', 'user?view=user', '1');
INSERT INTO `cms_operations` VALUES ('59', '删除评论', 'app.axd?do=archive:deletecomment', '1');
INSERT INTO `cms_operations` VALUES ('60', '头部导航链接', 'link?view=list&type=headerlink', '1');
INSERT INTO `cms_operations` VALUES ('61', '网站导航链接', 'link?view=list&type=navigation', '1');
INSERT INTO `cms_operations` VALUES ('62', '添加新链接', 'link?view=create', '1');
INSERT INTO `cms_operations` VALUES ('63', '修改链接', 'link?view=edit', '1');
INSERT INTO `cms_operations` VALUES ('64', '删除链接', 'app.axd?do=link:delete', '1');
INSERT INTO `cms_operations` VALUES ('65', '更新页面', 'archive?view=update&typeid=1', '1');
INSERT INTO `cms_operations` VALUES ('66', '更新信息', 'archive?view=update&typeid=2', '1');
INSERT INTO `cms_operations` VALUES ('67', '更新图文信息', 'archive?view=update&typeid=3', '1');
INSERT INTO `cms_operations` VALUES ('68', '更新画廊信息', 'archive?view=update&typeid=4', '1');
INSERT INTO `cms_operations` VALUES ('69', '更新视频信息', 'archive?view=update&typeid=5', '1');
INSERT INTO `cms_operations` VALUES ('70', '更新专题信息', 'archive?view=update&typeid=6', '1');
INSERT INTO `cms_operations` VALUES ('71', '图文信息列表', 'archive?view=list&typeid=3', '1');
INSERT INTO `cms_operations` VALUES ('72', '画廊息列表', 'archive?view=list&typeid=4', '1');
INSERT INTO `cms_operations` VALUES ('73', '视频信息列表', 'archive?view=list&typeid=5', '1');
INSERT INTO `cms_operations` VALUES ('74', '专题列表', 'archive?view=list&typeid=6', '1');
INSERT INTO `cms_operations` VALUES ('75', '发布图文信息', 'archive?view=create&typeid=3', '1');
INSERT INTO `cms_operations` VALUES ('76', '发布画廊信息', 'archive?view=create&typeid=4', '1');
INSERT INTO `cms_operations` VALUES ('77', '发布视频信息', 'archive?view=create&typeid=5', '1');
INSERT INTO `cms_operations` VALUES ('78', '创建新专题', 'archive?view=create&typeid=6', '1');
INSERT INTO `cms_operations` VALUES ('79', '清除缓存', 'system?view=clearcache', '1');
INSERT INTO `cms_operations` VALUES ('80', '操作列表', 'operation?view=list', '1');
INSERT INTO `cms_operations` VALUES ('81', '用户组操作权限设置', 'operation?view=set', '1');
INSERT INTO `cms_operations` VALUES ('82', '清除错误日志', '/app.axd?log:clearErrorLog', '1');
INSERT INTO `cms_operations` VALUES ('83', '删除文档', 'archive:delete', '1');
INSERT INTO `cms_operations` VALUES ('84', '刷新文档创建时间', 'archive:refresh', '1');
INSERT INTO `cms_operations` VALUES ('85', '内容采集', '/plugin/collection.ashx', '1');

-- ----------------------------
-- Table structure for cms_reviews
-- ----------------------------
DROP TABLE IF EXISTS `cms_reviews`;
CREATE TABLE `cms_reviews` (
  `id` varchar(255) NOT NULL,
  `members` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_reviews
-- ----------------------------

-- ----------------------------
-- Table structure for cms_sites
-- ----------------------------
DROP TABLE IF EXISTS `cms_sites`;
CREATE TABLE `cms_sites` (
  `siteid` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dirname` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `language` int(1) NOT NULL,
  `tpl` varchar(100) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `seotitle` varchar(200) DEFAULT NULL,
  `seokeywords` varchar(250) DEFAULT NULL,
  `seodescription` varchar(250) DEFAULT NULL,
  `state` int(1) NOT NULL,
  `protel` varchar(50) DEFAULT NULL,
  `prophone` varchar(11) DEFAULT NULL,
  `profax` varchar(50) DEFAULT NULL,
  `proaddress` varchar(100) DEFAULT NULL,
  `proemail` varchar(100) DEFAULT NULL,
  `im` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `pronotice` varchar(250) DEFAULT NULL,
  `proslogan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_sites
-- ----------------------------
INSERT INTO `cms_sites` VALUES ('1', '默认站点', null, null, '1', 'default', null, '默认站点-Speicial Cms .NET!', null, null, '1', '', '', '', '', null, null, null, 'SPC.NET是一款跨平台支持多站点基于ASP.NET MVC技术架构的内容管理系统!', '');

-- ----------------------------
-- Table structure for cms_table
-- ----------------------------
DROP TABLE IF EXISTS `cms_table`;
CREATE TABLE `cms_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `apiserver` varchar(200) DEFAULT NULL,
  `issystem` bit(1) NOT NULL,
  `available` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_table
-- ----------------------------

-- ----------------------------
-- Table structure for cms_table_columns
-- ----------------------------
DROP TABLE IF EXISTS `cms_table_columns`;
CREATE TABLE `cms_table_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  `validformat` varchar(200) DEFAULT NULL,
  `orderindex` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_table_columns
-- ----------------------------

-- ----------------------------
-- Table structure for cms_table_rows
-- ----------------------------
DROP TABLE IF EXISTS `cms_table_rows`;
CREATE TABLE `cms_table_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableid` int(11) NOT NULL,
  `submittime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_table_rows
-- ----------------------------

-- ----------------------------
-- Table structure for cms_table_rowsdata
-- ----------------------------
DROP TABLE IF EXISTS `cms_table_rowsdata`;
CREATE TABLE `cms_table_rowsdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_table_rowsdata
-- ----------------------------

-- ----------------------------
-- Table structure for cms_tplbinds
-- ----------------------------
DROP TABLE IF EXISTS `cms_tplbinds`;
CREATE TABLE `cms_tplbinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bindid` int(20) NOT NULL,
  `bindtype` int(2) NOT NULL,
  `tplpath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_tplbinds
-- ----------------------------

-- ----------------------------
-- Table structure for cms_usergroups
-- ----------------------------
DROP TABLE IF EXISTS `cms_usergroups`;
CREATE TABLE `cms_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_usergroups
-- ----------------------------
INSERT INTO `cms_usergroups` VALUES ('1', '超级管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42');
INSERT INTO `cms_usergroups` VALUES ('2', '管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,40,41,42');
INSERT INTO `cms_usergroups` VALUES ('3', '编辑', '1,2,3,4,5,6,10,11,12,13,14,15');
INSERT INTO `cms_usergroups` VALUES ('4', '会员', '1,2,3,4,5,6');
INSERT INTO `cms_usergroups` VALUES ('5', '游客', '3,4');
INSERT INTO `cms_usergroups` VALUES ('0', null, null);

-- ----------------------------
-- Table structure for cms_users
-- ----------------------------
DROP TABLE IF EXISTS `cms_users`;
CREATE TABLE `cms_users` (
  `userid` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` int(10) NOT NULL DEFAULT '1',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastlogindate` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cms_users
-- ----------------------------
DROP TABLE IF EXISTS `cms_related_link`;
CREATE TABLE `cms_related_link` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	`typeIndent` VARCHAR(50), 
	`relatedId` INT, 
	`name` VARCHAR(50), 
	`title` VARCHAR(100), 
	`uri` VARCHAR(150), 
	`enabled` BIT
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
