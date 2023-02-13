<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ojjang_pop</title>
<script>
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function fun1() {
	if ( document.form1.popup.checked )
	setCookie( "popup1", "done" , 1);
	self.close();
}
</script>
</head>
<body>
<form name="form1">
	<h1 align="center">공 지 사 항</h1>
	<h3>어쩌구 저쩌구<br>
		이러쿵 저러쿵<br>
		언제 끝나냐</h3>
	<a href="#">자세히 보기</a><br><br><br>
<input type="checkbox" name="popup" value="">
<font size="2">오늘 하루 그만 보기</font> <input type="button" onclick="fun1()" value="닫기">
</form>
</body>
</html>