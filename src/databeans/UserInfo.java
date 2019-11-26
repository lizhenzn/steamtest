package databeans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserInfo implements Serializable {
	public UserInfo(){
	}
	public UserInfo(String email,String username,String password,float money){
		this.email=email;
		this.username=username;
		this.password=password;
		this.money=money;
	}
	public UserInfo(ResultSet rs) {
		try {setEmail(rs.getString("email"));} catch (SQLException e) {}
		try {setUsername(rs.getString("username"));} catch (SQLException e) {}
		try {setPassword(rs.getString("password"));} catch (SQLException e) {}
		try {setMoney(rs.getFloat("money"));} catch (SQLException e) {}
	}
	private String email;
	private String username;
	private String password;
	private float money;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}
}