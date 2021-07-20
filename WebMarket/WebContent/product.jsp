<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="NoProductId.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	DecimalFormat dfFormat = new DecimalFormat("###,###"); //천단위구분
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<meta charset="UTF-8">
<style type="text/css">
	img{
		-webkit-perspective: 1;
		image-rendering: auto;
  		image-rendering: crisp-edges;
  		image-rendering: pixelated;
  		width: 15vw;
  		height: 30vh;
	}
</style>
<script type="text/javascript">
function addToCart(){
	if(confirm("해당 상품을 장바구니에 추가하시겠습니까?")){
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
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String productId = request.getParameter("id");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./upload/<%=rs.getString("p_fileName")%>">
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description")%></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"><%=rs.getString("p_id")%></span></p>
				<p><b>제조사  : </b><%=rs.getString("p_manufacturer")%></p>
				<p><b>분류  : </b><%=rs.getString("p_category")%></p>
				<p><b>재고 수  : </b><%=dfFormat.format(rs.getLong("p_stock"))%>개</p>
				<h4><%=dfFormat.format(rs.getInt("p_price"))%>원</h4>
				<form name="addForm" action="addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">				
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문 &raquo;</a>
					<a href="index.jsp?contentPage=cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="index.jsp?contentPage=products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
			</div>
			<%
				}
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			%>
		</div>
		</hr>
	</div>
</body>
</html>