package databeans;

import java.io.Serializable;
import java.sql.Timestamp;

public class RecordInfo implements Serializable {
    public RecordInfo(){}
    public RecordInfo(String user_email,String gid,String status,
    Timestamp timestamp,float price){
        setUser_email(user_email);
        setGid(gid);
        setStatus(status);
        setTimestamp(timestamp);
        setPrice(price);
    }
    private String user_email;
    private String gid;
    private String status;
    private Timestamp timestamp;
    private float price;

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
