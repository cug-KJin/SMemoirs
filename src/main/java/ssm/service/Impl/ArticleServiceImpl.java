package ssm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.dao.ArticleDao;
import ssm.dao.ArticleimageDao;
import ssm.entity.Article;
import ssm.service.ArticleService;

import java.util.ArrayList;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleDao articleDao;

    @Override
    public int createArctice(int sid,String username, int uid, String description) {
        Article article = new Article(uid,username,sid,description);
        articleDao.createarticle(article);
        return article.getAid();
    }

    @Override
    public List<Article> getArticleBySid(int sid) {
        List<Article> list =  articleDao.getArticleBySid(sid);
        List<Article> newlist = new ArrayList<>();
        for (int i = list.size()-1;i>=0;i--){
            newlist.add(list.get(i));
        }
        return newlist;
    }

    @Override
    public List<Article> getArticleByUid(int uid) {
        return articleDao.getArticleByUid(uid);
    }

    @Override
    public List<Article> getArticleBySidAndUid(int sid, int uid) {
        return articleDao.getArticleBySidAndUid(sid,uid);
    }

    @Override
    public int deleteArticle(int aid) {
        return articleDao.deleteArticle(aid);
    }
}
