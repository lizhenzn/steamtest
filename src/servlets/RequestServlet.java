package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DBCPManager;

/**
 * Servlet implementation class RequestServlet
 */
@WebServlet("/register")
public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("useremail");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String method=request.getParameter("method");
		if(method!=null&&username!=null&&password!=null&&email!=null&&method.equals("register")) {
			Connection conn=DBCPManager.getConn();
			String sql="select email from user where email=?";
			try {
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, email);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {//已经存在
					response.getWriter().print("already");
				}else {//可以插入
					sql="insert into user (email,username,password,money) value(?,?,?,?)";
					ps=conn.prepareStatement(sql);
					ps.setString(1, email);
					ps.setString(2, username);
					ps.setString(3, password);
					ps.setFloat(4, 0);
					if(ps.executeUpdate()!=0) {
						response.getWriter().print("success");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {conn.close();} catch (SQLException e) {}
			}	
		}else {
			System.out.println("Register: 输入异常");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
