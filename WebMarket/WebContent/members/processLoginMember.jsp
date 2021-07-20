<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");	
%>
<!-- jstl태그 라이브러리 sql태그 이용해 DB접속 -->
<sql:setDataSource var="dataSource"
	url="jdbc:mariadb://3.35.235.65:3306/project"
	driver="org.mariadb.jdbc.Driver"
	user="jundb" password="1q2w3e4r"/>

<sql:query dataSource="${dataSource }" var="resultSet">
	select * from members where id=? and password=?
	<sql:param value="<%=id %>"/>
	<sql:param value="<%=password %>"/>
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="../index.jsp?contentPage=/members/resultMember.jsp?msg=2"/>
</c:forEach>
<c:redirect url="../index.jsp?contentPage=/members/loginMember.jsp?error=1"/>