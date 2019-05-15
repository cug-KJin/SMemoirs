package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.dao.ArticleimageDao;
import ssm.entity.Articleimage;
import ssm.service.ArticleimageService;

import java.io.File;
import java.util.List;

@Service
public class ArticleimageServiceImpl implements ArticleimageService {
    @Autowired
    private ArticleimageDao articleimageDao;

    @Override
    public int addimage(int aid, String articleimage) {
        return articleimageDao.addimage(aid,articleimage);
    }

    @Override
    public int deleteimage(int aid) {
        List<Articleimage> list = articleimageDao.getImageByAid(aid);
        for (Articleimage articleimage:list){
            if (articleimage.getArticleimage()!=null){
                String[] str = articleimage.getArticleimage().split("/");
                String path = "/home/ubuntu/upload/useruploadphoto/"+str[str.length-1];
                File deleteFile = new File(path);
                deleteFile.delete();
            }
        }
        return articleimageDao.deleteimage(aid);
    }

    @Override
    public List<Articleimage> getImageByAid(int aid) {
        return articleimageDao.getImageByAid(aid);
    }
}
