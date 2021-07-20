<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//다른 페이지 이동하기 전에 문자셋을 맞추고 재인코딩
	Cookie cartId= new Cookie("shipping_cartId", URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
	Cookie name= new Cookie("shipping_name", URLEncoder.encode(request.getParameter("name"),"utf-8"));
	Cookie date= new Cookie("shipping_date", URLEncoder.encode(request.getParameter("date"),"utf-8"));
	Cookie zipCode= new Cookie("shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
	Cookie address= new Cookie("shipping_address", URLEncoder.encode(request.getParameter("address"),"utf-8"));

	//각 쿠키의 유효시간
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	date.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	address.setMaxAge(24*60*60);
	
	//응답객체에 탑재
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(date);
	response.addCookie(zipCode);
	response.addCookie(address);
	
	//주문 정보를 확인을 위해 강제이동
	response.sendRedirect("index.jsp?contentPage=orderConfirmation.jsp");
%>