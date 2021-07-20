<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	BoardDTO notice = (BoardDTO)request.getAttribute("bDto");
	int num = (Integer)request.getAttribute("num");
	int pageNum = (Integer)request.getAttribute("pageNum");
	
	String sessionId = (String)session.getAttribute("sessionId");
	String userId = notice.getId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<title>쇼핑몰</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form name="newUpdate" action="BoardUpdateAction.do?num=<%= notice.getNum()%>&pageNum=<%=pageNum%>" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2 control-label">이름</label>
				<div class="com-sm-3">
					<input name="name" class="form-control" value="<%=notice.getName()%>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
					<div class="com-sm-5">
						<%
							if(sessionId.equals(userId)){
						%>
						<input name="subject" class="form-control" value="<%=notice.getSubject()%>"/>
						<%
							}else{
						%>
						<input name="subject" class="form-control" value="<%=notice.getSubject()%>" readonly/>
						<%
							}
						%>
					</div>
				</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
					<div class="com-sm-8" style="word-break: break-all">
					<%
						if(sessionId.equals(userId)){
					%>
						<textarea name="content" class="form-control" rows="5" cols="50"><%=notice.getContent() %></textarea>
					<%
						}else{
					%>
						<textarea name="content" class="form-control" rows="5" cols="50" readonly><%=notice.getContent() %></textarea>
					<%
						}
					%>
					</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<c:set var="userId" value="<%=notice.getId() %>"/>
					<c:if test="${sessionId == userId || sessionId == 'admin' }">
						<a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>" class="btn btn-danger">삭제</a>
						<input type="submit" class="btn btn-success" value="수정">
					</c:if>
					<a href="./BoardListAction.do?pageNum=<%=pageNum%>" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
		<hr>
	</div>
</body>
</html>