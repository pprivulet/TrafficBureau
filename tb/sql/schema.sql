-- Copyright 2014 Tsari

-- To create the database:
--   CREATE DATABASE tb;
--   GRANT ALL PRIVILEGES ON tb.* TO 'tsari'@'localhost' IDENTIFIED BY '123456';
--
-- To reload the tables:
--   mysql --user=tsari --password=123456 --database=tb < schema.sql

SET SESSION storage_engine = "InnoDB";

-- beijing time_zone
SET SESSION time_zone = "+8:00";
 
ALTER DATABASE CHARACTER SET "utf8";

DROP TABLE IF EXISTS entries;
CREATE TABLE entries (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,    
    category INT NOT NULL,
    title VARCHAR(512) NOT NULL,
	importance INT NOT NULL DEFAULT '0',
    content MEDIUMTEXT NOT NULL,
    created TIMESTAMP  NULL DEFAULT NULL,   
    published TIMESTAMP  NULL DEFAULT NULL,
    updated TIMESTAMP  NULL DEFAULT NULL,	
	file INT NULL DEFAULT '0',
    status INT NOT NULL DEFAULT '0' COMMENT '状态',
    list_order INT NOT NULL DEFAULT '0' COMMENT '排序',
    KEY (id)
);


DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    login_name VARCHAR(100) NOT NULL UNIQUE,
	login_password VARCHAR(100) NOT NULL,
    create_date DATETIME NOT NULL,
    type INT NOT NULL DEFAULT '0',
    status INT NOT NULL DEFAULT '0'   
);

DROP TABLE IF EXISTS files;
CREATE TABLE files (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    entry_id INT NULL,
	category INT NOT NULL,
	save_path VARCHAR(512) NOT NULL,
	type INT NOT NULL DEFAULT '0',
	create_date TIMESTAMP NULL DEFAULT NULL,
    status INT NOT NULL DEFAULT '0'  
);

DROP TABLE IF EXISTS mails;
CREATE TABLE mails (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(16) NOT NULL,
    phone VARCHAR(16) NOT NULL,
    mail_address VARCHAR(64) NOT NULL,
    address  VARCHAR(128) NOT NULL,
    job  VARCHAR(32) NOT NULL,
    title VARCHAR(128) NOT NULL,
    type INT NOT NULL DEFAULT '0',
    content VARCHAR(1024) NOT NULL, 
	created TIMESTAMP NULL DEFAULT NULL,
    replied TIMESTAMP NULL DEFAULT NULL,
    status INT NOT NULL DEFAULT '0'  
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(16) NOT NULL,
    title VARCHAR(128) NOT NULL,
    type INT NOT NULL DEFAULT '0',
	content VARCHAR(1024) NOT NULL,    
	created TIMESTAMP NULL DEFAULT NULL,
    reply  VARCHAR(1024) NULL DEFAULT NULL,
    replied TIMESTAMP NULL DEFAULT NULL,
    status INT NOT NULL DEFAULT '0'  
);

DROP TABLE IF EXISTS vote_themes;
CREATE TABLE vote_themes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(128) NOT NULL,
	created TIMESTAMP NULL DEFAULT NULL, 
    published TIMESTAMP  NULL DEFAULT NULL,
    updated TIMESTAMP  NULL DEFAULT NULL,  
    closed TIMESTAMP  NULL DEFAULT NULL,      
    status INT NOT NULL DEFAULT '0'  
);

DROP TABLE IF EXISTS vote_quizzes;
CREATE TABLE vote_quizzes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vote_theme_id INT NOT NULL DEFAULT '-1',
    content VARCHAR(128) NOT NULL,	
    created TIMESTAMP NULL DEFAULT NULL, 
    updated TIMESTAMP  NULL DEFAULT NULL       
);

DROP TABLE IF EXISTS vote_options;
CREATE TABLE vote_options (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    option_index INT NOT NULL  DEFAULT '0',
    vote_theme_id INT NOT NULL DEFAULT '-1',
    vote_quiz_id INT NOT NULL DEFAULT '-1',
    vote INT NOT NULL DEFAULT '-1',
    content VARCHAR(128) NOT NULL,
	created TIMESTAMP NULL DEFAULT NULL, 
    updated TIMESTAMP  NULL DEFAULT NULL,
    status INT NOT NULL DEFAULT '0'     
);


-- admin/admin
INSERT INTO `users` (login_name, login_password, create_date) VALUES ('admin', 'edf249f3e37a4ba5120acea07041eb87', now());

