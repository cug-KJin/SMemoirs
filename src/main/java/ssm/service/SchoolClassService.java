package ssm.service;

import ssm.entity.SchoolClass;

import java.util.List;

public interface SchoolClassService {
    public int createClass(String address,int year,String classname,int u_id, String password,String description);

//    public SchoolClass getClassByAddress(String address);
//    public SchoolClass getClassByClassname(String classname);
//    public SchoolClass getClassByUID(int u_id);
    public List<SchoolClass> getClass(String message);
//    public int EditClass(int u_id,String address,int year,String classname,String password,String description);
    public int editClass(int s_id,String address,int year,String classname,String password,String description);
//    public int DeleteClassByUID(int s_id);
    public int deleteClass(int s_id);
    public SchoolClass getClassBySID(int sid);
}
