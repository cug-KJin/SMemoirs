CREATE TABLE IF NOT EXISTS `article`(
  `aid` int(10) primary key auto_increment,
  `uid` int(10) not null,
  `username` varchar(16),
  `sid` int(10) not null,
  `description` varchar (1024),
  `createtime` datetime NOT NULL DEFAULT NOW(),
  FOREIGN KEY (`uid`) REFERENCES Users(`uid`),
  FOREIGN KEY (`sid`) REFERENCES SchoolClass(`sid`)
);
ALTER TABLE `article` auto_increment = 100000000;