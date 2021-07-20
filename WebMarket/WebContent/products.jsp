<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="dao.ProductDAO"%>
<%@ page import="dto.ProductDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="dbconn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>쇼핑몰</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">

			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
			%>
			<div class="col-md-4">
				<img src="./upload/<%=rs.getString("p_fileName")%>"/>
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%></p>
				<p><%=dfFormat.format(rs.getInt("p_price"))%>원</p>
				<p><a href="index.jsp?contentPage=product.jsp?id=<%=rs.getString("p_id")%>"
				class="btn btn-secondary" role="button">상세정보&raquo;</a></p>
			</div>
			<%
				}
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			%>
		</div>
		<hr>
	</div>
</body>
</html>