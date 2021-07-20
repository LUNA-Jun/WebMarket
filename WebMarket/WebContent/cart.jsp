<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.scenario.effect.impl.prism.PrDrawable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String cartId = session.getId();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<meta charset="UTF-8">
<script type="text/javascript">
function select_delete(){
	if(confirm("해당 상품을 장바구니에서 삭제 하시겠습니까?")){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
}

function all_delete(){
	if(confirm("모든 상품을 장바구니에서 삭제 하시겠습니까?")){
		document.addForm.submit();
	}else{
		document.addForm.reset();
	}
}
</script>
<title>쇼핑몰</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>"
						class="btn btn-danger" onclick="all_delete()">전체 삭제</a></td>
					<td align="right"><a href="index.jsp?contentPage=shipping.jsp?cartId=<%=cartId%>" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
					int sum=0;
								//cartlist에 등록된 모든 상품을 가져옴
								ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>)session.getAttribute("cartlist");
								
								if(cartList == null){
									cartList = new ArrayList<ProductDTO>();
								}
								
								for(int i=0; i<cartList.size(); i++){
									ProductDTO product = cartList.get(i);
									int total = product.getPrice() * product.getQuantity();
									sum += total;
				%>
				<tr>
					<td><%= product.getProductId() %>-<%=product.getName() %></td>
					<td><%= product.getPrice() %></td>
					<td><%= product.getQuantity() %></td>
					<td><%= total %></td>
					<td><a href="./removeCart.jsp?id=<%= product.getProductId()%>"
						class="badge badge-danger" onclick="select_delete()">삭제</a></td>
				</tr>
				<%} %>
				<tr>
					<th colspan="2"></th>
					<th>총액</th>
					<th><%=sum %></th>
					<th></th>
				</tr>
			</table>
			<a href="index.jsp?contentPage=products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
	</div>
</body>
</html>