
create table IF NOT EXISTS `Users`(
  `uid` int(10) primary key auto_increment,
  `telphone` varchar(11) not null ,
  `username` varchar(16) not null,
  `password` varchar(16) not null,
  `realname` varchar(16),
  `sex` varchar(2),
  `userQQ` varchar(11),
  `email` varchar(32),
  `userwechat` varchar(20),
  `birthday` varchar(8),
  `userimage` varchar(255)
);
alter table `Users` auto_increment = 1000000000;

