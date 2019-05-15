package ssm.service;

import ssm.entity.Article;

import java.util.List;

public interface ArticleService {
    public int createArctice(int sid,String username,int uid,String description);
    public List<Article> getArticleBySid(int sid);
    public List<Article> getArticleByUid(int uid);
    public List<Article> getArticleBySidAndUid(int sid,int uid);
    public int deleteArticle(int aid);
}
