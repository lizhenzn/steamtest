package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import databeans.GameInfo;
import databeans.RecordInfo;
import databeans.UserInfo;
import utils.DatabaseManager;

public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		String sql;
		ResultSet rest; 
		HttpSession session=request.getSession();
		PrintWriter writer = response.getWriter();
		String way=request.getParameter("buy");
		
		UserInfo user=(UserInfo) session.getAttribute("user");
		GameInfo gameInfo=(GameInfo) session.getAttribute("GameInfo");
		String user_email=user.getEmail();
		String gid=gameInfo.getGameid();
		String status="bought";
		java.sql.Timestamp timestamp=new java.sql.Timestamp(System.currentTimeMillis());
		float price=gameInfo.getPrice();
		sql="select gid from records where user_email="+"'"+user.getEmail()+"'  and"+" gid="+"'"+gid+"'";
		float money=user.getMoney();
		
		try {
			rest=DatabaseManager.search(sql);
			if(rest.next())
			{
				writer.println("您已购买此游戏");
			}
	
			else
			{
				if(money<price)
				{
				  // ("余额不足  请充值");
			    	response.sendRedirect("topup.jsp");
				}
				else
				{
					RecordInfo recordInfo= new RecordInfo(user_email,gid,status,timestamp,price);
					@SuppressWarnings("unchecked")
					ArrayList<GameInfo> records=(ArrayList<GameInfo>) session.getAttribute("gamerepe");
					if(records!=null)
						records.add(gameInfo);
					money=money-price;
					sql="update user set money="+money+" where email="+"'"+user.getEmail()+"'";
					user.setMoney(money);
					DatabaseManager.update(sql);
					sql="insert into records values("+"'"+user_email+"'"+","+"'"+gid+"'"+","+"'"+status+"'"+","+"'"+timestamp+"'"+","+price+")";
					DatabaseManager.add(sql);
					response.sendRedirect("detail.jsp");
				}
			}
				
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
