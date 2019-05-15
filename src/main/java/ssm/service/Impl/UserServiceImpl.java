package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ssm.dao.UsersDao;
import ssm.entity.Users;
import ssm.service.UsersService;

import java.io.File;

@Service
public class UserServiceImpl implements UsersService {
    @Autowired
    private UsersDao usersDao;
    @Override
    public int register(String userName, String telphone, String passWord) {
        if (usersDao.getUserByTelphone(telphone)!=null)
        {
            return -1;
        }
        int index = usersDao.registerUser(userName,passWord,telphone);
        if (index>0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

    @Override
    public boolean login(String telphone, String passWord) {
        Users user = usersDao.checkLogin(telphone,passWord);
        if (user!=null)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    @Override
    public Users getUserByTelphone(String telphone) {
        return usersDao.getUserByTelphone(telphone);
    }

    @Override
    public int editUserMessage(String telphone, String username,String realname, String sex, String userQQ, String email, String userwechat, String birthday) {
        return usersDao.editUserMessage(telphone,username,realname,sex,userQQ,email,userwechat,birthday);
    }

    @Override
    public int updatePassword(String telphone, String password) {
        return usersDao.updatePassword(telphone,password);
    }

    @Override
    public int saveUserimage(String telphone, String userimage) {
        Users users = usersDao.getUserByTelphone(telphone);
        if (users.getUserimage()!=null){
            String url = "/home/ubuntu/upload/userimages/";
            File deleteFile = new File(url+users.getUserimage());
            deleteFile.delete();
        }
        return usersDao.updateUserimage(telphone,userimage);
    }

    @Override
    public Users getUserByUID(int uid) {
        return usersDao.getUserByUID(uid);
    }
}
