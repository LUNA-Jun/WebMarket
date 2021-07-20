<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String filename = "";
	String realFolder = application.getRealPath("/upload");
	
	int maxSize = 10 * 1024 * 1024; // 최대 업로드 크기 10M
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize,
				encType, new DefaultFileRenamePolicy());
	 
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String price = multi.getParameter("price");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String stock = multi.getParameter("stock");
	String state = multi.getParameter("state");
	
	//price stiock stirng에서 int long으로 변환
	Integer price_i;
	long stock_i;
	
	if(price.isEmpty()){
		price_i = 0;
	}
	else{
		price_i = Integer.valueOf(price);
	}
	
	if(stock.isEmpty()){
		stock_i = 0;
	}
	else{
		stock_i = Long.valueOf(stock);
	}
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql="select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql = "update product set p_name=?, p_price=?, p_description=?, p_manufacturer=?," +
					"p_category=?, p_stock=?, p_state=? p_fileName where p_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price_i);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock_i);
			pstmt.setString(7, state);
			pstmt.setString(8, fileName);
			pstmt.setString(9, productId);
			pstmt.executeUpdate();
		}
		//이미지 변경이 없을시
		else{
			sql = "update product set p_name=?, p_price=?, p_description=?, p_manufacturer=?," +
					"p_category=?, p_stock=?, p_state=? where p_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price_i);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock_i);
			pstmt.setString(7, state);
			pstmt.setString(8, productId);
			pstmt.executeUpdate();
		}
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>
