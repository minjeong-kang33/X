<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<script type="text/javascript">
			let DosearchForm_submited = false;
			function (DosearchForm_submited) {
				form.searchKeyword.value = form.searchKeyword.value.trim();
			}
			if(form.searchKeyword.value.length == 0){
				alert('검색어를 입력해주세요.');
				form.searchKeyword.focus;
				return;
			}
			DosearchForm_submited = ture;
			
			</script>
			<form action="" class="form-inline" onsubmit="return false;">
				<input type="hidden" name="searchID" value="${param.S_title}">
				<input type="text" value="${param.S_title}" name="Keyword" placeholder="검색어를 입력하세요." class="form-e">		
				<input type="submit" value="검색">
			</form>							
			
			
</body>
</html>