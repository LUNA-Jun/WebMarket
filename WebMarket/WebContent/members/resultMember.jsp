<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<title>쇼핑몰</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	<div class="container">
		<%
			String msg = request.getParameter("msg");
			
			if(msg != null){
				if(msg.equals("0")){
					out.println("<h2 class='alert alert-danget'>회원 정보가 수정되었습니다.</h2>");
				}else if(msg.equals("1")){
					out.println("<h2 class='alert alert-danget'>회원 가입을 축하드립니다.</h2>");
				}else if(msg.equals("2")){
					String loginId = (String)session.getAttribute("sessionId");
					out.println("<h2 class='alert alert-danget'>"+loginId+"님 환영합니다.</h2>");
				}else if(msg.equals("3")){
					out.println("<h2 class='alert alert-danget'>로그아웃 하셨습니다.</h2>");
				}
			}else{
				out.println("<h2 class='alert alet-danget'>회원 정보가 삭제되었습니다.</h2>");
			}
		%>
	</div>
</body>
</html>