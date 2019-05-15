CREATE TABLE IF NOT EXISTS `SchoolClass`(
`sid` int(10) primary key auto_increment,
`address` varchar(255) not null,
`year` int(4) not null,
`classname` varchar(32) not null ,
`uid` int (10) not null,
`password` varchar (8) not null,
`description` varchar (255) ,
`createtime` datetime NOT NULL DEFAULT NOW(),
foreign key (`uid`) REFERENCES Users(`uid`)
);
alter table `SchoolClass` auto_increment = 1000001234;