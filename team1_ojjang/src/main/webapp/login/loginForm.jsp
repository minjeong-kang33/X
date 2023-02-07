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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="loginPro.jsp" method="post">
        아이디<input type="text" name="M_id"><br>
        비밀번호<input type="password" name="M_pw"><br>
            <input type="submit" value="로그인">
            <a href="joinForm.jsp">회원가입</a> 
            <a href="아이디찾기로 가야함">아이디 찾기</a> 
            <a href="비밀번호찾기로 가야함">비밀번호 찾기</a>
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
</body>
</html>

