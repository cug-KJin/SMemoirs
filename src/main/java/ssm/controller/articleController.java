package ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ssm.entity.*;
import ssm.service.Impl.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@CrossOrigin
@RequestMapping("/Article")
public class articleController {
    @Autowired
    private ArticleimageServiceImpl articleimageService;
    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private SchoolClassServiceImpl schoolClassService;
    @Autowired
    private UserAndSchoolClassServiceImpl userAndSchoolClassService;
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping(value = "/enterIntoClass",method = RequestMethod.POST)
    public ModelAndView enterIntoClass(HttpServletRequest request, HttpSession session){
        int sid = Integer.parseInt(request.getParameter("s_id"));
        System.out.println(sid);
        SchoolClass schoolClass = schoolClassService.getClassBySID(sid);
        System.out.println(schoolClass.toString());
        Users users = (Users) session.getAttribute("currentuser");
        UserAndSchoolClass userAndSchoolClass = userAndSchoolClassService.getBySidAndUid(users.getUid(),schoolClass.getSid());
        System.out.println(userAndSchoolClass.toString());

        session.setAttribute("SchoolClass",schoolClass);
        session.setAttribute("UserAndSchoolClass",userAndSchoolClass);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("SchoolClass",schoolClass);

        List<CompleteArticle> list = new ArrayList<>();
        List<Article> list1 = null;
        try {
            list1 = articleService.getArticleBySid(sid);
            for (Article article:list1) {
                System.out.println(article.toString());
                CompleteArticle completeArticle = new CompleteArticle();
                completeArticle.setArticle(article);
                Users users1 = userService.getUserByUID(article.getUid());
                completeArticle.setUsers(users1);
                List<Articleimage> temp = articleimageService.getImageByAid(article.getAid());
                completeArticle.setList(temp);
                System.out.println(temp.toString());
                list.add(completeArticle);
            }

        }catch (NullPointerException e){
            System.out.println(e.toString());
        }
        modelAndView.addObject("CompleteArticle",list);
        modelAndView.setViewName("CurrentClass");
        return modelAndView;
    }

    @RequestMapping(value = "/DeleteArticle",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> deleteArticle(HttpServletRequest request, HttpSession session){
        Map<String,String> map = new HashMap<>();
        int aid = Integer.parseInt(request.getParameter("aid"));
        articleimageService.deleteimage(aid);
        articleService.deleteArticle(aid);
        map.put("editmessage","删除成功");
        return map;
    }
    @RequestMapping(value = "/AddArticle",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> AddArticle(@RequestParam("file") MultipartFile[] files, HttpServletRequest request, HttpSession session){
        Map<String,String> map = new HashMap<>();
        Users users = (Users) session.getAttribute("currentuser");
        System.out.println(users.toString());
        SchoolClass schoolClass = (SchoolClass) session.getAttribute("SchoolClass");
        String des = request.getParameter("des");
        int aid = articleService.createArctice(schoolClass.getSid(),users.getUserName(),users.getUid(),des);
        if (aid == 0){
            map.put("uploadmessage","上传失败！");
            return map;
        }

        String basepath = "/home/ubuntu/upload/useruploadphoto/";
        for (MultipartFile file : files) {
            System.out.println("文件类型:" + file.getContentType());
            String filename = file.getOriginalFilename();
            String suffix = filename.substring(filename.length() - 3);
            System.out.println("文件名:" + filename);
            System.out.println("文件后缀:" + suffix);
            System.out.println("文件大小:" + file.getSize() / 1024 + "KB");
            String newFileName = UUID.randomUUID().toString();
            File File = new File(basepath+newFileName);
            try {
                file.transferTo(File);
                articleimageService.addimage(aid,"http://129.211.26.231:8080/upload/useruploadphoto/"+newFileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        map.put("uploadmessage","上传成功！");
        return map;
    }
}
