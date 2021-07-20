<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String edit = request.getParameter("edit");
	DecimalFormat dfFormat = new DecimalFormat("###,###"); //천단위구분
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<title>쇼핑몰</title>
<script type="text/javascript">
	function deleteMessage(id) {
		if(confirm("해당 상품을 삭제합니다.")==true)
			location.href="./deleteProduct.jsp?id="+id;
		else
			return;
	}
</script>
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
				<img src="./upload/<%=rs.getString("p_fileName")%>">
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %></p>
				<p><%=dfFormat.format(rs.getInt("p_price"))%>원</p>
				<p>
					<%
						if(edit.equals("update")){
					%>
					<a href="index.jsp?contentPage=updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button">수정 &raquo;</a>
					<%
						}else if(edit.equals("delete")){
					%>
					<a href="#" onclick="deleteMessage('<%=rs.getString("p_id") %>')" class="btn btn-danger" role="button">삭제 &raquo;</a>
					<%
						}
					%>
			</div>
			<%
				}
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			%>
		</div>
	</div>
</body>
</html>