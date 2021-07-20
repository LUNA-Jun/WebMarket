<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">쇼핑몰에 오신걸 환영합니다.</h1>
		</div>
	</div>
<div class="container">
	<div class="text-center">
		<h2>환영합니다!</h2>
		<h3 id="watch"></h3>
		<%
			Calendar calendar = Calendar.getInstance();
			int hour = calendar.get(Calendar.HOUR_OF_DAY);
			int minute = calendar.get(Calendar.MINUTE);
			int second = calendar.get(Calendar.SECOND);
			int am_pm = calendar.get(calendar.AM_PM);
			
			String ampm = null;
			if(am_pm == 0){
				ampm = "오전";
			} else {
				ampm = "오후";
			}
			
			String connectTime = hour + ":" + minute + ":" + second + " " + ampm;
			out.println("현재 접속 시간  : " + connectTime + "\n");
		%>
		<hr>
	</div>
</div>
<script src="resource/js/watch.js"></script>
</body>
</html>