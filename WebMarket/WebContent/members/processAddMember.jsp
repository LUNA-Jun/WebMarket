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
	//가입날짜
	SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String regist_day = sDateFormat.format(new Date());
	
	PreparedStatement pstmt = null;
	String sql = "insert into members values(?,?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birthday);
	pstmt.setString(6, email);
	pstmt.setString(7, phone);
	pstmt.setString(8, addr_api_postcode);
	pstmt.setString(9, addr_api_address);
	pstmt.setString(10, addr_api_detailAddress);
	pstmt.setString(11, addr_api_extraAddress);
	pstmt.setString(12, regist_day);
	
	pstmt.executeUpdate();
	System.out.println("회원 등록 완료");
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("../index.jsp?contentPage=/members/resultMember.jsp?msg=1");
	
%>