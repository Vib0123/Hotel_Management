<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> About Page</h1>

    <% String a=(String) request.getAttribute("name"); 
    String b=(String) request.getAttribute("Address"); 
    Integer c=(Integer) request.getAttribute("phoneNo"); 
    String d=(String )request.getAttribute("username");
    String e=(String) request.getAttribute("password");
    
    
    %>
    <h1>This is my name <%=a %> </h1>
    <h1>This is my Address <%=b %> </h1>
    <h1>This is my Phone No <%=c %> </h1>
    <h1> This is username <%=d %> </h1>
    <h1>This is Password <%=e %> </h1>
    
    
</body>
</html>