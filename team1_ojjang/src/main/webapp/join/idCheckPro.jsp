<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckPro.jsp</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>* 아이디 중복 확인 결과 *</h3>
	<%
	request.setCharacterEncoding("utf-8");
	String M_id = request.getParameter("M_id");
	MemberDAO dao = new MemberDAO();
	int cnt = dao.duplecateID(M_id);
	out.println("입력 ID : <strong>" + M_id + "</stong>");
	if (cnt == 0) {
		out.println("<p>사용 가능한 아이디입니다.</p>");
		out.println("<a href='javascript:apply(\"" + M_id + "\")'>[적용]</a>");
	%>

	<script>
		function apply(M_id) {
			window.opener.document.getElementById("M_id").value =M_id;
			window.close();
		}
	</script>
	<%
	} else {
	out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>");
	} //if end
	%>
	<hr>
	<a href="javascript:history.back()">[다시시도]</a> &nbsp; &nbsp;
	<a href="javascript:window.close()">[창닫기]</a>

</body>
</html>