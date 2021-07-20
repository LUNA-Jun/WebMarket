<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_date = "";
	String shipping_zipCode = "";
	String shipping_address = "";

	//모든 쿠키로 설정된 내용을 쿠키배열로 받아옴
	Cookie[] cookies = request.getCookies();

	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			Cookie thisCookie = cookies[i];
			//쿠키의 Name을 가져옴
			String str = thisCookie.getName();
		
			//URLDecoder 클래스를 이용해 문자셋를 다시 맞추어서 가져옴
			if(str.equals("shipping_cartId")){
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
			if(str.equals("shipping_date")){
				shipping_date = URLDecoder.decode(thisCookie.getValue(), "utf-8");
			}
		}
	}
%>
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
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	</div>
	<div class="container">
		<p>주문은 <%out.println(shipping_date); %>에 배송될 예정입니다.</p>
		<p>주문번호 : <%out.println(shipping_cartId); %></p>
	</div>
	<div class="container">
		<p><a href="index.jsp?contentPage=products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
	</div>
</body>
</html>
<%
	//주문이 완료 되었으니 세션과 쿠티를 삭제
	session.invalidate();

	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String str = thisCookie.getName();
		
		if(str.equals("shipping_cartId")){
			thisCookie.setMaxAge(0);
		}
		if(str.equals("shipping_name")){
			thisCookie.setMaxAge(0);
		}
		if(str.equals("shipping_date")){
			thisCookie.setMaxAge(0);
		}
		if(str.equals("shipping_zipCode")){
			thisCookie.setMaxAge(0);
		}
		if(str.equals("shipping_address")){
			thisCookie.setMaxAge(0);
		}
		//변경된 쿠키를 다시 응답처리객체에 재탑재
		response.addCookie(thisCookie);
	}
	
%>