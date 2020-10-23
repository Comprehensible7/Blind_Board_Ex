<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<!--웹폰트 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>ログイン</title>


<script>
	//로그인 폼 검사
	function formCheck() {
		var id = document.getElementById('id');
		var password = document.getElementById('password');

		if (id.value == '' || password.value == '') {
			alert('IDとパスワードを入力してください。');
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
				<form id="loginForm" action="login" method="post"
					onSubmit="return formCheck();">
					<h3 style="text-align: center;">ログイン</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="id"
							name="id" id="id" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="password"
							name="password" id="password" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control"
						value="ログイン">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src=<c:url value="/js/bootstrap.js" />></script>

</body>
</html>