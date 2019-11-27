<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/register.js"></script>
 <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<div class="head">
	<div class="title">Steam Simulator</div>
</div>
	
<div class="wrap">
	<div class="content">Steam Simulator 您的游戏专属平台</div>
	<div class="login_frame" id="login_register">
		<form action="loginServlet" method="GET">
		<p class="login_tip">登录</p>
		<input type="text" placeholder="请输入用户名" id='user'>
		<input type="password" placeholder="请输入密码" id='psw'>
		<input type="submit" onclick="login()" value="登录" style="background-color: turquoise;">
		<a href=''>点击注册</a>
		</form>
		<button onclick="onRegister()">点击注册</button>
	</div>
</div>
<script>
function login(){
	var user=document.getElementById('user');
	var psw=document.getElementById('psw');
	if(!user.value){
		alert('用户名不能为空');
	}
	if(!psw.value){
		alert('密码不能为空');
	}

}
</script>
	
<div class="foot">

	
</div>
	
	
</body>
</html>