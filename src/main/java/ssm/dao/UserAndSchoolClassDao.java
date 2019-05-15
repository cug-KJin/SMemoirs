package ssm.dao;

import org.apache.ibatis.annotations.Param;
import ssm.entity.UserAndSchoolClass;

import java.util.List;

public interface UserAndSchoolClassDao {
    public int addClassUser(@Param("uid") int uid,@Param("sid")int sid,@Param("status") int status);
    public int deleteClassUser(@Param("uid") int uid,@Param("sid")int sid);
    public int deleteClassAllUser(@Param("sid")int sid);
    public List<UserAndSchoolClass> getClassIDByUserID(@Param("uid") int uid);
    public List<UserAndSchoolClass> getUserIDByClassID(@Param("sid") int sid);
    public UserAndSchoolClass getBySidAndUid(@Param("uid")int uid,@Param("sid")int sid);
}
