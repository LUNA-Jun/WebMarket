<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardlist");
	int total_record = ((Integer)request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer)request.getAttribute("total_page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script type="text/javascript">
//로그인 여부를 판단
function b_checkForm(){
	if(${sessionId==null}){
		alert("로그인을 해야 작성할 수 있습니다.");
		return false;
	}
	location.href="./BoardWriteForm.do?id=<%=sessionId%>";
}
function b_loginForm() {
	if(${sessionId==null}){
		alert("로그인을 해야 게시글을 볼 수 있습니다.");
		return false;
	}
}
</script>
<meta charset="UTF-8">
<title>쇼핑물</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form action="<c:url value="BoardListAction.do"/>" method="post">
			<div class="text-right">
				<span class="badge badge-success">전체<%= total_record %></span>
			</div>
			<!-- 게시글 -->
			<div style="padding-top: 50px">
				<table	class="table talbe-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
						for(int j=0; j<boardList.size(); j++){
							BoardDTO notice = boardList.get(j);
					%>
					<tr>
						<td><%=notice.getNum() %></td>
						<td>
							<% if(sessionId == null) { %>
								<a href="#" onclick="b_loginForm()"><%=notice.getSubject()%></a>
							<%}else{ %>
								<a href="./BoardViewAction.do?num=<%= notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a>
							<%} %>
						</td>
						<td><%=notice.getRegist_day() %></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getName()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<!-- 페이지수 -->
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum %>"/>
				<c:forEach var="i" begin="1" end="<%=total_page %>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}"/>">
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='blue'><b>[${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='black'>[${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<!-- 검색페이지 -->
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;
							<select name="items" class="txt">
								<option value="subject">제목</option>
								<option value="content">본문</option>
								<option value="name">글쓴이</option>
							</select>
							<input name="text" type="text"/>
							<input type="submit" id="btnAdd" class="btn btn-primary btn-sm" value="검색">
						</td>
						<td width="100%" align="right">
							<h3><a href="#" onclick="b_checkForm(); return false" class="badge badge-primary">&laquo;글쓰기</a></h3>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>