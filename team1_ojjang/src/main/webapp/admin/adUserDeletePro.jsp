<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.AdminDAO"%>
<%
String M_id=(String)request.getParameter("id");
AdminDAO dao=new AdminDAO();
dao.adUserDeletePro(M_id);
%>
	<script type="text/javascript">
	alert("탈퇴완료");
	</script>