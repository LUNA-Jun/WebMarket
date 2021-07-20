<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script type="text/javascript" src="./resource/js/verify.js"></script>
<meta charset="UTF-8">
<title>쇼핑몰</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
		<a href="logout.jsp" class="btn btn-sm btn-success pull-right"><b>로그아웃</b></a>
		</div>
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><b>상품코드</b></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control" placeholder="상품코드를 입력하세요.">
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>상품명</b></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control" placeholder="상품명을 입력하세요.">
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>가격</b></label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control" placeholder="가격을 입력하세요.">
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>상세정보</b></label>
				<div class="col-sm-5">
					<textarea name="description"rows="2" cols="50" class="form-control" placeholder="상세정보를 입력하세요."></textarea>
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>제조사</b></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" placeholder="제조사를 입력하세요.">
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>분류</b></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" placeholder="분류를 입력하세요.">
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>재고 수량</b></label>
				<div class="col-sm-3">
					<input type="text" id="stock" name="stock" class="form-control" placeholder="재고 수량을 입력하세요.">
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>상태</b></label>
				<div class="col-sm-5">
					<input type="radio" name="state" value="New">신규 제품 &nbsp;
					<input type="radio" name="state" value="Old">중고 제품 &nbsp;
					<input type="radio" name="state" value="Refurbished">리퍼 제품
				</div>			
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><b>이미지</b></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>			
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
				</div>			
			</div>
		</form>
	</div>
</body>
</html>