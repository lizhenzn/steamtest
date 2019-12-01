<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import="databeans.*"%>
<%@ page import="utils.*"%>
<%@page import="java.sql.ResultSet" %>
<head>
  <title>充值Login Form</title>
  <link rel="stylesheet" href="css/topup.css">
</head>
<body>
   <% UserInfo user=(UserInfo)session.getAttribute("user"); %>
  <section class="container">
    <div class="topup">
      <h1> <%=user.getUsername() %></h1>
      <h2>余额:<%=user.getMoney() %>元</h2>
     
      <form method="post" action="Topup">
        <p><input type="number" min=0 name="topup" value="0" placeholder="充值金额"></p>
        <p class="submit"><input type="submit" name="commit" value="充值"></p>
      </form>
    </div>
  </section>

  <section class="about">
    <p class="about-links">
      <a href="GameRepertory.jsp" target="_parent">我的游戏库</a>
      <a href="index.jsp" target="_parent">游戏商城</a>
    </p>
   
  </section>
</body>
</html>