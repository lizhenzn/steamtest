<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="databeans.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 	<%
 		ArrayList<GameInfo> gamelist=new ArrayList<GameInfo>();
 		
 		
 	%>
 	<div>
 	<%for(int i=0;i<gamelist.size();i++){%>
 	<div class="gameblock"> <form method="post">
 	<input type="hidden" name="rscPath" value="<%= gamelist.get(i).getRsc()%>"/>
 	<input type="submit"/>
 	</form> </div>
 	<%} %>
 	
 	</div>
</body>
</html>