<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<%! int cnt = 0; %>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				/* 로그인 실패*/
				String error = request.getParameter("error");
				if(error != null){
					if(cnt ==3 ){
						out.println("<div class='alert alert-danger'>");
						out.println("존재하는 아이디가 없습니다.</br>회원가입을 해주세요.");
						out.println("</div>");
					}else{
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해주세요!");
						out.println("</div>");	
					}
				}
				cnt++;
			%>
			<form class="form-signin" action="./members/processLoginMember.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name="id" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" name="password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>	
			</form>
		</div>
	</div>		
</body>
</html>