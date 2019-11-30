/**
 * 
 */
//验证表单是否为空，若为空则将焦点聚焦在input表单上，否则表单通过，登录成功
var systemURL="http://localhost:8080/SteamSimulator/register";
var loginUrl="http://localhost:8080/SteamSimulator/login.jsp";
function check(form){
  var accountName = $("#accountName"),password = $("#password"),userEmail=$("#userEmail");
  var accountName = accountName.val(),password = password.val(),userEmail=userEmail.val();
  console.log(accountName.toString());
  console.log(password.toString());
  console.log(userEmail.toString());
  if(!accountName || accountName == ""){
    showMsg("请输入用户名");
    form.accountName.focus ();
    return false;
  }
  if(!userEmail || userEmail == ""){
	    showMsg("请输入邮箱");
	    form.accountName.focus ();
	    return false;
	  }
  if(!password || password == ""){
    showMsg("请输入密码");
    form.password.focus ();
    return false;
  }
  if(password&&password.length<6){
	  showMsg("请输入密码");
	  form.password.focus();
	  return false;
  }
//这里为用ajax获取用户信息并进行验证，如果账户密码不匹配则登录失败，如不需要验证用户信息，这段可不写

 $.ajax({
    url : systemURL,// 获取自己系统后台用户信息接口
    data :{"password":password,"username":accountName,"useremail":userEmail,"method":"register"},
    type : "POST",
    dataType: "text",
    success : function(data) {
    	data=data.toString();
      if (data){
    	  console.log(data);
        if (data == "success") { //判断返回值，这里根据的业务内容可做调整
        	//显示跳转提示
        	console.log(data);
            setTimeout(function () {//做延时以便显示注册状态
            	var inform="注册成功，即将回到登陆页面";
            	showMsg(inform);
            	window.location.href = loginUrl;//指向登录的页面地址
            },2000);
          } else if(data="already"){
        	  showMsg("该邮箱已经被注册！");
          }
          else{
        	 showMsg("注册异常，请稍后重试");
          }
        }
      },
      error : function(data){
        showMsg("网络错误，请稍后重试！");
      }
  });
}
 
//错误信息提醒
function showMsg(msg){
	$("#CheckMsg").text("");
//给要启用动画的标签绑定设置好的css动画   
  document.getElementById("CheckMsg").className="message";
  setTimeout(function () {//做延时以便显示注册状态
	  $("#CheckMsg").text(msg);
  },500);
 //展示完成后，删除绑定的动画，以便可以下次触发的时候可以再次显示动画效果
}

function onRegister(){
	var htmlcontent=" <form id='user_login' action=‘’>" +
      "<p class='login_tip'>欢迎加入 Steam(Simulator)</p>"+
      "<input class='name' name='' id='userEmail' type='email' placeholder='请输入邮箱'>"+
     "<input class='name' name='' id='accountName' type='text' placeholder='请输入用户名'>"+
      "<input class='code' name='password' id='password' type='password' placeholder='请输入密码'>"+
      " <div id='CheckMsg'></div>"+
      "<div class='btn'>"+
        "<input type='button' id='submit' class='submit' value='注册' onclick='return check(this.form);'>"+
      "</div>"+
      
   " </form>";
	document.getElementById("login_register").innerHTML=htmlcontent;
	return;
}

//监听回车键提交
function bindEnter(){
  document.onkeydown=keyDownSearch;
  function keyDownSearch(e) {
    // 兼容FF和IE和Opera
    var theEvent = e || window.event;
    var code = theEvent.keyCode || theEvent.which || theEvent.charCode;
    if (code == 13) {
      $('#submit').click();//具体处理函数
      return false;
    }
    return true;
  }
};