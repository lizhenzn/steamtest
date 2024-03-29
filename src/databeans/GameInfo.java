package databeans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GameInfo implements Serializable {
	public GameInfo(){}
	public GameInfo(String gid,String name,String intro,String img1,
	String img2,String img3,String discount,String type,String rsc,int sells,float price){
		setGameid(gid);
		setName(name);
		setIntro(intro);
		setImg1(img1);
		setImg2(img2);
		setImg3(img3);
		setDiscount(discount);
		setType(type);
		setRsc(rsc);
		setSells(sells);
		setPrice(price);
	}
	public GameInfo(ResultSet rs) {
		try {setGameid(rs.getString("gid"));} catch (SQLException e) {}
		try {setName(rs.getString("name"));} catch (SQLException e) {}
		try {setIntro(rs.getString("intro"));} catch (SQLException e) {}
		try {setImg1(rs.getString("img1"));} catch (SQLException e) {}
		try {setImg2(rs.getString("img2"));} catch (SQLException e) {}
		try {setImg3(rs.getString("img3"));} catch (SQLException e) {}
		try {setPrice(rs.getFloat("price"));} catch (SQLException e) {}
		try {setDiscount(rs.getString("discount"));} catch (SQLException e) {}
		try {setType(rs.getString("type"));} catch (SQLException e) {}
		try {setSells(rs.getInt("sells"));} catch (SQLException e) {}
		try {setRsc(rs.getString("rsc"));} catch (SQLException e) {}
	}
	private String gameid;
	private String name;
	private String intro;
	private String img1;
	private String img2;
	private String img3;
	private String discount;
	private String type;
	private String rsc;
	private int sells;
	private float price;

	public String getGameid() {
		return gameid;
	}

	public void setGameid(String gameid) {
		this.gameid = gameid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getRsc() {
		return rsc;
	}

	public void setRsc(String rsc) {
		this.rsc = rsc;
	}

	public int getSells() {
		return sells;
	}

	public void setSells(int sells) {
		this.sells = sells;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
}