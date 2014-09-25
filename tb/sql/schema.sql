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
    content MEDIUMTEXT NOT NULL,
    created TIMESTAMP NULL DEFAULT NULL,   
    published TIMESTAMP NULL DEFAULT NULL,
    updated TIMESTAMP NULL DEFAULT NULL,
	user_id INT DEFAULT NULL COMMENT '建者创id',
    status INT DEFAULT NULL COMMENT '状态',
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


INSERT INTO `users` (login_name, login_password, create_date) VALUES ('tsari', '123456', now());
INSERT INTO `entries` (category, title, content, created, published, updated)VALUES ('1', '喜讯:苏州清研安远信息科技发展有限公司在今日成立', '<p>\r\n	&nbsp;&nbsp;&nbsp; 2013年9月19日，苏州清研安远信息科技发展有限公司（以下简称：清研安远）在清华大学苏州汽车研究院产业孵化基地正式成立。清研安远依托清华大学车联网领域的研发基础与苏州的智慧交通建设实践，汇聚国内一流大学的高端人才和先进技术，是中国智慧城市设计、建设与运营的创新者与引领者。清研安远致力于整合全国智慧资源，创新智慧运营模式，推动形成智慧产业集群，引领智慧产业发展，通过项目落地打造成功的智慧城市&ldquo;苏州模式&rdquo;，并根据各地智慧城市建设实际向全国输出，利用智慧城市的综合提升作用助力中国城市的转型升级，促进城市民生服务的提升改善。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 目前，清研安远的关键技术与产品主要有：国家863《基于车联网的车辆智能化关键技术研究》、国家863《区域交通行驶车辆与交通信号多目标协同控制技术》、江苏省产学研联合重大创新载体项目、车联网远程故障诊断服务平台、交通领域智能化的车辆安全管理平台关键技术研究、公交车客流量统计平台、城市出租车自助式电召平台、基于北斗GPS双模卫星技术的信息服务平台、醉酒检测预警平台、车辆故障诊断OBD硬件研发等。</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp; 清研安远开展了一系列智慧城市的规划、建设、运营项目，包括广东的智慧乐从，贵州的智慧铜仁、智慧赤水、智慧都匀，以及湖北十堰的智慧医疗等。</p>\r\n<p>\r\n	&nbsp;</p>', '2013-09-20 15:36:26', '2013-09-20 16:27:47', '2013-11-08 16:27:47');
