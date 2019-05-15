package ssm.entity;

import lombok.Data;

@Data
public class Articleimage {
    private int imageid;
    private int aid;
    private String articleimage;

    public int getImageid() {
        return imageid;
    }

    public int getAid() {
        return aid;
    }

    public String getArticleimage() {
        return articleimage;
    }

    @Override
    public String toString() {
        return "articleimage{" +
                "imageid=" + imageid +
                ", aid=" + aid +
                ", image='" + articleimage + '\'' +
                '}';
    }
}
