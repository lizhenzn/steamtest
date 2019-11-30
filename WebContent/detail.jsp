<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>游戏详情</title>
<link href="css/detail.css" type="text/css" rel="stylesheet" />
</head>


<body>
 
   <ul>
<li><a href="">游戏商城</a></li>
<li><a href="topup.jsp">充值</a></li>
<li><a href="#">Link three</a></li>
<li><a href="#">Link four</a></li>
</ul>

<div style="width:733px; height:320px; margin:0 auto;">
<div class="wrap"> 
		<a href="index.jsp"> 
     	<img src='image/wei.jpg' style="width:980;height=51" alt='' />
      			<p> <b>韦</b> <span>无所畏惧<br /> <br />
         			 handsome  boy
          		 </span>
      			</p>
        </a> 
 </div>
<!-- end wrap -->
<div class="wrap" > 
           <a href="#x" > 
           <img src='image/hou.jpg' alt='' />
           <p> <b>厚</b> 
           <span>独一无二<br /><br />
                                    帅哥
            </span> </p>
         </a>
</div>
<!-- end wrap -->
<div class="wrap"> <a href="#x"> <img src='image/zhou.jpg' alt='' />
  <p> <b>舟</b> <span>帅到掉渣<br />
    <br />
    帅到炸 </span> </p>
  </a> </div>
  
   <form method="post" action="detail">
        <p><input type="submit" name="buy" value="充值"></p>
     
    </form>
  
  
  
 </div>
</body>
</html>
