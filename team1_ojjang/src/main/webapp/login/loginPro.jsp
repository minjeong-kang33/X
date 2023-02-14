<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("utf-8");
	String M_id = request.getParameter("M_id");
	String M_pw = request.getParameter("M_pw");

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.M_userCheck(M_id, M_pw);
	if(M_id.equals("admin")&&(M_pw.equals("1234"))) {
			response.sendRedirect("../admin/admain_test.jsp");
		} else if (dto != null) {
		session.setAttribute("M_id", M_id);
		response.sendRedirect("../home/main.jsp");
	} else {
	%>
	<script type="text/javascript">
		alert("아이디 비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
	<%
	}
	%>
