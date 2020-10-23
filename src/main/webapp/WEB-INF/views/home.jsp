<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>bbs</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<!--웹폰트 -->

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

			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.loginId == null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 接続<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="member/login">ログイン</a></li>
							<li><a href="member/join">会員加入</a></li>
						</ul></li>
				</c:if>
			</ul>




			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.loginId != null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><c:if
								test="${sessionScope.loginId != null}">
								${sessionScope.loginName}(${sessionScope.loginId})さん
							</c:if> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="member/logout">ログアウト</a></li>

						</ul></li>
				</c:if>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>BBS PROJECT</h1>
				<p>
					* framework- Spring 4.3.6 <br> - Mybatis 3.4.6<br> -
					JSP, JSTL, HTML, CSS, JavaScript<br> - join, login, logout, 
					board,create,read,update,delete ,fileupload,reply<br> <br>
				</p>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	
</body>
</html>
