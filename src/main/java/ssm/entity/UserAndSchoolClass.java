package ssm.entity;

import lombok.Data;

@Data
public class UserAndSchoolClass {
    /*
    `us_id` INT(10) ,
    `u_id` INT(10),
    `s_id` INT(10),
    `status` INT(1),
    * */
    private int usid = 0;
    private int uid = 0;
    private int sid = 0;
    private int status = 1;

    @Override
    public String toString() {
        return "UserAndSchoolClass{" +
                "usid=" + usid +
                ", uid=" + uid +
                ", sid=" + sid +
                ", status=" + status +
                '}';
    }

    public int getUsid() {
        return usid;
    }

    public void setUsid(int usid) {
        this.usid = usid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
