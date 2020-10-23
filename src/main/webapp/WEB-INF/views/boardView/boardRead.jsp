<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<!--웹폰트 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<title>board read</title>



<script type="text/javascript">
	//글삭제시 확인 스크립트
	function deleteCheck(boardnum) {
		if (confirm("本当に削除しますか?")) {
			location.href = 'delete?boardnum=' + boardnum;
		}
	}

	//리플 쓰기 폼 체크
	function replyFormCheck() {
		var retext = document.getElementById('retext');
		if (retext.value.length < 5) {
			alert('リップル内容を入力してください');
			retext.focus();
			retext.select();
			return false;
		}
		return true;
	}

	//리플 수정
	function replyEditForm(replynum, boardnum, retext) {
		//해당 리플번호를 붙여 생성한 <div>태그에 접근
		var div = document.getElementById("div" + replynum);

		var str = '<form name="editForm' + replynum + '" action="replyEdit" method="post">';
		str += '<input type="hidden" name="replynum" value="'+replynum+'">';
		str += '<input type="hidden" name="boardnum" value="'+boardnum+'">';
		str += '&nbsp;';
		str += '<input type="text" name="text" value="' + retext + '" style="width:530px;">';
		str += '&nbsp;';
		str += '<a href="javascript:replyEdit(document.editForm' + replynum
				+ ')">[저장]</a>';
		str += '&nbsp;';
		str += '<a href="javascript:replyEditCancle(document.getElementById(\'div'
				+ replynum + '\'))">[취소]</a>';
		str += '</form>';
		div.innerHTML = str;
	}

	//리플 수정 취소
	function replyEditCancle(div) {
		div.innerHTML = '';
	}

	//리플 수정 정보 저장
	function replyEdit(form) {
		if (confirm('修正された内容を保存しますか')) {
			form.submit();
		}
	}

	//리플 삭제
	function replyDelete(replynum, boardnum) {
		if (confirm('リップルを削除しますか?')) {
			location.href = 'replyDelete?replynum=' + replynum + '&boardnum='
					+ boardnum;
		}
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
			<a class="navbar-brand" href="/">board web site</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">main</a></li>
				<li><a href="list">board</a></li>
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

				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">リスト
							</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<th style="width:20%;">タイトル</th>
						<td colspan="2">${board.title}</td>
					</tr>
					
					<tr>
						<th style="width: 100px;">作成者</th>
						<td style="width: 600px;">${board.id}</td>
					</tr>
					<tr>
						<th>作成日</th>
						<td colspan="2">${board.inputdate }</td>
					</tr>
					<tr>
						<th>アクセス数</th>
						<td>${board.hits}</td>
					</tr>

					<tr>
						<th>内容</th>
						<td colspan="2" style="min-height: 400px; text-align:left;"><pre>${board.contents}</pre></td>
					</tr>
					<tr>
						<th>ファイル添付</th>
						<td>
							<!-- 첨부된 파일이 있는 경우, 해당 파일을 다운로드 할 수 있는 링크 제공 --> <c:if
								test="${board.originalfile != null}">
								<a href="download?boardnum=${board.boardnum}">
									${board.originalfile} </a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>

			<div id="navigator">
				<!-- 본인 글인 경우에만 보이기 -->
				<c:if test="${loginId == board.id}">
					<!-- 현재글 삭제하기-->
					<a href="javascript:deleteCheck(${board.boardnum})">削除</a>
					<!-- 현재글 수정하기-->
					<a href="edit?boardnum=${board.boardnum}">修整</a>
				</c:if>

				<!-- 목록보기-->
				<a href="list">リスト</a>
			</div>
			<br>

			<!-- 리플 작성 폼 시작 -->
			<c:if test="${loginId != null}">
				<form id="replyform" action="replyWrite" method="post"
					onSubmit="return replyFormCheck();">
				リップル内容 <input type="hidden" name="boardnum" value="${board.boardnum}" />
					<input type="text" name="text" id="retext" style="width: 500px;" />
					<input type="submit" value="확인" />
				</form>
			</c:if>
			<!-- /리플 작성 폼 끝 -->
			<br>

			<!-- 리플 목록 출력 시작 -->
			<table class="reply">
				<c:forEach var="reply" items="${replylist}">
					<tr>
						<td class="replyid"><b>${reply.id}</b></td>
						<td class="replytext">${reply.text}</td>
						<td class="replybutton"><c:if test="${loginId == reply.id}">
				[<a
									href="javascript:replyEditForm(${reply.replynum}, ${reply.boardnum}, '${reply.text}')">修整</a>]
			</c:if></td>
						<td class="replybutton"><c:if test="${loginId == reply.id}">
				[<a
									href="javascript:replyDelete(${reply.replynum}, ${reply.boardnum })">削除</a>]
			</c:if></td>
					</tr>
					<tr>
						<!-- 리플 수정 폼이 나타날 위치 -->
						<td class="white" colspan="4"><div id="div${reply.replynum}"></div></td>
					</tr>

				</c:forEach>
			</table>
			<!-- /리플 목록 출력 끝 -->

			<br> <br> <br>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
