<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<link rel="stylesheet" type="text/css" href="reportWrite.css"/>


<script type="text/javascript">
< 
<%-- 창닫기 --%>
function fun2() {
	window.close();
}
</script>

</head>
<body>

<%-- 신고하기 폼 --%>




<div class="reportForm">
<form action="reportForm" method="post">
	<span class="reportInfo"> 클릭하여 신고 이유를 선택해 주세요. </span> 
	<select>
		<option> 회원비난/비하 </option>
		<option> 욕설/비속어 </option>
		<option> 무단광고/홍보 </option>
		<option> 도배 </option>
		<option> 아이디/DB거래 </option>
		<option> 음란성/선정성 </option>
		<option> 기타 </option>
	</select><br>

	<textarea rows = "5" cols = "19"> </textarea><br>

<input type="submit" value="신고하기"> <input type="button" value="취소하기" onclick="fun2()">
</form>      
</div>

</body>
</html>