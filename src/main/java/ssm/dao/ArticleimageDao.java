package ssm.dao;

import org.apache.ibatis.annotations.Param;
import ssm.entity.Articleimage;

import java.util.List;

public interface ArticleimageDao {
    public int addimage(@Param("aid")int aid,@Param("articleimage")String articleimage);
    public int deleteimage(@Param("aid")int aid);
    public List<Articleimage> getImageByAid(@Param("aid")int aid);
}
