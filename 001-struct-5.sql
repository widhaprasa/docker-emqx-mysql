-- Grant all privileges
GRANT ALL PRIVILEGES ON emqx_mysql.* TO 'emqx_mysql'@'%';

-- Use database
USE emqx_mysql;

-- Create default table
CREATE TABLE `mqtt_user_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `peerhost` varchar(60) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `cert_subject` varchar(100) DEFAULT NULL,
  `cert_common_name` varchar(100) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `salt` varchar(35) DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `group_` varchar(35) DEFAULT NULL,
  `listener` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mqtt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX mqtt_user_5_peerhost_idx ON mqtt_user(peerhost, listener);
CREATE INDEX mqtt_user_5_clientid_idx ON mqtt_user(clientid, listener);
CREATE INDEX mqtt_user_5_username_idx ON mqtt_user(username, listener);
CREATE INDEX mqtt_user_5_group_idx ON mqtt_user(group_, listener);

CREATE TABLE `mqtt_acl_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `peerhost` varchar(60) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `cert_subject` varchar(100) DEFAULT NULL,
  `cert_common_name` varchar(100) DEFAULT NULL,
  `permission` varchar(5) NOT NULL,
  `action` varchar(9) NOT NULL,
  `topic` varchar(100) NOT NULL,
  `group_` varchar(35) DEFAULT NULL,
  `listener` varchar(35) DEFAULT NULL,
  INDEX username_idx(username),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX mqtt_acl_5_peerhost_idx ON mqtt_acl(peerhost, listener);
CREATE INDEX mqtt_acl_5_clientid_idx ON mqtt_acl(clientid, listener);
CREATE INDEX mqtt_acl_5_username_idx ON mqtt_acl(username, listener);
CREATE INDEX mqtt_acl_5_group_idx ON mqtt_acl(group_, listener);
