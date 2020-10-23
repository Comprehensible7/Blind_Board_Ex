<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<!--웹폰트 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>会員加入</title>



<script>
//가입폼 확인
function formCheck() {
	var id = document.getElementById('id');
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('password2');
	var name = document.getElementById('name');
	
	if (id.value.length < 3 || id.value.length > 10) {
		alert("IDは3~10文字で入力してください。");
		id.focus();
		id.select();
		return false;
	}
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("パスワードは3~10文字で入力してください");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw2.value) {
		alert("パスワードを正確に入力してください.");
		pw.focus();
		pw.select();
		return false;
	}
	if (name.value == '') {
		alert("名前を入力してください。");
		name.focus();
		name.select();
		return false;
	}
	return true;
}


</script>
</head>

<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">board web site</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">main</a></li>
				<li><a href="board/list">board</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form id="joinform" action="join" method="post"
					onsubmit="return formCheck();">
					<h3 style="text-align: center;">会員加入</h3>
					<div class="form-group">
						<input type="text" name="id" id="id" maxlength="10"
							placeholder="ID" class="form-control" value="${member.id}">
					</div>
					<div class="form-group">
						<input type="password" name="password" id="password"
							placeholder="パスワード入力" class="form-control"
							value="${member.password}"><br> <input
							type="password" id="password2" placeholder="パスワードを再"
							class="form-control" value="${member.password}">
					</div>
					<div class="form-group">
						<input type="text" name="name" id="name" placeholder="名前"
							class="form-control" value="${member.name}">
					</div>
					<div class="form-group">
						<input type="text" name="phone" placeholder="電話番号 "
							class="form-control" value="${member.phone}">
					</div>
					<div class="form-group">
						<input type="text" name="address" placeholder="住所 "
							class="form-control" value="${member.address}">
					</div>
					<div class="form-group">
						<input type="text" name="email" id="email" placeholder="email"
							class="form-control" value="${member.email}">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="会員加入"> 
				
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src=<c:url value="/js/bootstrap.js" />></script>
</body>
</html>