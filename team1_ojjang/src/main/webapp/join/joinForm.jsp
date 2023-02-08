<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<body>
	<form action="joinpro.jsp" method="post">
		<div>
			아이디 <input type="text" id="M_id" name="M_id" size="15" required onclick="idCheck()">
			<input type="button" value="ID중복확인" >
			<script type="text/javascript">
				function idCheck() {
					window.open("idCheck.jsp", "nickwin",
							"width=400, height=350");
				}
			</script>
		</div>
		<div>
			비밀번호 <input type="password" id="M_pw" name="M_pw" size="15" required>
		</div>
		<div>
			비밀번호 확인 <input type="password" id="M_pw2" name="M_pw2" size="15"
				required>
			<%@include file="pwCheck.jsp"%>
			<input type="submit" value="PW중복확인">
		</div>
		<div>
			이름 <input type="text" id="M_name" name="M_name" size="15" required>
		</div>
		<div>
			닉네임 <input type="text" id="M_nick" name="M_nick" size="15" required
				onclick="nickCheck()"> <input type="button" value="닉네임중복확인">
			<script type="text/javascript">
				function nickCheck() {
					window.open("nickCheck.jsp", "nickwin",
							"width=400, height=350");
				}
			</script>
		</div>
		<div>
			이메일 <input type="email" id="M_email" name="M_email" size="30">
			<input type="button" id="M_id" value="Email 인증"
				onclick="emailCheck()">
		</div>
		<div>
			전화번호 <input type="text" id="M_phone" name="M_phone" size="15">
		</div>
		<div>
			우편번호 <input type="text" name="M_zipcode" id="zipcode" size="7"
				readonly> <input type="button" value="주소찾기"
				onclick="DaumPostcode()">
			<%@include file="addressMap.jsp"%>
		</div>
		<div>
			주소 <input type="text" name="M_address" id="M_address" size="45"
				readonly required>
		</div>

		<div>
			나머지주소 <input type="text" name="M_address2" id="M_address2" size="45">
		</div>

		<div>
			성별 <select name="M_gender" id="M_gender">
				<option value="2">선택하세요.</option>
				<option value="0">남자</option>
				<option value="1">여자</option>
			</select>
		</div>

		<input type="submit" value="회원가입" class="btn btn-primary" /> <input
			type="reset" value="취소" class="btn btn-primary" />
	</form>
</body>

</html>
