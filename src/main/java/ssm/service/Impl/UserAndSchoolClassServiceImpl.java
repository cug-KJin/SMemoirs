package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.dao.SchoolClassDao;
import ssm.dao.UserAndSchoolClassDao;
import ssm.entity.SchoolClass;
import ssm.entity.UserAndSchoolClass;
import ssm.service.UserAndSchoolClassService;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserAndSchoolClassServiceImpl implements UserAndSchoolClassService {
    @Autowired
    private UserAndSchoolClassDao userAndSchoolClass;
    @Autowired
    private SchoolClassDao schoolClassDao;
    @Override
    public int addClassUser(int u_id, int s_id, int status,String password) {
        SchoolClass schoolClass = schoolClassDao.getClassBySID(s_id);
        if (!password.equals(schoolClass.getPassword())){
            return -1;
        }
        else if (userAndSchoolClass.getBySidAndUid(u_id,s_id)!=null){
            return -2;
        }
        else {
            return userAndSchoolClass.addClassUser(u_id,s_id,1);
        }
    }

    @Override
    public int deleteClassUser(int u_id, int s_id) {
        return userAndSchoolClass.deleteClassUser(u_id,s_id);
    }

    @Override
    public int deleteClassAllUser(int s_id) {
        return userAndSchoolClass.deleteClassAllUser(s_id);
    }

    @Override
    public UserAndSchoolClass getBySidAndUid(int uid, int sid) {
        return userAndSchoolClass.getBySidAndUid(uid,sid);
    }

    @Override
    public List<UserAndSchoolClass> getClassIDByUserID(int uid) {
        List<UserAndSchoolClass> list = new ArrayList<>();
        list = userAndSchoolClass.getClassIDByUserID(uid);
        return list;
    }

    @Override
    public List<UserAndSchoolClass> getUserIDByClassID(int sid) {
        List<UserAndSchoolClass> list = new ArrayList<>();
        list = userAndSchoolClass.getUserIDByClassID(sid);
        return list;
    }
}
