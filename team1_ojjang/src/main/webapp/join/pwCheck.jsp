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
var M_pw = document.getElementById("M_pw")
, M_pw2 = document.getElementById("M_pw2");

function validatePassword(){
if(M_pw.value != M_pw2.value) {
  M_pw2.setCustomValidity("비밀번호가 일치하지 않습니다.");
} else {
  M_pw2.setCustomValidity(''); // 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
}
}

M_pw.onchange = validatePassword;
M_pw2.onkeyup = validatePassword;
  </script>
</body>
</html>