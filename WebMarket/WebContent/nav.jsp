<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String sessionId = (String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">HOME</a>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty sessionId}">
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="index.jsp?contentPage=/members/loginMember.jsp"/>">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="index.jsp?contentPage=/members/addMember.jsp"/>">회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<li style="padding-top:7px; color: white">
								[<%=sessionId %>님]
							</li>
							<li class="nav-item">
							<a class="nav-link" href="<c:url value="./members/logoutMember.jsp"/>">로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<c:url value="index.jsp?contentPage=/members/updateMember.jsp"/>">정보수정</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${sessionId ne 'admin'}">
							<li class="nav-item"><a class="nav-link" href="index.jsp?contentPage=products.jsp">상품 목록</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="index.jsp?contentPage=products.jsp">상품 목록</a></li>
							<li class="nav-item"><a class="nav-link" href="index.jsp?contentPage=addProduct.jsp">상품 등록</a></li>
							<li class="nav-item"><a class="nav-link" href="index.jsp?contentPage=editProduct.jsp?edit=update">상품 수정</a></li>
							<li class="nav-item"><a class="nav-link" href="index.jsp?contentPage=editProduct.jsp?edit=delete">상품 삭제</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link" href="BoardListAction.do?pageNum=1">게시판</a></li>
				</ul>
			</div>
		</div>
</nav>