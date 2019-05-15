package ssm.dao;

import org.apache.ibatis.annotations.Param;
import ssm.entity.SchoolClass;

import java.util.List;

/*`address` varchar(255) not null,
`year` int(4) not null,
`classname` varchar(32) not null ,
`u_id` int (10) not null,
`password` varchar (8),
`description` varchar (255) ,
`createtime` DATE,*/
public interface SchoolClassDao {
    public int createClass(SchoolClass schoolClass);
    public List<SchoolClass> getClassByAddress(@Param("address") String address);
    public List<SchoolClass> getClassByClassname(@Param("classname")String classname);
    public SchoolClass getClassBySID( @Param("sid")int sid);
    public int EditClass(@Param("sid")int sid,@Param("address") String address, @Param("year") int year, @Param("classname")String classname, @Param("password") String password, @Param("description") String description);
    public int DeleteClassBySID(@Param("sid")int sid);
}
