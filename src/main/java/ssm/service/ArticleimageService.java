package ssm.service;

import ssm.entity.Articleimage;

import java.util.List;

public interface ArticleimageService {
    public int addimage(int aid, String articleimage);
    public int deleteimage(int aid);
    public List<Articleimage> getImageByAid(int aid);
}
