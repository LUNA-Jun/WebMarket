<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String birthday=request.getParameter("birthday");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String addr_api_postcode=request.getParameter("addr_api_postcode");
	String addr_api_address=request.getParameter("addr_api_address");
	String addr_api_detailAddress=request.getParameter("addr_api_detailAddress");
	String addr_api_extraAddress=request.getParameter("addr_api_extraAddress");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql="select * from members where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
	
		sql = "update members set password=?, name=?, birthday=?, mail=?, phone=?, address_postcode=?, address_address=?, address_detailAddress=?, address_extraAddress=? where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, name);
		pstmt.setString(3, birthday);
		pstmt.setString(4, email);
		pstmt.setString(5, phone);
		pstmt.setString(6, addr_api_postcode);
		pstmt.setString(7, addr_api_address);
		pstmt.setString(8, addr_api_detailAddress);
		pstmt.setString(9, addr_api_extraAddress);
		pstmt.setString(10, id);
		pstmt.executeUpdate();
		
		System.out.println("회원 등록 완료");
	}
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	if(rs != null) conn.close();
	
	response.sendRedirect("../index.jsp?contentPage=/members/resultMember.jsp?msg=0");
	
%>