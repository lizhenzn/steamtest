<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@page import="databeans.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="utils.DBCPManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
 	<%
 		ArrayList<GameInfo> gameRepo=null;
 		UserInfo user=null;
 		int count=0;
 		user=(UserInfo)session.getAttribute("userinfo");
 		if(user!=null){
 		gameRepo=(ArrayList<GameInfo>)session.getAttribute("gamerepo");
 		Connection conn=DBCPManager.getConn();
 		System.out.println("try get conn");
			if(conn!=null){
				System.out.println("get conn");
		 		if(gameRepo==null){//获取实例
		 				gameRepo=new ArrayList<GameInfo>();
		 				String sql="select * from game where gid in (select gid from records where user_email=?)";
		 				PreparedStatement ps=conn.prepareStatement(sql);
		 				ps.setString(1, user.getEmail());
		 				ResultSet rs=ps.executeQuery();
		 				while(rs.next()){gameRepo.add(new GameInfo(rs));}
		 				session.setAttribute("gamerepo",gameRepo);
		 				System.out.println("get repo");
		 			}
		 		String sql="select count(gid)as nums from records where user_email=?";
		 		PreparedStatement ps=conn.prepareStatement(sql);
		 		count=ps.executeQuery().getInt("nums");
		 		System.out.println("get num");
	 			conn.close();
	 		}
 		}//至此，当用户登录时，将获取用户游戏列表，放入session，并获得游戏数量用来翻页
 		//每次进入页面都查一下游戏数量真的好吗？
 		//是否有必要考虑用户游戏列表数量过大？
 		
 	%>
 	<div>
 	<%if(gameRepo!=null)for(int i=0;i<gameRepo.size();i++){%>
 	<div class="gameblock"> <form method="post">
 	<input type="hidden" name="rscPath" value="<%= gameRepo.get(i).getRsc()%>"/>
 	<input type="submit"/>
 	</form> 
 	</div>
 	<%}%>
 	
 	</div>
</body>
</html>