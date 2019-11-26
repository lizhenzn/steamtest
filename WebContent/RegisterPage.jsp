<%@ page language="java" contentType="text/html; "
    pageEncoding="UTF-8"%>
<%@page import="databeans.UserInfo" %>
<!DOCTYPE html>
<html>
<head>
<title>欢迎来到Sbeam</title>
<link href="css/common.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="js/register.js"></script>
 <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<% 
	UserInfo user=null;
%>
<div class="content">
  <div class="login-wrap">
    <form id="user_login" action="">
      <h3>欢迎加入 Steam(Simulator)</h3>
      <input class="name" name="" id="userEmail" type="text" placeholder="请输入邮箱">
      <input class="name" name="" id="accountName" type="text" placeholder="请输入用户名">
      <input class="code" name="password" id="password" type="password" placeholder="请输入密码">
      <div class="btn">
        <input type="button" id="submit" class="submit" value="注册" onclick="return check(this.form);">
        <input type="reset" id="reset" class="reset" value="重置" >
      </div>
        <div id="CheckMsg" class="msg"></div>
    </form>
  </div>
</div>
</body>
</html>