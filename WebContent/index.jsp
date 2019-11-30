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
	if(request.getParameter("cmd")==null){
		gameList=new GameList();
		 Connection conn; 
		 if((conn=DBCPManager.getConn())==null){
		System.out.print("fail to connect dbcp\n");
		}else { 
		System.out.print("connect to dbcp successfully\n");} 
		  ResultSet set= conn.createStatement().executeQuery("select * from game;"); 
		  while(set.next()){  
		  gameList.addItem("test.png",set.getString("name")); 
		  gameList.addItem("test.png",set.getString("name")); 
		  gameList.addItem("test.png",set.getString("name")); 
		  gameList.addItem("test.png",set.getString("name")); 
		  gameList.addItem("test.png",set.getString("name")); 
		  gameList.addItem("test.png",set.getString("name")); 
		 }
		 session.setAttribute("GameList", gameList); 
		 conn.close(); 
	}
	else if(request.getParameter("cmd").equals("nextPage") ){
		System.out.print("enter nextPage\n");
		gameList=(GameList)session.getAttribute("GameList");
		gameList.nextPage();
		session.setAttribute("GameList",gameList);
	}
	else if (request.getParameter("cmd").equals("lastPage") ){
		System.out.print("enter lastPage\n");
		gameList=(GameList)session.getAttribute("GameList");
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
<meta charset="ISO-8859-1">
<link href="css/login.css" rel="stylesheet" type="text/css">
<script src="jquery-3.4.1.js"></script>
<script type="text/javascript">
// 	function nextPage(){
// 		$.ajax({
// 			url:"http://localhost:8080/SteamSimulator/IndexServlet",
// 			type:"POST",
//  			data:{"cmd":"nextPage"},
//  			dataType:"text",
// 			success:function(data){
// 				alert("succcess!");
// 			},
// 			error : function(data){
// 		        alert("网络错误，请稍后重试！");
// 		      }
// 		});
		
// 	}
// 	function lastPage(){

// 	}
</script>
<title>游戏商店</title>
</head>
<body>
<div class="head">
	<div style="position:absolute;left:50px;top:50px;">
	<table width=600px>
		<tr>
			<td>
				<a href="index.jsp">游戏商店</a>
			</td>
			<td>
				<a href="GameRepertory.jsp">游戏库</a>
			</td>
		</tr>
	</table>
</div>

<div style="position:absolute;right:50px;top:10px;">
	<% Object object=session.getAttribute("user"); %>
	<% if(object==null) {%>
		<a href="login.jsp">登陆</a>
		<a href="RegisterPage.jsp">注册</a>
	<% } else { %>
	<% UserInfo user=(UserInfo)object;%>
	用户名：<%= user.getUsername() %> 账户余额：<%= user.getMoney() %><a href="">充值</a>
	<%}%>
</div>
<h1 style="position:absolute; left:700px;top:100px;">游戏信息</h1>
</div>

<div class="wrap">
	<div style="position:absolute;left:50px;top:0px;">
	 
	<table border=0 id="gameInfo" style="position:absolute;left:50px;">
  	<tr>
  		<td>
  			<form method="POST">
  				<input type="submit"  value="下一页">
  				<input type="hidden" name="cmd" value="nextPage">
  			</form>
  		</td>
  		<td>
  			<form method="POST">
  				<input type="submit"  value="上一页">
  				<input type="hidden" name="cmd" value="lastPage">
  			</form>
  		</td>
  	</tr>
  	<% %>
  	<% for(int i=0;(gameList.getImg(i)!=null)&&i<5;i++){%>  
  	<tr>
  			<td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(i)%>"/></a></td>
  			<td><%= gameList.getName(i) %></td>  		
  	</tr>
  	
  	<%}%>
  	  			
  </table>
</div>
</div>

<%
	
%>
</body>
</html>