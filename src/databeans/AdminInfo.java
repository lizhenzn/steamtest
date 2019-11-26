package databeans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AdminInfo implements Serializable {
	public AdminInfo(){}
	public AdminInfo(String admin_id,String password){this.admin_id=admin_id;this.password=password;}
	public AdminInfo(ResultSet rs) {
		try {setAdmin_id(rs.getString("admin_id"));} catch (SQLException e) {}
		try {setPassword(rs.getString("password"));} catch (SQLException e) {}
	}
	private String admin_id;
	private String password;

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}