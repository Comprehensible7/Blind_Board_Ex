<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>board</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
	
}
form { 

        margin: 0 auto; 

        width:250px;

    }   
.navigator{
      margin: 0 auto; 

        width:250px;
} 

</style>


<!-- 페이지 이동 스크립트  -->
<script>
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var page = document.getElementById('page');
		page.value = currentPage;
		form.submit();
	}
</script>

</head>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">board web site</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">main</a></li>
				<li><a href="#">board</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.loginId == null}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> 접속하기<span class="caret"></span></a>
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
								${sessionScope.loginName}(${sessionScope.loginId})님
							</c:if> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="member/logout">ログアウト</a></li>

						</ul></li>
				</c:if>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="">
				<thead style="text-align: center;">
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">番号</th>
						<th style="background-color: #eeeeee; text-align: center;">タイトル</th>
						<th style="background-color: #eeeeee; text-align: center;">作成者</th>
						<th style="background-color: #eeeeee; text-align: center;">アクセス数</th>
						<th style="background-color: #eeeeee; text-align: center;">登録日</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<tr>
						<!-- 반복 시작 -->
						<c:forEach var="board" items="${boardlist}">
							<tr>
								<td class="center">${board.boardnum}</td>
								<td><a href="read?boardnum=${board.boardnum}">${board.title}</a>
								</td>
								<td class="center">${board.id}</td>
								<td class="center">${board.hits}</td>
								<td>${board.inputdate}</td>
							</tr>
						</c:forEach>
					</tr>
				</tbody>
			</table>
			<input type="button" class="btn btn-primary pull-right" value="物書き"
				onClick="location.href='write';">
		</div>
		
		<div class="navigator">
			<!-- 페이지 이동 부분 -->
			&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;
			<a
				href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁
			</a> &nbsp;&nbsp; <a
				href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a>
			&nbsp;&nbsp;

			<c:forEach var="counter" begin="${navi.startPageGroup}"
				end="${navi.endPageGroup}">
				<c:if test="${counter == navi.currentPage}">
					
				</c:if>
				<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
				
				
		<c:if test="${counter == navi.currentPage}">
					
				</c:if>
			</c:forEach>
			&nbsp;&nbsp; <a
				href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a>
			&nbsp;&nbsp; <a
				href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
				<br>
				<br>
		<div>
			<form id="pagingForm" method="get" action="list">
				<div class="form-group">
				<input type="hidden" name="page" id="page" /> 
			    <input type="text"  name="searchText" value="${searchText}"/> 
			    <input type="button"  onclick="pagingFormSubmit(1)" value="検索">
				</div>
				
			</form>
		</div>
	</div>




</body>
</html>
