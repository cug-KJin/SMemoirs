package ssm.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Article {
    private int aid = 0;
    private int uid;
    private String username;
    private int sid;
    private String description = null;
    private Date createtime;
    public Article(){}

    public Article(int uid,String username, int sid, String description){
        this.sid = sid;
        this.uid = uid;
        this.username = username;
        this.description = description;
    }
    public Article(int aid,int uid,String username, int sid, String description){
        this.aid = aid;
        this.sid = sid;
        this.uid = uid;
        this.username = username;
        this.description = description;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public int getAid() {
        return aid;
    }

    public int getUid() {
        return uid;
    }

    public int getSid() {
        return sid;
    }

    public String getDescription() {
        return description;
    }

    public Date getCreatedate() {
        return createtime;
    }

    @Override
    public String toString() {
        return "article{" +
                "aid=" + aid +
                ", uid=" + uid +
                ", sid=" + sid +
                ", description='" + description + '\'' +
                ", createdate=" + createtime +
                '}';
    }
}
