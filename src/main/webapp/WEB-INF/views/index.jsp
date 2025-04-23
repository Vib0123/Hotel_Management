<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Hello world</h1>
    <% String s=(String) request.getAttribute("name"); %>
    <h1>This is my name <%=s %></h1>
    
    <% String a=(String) request.getAttribute("name"); %>>
    <h1>This is my name <%=a %>/h1>
    <%  String b=(String)request.getAttribute("Address"); %>>
    <h1>This is my Address <%=b %>/h1>
    
</body>
</html>