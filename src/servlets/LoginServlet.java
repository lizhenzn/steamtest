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
 * Servlet implementation class Login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user=request.getParameter("user");
		String psw=request.getParameter("psw");
		System.out.println("user:"+user+"   psw:"+psw);
		if(user!=null&&psw!=null) {
			Connection conn=DBCPManager.getConn();
			if(conn!=null) {
				System.out.println("���ݿ����ӳɹ�");
			}
			String sql="select * from user where email=? and psw=?";
			try {
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, user);
				ps.setString(2, psw);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {//�Ѿ�����
					System.out.println("���ݿ��д���");
					response.getWriter().print("success");
					
				}else {//���Բ���
					System.out.println("���ݿ�û�д���");
					response.getWriter().print("fail");
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {conn.close();} catch (SQLException e) {}
			}	
		}else {
			System.out.println("Login: �����쳣");
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
