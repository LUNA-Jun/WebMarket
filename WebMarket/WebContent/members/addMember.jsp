<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./resource/js/verify.js"></script>
<style type="text/css">
	#important{
		color: red;
	}
</style>
<title>쇼핑몰</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	<div class="container">
			<small><b id="important">*</b>는 필수 입력</small>
	</div>
	<br>
	<div class="container">
		<form name="newMember" class="form-horizontal" action="./members/processAddMember.jsp" method="post" onsubmit="return m_checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디&nbsp;<b id="important">*</b></label>
				<div class="col-sm-4">
					<input name="id" id="id" type="text" class="form-contrl">
					<input type="button" name="idCheck" id="idCheck" value="중복확인" onclick="Check_id()">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호&nbsp;<b id="important">*</b></label>
				<div class="col-sm-3">
					<input name="password" id="password" type="password" class="form-contrl" onchange="Check_pw()">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인&nbsp;<b id="important">*</b></label>
				<div class="col-sm-5">
					<input name="passowrd_confirm" id="passowrd_confirm" type="password" class="form-contrl" onchange="Check_pw()">
					<span id="check"></span>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름&nbsp;<b id="important">*</b></label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-contrl">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남"/>남&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="gender" type="radio" value="여"/>여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-4">
					<input type="text" onKeyup="inputBirthday(this);" name="birthday" maxlength="10">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">E-mail&nbsp;<b id="important">*</b></label>
				<div class="col-sm-4">
					<input type="text" name="email">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호&nbsp;<b id="important">*</b></label>
				<div class="col-sm-4">
					<input type="text" name="phone" maxlength="13" onkeyup="inputTel(this);" >
					(-기호 생략)
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소&nbsp;<b id="important">*</b></label>
				<div class="col-sm-5">
					<input type="text" id="addr_api_postcode" name="addr_api_postcode" placeholder="우편번호">
					<input type="button" id="button-addon2" onclick="addr_api()" value="우편번호 찾기" />
					<input type="text" id="addr_api_address" name="addr_api_address" placeholder="주소" style="width: 23em;">
					</br>
					<input type="text" id="addr_api_detailAddress" name="addr_api_detailAddress" placeholder="상세주소">
					<input type="text" id="addr_api_extraAddress" name="addr_api_extraAddress" placeholder="참고항목">	
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="가입">
					<input type="reset" class="btn btn-primary" value="취소">
				</div>
			</div>
		</form>
	</div>
</body>
</html>