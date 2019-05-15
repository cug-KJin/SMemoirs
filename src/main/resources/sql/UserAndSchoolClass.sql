
CREATE TABLE IF NOT EXISTS `UserAndSchoolClass`(
`usid` INT(10) PRIMARY KEY auto_increment ,
`uid` INT(10),
`sid` INT(10),
`status` INT(1),
FOREIGN KEY (`uid`) REFERENCES Users(`uid`),
FOREIGN KEY (`sid`) REFERENCES SchoolClass(`sid`)
);
ALTER TABLE `UserAndSchoolClass` auto_increment = 100000000;
