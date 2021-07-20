<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String contentPage=request.getParameter("contentPage");
	if(contentPage==null)
		contentPage="Welcome.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<body onload="startTime()">
	<div>
		<jsp:include page="nav.jsp"/>
	</div>
	<div>
		<jsp:include page="<%=contentPage %>"/>
	</div>
	<div>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>