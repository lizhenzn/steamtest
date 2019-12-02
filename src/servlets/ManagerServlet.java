package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databeans.GameInfo;
import utils.DBCPManager;
 /* Servlet implementation class ManagerServlet
 */
@WebServlet("/ManagerServlet")

public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String doWhat=request.getParameter("doWhat");
		System.out.println("do:"+doWhat);
		if(doWhat!=null) {
			if(doWhat.equals("allGameInfo")) {
				System.out.println("�õ�������Ϸ��Ϣ");
				List<GameInfo> gameInfos=new ArrayList<GameInfo>();
				String sql="select * from game;";				
				Connection conn=DBCPManager.getConn();
				try {
					PreparedStatement ps=conn.prepareStatement(sql);
					ResultSet rs=ps.executeQuery();
					while(rs.next()) {//�Ѿ�����
						GameInfo game=new GameInfo(rs);
						gameInfos.add(game);
						System.out.println("");
												
					}
					System.out.println("����"+gameInfos.toString());
					//TODO AJAX����Ϸ������ǰ̨
					} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					try {conn.close();} catch (SQLException e) {}
				}	
			}else if(doWhat.equals("up")) {
				String gameName=request.getParameter("gameName");
				String gamePrice=request.getParameter("gamePrice");
				String gameIntro=request.getParameter("gameIntro");

				

				String sql="insert into game(gid,name,price,intro,img1,img2,img3) values(?,?,?,?,?,?,?);";				
				Connection conn=DBCPManager.getConn();
				try {
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setString(1, gameName);
					ps.setString(2, gameName);
					ps.setString(3, gamePrice);
					ps.setString(4, gameIntro);
					ps.setString(5, gameName+"1.jpg");
					ps.setString(6, gameName+"2.jpg");
					ps.setString(7, gameName+"3.jpg");

					
					ps.execute();//����
						
						System.out.println("�ϼܳɹ�");
						
						
						response.getWriter().print("up-success");
						
					
						
						
					
					//TODO AJAX����Ϸ������ǰ̨
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("�ϼ�ʧ��");
					response.getWriter().print("up-fail");
				}finally {
					try {conn.close();} catch (SQLException e) {}
				}	
			}else if(doWhat.equals("down")) {
				String gameName=request.getParameter("gameName");
				System.out.println("���յ�ǰ��AJAX�����¼�"+gameName);

				String sql="delete from game where name=?;";				
				Connection conn=DBCPManager.getConn();
				try {
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setString(1, gameName);
					
					ps.execute();//ɾ��
						
						System.out.println("ɾ����Ϸ�ɹ�:"+gameName);
						response.getWriter().print("down-success");
						
					
					//TODO AJAX����Ϸ������ǰ̨
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("ɾ����Ϸʧ��"+gameName);
					response.getWriter().print("down-fail");
				}finally {
					try {conn.close();} catch (SQLException e) {}
				}	
			}else if(doWhat.equals("discount")) {//����
				String gameName=request.getParameter("gameName");				
				int discount=Integer.valueOf(request.getParameter("gameDiscount"));
				System.out.println("��Ϸ����"+gameName+"�ۿۣ�"+discount);
				String sql="update  game set discount=? where gid=?;";				
				Connection conn=DBCPManager.getConn();
				try {
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setInt(1, discount);
					ps.setString(2, gameName);
				
					ps.execute(); //�����ۿ�
						
						System.out.println("������Ϣ���³ɹ�");
						
						
						response.getWriter().print("discount-success");
					
					//TODO AJAX����Ϸ������ǰ̨
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("������Ϣ����ʧ��");
					response.getWriter().print("discount-fail");
				}finally {
					try {conn.close();} catch (SQLException e) {}
				}	
				
			}
		}else {
			//TODO ���ش�����Ϣ
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
