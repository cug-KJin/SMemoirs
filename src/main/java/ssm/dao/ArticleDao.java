package ssm.dao;

import org.apache.ibatis.annotations.Param;
import ssm.entity.Article;

import java.util.List;

public interface ArticleDao {
    public int createarticle(Article article);
    public List<Article> getArticleBySid(@Param("sid") int sid);
    public List<Article> getArticleByUid(@Param("uid") int uid);
    public List<Article> getArticleBySidAndUid(@Param("sid") int sid,@Param("uid") int uid);
    public int deleteArticle(@Param("aid") int aid);
}
