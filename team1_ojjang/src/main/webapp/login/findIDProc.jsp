<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>* 아이디/비밀번호 찾기 결과 *</h3>
<%
request.setCharacterEncoding("utf-8");
MemberDAO dao=new MemberDAO();
MemberDTO dto=new MemberDTO();
	String M_name = request.getParameter("M_name");
	String M_email = request.getParameter("M_email");
	String M_pw = dao.randomPasswd(10);
	dto.setM_name(M_name);
	dto.setM_email(M_email);
	String M_id = dao.findID(M_name, M_email);
	if(M_id==null){
		out.println("<p>일치하는 정보가 없습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{		
%>
		<form action="sendPasswd.jsp?M_id=<%=M_id%>&M_pw<%=M_pw%>">
			<input type="hidden" name="M_email" id="M_email" value="<%=M_email%>">
			<input type="hidden" name="M_pw" id="M_pw" value="<%=M_pw%>">
			<input type="hidden" name="M_id" id="M_id" value="<%=M_id%>">
			<table class=table>
			<tr>
				<td>회원님의 아이디는<%=M_id%> 입니다. </td>
			</tr>
			<tr>
				<td>임시 비밀번호를 발급받으시겠습니까?</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="발급" class="btn btn-danger">
				</td>
			</tr>
			</table>
		</form>
<%
	}//if end	
%>
