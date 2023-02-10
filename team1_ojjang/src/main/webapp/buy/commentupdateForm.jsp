<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정폼</title>
</head>
<body>
<div id="wrap">
	<br>
	<b><font size="5" color="gray">댓글 수정</font></b>
	<hr size="1" width="550">
	<br>
	
	<div id = "commentupdateForm">
		<form name="commentupdateForm" target="parentForm">
				<textarea rows="7" cols="70" name="commentupdate"></textarea>
				<br><br>
		<input type="button" value="등록" onclick="checkValue()">
		<input type="button" value="취소" onclick="window.close()">
				</form>
	</div>
</div>
</body>
</html>