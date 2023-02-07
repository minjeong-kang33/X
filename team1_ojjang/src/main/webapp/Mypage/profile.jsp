<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <title>중고의류거래: 옺장</title>
</head>
<body>


    <div class="page-heading about-page-heading" id="top">
        <div class="container">
             <div class="inner-content2">
             	<h3>회원정보조회</h3>
             </div>
        </div>
    </div>
    <section>

<%
String M_id=(String)session.getAttribute("M_id");
MemberDAO dao=new MemberDAO();
MemberDTO dto=dao.getMember(M_id);
%>
	


아이디 : <%=dto.getM_id() %><br>
이름 : <%=dto.getM_name() %><br>
닉네임: <%=dto.getM_nick() %><br>
이메일:<%=dto.getM_email() %><br>
주소:<%=dto.getM_address() %><br>
<%-- 상세주소:<%=dto.getM_address2() %><br> --%>
번호:<%=dto.getM_phone() %><br>
생년월일: <br>
성별:<%=dto.getM_gender() %><br>


<a href="main.jsp">메인으로 이동</a>

</section>

	<!-- ***** 회원정보조회 ***** -->
	

    
	<!-- ***** 회원정보조회 끝 ***** -->



  </body>
</html>