<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 수정</title>

<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />

<script>
//가입폼 확인
function formCheck() {
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('password2');
	var name = document.getElementById('name');
	
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("パスワードは3~10文字で入力してください");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw2.value) {
		alert("パスワードを正確に入力してください。");
		pw.focus();
		pw.select();
		return false;
	}
	if (name.value == '') {
		alert("名前を入力してください");
		name.focus();
		name.select();
		return false;
	}
	return true;
}
</script>
</head>

<body>
<div class="centerdiv">
<h1>[ 個人情報の修正 ]</h1>

<form id="updateform" action="update"  method="post" onsubmit="return formCheck();">
<table>
	<tr>
		<th>ID</th>
		<td>${member.id}</td>
	</tr>
	<tr>
		<th>パスワード</th>
		<td><input type="password" name="password" id="password" placeholder="パスワード<"><br>
		<input type="password" id="password2" placeholder="パスワード<""></td>
	</tr>
	<tr>
		<th>名前</th>
		<td><input type="text" name="name" id="name" placeholder="名前"  value="${member.name}"></td>
	</tr>
	<tr>
		<th>電話番号</th>
		<td><input type="text" name="phone" placeholder="電話番号"  value="${member.phone}"></td>
	</tr>
	<tr>
		<th>住所</th>
		<td><input type="text" name="address" placeholder="住所"  value="${member.address}" style="width:300px;"></td>
	</tr>
	<tr>
		<th>email</th>
		<td><input type="text" name="email" id="email" placeholder="email"  value="${member.email}"></td>
	</tr>
</table>
	<br>

<input type="submit" value="修整" />
<input type="reset" value="re" />

</form>

</div>
</body>
</html>