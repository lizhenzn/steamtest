<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="utils.*,databeans.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/manager.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>游戏管理</title>
</head>
<body>
    <div class="func_bar">
        <ul class="clear">
            <li onclick="show()">全部游戏</li>
            <li onclick="up()">上架</li>
        </ul>
    </div>
    <div class="list" id="container">
        

        <!--$(` <div><img src="${t[i].src}" alt=""> <p>${t[i].text}</p></div>`).appendTo($(.list))-->
    </div>
    <div class="discount_container" id="discount_container"></div>
 <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
 <script>
	var game=[];

        var choosedGame;
        show();
        function init(){
			game=[];
            document.getElementById("container").innerHTML='';

        	<% String sql="select * from game;";				
			Connection conn=DBCPManager.getConn();
			try {
				
	            List<GameInfo> list=new ArrayList<GameInfo>();
	            
	            
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {//已经存在
					GameInfo game=new GameInfo(rs);
					System.out.println("");
					list.add(game);
											
				}
				for(int i=0;i<list.size();i++){%>
				var g={src:"",name:""};
					g.src= 'images/'+'<%=list.get(i).getImg1()%>';
					g.name= '<%=list.get(i).getName()%>';
					game.push(g);
				<%}
				} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {conn.close();} catch (SQLException e) {}
			}	
			%>
             console.log(game)
            //控件添加  信息
            
                for(var i=0;i<game.length;i++){
                  $('<div class="listdiv"><img src='+game[i].src+' alt=""> <p>'+game[i].name+'</p><button>下架</button><button onclick="discount()">打折</button></div>').appendTo($('.list'));
                 }
            
        }
        function show(){
            init();
            $('.list div button').on('click',function(){
                choosedGame=$(this).parent().children()[1].innerHTML;
                console.log(choosedGame);
            console.log($(this).parent().children()[1].innerHTML);
            var button=$(this)[0].innerHTML;
            console.log(button);
            if(button=='下架'){
                if(confirm("确认要下架？")){
                    /*for(var k=0;k<game.length;k++){
                        if(game[k].name==choosedGame){
                            game.splice(k,1);
                            k--;
                        }
                    }*/
                    var systemURL="http://localhost:8080/SteamSimulator/ManagerServlet";      	
                	//AJAX向后台发请求所有游戏信息
                	 $.ajax({
                		    url : systemURL,// 获取自己系统后台用户信息接口
                		    data :{"doWhat":"down","gameName":choosedGame},
                		    type : "POST",
                		    dataType: "text",
                		    success : function(data) {
                		      if (data){
                		    	  console.log(data);
                		        if (data == "down-success") { //判断返回值，这里根据的业务内容可做调整
                		        	//显示跳转提示
                		        	console.log(data);
                		        	for(var k=0;k<game.length;k++){
                                        if(game[k].name==choosedGame){
                                            game.splice(k,1);
                                            k--;
                                        }
                                    }
                		        	console.log('下架成功'+game);
                		        	//show();
                		        	//console.log('下架成功show后'+game);

                		           
                		          } else if(data="down-fail"){
                		        	  alert("下架失败！");
                		          }
                		          else{
                		        	 alert("下架异常，请稍后重试");
                		          }
                		        }
                		      },
                		      error : function(data){
                		        alert("网络错误，请稍后重试！");
                		      }
                		  });
                    //show();

                    alert('下架成功');
                }else{
                    alert('取消下架');
                }
            }else{
                discount();        //弹出打折框
            }
        })
        }
        //init();
        function up(){
            var upHtml="<div class='up_div'><input type=\"text\" placeholder=\"请输入游戏名\" id=\"up_name\"><input type=\"number\" placeholder=\"售价\"  id=\"up_price\"><input type=\"text\" placeholder=\"简介\"  id=\"up_intro\"><button id='up_btn'>上架</button></div>";
            document.getElementById("container").innerHTML=upHtml;
            $('.up_div #up_btn').on('click',function(){
            	var systemURL="http://localhost:8080/SteamSimulator/ManagerServlet";      	
            	//AJAX向后台发请求所有游戏信息
            	var gameName=document.getElementById('up_name');
            	var price=document.getElementById('up_price');
            	var intro=document.getElementById('up_intro');
            	if(!gameName.value){
            		alert("游戏名不能为空");
            		return false;
            	}
            	if(!price.value){
            		alert("价格不能为空");
            		return false;
            	}
            	if(!intro.value){
            		alert("游戏简介不能为空");
            		return false;
            	}
            	 $.ajax({
            		    url : systemURL,// 获取自己系统后台用户信息接口
            		    data :{"doWhat":"up","gameName":gameName.value,"gamePrice":price.value,"gameIntro":intro.value},
            		    type : "POST",
            		    dataType: "text",
            		    success : function(data) {
            		      if (data){
            		    	  console.log(data);
            		        if (data == "up-success") { //判断返回值，这里根据的业务内容可做调整
            		        	//显示跳转提示
            		        	console.log(data);
            		           alert('上架成功');
            		          } else if(data="up-fail"){
            		        	  alert("上架失败！");
            		          }
            		          else{
            		        	 alert("上架异常，请稍后重试");
            		          }
            		        }
            		      },
            		      error : function(data){
            		        alert("网络错误，请稍后重试！");
            		      }
            		  });
            })           
        }
        function discount(){
            console.log("选中的打折商品："+choosedGame);
            var discountHtml="<div class=\"discount_frame\"><p id=discount_gamename>"+choosedGame+"</p><input type=\"number\" placeholder=\"请输入折扣\" id='dis_input'><button>打折</button></div>";
            document.getElementById("discount_container").innerHTML=discountHtml;
            document.getElementById("discount_container").style.display='block';
            //TODO 实时监听discount 判断是否输入符合
            
            $('.discount_container button').on('click',function(){
                var discount=document.getElementById('dis_input');  //TODO
            	if(!discount.value){
                	alert("折扣不能为空");
                	document.getElementById('discount_container').innerHTML='';
                	return false;
                }
                
            	 var systemURL="http://localhost:8080/SteamSimulator/ManagerServlet";  

            	 $.ajax({
         		    url : systemURL,// 获取自己系统后台用户信息接口
         		    data :{"doWhat":"discount","gameName":choosedGame,"gameDiscount":discount.value},
         		    type : "POST",
         		    dataType: "text",
         		    success : function(data) {
         		      if (data){
         		    	  console.log(data);
         		        if (data == "discount-success") { //判断返回值，这里根据的业务内容可做调整
         		        	//显示跳转提示
         		        	console.log(data);
         		           alert('打折成功');
         		          } else if(data="discount-fail"){
         		        	  alert("打折失败！");
         		          }
         		          else{
         		        	 alert("打折异常，请稍后重试");
         		          }
         		        }
         		      },
         		      error : function(data){
         		        alert("网络错误，请稍后重试！");
         		      }
         		  });
            	 document.getElementById("discount_container").innerHTML='';
                
            });

        }

        
        $('ul li').on('click',function(){
            console.log($(this)[0].innerHTML);
        })

        
        
    </script>
</body>
</html>