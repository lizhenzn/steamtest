<%@ page language="java" contentType="text/html; "
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="index.*" %>
<%@page import="java.util.*" %>
<%@page import="utils.*" %>
<%@page import="databeans.*" %>
<% 
	GameList gameList=null;
	gameList=(GameList)session.getAttribute("GameList");
if(gameList!=null)
	gameList=new GameList(gameList.getPage());
else
	gameList=new GameList();
	Connection conn; 
	if((conn=DBCPManager.getConn())==null){
		System.out.print("fail to connect dbcp\n");
	}else { 
		System.out.print("connect to dbcp successfully\n");} 
 		ResultSet set= conn.createStatement().executeQuery("select * from game;"); 
 		while(set.next()){  
 			gameList.addItem(new GameInfo(set)); 
		}
	session.setAttribute("GameList", gameList); 
	conn.close();
	if(request.getParameter("cmd")==null){
		
	}
	else if(request.getParameter("cmd").equals("nextPage") ){
		System.out.print("enter nextPage\n");
		gameList.nextPage();
		session.setAttribute("GameList",gameList);
	}
	else if (request.getParameter("cmd").equals("lastPage") ){
		System.out.print("enter lastPage\n");
		gameList.lastPage();
		session.setAttribute("GameList",gameList);
	}
	else{
		System.out.print("fail to get cmd\n");
		System.out.print("para="+request.getParameter("cmd")+"\n");
	}
	
%>
<%-- <% Connection conn; %> --%>
<%-- <% if((conn=DBCPManager.getConn())==null){ %> --%>
<%-- <% System.out.print("fail to connect dbcp\n"); %> --%>
<%-- <% }else { %> --%>
<%-- <%  System.out.print("connect to dbcp successfully\n");} %> --%>
<%-- <%  ResultSet set= conn.createStatement().executeQuery("select * from game;"); %> --%>
<%-- <% while(set.next()){  %> --%>
<%-- <% gameList.addItem("test.png",set.getString("name")); %> --%>
<%-- <% gameList.addItem("test.png",set.getString("name")); %> --%>
<%-- <% gameList.addItem("test.png",set.getString("name")); %> --%>
<%-- <% gameList.addItem("test.png",set.getString("name")); %> --%>
<%-- <% gameList.addItem("test.png",set.getString("name")); %> --%>
<%-- <% gameList.addItem("test.png",set.getString("name")); %> --%>
<%-- <% conn.close(); %> --%>


<!DOCTYPE html>
<html>
<head>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/stars.css" rel="stylesheet" type="text/css">
<link href="css/pagingArrow.css" rel="stylesheet" type="text/css">
<link href="css/gamelist.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function transGameInfo(index){
		$.ajax({
			url:"http://localhost:8080/SteamSimulator/IndexServlet",
			type:"POST",
 			data:{"cmd":"transGameInfo","index":index},
 			dataType:"text",
			success:function(data){
				alert("succcess!");
			},
			error : function(data){
		        alert("网络错误，请稍后重试！");
		      }
		});
	}
	function jumpWithCmd(cmd){
		console.log("/index.jsp?cmd="+cmd);
		window.location.assign("index.jsp?cmd="+cmd);
	}
</script>
<style type="text/css">
	.changePage {
    background-color: #f1f1f1;
    color: black;
}
.changePage:hover {
    background-color: #4CAF50;
    color: white;
}
</style>
<title>游戏商店</title>
</head>
<body>
<div class="head">
<img id="mainicon" src="assets/globalheader_logo.png" ></img>
 	<div class="title">Simulator</div>
	<div class="guidediv"  style="position:absolute;left:45%;top:6%;" >
				<a href="index.jsp">游戏商店</a>
				<a href="GameRepertory.jsp">游戏库</a>
	</div>

<div style="position:absolute;right:5%;top:10%;color:#b8b6b4 ;" class="guidediv">
	<% Object object=session.getAttribute("user"); %>
	<% if(object==null) {%>
		<a href="login.jsp">登陆</a>
	<% } else { %>
	<% UserInfo user=(UserInfo)object;%>
	用户名：<%= user.getUsername() %> 账户余额：<%= user.getMoney() %>
	<a href="topup.jsp">充值</a>
	<%}%>
</div>
</div>

<div class="wrap">

<canvas></canvas>
 	<script type="text/javascript" src="js/stars.js"></script>	
 	<div class=" arrow left" onclick="jumpWithCmd('lastPage')"><div></div></div>
<div class=" arrow right" onclick="jumpWithCmd('nextPage')"><div></div></div>
  	<div class="gamelist" >
  	<% for(int i=0;(gameList.getImg(i)!=null)&&i<8;i++){%> 
  	 	
  			<a class="gameitem"  href="detail.jsp" onclick="transGameInfo(<%=i %>)">
			 		<img  class="gameimg"  src="<%= gameList.getGameItem(i).getImg1()%>"/>
			 		<div class="gameinfo">
			 			<div class="gametitle"><%=gameList.getGameItem(i).getName() %></div>
			 			<div class="extrainfo"><p><%=gameList.getGameItem(i).getIntro() %></p></div>
			 		</div>
			 		<div class="gamemethod">
			 			<% int discount=0;
			 			if(gameList.getGameItem(i).getDiscount()!=null)
			 			discount=Integer.parseInt(gameList.getGameItem(i).getDiscount()); %>
			 			<% if (discount!=0) {%>
 			 			<div class="gameprice discount"><%=(int)gameList.getGameItem(i).getPrice() %></div>
 			 			<div class="gameprice priceshow"><p><%=(int)((gameList.getGameItem(i).getPrice())*(1-(float)discount/100)) %></p>
 			 			<p>(优惠 <%=discount %>%！)</p>
 			 			<%} else { %>
 			 			<div class="gameprice discount"></div>
 			 			<div class="gameprice priceshow"><p><%=(int)gameList.getGameItem(i).getPrice() %></p>
 			 			<%} %>	 			
 			 			</div>
			 		</div>
		 		</a>			
  	<%}%>
  	</div>
  <div class="infoblock"> <img src="assets/forge.gif" width="256px" height="256px"/> </div>
</div>
<div class="foot"></div>
<%
	
%>
</body>
</html>