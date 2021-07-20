<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String edit = request.getParameter("edit");
	DecimalFormat dfFormat = new DecimalFormat("###,###"); //천단위구분
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<title>쇼핑몰</title>
<style type="text/css">
	img {
		-webkit-perspective: 1;
		image-rendering: auto;
		image-rendering: crisp-edges;
		image-rendering: pixelated;
		width: 15vw;
		height: 30vh;
	}
</style>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
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
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2"><b>상품코드</b></label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId"
								class="form-control" value='<%=rs.getString("p_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>상품명</b></label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control"
								value='<%=rs.getString("p_name")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>가격</b></label>
						<div class="col-sm-3">
							<input type="text" id="price" name="price" class="form-control"
								value='<%=rs.getInt("p_price")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>상세정보</b></label>
						<div class="col-sm-5">
							<textarea name="description" rows="2" cols="50"
								class="form-control"><%=rs.getString("p_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>제조사</b></label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control"
								value='<%=rs.getString("p_manufacturer")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>분류</b></label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control"
								value='<%=rs.getString("p_category")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>재고 수량</b></label>
						<div class="col-sm-3">
							<input type="text" id="stock" name="stock" class="form-control"
								value='<%=rs.getLong("p_stock")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>상태</b></label>
						<div class="col-sm-5">
							<input type="radio" name="state" value="New">신규 제품 &nbsp;
							<input type="radio" name="state" value="Old">중고 제품 &nbsp;
							<input type="radio" name="state" value="Refurbished">리퍼 제품
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><b>이미지</b></label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="수정">
						</div>
					</div>
				</form>
			
			</div>
		</div>
	</div>
	<%
		}
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	%>
</body>
</html>