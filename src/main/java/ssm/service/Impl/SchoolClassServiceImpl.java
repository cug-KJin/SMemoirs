package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import ssm.dao.SchoolClassDao;
import ssm.dao.UserAndSchoolClassDao;
import ssm.entity.SchoolClass;
import ssm.service.SchoolClassService;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class SchoolClassServiceImpl implements SchoolClassService {
    @Autowired
    private SchoolClassDao schoolClassDao;
    @Autowired
    private UserAndSchoolClassDao userAndSchoolClassDao;

    @Override
    public int createClass(String address, int year, String classname, int u_id, String password, String description) {
        SchoolClass schoolClass = new SchoolClass(address,year,classname,u_id,password,description);
        int createResult = schoolClassDao.createClass(schoolClass);
        if (createResult<=0)
        {
            return 0;
        }
        int insertcount = userAndSchoolClassDao.addClassUser(schoolClass.getUid(),schoolClass.getSid(),2);
        if (insertcount<=0){
            schoolClassDao.DeleteClassBySID(schoolClass.getSid());
            return 0;
        }
        return schoolClass.getSid();
    }

    @Override
    public List<SchoolClass> getClass(String message) {

        List<SchoolClass> list1 = schoolClassDao.getClassByAddress(message);
        List<SchoolClass> list2 = schoolClassDao.getClassByClassname(message);
        SchoolClass list3 = null;
        Set<SchoolClass> set = new HashSet<>();
        if (StringUtils.isNumeric(message)) {
            list3 = schoolClassDao.getClassBySID(Integer.parseInt(message));
        }
        if (list1 != null){
            set.addAll(list1);
        }
        if (list2 != null){
            set.addAll(list2);
        }
        if (list3 != null){
            set.add(list3);
        }
        List<SchoolClass> list = new ArrayList<>(set);
        return list;
    }

    @Override
    public int editClass(int s_id, String address, int year, String classname, String password, String description) {
        return schoolClassDao.EditClass(s_id,address,year,classname,password,description);
    }

    @Override
    public int deleteClass(int s_id) {
        userAndSchoolClassDao.deleteClassAllUser(s_id);
        return schoolClassDao.DeleteClassBySID(s_id);
    }

    @Override
    public SchoolClass getClassBySID(int sid) {
        SchoolClass list3 = schoolClassDao.getClassBySID(sid);
        return list3;
    }
}
