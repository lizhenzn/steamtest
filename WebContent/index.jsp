<%@ page language="java" contentType="text/html; "
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>

<%@page import="index.*" %>
<%@page import="java.util.*" %>
<%@page import="databeans.UserInfo" %>

<% GameList gameList=new GameList(); %>
<% gameList.addItem("test.png","name1");%>
<% gameList.addItem("test.png","name2");%>
<% gameList.addItem("test.png","name3");%>
<% gameList.addItem("test.png","name4");%>
<% gameList.addItem("test.png","name5");%>
<% gameList.addItem("test.png","name6");%>
<% gameList.addItem("test.png","name7");%>
<% gameList.addItem("test.png","name8");%>
<% gameList.addItem("test.png","name9");%>
<% gameList.addItem("test.png","name10");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="js/jquery-3.4.1.min.js"></script>
<script>
	function nextPage(){
		var str =""
	    str+='<caption>游戏信息</caption><tr><td><button onclick="nextPage()">下一页</button></td></tr>'
		str+='<tr><td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(0)%>"/></a></td><td><%= gameList.getName(0) %></td></tr>' 	
		str+='<tr><td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(1)%>"/></a></td><td><%= gameList.getName(1) %></td></tr>'
  		str+='<tr><td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(2)%>"/></a></td><td><%= gameList.getName(2) %></td></tr>'
  		str+='<tr><td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(3)%>"/></a></td><td><%= gameList.getName(3) %></td></tr>'
  		str+='<tr><td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(4)%>"/></a></td><td><%= gameList.getName(4) %></td></tr>'
	$("#gameInfo").html(str)
	}
</script>
<title>游戏商店</title>
</head>
<body>
<div style="position:absolute;left:50px;top:50px;">
	<table width="600px">
		<tr>
			<td>
				<a href="index.jsp">游戏商店</a>
			</td>
			<td>
				<a href="GameRepertory.jsp">游戏库</a>
			</td>
			<td>
				<a href="">购物车</a>
			</td>
		</tr>
	</table>
</div>
<%UserInfo user=(UserInfo) session.getAttribute("user"); 
if(user!=null){%>
<div style="position:absolute;right:50px;top:10px;">
	用户名: <%=user.getUsername() %>      账户余额: <%=user.getMoney() %>
</div>
<%} %>
<div style="position:absolute;left:50px;top:100px;">
	<table id="gameInfo">
  	<caption>游戏信息</caption>
  	<tr>
  		<td>
  			<button onclick="nextPage()">
  				下一页
  			</button>
  		</td>
  	</tr>
  	<tr>
  			<td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(0)%>"/></a></td>
  			<td><%= gameList.getName(0) %></td>  		
  	</tr>
  	<tr>
  		<td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(1)%>"/></a></td>
  		<td><%= gameList.getName(1) %></td>
  	</tr>	
  	<tr>
  		<td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(2)%>"/></a></td>
  		<td><%= gameList.getName(2) %></td>
  	</tr>	
  	<tr>
  		<td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(3)%>"/></a></td>
  		<td><%= gameList.getName(3) %></td>
  	</tr>	
  	<tr>
  		<td><a href="PresentGame.jsp"><img width=100 height=100 src="<%=gameList.getImg(4)%>"/></a></td>
  		<td><%= gameList.getName(4) %></td>
  	</tr>
  	
  	  			
  </table>
</div>
<%
	
%>
</body>
</html>