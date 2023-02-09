<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String M_name = request.getParameter("M_name");
String M_phone = request.getParameter("M_phone"); 
MemberDAO dao = new MemberDAO();
String M_id=dao.findId(M_name, M_phone);
%>
 <form name="idsearch" method="post" action="loginForm.jsp">
      <%
       if (M_id != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=M_id%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="submit" id="btnLogin" value="로그인">
       	</div>
       </div>
      <%
  } else {
 %>
 </form>
 <form action="./join/joinForm.jsp">
        <div class = "container">
      	<div class = "found-fail">
	      <h4> 등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입"  onClick="location.href='../join/joinForm.jsp';"/>
       	</div>
       </div>
      </form>
       <%
  }
 %> 
 