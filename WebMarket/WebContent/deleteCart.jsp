<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<body>
	<%
		//모든 상품 삭제
		String id = request.getParameter("cartId");
		
		if(id==null || id.trim().equals("")){
			response.sendRedirect("cart.jsp");
			return;
		}
		
		session.invalidate();
		response.sendRedirect("index.jsp?contentPage=cart.jsp");
	%>
</body>
</html>