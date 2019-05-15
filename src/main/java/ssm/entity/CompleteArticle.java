package ssm.entity;

import java.util.ArrayList;
import java.util.List;

public class CompleteArticle {
    private Article article = null;
    private List<Articleimage> list = null;
    private Users users = null;

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public List<Articleimage> getList() {
        return list;
    }

    public void setList(List<Articleimage> list) {
        this.list = list;
    }
}
