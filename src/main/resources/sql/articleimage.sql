
create table IF NOT EXISTS`articleimage`(
  `imageid` int(10) primary key auto_increment,
  `aid` int(10) not null,
  `articleimage` varchar(255),
  foreign key( `aid`) references article(`aid`)
);
ALTER TABLE `articleimage` auto_increment = 100000000;