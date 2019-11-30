<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@page import="databeans.GameInfo" %>
<%@page import="databeans.UserInfo" %>
<%@page import="java.util.ArrayList" %>
<%@page import="utils.DBCPManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<title>我的游戏库</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/gamelist.css" rel="stylesheet" type="text/css">
</head>
<%
		String hostUrl="http:localhost:8080/SteamSimulator/";
 		ArrayList<GameInfo> gameRepo=null;
 		UserInfo user=null;
 		int count=0;
 		int pages=0;
 		int index;
 		if(request.getParameter("index")!=null)index=Integer.parseInt(request.getParameter("index"));
 		else index=1;
 		user=(UserInfo)session.getAttribute("user");
 	if(user!=null){
 		gameRepo=(ArrayList<GameInfo>)session.getAttribute("gamerepo");
		 	if(gameRepo==null){//获取实例
		 		Connection conn=DBCPManager.getConn();
		 			if(conn!=null){
		 				gameRepo=new ArrayList<GameInfo>();
		 				String sql="select * from game where gid in (select gid from records where user_email=?)";
		 				PreparedStatement ps=conn.prepareStatement(sql);
		 				ps.setString(1, user.getEmail());
		 				ResultSet rs=ps.executeQuery();
		 				while(rs.next()){gameRepo.add(new GameInfo(rs));}
		 				session.setAttribute("gamerepo",gameRepo);
		 				System.out.println("get repo");
		 				conn.close();
		 			}
	 		}
			count=gameRepo.size();
 			pages=(count+9)/10;
 		}//至此，当用户登录时，将获取用户游戏列表，放入session，并获得游戏数量用来翻页
 		//每次进入页面都查一下游戏数量真的好吗？
 		//是否有必要考虑用户游戏列表数量过大？
 		else{//若用户没有登陆，提示并跳转
 			%>
 			<script type="text/javascript">
 				alert("您尚未登录，请先登录！");
 				var url="index.jsp";
 				go();
 				function go(){ 
 					location.href="login.jsp"; 
 					} 	
 			</script>
 			<%
 		}
 	%>
<body>
 	<div class="head">
 	<%if(user!=null){ %><div class="userwelcome">欢迎您:<%=user.getUsername()%></div><%} %>
 	</div>
 	<div class="wrap">
 	<div class="gamelist" >
	 	<%if(gameRepo!=null)for(int i=10*(index-1);i<gameRepo.size()&&i<index*10;i++){%>
	 		<a class="gameitem"   href="<%=hostUrl+"gamePlay?offset="+i %>">
		 		<img  class="gameimg"  src="<%= gameRepo.get(i).getImg1()%>"/>
		 		<div class="gameinfo">
		 			<div class="gametitle"><%=gameRepo.get(i).getName() %></div>
		 			<div class="extrainfo"><p>额外信息</p><p>额外信息</p><p>额外信息</p></div>
		 		</div>
		 		<div class="gamemethod">
		 			<!-- <div class="gameprice discount">40.00</div>
		 			<div class="gameprice priceshow"><p>30.00</p><p>(优惠 25%！)</p></div> -->
		 			<div class="gameprice discount"></div>
		 			<div class="gameprice priceshow">点击游玩</div>
		 		</div>
	 		</a>
	 	<%} %>
	 	<div class="paging">
 		<div>
		 	<form method="GET">
		 		<input class="paging-content pagebtn" type="submit" <%if(index-1<1)out.print("disabled='disabled'"); %> value="< 上一页">
		 		<input  type="hidden" name="index"  value="<%=index-1 %>">
		 	</form>
 		</div>
 		<div>
		 	<form method="GET">
		 		<input class="paging-content pagebtn" type="submit" <%if(index+1>pages)out.print("disabled='disabled'"); %>value="下一页 >">
		 		<input type="hidden" name="index"  value="<%=index+1 %>">
		 	</form>
 		</div>
 	</div>
 	</div>
 	<div class="infoblock"> 这是信息框 </div>
 	
 	</div>
 	
 	<div class="foot" ></div>
 	
</body>
</html>