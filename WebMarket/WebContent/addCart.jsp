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
		
		ArrayList<ProductDTO> goodsList = dao.getAllProducts();
		ProductDTO goods = new ProductDTO();
		
		for(int i=0; i<goodsList.size(); i++){
			goods = goodsList.get(i);
			if(goods.getProductId().equals(id)){
		break;
			}
		}
		
		ArrayList<ProductDTO> list = (ArrayList<ProductDTO>)session.getAttribute("cartlist");
		if(list == null){
			list = new ArrayList<ProductDTO>();
			session.setAttribute("cartlist", list);
		}
		
		int cnt = 0;
		ProductDTO goodsQnt = new ProductDTO();
		
		//장바구니에 이미 물건이 있는지 검색후 있으면 수량 증가
		for(int i=0; i<list.size(); i++){
			goodsQnt = list.get(i);
			if(goodsQnt.getProductId().equals(id)){
		cnt++;
		int orderQuandity = goodsQnt.getQuantity() + 1;
		goodsQnt.setQuantity(orderQuandity);
			}
		}
		//장바구니에 물건이 없으면 수량을 1로 바꾸어주고 장바구니에 추가
		if(cnt ==0 ){
			goods.setQuantity(1);
			list.add(goods);
		}
		
		response.sendRedirect("index.jsp?contentPage=product.jsp?id="+id);
	%>
</body>
</html>