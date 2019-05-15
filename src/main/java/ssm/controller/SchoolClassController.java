package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ssm.entity.Article;
import ssm.entity.SchoolClass;
import ssm.entity.UserAndSchoolClass;
import ssm.entity.Users;
import ssm.service.ArticleService;
import ssm.service.ArticleimageService;
import ssm.service.Impl.SchoolClassServiceImpl;
import ssm.service.Impl.UserAndSchoolClassServiceImpl;
import ssm.service.Impl.UserServiceImpl;
import ssm.tools.StringRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@CrossOrigin
@RequestMapping("/SchoolClass")
public class SchoolClassController {
    @Autowired
    private UserAndSchoolClassServiceImpl userAndSchoolClassService;
    @Autowired
    private SchoolClassServiceImpl schoolClassService;
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private ArticleimageService articleimageService;
    @Autowired
    private ArticleService articleService;
    @RequestMapping(value = "/CreateClass",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> createClass(HttpServletRequest request, HttpSession session){
        Map<String, String> map = new HashMap<>();
        String randomPwd = StringRandom.getStringRandom(6);
        Users users = (Users) session.getAttribute("currentuser");
        if(request.getParameter("address").equals("")){
            map.put("message","班级地址不可为空");
        }else if(request.getParameter("year").equals("")){
            map.put("message","班级年份不可为空");
        }else if(request.getParameter("classname").equals("")){
            map.put("message","班级名称不能为空");
        }else {
            int result = schoolClassService.createClass(request.getParameter("address"),
                    Integer.parseInt(request.getParameter("year")),
                    request.getParameter("classname"),
                    users.getUid(),
                    randomPwd,
                    request.getParameter("description"));
            if (result == 0) {
                request.setAttribute("message", "创建失败！");
            } else {
                map.put("Pwd", randomPwd);
                map.put("success", "创建成功");
            }
        }
        return map;
    }
    @RequestMapping(value = "/SearchClass",method = RequestMethod.GET)
    @ResponseBody
    public List<List<SchoolClass>> SearchClass(HttpServletRequest request, HttpSession session){
        List<List<SchoolClass>> lists = new ArrayList<>();

        List<SchoolClass> list1 = new ArrayList<>();
        List<SchoolClass> list2 = new ArrayList<>();
        List<SchoolClass> list3 = new ArrayList<>();

        List<SchoolClass> allList = schoolClassService.getClass(request.getParameter("value"));
        Users users = (Users) session.getAttribute("currentuser");
        for (int i = 0;i<allList.size();i++){
            SchoolClass schoolClass = allList.get(i);
            UserAndSchoolClass userAndSchoolClass = null;
            try {
                userAndSchoolClass = userAndSchoolClassService.getBySidAndUid(users.getUid(),schoolClass.getSid());

            }catch (NullPointerException e){
                System.out.println(e);
            }
            if (userAndSchoolClass!=null){
                if (userAndSchoolClass.getStatus() == 2){
                    list1.add(schoolClass);
                }else {
                    list2.add(schoolClass);
                }
            }
            else if(schoolClass!=null) {
                list3.add(schoolClass);
            }
        }
        lists.add(list1);
        lists.add(list2);
        lists.add(list3);
        return lists;
    }
    @RequestMapping(value = "/getClassMessage",method = RequestMethod.GET)
    @ResponseBody
    public List<SchoolClass> getClassMessage(HttpServletRequest request){
        int sid = Integer.parseInt(request.getParameter("sid"));
        SchoolClass schoolClass = schoolClassService.getClassBySID(sid);
        System.out.println(schoolClass.getCreatetime());
        List<SchoolClass> list = new ArrayList<>();
        list.add(schoolClass);
        return list;
    }
    @RequestMapping(value = "/AddClass",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> AddClass(HttpServletRequest request,HttpSession session){
        Map<String,String> map = new HashMap<>();
        int sid = Integer.parseInt(request.getParameter("sid"));
        String password = request.getParameter("password");
        Users users = (Users)session.getAttribute("currentuser");
        int uid = users.getUid();
        int result = userAndSchoolClassService.addClassUser(uid,sid,1,password);
        if (result>0){
            map.put("message","加入成功！");
        }
        else if (result == -1){
            map.put("message","密码错误！");
        }
        else if (result == -2){
            map.put("message","您已加入该班级！");
        }
        else {
            map.put("message","不知道咋回事，加入失败！");
        }
        return map;
    }
    @RequestMapping(value = "/EditClass",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> EditClass(HttpServletRequest request,HttpSession session){
        Map<String,String> map = new HashMap<>();
        int sid = Integer.parseInt(request.getParameter("sid"));
        String address = request.getParameter("address");
        String pwd = request.getParameter("password");
        int year = Integer.parseInt(request.getParameter("year"));
        String classname = request.getParameter("classname");
        String description = request.getParameter("description");
        if(address.equals("")||pwd.equals("")||classname.equals(""))
        {
            map.put("editmessage","班级地址、班级密码、班级名称不可为空");
            return map;
        }else if(pwd.length()>8){
            map.put("editmessage","班级密码不可超过8位");
            return map;
        }
        int count = schoolClassService.editClass(sid,address,year,classname,pwd,description);
        if (count>0){
            map.put("editmessage","修改成功！");
            map.put("address",address);
            map.put("pwd",pwd);
            map.put("classname",classname);
            map.put("description",description);
            map.put("year",String.valueOf(year));
            SchoolClass schoolClass = schoolClassService.getClassBySID(sid);
            session.setAttribute("SchoolClass",schoolClass);
        }
        else {
            map.put("editmessage","修改失败！");
        }
        return map;
    }
    @RequestMapping(value = "/DeleteClass",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteClass(HttpServletRequest request,HttpSession session){
        Map<String,String> map = new HashMap<>();
        int sid = Integer.parseInt(request.getParameter("sid"));
        System.out.println(sid);
        List<Article> list = articleService.getArticleBySid(sid);
        for (Article article:list){
            articleimageService.deleteimage(article.getAid());
            articleService.deleteArticle(article.getAid());
        }
        userAndSchoolClassService.deleteClassAllUser(sid);
        schoolClassService.deleteClass(sid);
        map.put("deletemessage","删除成功！");
        map.put("value","1");
        return map;
    }

}
