-- Grant all privileges
GRANT ALL PRIVILEGES ON emqx_mysql.* TO 'emqx_mysql'@'%';

-- Use database
USE emqx_mysql;

-- Create default tables and indexes
CREATE TABLE `mqtt_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `peerhost` varchar(60) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `cert_subject` varchar(100) DEFAULT NULL,
  `cert_common_name` varchar(100) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `salt` varchar(35) DEFAULT NULL,
  `is_superuser` tinyint DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `group_` varchar(35) DEFAULT NULL,
  `listener` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX mqtt_user_listener_idx ON mqtt_user(listener);

CREATE INDEX mqtt_user_peerhost_listener_idx ON mqtt_user(peerhost, listener);
CREATE INDEX mqtt_user_clientid_listener_idx ON mqtt_user(clientid, listener);
CREATE INDEX mqtt_user_username_listener_idx ON mqtt_user(username, listener);
CREATE INDEX mqtt_user_group_listener_idx ON mqtt_user(group_, listener);

CREATE TABLE `mqtt_acl` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX mqtt_acl_listener_idx ON mqtt_acl(listener);
CREATE INDEX mqtt_acl_peerhost_idx ON mqtt_acl(peerhost);
CREATE INDEX mqtt_acl_clientid_idx ON mqtt_acl(clientid);
CREATE INDEX mqtt_acl_username_idx ON mqtt_acl(username);

CREATE INDEX mqtt_acl_peerhost_listener_idx ON mqtt_acl(peerhost, listener);
CREATE INDEX mqtt_acl_clientid_listener_idx ON mqtt_acl(clientid, listener);
CREATE INDEX mqtt_acl_username_listener_idx ON mqtt_acl(username, listener);
CREATE INDEX mqtt_acl_group_listener_idx ON mqtt_acl(group_, listener);
