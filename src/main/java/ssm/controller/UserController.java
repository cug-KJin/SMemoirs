package ssm.controller;

import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ssm.entity.Users;
import ssm.service.Impl.UserServiceImpl;
import ssm.tools.DigestTool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@CrossOrigin
@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;
    @RequestMapping(value = "/Register" ,method = RequestMethod.POST)
    @CrossOrigin
    public ModelAndView RegisterUser(@RequestParam("username")String username,@RequestParam("telphone")String telphone,@RequestParam("password")String password){
        ModelAndView modelAndView = new ModelAndView();
        password = DigestTool.MD5(password);

        Pattern p = null;
        p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // 验证手机号
        Matcher m = null;
        boolean b = false;
        m = p.matcher(telphone);
        b = m.matches();
        if(username.equals("")||telphone.equals("")||password.equals(""))
        {
            modelAndView.addObject("message","用户信息不可为空");
            modelAndView.setViewName("register");
        }else if(username.length()>16){
            modelAndView.addObject("message","用户名少于16位");
            modelAndView.setViewName("register");
        }else if(!b){
            modelAndView.addObject("message","请输入正确的手机号格式");
            modelAndView.setViewName("register");
        }else if(password.length()<6||password.length()>16){
            modelAndView.addObject("message","密码应小于6位，大于16位");
            modelAndView.setViewName("register");
        } else {
            int index = userService.register(username, telphone, password);
            if (index == -1) {
                modelAndView.addObject("message", "该手机号已被注册");
                modelAndView.setViewName("register");
            } else if (index == 0) {
                modelAndView.addObject("message", "注册失败，具体原因不明");
                modelAndView.setViewName("register");
            } else {
                modelAndView.setViewName("login");
            }
        }
        return modelAndView;
    }
    @RequestMapping(value = "/Login",method = RequestMethod.POST)
    public ModelAndView Login(@RequestParam("telphone") String telphone, @RequestParam("password")String password , HttpSession session){
        // System.out.println(telphone+password);
        ModelAndView modelAndView = new ModelAndView();
        password = DigestTool.MD5(password);

        Pattern p = null;
        p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // 验证手机号
        Matcher m = null;
        boolean b = false;
        m = p.matcher(telphone);
        b = m.matches();
        if(telphone.equals("")||password.equals("")){
            modelAndView.addObject("message","手机号或密码不能为空");
            modelAndView.setViewName("login");
        }else if(!b){
            modelAndView.addObject("message","手机号格式不正确");
            modelAndView.setViewName("login");
        }else if(password.length()<6||password.length()>16){
            modelAndView.addObject("message","密码应大于6位或少于16位");
            modelAndView.setViewName("login");
        }else {
            if (userService.login(telphone, password)) {
                Users users = userService.getUserByTelphone(telphone);
                session.setAttribute("currentuser", users);
                modelAndView.addObject("message", "登陆成功");
                modelAndView.setViewName("Loginsecc");

            } else {
                modelAndView.addObject("message", "用户名密码错误");
                modelAndView.setViewName("login");
            }
        }
        return modelAndView;
    }

    @RequestMapping(value = "/UploadUserImage",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> uploadUserImage(@RequestParam("userimage") MultipartFile userimage, HttpSession session, HttpServletRequest request){
        Users users = (Users) session.getAttribute("currentuser");
        Map<String, String> map = new HashMap<String, String>();
        String basepath = "/home/ubuntu/upload/userimages/";
        System.out.println(userimage.toString());
        //获取图片原始名称
        String originalFilename = userimage.getOriginalFilename();
        try {
            //以用户id加图片扩展名给图片命名
            String fileName=users.getTelphone()+originalFilename.substring(originalFilename.lastIndexOf("."));

            // 生成图片存储的名称，UUID 避免相同图片名冲突，并加上图片后缀
            String newFileName = UUID.randomUUID().toString() + fileName;
            File file=new File(basepath+newFileName);
            userimage.transferTo(file);
            Thumbnails.of(file).size(100, 100).keepAspectRatio(false).toFile(file);
            //图片上传成功，更新数据库，将数据写会前端页面
            if (userService.saveUserimage(users.getTelphone(),newFileName)>0){
                session.setAttribute("currentuser",userService.getUserByTelphone(users.getTelphone()));
                map.put("url", "http://129.211.26.231:8080/upload/userimages/" + newFileName);

            }
            else {
                request.setAttribute("message","图片上传失败！");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping(value = "/Edit",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> editUserMessage(HttpSession session, HttpServletRequest request){
        Map<String,String> map = new HashMap<>();
        Users users = (Users) session.getAttribute("currentuser");
        String realname = request.getParameter("realname");
        String username = request.getParameter("username");
        String sex = request.getParameter("sex");
        String userQQ = request.getParameter("userQQ");
        String email = request.getParameter("email");
        String userwechat = request.getParameter("userwechat");
        String birthday = request.getParameter("birthday");
        //验证邮箱格式
        String regEx1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p = Pattern.compile(regEx1);
        Matcher m = p.matcher(email);
        boolean b = m.matches();
        if(username.equals("")){
            map.put("editmessage","用户名不可为空");
            // request.setAttribute("editmessage","用户名不可为空");
        }else if (!b){
            map.put("editmessage","邮箱格式不正确");

        }else {
            int count = userService.editUserMessage(users.getTelphone(), username, realname, sex, userQQ, email, userwechat, birthday);
            if (count > 0) {
                map.put("realname", realname);
                map.put("userQQ", userQQ);
                map.put("email", email);
                map.put("sex", sex);
                map.put("userwechat", userwechat);
                map.put("birthday", birthday);
                map.put("editmessage", "已完成修改");
                session.setAttribute("currentuser", userService.getUserByTelphone(users.getTelphone()));
            } else if (count == 0) {
                request.setAttribute("editmessage", "请完成信息修改");
            } else {
                request.setAttribute("editmessage", "修改失败");
            }
        }
        return map;
    }
    @RequestMapping(value = "/EditPass",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> editPass(HttpSession session, HttpServletRequest request){
        Map<String,String> map = new HashMap<>();
        Users users = (Users) session.getAttribute("currentuser");
        String oldPwd = request.getParameter("oldPwd");
        oldPwd = DigestTool.MD5(oldPwd);
        if (!oldPwd.equals(users.getPassWord())){
            map.put("editmessage","原密码不正确！");
            return map;
        }
        String newPwd = request.getParameter("newPwd");
        if(newPwd.equals("")){
            map.put("editmessage","密码不可为空！！！");
            return map;
        }
        newPwd = DigestTool.MD5(newPwd);
        if (oldPwd.equals(newPwd)){
            map.put("editmessage","请不要重复输入原密码！");
            return map;
        }
        int count = userService.updatePassword(users.getTelphone(),newPwd);
        if (count>0){
            map.put("editmessage","已完成修改");
            session.setAttribute("currentuser",userService.getUserByTelphone(users.getTelphone()));
        }
        else if (count==0){
            map.put("editmessage","请不要重复输入原密码！");
        }
        else {
            map.put("editmessage","修改失败");
        }
        return map;
    }
    @RequestMapping(value = "/LoginOut",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> loginOut(HttpSession session, HttpServletRequest request){
        Map<String, String> map = new HashMap<>();
        session.invalidate();
        System.out.println("LoginOut");
        map.put("loginout","1");
        return map;
    }
}
