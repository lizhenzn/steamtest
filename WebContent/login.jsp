<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/login.css" rel="stylesheet" type="text/css">
<link href="css/stars.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/register.js"></script>
 <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<div class="head">
<img  id="mainicon" src="assets/globalheader_logo.png" ></img>
	<div class="title">Simulator</div>
	<div class="guidediv"   style= "position:absolute;left:45%;top:6%;">
				<a href="index.jsp">游戏商店</a>
				<a href="GameRepertory.jsp">游戏库</a>
	</div>
</div>
	
<div class="wrap">
<canvas></canvas>
 	<script type="text/javascript" src="js/stars.js"></script>
	<div class="content"><p>Steam Simulator </p><p>您的游戏专属平台</p>
	<img src="assets/star.gif" />
	</div>
	
	<div class="login_frame" id="login_register">
		<form action="LoginServlet" method="GET">
		<div class="login_frame">
		<p class="login_tip">登录</p>
		<input type="text" placeholder="请输入邮箱" id='user'>
		<input type="password" placeholder="请输入密码" id='psw'>
		<input type="button" onclick="login()" value="登录"style="background-color: turquoise;"/>
		<input type="button" onclick="onRegister()" value="点击注册"style="background-color: turquoise;"/>
		</div>
		</form>
	</div>
</div>
 <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
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
	var data={
			user:user.value,
			psw:psw.value
	}
	var systemURL="http://localhost:8080/SteamSimulator/LoginServlet";
	var indexUrl="http://localhost:8080/SteamSimulator/index.jsp";


	//AJAX向后台发送用户名和密码
	 $.ajax({
		    url : systemURL,// 获取自己系统后台用户信息接口
		    data :{"psw":psw.value,"user":user.value},
		    type : "POST",
		    dataType: "text",
		    success : function(data) {
		    	data=data.toString();
		      if (data){
		    	  console.log(data);
		        if (data == "success") { //判断返回值，这里根据的业务内容可做调整
		        	//显示跳转提示
		        	console.log(data);
		            //setTimeout(function () {//做延时以便显示登录状态
		            	window.location.href = indexUrl;//指向登录的页面地址
		            //},3000);
		          } else if(data="fail"){
		        	  alert("登陆失败！");
		          }
		          else{
		        	 alert("登录异常，请稍后重试");
		          }
		        }
		      },
		      error : function(data){
		        alert("网络错误，请稍后重试！");
		      }
		  });
}
</script>
	
<div class="foot">

	
</div>
	
	
</body>
</html>