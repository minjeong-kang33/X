<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<link rel="stylesheet" type="text/css" href="reportWrite.css"/>


<script type="text/javascript">

<%-- 창닫기 --%>
function fun1() {
	if(confirm("정말 신고하시겠습니까??") == true){ 
	window.close();
	} else {
	swindow.close();
	}
}

function fun2() {
	window.close();
}

<!-- jQuery -->
$()

</script>

</head>
<body>

<%-- 신고하기 폼 --%>
<div class="reportForm">
<form action="reportForm" method="post">
	<span class="reportInfo"><img src="danger.png" class="dangerIcon">  클릭하여 신고 이유를 선택해 주세요. </span> 
	<select id="selectBox" name="selectBox">
		<option value="" selected="selected"> -- 선택하세요 -- </option>
		<option value="1"> 회원비난/비하 </option>
		<option value="2"> 욕설/비속어 </option>
		<option value="3"> 무단광고/홍보 </option>
		<option value="4"> 도배 </option>
		<option value="5"> 아이디/DB거래 </option>
		<option value="6"> 음란성/선정성 </option>
		<option value="7"> 기타 </option>
	</select><br>

	<textarea rows = "5" cols = "19" class="textarea" placeholder=" 내용을 입력해 주세요."></textarea><br>
	<li> 정상적인 게시물을 신고하시는 경우 본인이 제재를 당할 수 있습니다.</li>
	<li> 신고하게 된 이유를 사제히 써주시면 운영자의 관련 결정에 도움이 됩니다.</li>

<input type="submit" value="신고하기" onclick="fun1()"> <input type="button" value="취소하기" onclick="fun2()">
</form>      
</div>


 <!-- jQuery 이 밑으로만 제이쿼리 문법 작성-->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"
		integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
		crossorigin="anonymous"></script>

<script type="text/javascript">
	jQuery('#selectBox').change(function() {
	var state = jQuery('#selectBox option:selected').val();
	if ( state == '7' ) {
		jQuery('.textarea').show();
	} else {
		jQuery('.textarea').hide();
	}
	});	
	
</script>
		
		
</body>
</html>