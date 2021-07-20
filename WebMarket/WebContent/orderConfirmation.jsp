<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String cartId = session.getId();
	
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
	if(str.equals("shipping_name")){
		shipping_name = URLDecoder.decode(thisCookie.getValue(), "utf-8");
	}
	if(str.equals("shipping_date")){
		shipping_date = URLDecoder.decode(thisCookie.getValue(), "utf-8");
	}
	if(str.equals("shipping_zipCode")){
		shipping_zipCode = URLDecoder.decode(thisCookie.getValue(), "utf-8");
	}
	if(str.equals("shipping_address")){
		shipping_address = URLDecoder.decode(thisCookie.getValue(), "utf-8");
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
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<b>배송주소</b><br/>
				성명 : <%
					out.println(shipping_name);
				%><br/>
				우편번호 : <%
					out.println(shipping_zipCode);
				%><br/>
				주소 : <%
					out.println(shipping_address);
				%><br/>
			</div>
			<div class="col-4" align="right">
				<b>배송일 : <%
					out.println(shipping_date);
				%></b>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">물품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum = 0;
							ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>)session.getAttribute("cartlist");
							if(cartList == null)
								cartList = new ArrayList<ProductDTO>();
							
							for(int i=0; i<cartList.size(); i++){
								ProductDTO product = cartList.get(i);
								int total = product.getPrice() * product.getQuantity();
								sum += total;
				%>
				<tr>
					<td class="text-center">
						<b><%=product.getName() %></b>
					</td>
					<td class="text-center">
						<b><%=product.getQuantity() %></b>
					</td>
					<td class="text-center">
						<b><%=product.getPrice() %></b>
					</td>
					<td class="text-center">
						<b><%=total %>원</b>
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><b>총액 : </b></td>
					<td class="text-center text-danger"><b><%=sum %>원</b></td>
				</tr>
			</table>
			<a href="index.jsp?contentPage=Shipping.jsp?cartId=<%= shipping_cartId %>" class="btn btn-secondary" role="button">이전</a>
			<a href="index.jsp?contentPage=orderComplete.jsp" class="btn btn-success" role="button">주문완료</a>
			<a href="index.jsp?contentPage=checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
</body>
</html>