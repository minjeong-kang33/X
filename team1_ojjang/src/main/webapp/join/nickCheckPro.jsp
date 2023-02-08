<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nickCheckPro.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3> 닉네임 중복 확인 결과 </h3>
	<%
	request.setCharacterEncoding("utf-8");
	String M_nick = request.getParameter("M_nick");
	MemberDAO dao = new MemberDAO();
	int cnt = dao.duplecateNick(M_nick);
	out.println("입력 닉네임 : <strong>" + M_nick + "</stong>");
	if (cnt == 0) {
		out.println("<p>사용 가능한 닉네임입니다.</p>");
		out.println("<a href='javascript:apply(\"" + M_nick + "\")'>[적용]</a>");
	%>

	<script>
		function apply(M_nick) {
			window.opener.document.getElementById("M_nick").value =M_nick;
			window.close();
		}
	</script>
	<%
	} else {
	out.println("<p style='color: red'>해당 닉네임은 사용하실 수 없습니다.</p>");
	} //if end
	%>
	<hr>
	<a href="javascript:history.back()">[다시시도]</a> &nbsp; &nbsp;
	<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>