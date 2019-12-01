<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import="databeans.*" %>
<html>

<head>
<title>游戏详情</title>
<link href="css/detail.css" type="text/css" rel="stylesheet" />
</head>


<body>
 
   <ul>
<li><a href="login.jsp">退出</a></li>
<li><a href="topup.jsp">充值</a></li>
<li><a href="index.jsp">游戏商城</a></li>
<li><a href="GameRepertory.jsp">我的游戏库</a></li>
</ul>
<%GameInfo gameInfo=(GameInfo)session.getAttribute("GameInfo"); %>
<% if(gameInfo==null) System.out.println(" game  null"); %>
<div style="width:733px; height:320px; margin:0 auto;">
<div class="wrap"> 
		<a  href="Detail"> 
     	<img src="<%=gameInfo.getImg1()%>" style="width:980;height=51" alt='' />
      			<p> <b><%=gameInfo.getName() %></b> <span><%=gameInfo.getIntro() %><br /> <br />
         			 
          		 </span>
      			</p>
        </a> 
 </div>
<!-- end wrap -->
<div class="wrap" > 
           <a href="Detail" > 
           <img src=<%=gameInfo.getImg2()%>  alt='' />
           <p> <b>价格:<%=gameInfo.getPrice() %></b> 
           <span><%=gameInfo.getIntro() %><br /><br />
                                
            </span> </p>
         </a>
</div>
<!-- end wrap -->
<div class="wrap"> <a href="Detail"> <img src=<%=gameInfo.getImg3()%> alt='' />
  <p> <b>折扣：<%=gameInfo.getDiscount()%></b> <span><%=gameInfo.getIntro() %><br />
    <br />
     </span> </p>
  </a> </div>
  
   <form method="post" action="Detail">
        <p><input type="submit" name="buy" value="buy"></p>
     
    </form>
  
  
  
 </div>
</body>
</html>