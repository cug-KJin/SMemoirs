package ssm.service;

import ssm.entity.UserAndSchoolClass;

import java.util.List;

public interface UserAndSchoolClassService {
    public int addClassUser(int u_id,int s_id,int status,String password);
    public int deleteClassUser(int u_id,int s_id);
    public int deleteClassAllUser(int s_id);
    public UserAndSchoolClass getBySidAndUid(int uid,int sid);
    public List<UserAndSchoolClass> getClassIDByUserID( int uid);
    public List<UserAndSchoolClass> getUserIDByClassID(int sid);
}
