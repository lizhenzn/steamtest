<%@ page language="java" contentType="text/html; "
    pageEncoding="UTF-8"%>
<%@page import="utils.DBCPManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
hello world
<%
Connection conn=DBCPManager.getConn();
ResultSet rs=conn.prepareStatement("select * from admin").executeQuery();
rs.next();
out.println("id:"+rs.getString("admin_id")+"pass:"+rs.getString("password"));
conn.close();
%>
 <a href="GameRepertory.jsp">fdsaf</a>
</body>
</html>