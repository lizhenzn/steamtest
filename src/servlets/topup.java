package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databeans.UserInfo;
import utils.DatabaseManager;

/**
 * Servlet implementation class topup
 */
@WebServlet("/topup")
public class topup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public topup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		String sql;
		String  money;
		HttpSession session=request.getSession();
	//	PrintWriter writer = response.getWriter();
		String way=request.getParameter("topup");
		float money1=Float.valueOf(way);

		
		UserInfo user=(UserInfo) session.getAttribute("user");
		sql="select money from user where email="+"'"+user.getEmail()+"'";
		ResultSet rest;
	    try {
			rest = DatabaseManager.search(sql);
		 if(rest.next())
		  {
				money=rest.getString("money");
				money1=money1+Float.valueOf(money);
		     sql="update user set money= "+money1+" where email= "+"'"+user.getEmail()+"'";
		     DatabaseManager.update(sql);
		     
		     user.setMoney(money1);
		     
		     
		  }
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    
		

	    response.sendRedirect("topup.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
