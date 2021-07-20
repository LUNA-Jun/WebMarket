<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
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
	//전체 상품 목록 중에서 물품 id값과 동일하면 삭제 (선택 삭제)
		
		String id = request.getParameter("id");
	
		if(id == null || id.trim().equals("")){
	response.sendRedirect("index.jsp?contentPage=products.jsp");
	return;
		}
		
		ProductDAO dao = ProductDAO.getInstacne();
		ProductDTO product = dao.getProductById(id);
		if(product == null){
	response.sendRedirect("index.jsp?contentPage=NoProductId.jsp");
		}
		
		ArrayList<ProductDTO> cartList = (ArrayList<ProductDTO>)session.getAttribute("cartlist");
		
		ProductDTO goodsQnt = new ProductDTO();
		
		
		for(int i=0; i<cartList.size(); i++){
	goodsQnt = cartList.get(i);
	if(goodsQnt.getProductId().equals(id)){
		cartList.remove(goodsQnt);
	}
		}
		
		response.sendRedirect("index.jsp?contentPage=cart.jsp");
%>
</body>
</html>