<%@page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	String sql="insert into product values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price_i);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, category);
	pstmt.setLong(7, stock_i);
	pstmt.setString(8, state);
	pstmt.setString(9, fileName);
	
	pstmt.executeUpdate();
	System.out.println("상품 등록 완료");
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("index.jsp?contentPage=products.jsp");
%>