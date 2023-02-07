<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<h1>member/updatePro.jsp</h1>


<%

request.setCharacterEncoding("utf-8");

String M_id=request.getParameter("M_id");
String M_pw=request.getParameter("M_pw");
String M_pw2=request.getParameter("M_pw2");

MemberDTO updatePwDto=new MemberDTO();
updatePwDto.setM_id(M_id);
updatePwDto.setM_pw(M_pw2);


MemberDAO dao=new MemberDAO();

MemberDTO dto=dao.M_userCheck(M_id, M_pw);
 
if(dto!=null){
	System.out.println("일치");
	dao.updatePw(updatePwDto);

	response.sendRedirect("../home/main.jsp");
}else{
    %>
    <script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
    </script>
    <%
}
%>
</body>
</html>
