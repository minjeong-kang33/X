<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.AdminDAO"%>
<%
String B_numArr[]=request.getParameterValues("ck");
AdminDAO dao=new AdminDAO();
String B_num=null;
if(B_numArr!=null){
	for(int i=0;i<B_numArr.length;i++){
		B_num=B_numArr[i];
		dao.adBuyDelete(Integer.parseInt(B_num));
	}
}
%>
	<script type="text/javascript">
		alert("삭제완료");
		location.href="adBuyList.jsp";
	</script>