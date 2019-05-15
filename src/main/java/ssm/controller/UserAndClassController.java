package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ssm.entity.SchoolClass;
import ssm.entity.UserAndSchoolClass;
import ssm.entity.Users;
import ssm.service.Impl.SchoolClassServiceImpl;
import ssm.service.Impl.UserAndSchoolClassServiceImpl;
import ssm.service.Impl.UserServiceImpl;
import ssm.tools.get_StringNum;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@CrossOrigin
@RequestMapping("/SchoolClass")
public class UserAndClassController {
    @Autowired
    private UserAndSchoolClassServiceImpl userAndSchoolClassService;
    @Autowired
    private SchoolClassServiceImpl schoolClassService;
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping(value = "/getCreateClass",method = RequestMethod.POST)
    @ResponseBody
    public List<SchoolClass> getCreateClass(HttpServletRequest request, HttpSession session){
        List<SchoolClass> map = new ArrayList<>();
        Users users = (Users) session.getAttribute("currentuser");
        System.out.println(users.toString());
        List<UserAndSchoolClass> list = userAndSchoolClassService.getClassIDByUserID(users.getUid());
        for (int i = 0;i<list.size();i++){
            UserAndSchoolClass userAndSchoolClass = list.get(i);
            System.out.println(userAndSchoolClass.toString());
            if (userAndSchoolClass.getStatus() == 2){
                System.out.println("userAndSchoolClass.getStatus()");
                SchoolClass schoolClass = schoolClassService.getClassBySID(userAndSchoolClass.getSid());
                System.out.println(schoolClass.getClassname()+schoolClass.getSid());
                map.add(schoolClass);
            }
        }
        return map;
    }
    @RequestMapping(value = "/getAddClass",method = RequestMethod.POST)
    @ResponseBody
    public List<SchoolClass> getAddClass(HttpServletRequest request, HttpSession session){
        List<SchoolClass> map = new ArrayList<>();
        Users users = (Users) session.getAttribute("currentuser");
        List<UserAndSchoolClass> list = userAndSchoolClassService.getClassIDByUserID(users.getUid());
        for (int i = 0;i<list.size();i++){
            UserAndSchoolClass userAndSchoolClass = list.get(i);
            if (userAndSchoolClass.getStatus() == 1){
                SchoolClass schoolClass = schoolClassService.getClassBySID(userAndSchoolClass.getSid());
                map.add(schoolClass);
            }
        }
        return map;
    }
    @RequestMapping(value = "/DeleteUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteUser(HttpServletRequest request, HttpSession session){
        Map<String,String> map = new HashMap<>();
        int sid = Integer.parseInt(get_StringNum.getStringNum(request.getParameter("sid")));
        int uid = Integer.parseInt(request.getParameter("value"));
        int count = userAndSchoolClassService.deleteClassUser(uid,sid);
        if (count>0){
            map.put("editmessage","移除成功");
        }
        return map;

    }
    @RequestMapping(value = "/GetUserList",method = RequestMethod.GET)
    @ResponseBody
    public List<Users> getAllUserBySID(HttpServletRequest request, HttpSession session) {
        List<Users> map = new ArrayList<>();
        int sid = Integer.parseInt(request.getParameter("sid"));
        List<UserAndSchoolClass> list = userAndSchoolClassService.getUserIDByClassID(sid);
        for (int i = 0; i < list.size(); i++) {
            UserAndSchoolClass userAndSchoolClass = list.get(i);
            Users users = userService.getUserByUID(userAndSchoolClass.getUid());
            System.out.println(users.toString());
            map.add(users);
        }
        return map;
    }
}
