<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@page import="databeans.*" %> 
<%@page import="java.util.ArrayList" %>   
<!DOCTYPE html>
<html>
<head>
<title>PlayGame</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.4.1.min.js"></script>
<style>
.gameframe{
	width:90%;
	height:89%;
	left:5%;
	position:relative;
}
</style>
</head>
<body>
<div class="head">
<img id="mainicon" src="assets/globalheader_logo.png" ></img>
 	<div class="title">Simulator</div>
	<div class="guidediv"   style= "position:absolute;left:45%;top:6%;">
				<a href="index.jsp">游戏商店</a>
				<a href="GameRepertory.jsp">游戏库</a>
	</div>
</div>
<div class="wrap">
<%
	int offset=Integer.parseInt(request.getParameter("offset"));
	ArrayList<GameInfo> gameList=(ArrayList<GameInfo>)session.getAttribute("gamerepe");
	GameInfo gameInfo=gameList.get(offset);
	System.out.print(gameInfo.getRsc()+"\n");
%>
<embed class="gameframe" src="<%=gameInfo.getRsc()%>">
</div>
	<div class="foot"></div>
</body>
</html>