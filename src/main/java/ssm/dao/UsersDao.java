package ssm.dao;

import org.apache.ibatis.annotations.Param;
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
public interface UsersDao {
    public int registerUser(@Param("username") String username,@Param("password") String password,@Param("telphone") String telphone);
    public Users getUserByTelphone(@Param("telphone") String telphone);
    public Users checkLogin(@Param("telphone") String telphone,@Param("password") String password);
    public int updatePassword(@Param("telphone") String telphone,@Param("password") String password);
    public int editUserMessage(@Param("telphone") String telphone,@Param("username") String username,@Param("realname") String realname,@Param("sex") String sex,@Param("userQQ") String userQQ,@Param("email") String email,@Param("userwechat") String userwechat,@Param("birthday") String birthday);
    public int updateUserimage(@Param("telphone") String telphone,@Param("userimage") String userimage);
    public Users getUserByUID(@Param("uid") int uid);
}
