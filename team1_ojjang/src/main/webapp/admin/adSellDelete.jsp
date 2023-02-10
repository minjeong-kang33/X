<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.AdminDAO"%>
<%
String S_numArr[]=request.getParameterValues("ck");
AdminDAO dao=new AdminDAO();
String S_num=null;
if(S_numArr!=null){
	for(int i=0;i<S_numArr.length;i++){
		S_num=S_numArr[i];
		dao.adSellDelete(Integer.parseInt(S_num));
	}
}
%>
	<script type="text/javascript">
		alert("삭제완료");
		location.href="adSellList.jsp";
	</script>