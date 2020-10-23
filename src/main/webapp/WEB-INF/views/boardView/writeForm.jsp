<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">

<title>物書き</title>


<script>
//글쓰기폼 확인
function formCheck() {
	var title = document.getElementById('title');
	var contents = document.getElementById('contents');
	
	if (title.value.length < 5) {
		alert("タイトルを入力してください");
		title.focus();
		title.select();
		return false;
	}
	if (contents.value.length < 5) {
		alert("内容を入力してください。.");
		contents.focus();
		contents.select();
		return false;
	}
	return true;
}
</script>	
</head>
<body>
<div class="container">
		<div class="row">
			<form id="writeform" action="write"  method="post" 
	enctype="multipart/form-data" onsubmit="return formCheck();">
			<table class="table table-striped" style="text-align; border 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color:#eeeeee; text-align:center;">board list</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" name="title" id="title" class="form-control" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea name="contents" id="contents" class="form-control"maxlength="2048" style="resize:none; height:350px;"></textarea></td>
					</tr>
				</tbody>
				
			</table>
			<input type="file" name="upload" size="30">
			<input type="submit" class="btn btn-primary pull-right" value="物書き">
			</form>
			
		</div>
	</div>
</body>
</html>
