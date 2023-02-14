<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.AdminDAO"%>
<%
String M_idArr[]=request.getParameterValues("ck");
AdminDAO dao=new AdminDAO();
String M_id=null;
if(M_idArr!=null){
	for(int i=0;i<M_idArr.length;i++){
		M_id=M_idArr[i];
		dao.adUserDeletePro(M_id);
	}
}
%>
	<script type="text/javascript">
		alert("강퇴완료");
		location.href="adUserList.jsp";
	</script>