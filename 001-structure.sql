-- Grant all privileges
GRANT ALL PRIVILEGES ON emqx_mysql.* TO 'emqx_mysql'@'%';

-- Use database
USE emqx_mysql;

-- Create default table
CREATE TABLE `mqtt_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(35) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `group_` varchar(35) DEFAULT NULL,
  `listener` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mqtt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX mqtt_user_username_idx ON mqtt_user(username, listener);
CREATE INDEX mqtt_user_group_idx ON mqtt_user(group_, listener);

CREATE TABLE `mqtt_acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `allow` int(1) DEFAULT 1 COMMENT '0: deny, 1: allow',
  `ipaddr` varchar(60) DEFAULT NULL COMMENT 'IpAddress',
  `username` varchar(100) DEFAULT NULL COMMENT 'Username',
  `clientid` varchar(100) DEFAULT NULL COMMENT 'ClientId',
  `access` int(2) NOT NULL COMMENT '1: subscribe, 2: publish, 3: pubsub',
  `topic` varchar(100) NOT NULL DEFAULT '' COMMENT 'Topic Filter',
  `group_` varchar(35) DEFAULT NULL,
  `listener` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX mqtt_acl_ipaddr_idx ON mqtt_acl(ipaddr, listener);
CREATE INDEX mqtt_acl_username_idx ON mqtt_acl(username, listener);
CREATE INDEX mqtt_acl_clientid_idx ON mqtt_acl(clientid, listener);
CREATE INDEX mqtt_acl_group_idx ON mqtt_acl(group_, listener);
