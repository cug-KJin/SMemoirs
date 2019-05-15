package ssm.entity;

import lombok.Data;

import java.util.Date;

@Data
public class SchoolClass {
    /*
    `s_id` int(10) ,
    `address`  varchar(255),
    `year` int(4) ,
    `classname` varchar(32) ,
    `u_id` int (10),
    `password` varchar (8),
    `description` varchar (255) ,
    `createtime` DATE,
    * */
    public SchoolClass(){}
    public SchoolClass(String address, int year, String classname, int uid, String password, String description) {
        this.address = address;
        this.classname = classname;
        this.year = year;
        this.uid = uid;
        this.password = password;
        this.description = description;
    }

    private int sid = 0;

    @Override
    public String toString() {
        return "SchoolClass{" +
                "sid=" + sid +
                ", address='" + address + '\'' +
                ", year=" + year +
                ", classname='" + classname + '\'' +
                ", uid=" + uid +
                ", password='" + password + '\'' +
                ", description='" + description + '\'' +
                ", createtime=" + createtime +
                '}';
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    private String address = null;
    private int year = 0;
    private String classname = null;
    private int uid = 0;
    private String password = null;
    private String description = null;
    private Date createtime = null;

}
