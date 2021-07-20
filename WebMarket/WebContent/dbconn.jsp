<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	
	try{
		String url = "jdbc:mariadb://3.35.235.65:3306/project";
		String user = "jundb";
		String password = "1q2w3e4r";
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("데이터베이스 연결이 되었습니다.");
		
	}catch(SQLException e){
		System.out.println("데이터베이스 연결이 실패되었습니다.");
		System.out.print("에러 : ");
		e.printStackTrace();
	}
%>