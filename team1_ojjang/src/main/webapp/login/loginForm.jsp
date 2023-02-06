
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link href="pro.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<body class="text-center">

	<!--  html 전체 영역을 지정하는 container -->
	<div id="container">
		<!--  login 폼 영역을 : loginBox -->
		<div id="loginBox">
			<form action="loginPro.jsp" method="post">
				<!-- 로그인 페이지 타이틀 -->
				<div id="loginBoxTitle">옺장</div>
				<!-- 아이디, 비번, 버튼 박스 -->
				<div id="inputBox">
					<div class="input-form-box">
						<span>아이디 </span><input type="text" name="M_id"
							class="form-control" placeholder="아이디">
					</div>
					<div class="input-form-box">
						<span>비밀번호 </span><input type="password" name="M_pw"
							class="form-control" placeholder="비밀번호">
					</div>
					<div class="button-login-box">
						<button type="button" class="btn btn-primary btn-xs"
							style="width: 100%">로그인</button>
					</div>
					<a href="joinForm.jsp">회원가입</a> <a href="아이디찾기로 가야함">아이디 찾기</a> <a
						href="비밀번호찾기로 가야함">비밀번호 찾기</a>
				</div>
	
	</form>
	<div> <!-- 카카오 로그인 -->
	<a onclick="kakaoLogin();">
        <img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
    </a>
    <ul><li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
	</ul>
    <%@include file="kakaoApi.jsp"%>
	
    
    
    </div>
    <div>
      <a id="naverIdLogin_loginButton" href="javascript:void(0)">
          네이버 로그인
      </a>
	
	<span><a  onclick="naverLogout(); return false;"> 네이버 로그아웃 </a></span>
      <a href="javascript:void(0)">
      </a>
    <%@include file="naverApi.jsp"%>
    </div>
		</div>
	</div>
</body>

</body>

</body>
</html>
