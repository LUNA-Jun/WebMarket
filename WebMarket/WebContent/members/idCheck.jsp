<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ include file="../dbconn.jsp"%>
<%
   String id = request.getParameter("id");
   String openInit = "false";
   
   if(request.getParameter("openInit") != null) {
      openInit = request.getParameter("openInit");
   }   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
</head>
<script>
	function init() {
		if (<%=openInit %>) {
			document.getElementById("id").value = opener.document.getElementById("id").value;
		}
	}
	function userId(v) {
		opener.chkId = true;
		opener.idcheck = v.trim();
		opener.document.getElementById("id").value = v;
		window.close();
	}
</script>
<body onload="init()">
	<form action="./idCheck.jsp" method="post">
		<input type="text" name="id" id="id" /> 
		<input type="submit" value="중복확인" />
		<hr>
	</form>
	<% 
	   if(!(id == null || id.equals(""))) {
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      
	      pstmt = conn.prepareStatement("SELECT * FROM members WHERE id=?");
	      pstmt.setString(1, id);
	      rs = pstmt.executeQuery();
	       
	      if(rs.next()) {
	%>
	<h3><%=id %>는 사용 불가능한 아이디입니다. 다시 검색하세요!</h3>
	<%} else { %>
	<h3><%=id %>는 사용 가능한 아이디입니다. <a href="javascript:userId('<%=id %>')">사용하기</a>	</h3>
	<%} 
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
            if(rs != null) rs.close();      
	   } 
	%>
</body>
</html>