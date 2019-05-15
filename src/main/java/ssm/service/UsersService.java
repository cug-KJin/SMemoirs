package ssm.service;

import ssm.entity.Users;
/*
* `telphone` varchar(11) not null primary key ,
  `username` varchar(16),
  `password` varchar(16),
  `realname` varchar(16),
  `sex` varchar(2),
  `userQQ` varchar(11),
  `email` varchar(32),
  `userwechat` varchar(20),
  `birthday` varchar(8),
  `userimage` varchar(255)
* */
public interface UsersService {
    public int register(String userName,String telphone,String passWord);
    public boolean login(String telphone,String passWord);
    public Users getUserByTelphone(String telphone);
    public int editUserMessage(String telphone,String username,String realname,String sex,String userQQ,String email,String userwechat,String birthday);
    public int updatePassword(String telphone,String password);
    public int saveUserimage(String telphone,String userimage);
    public Users getUserByUID(int uid);
}
