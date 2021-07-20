<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<body>
	<!-- 로그인 인증 실패 시 1로 설정 되고 다시 로그인 페이지로 이동 -->
	<% 
		session.invalidate(); //모든 사용자 삭제
		response.sendRedirect("index.jsp");
	%>
</body>
</html>