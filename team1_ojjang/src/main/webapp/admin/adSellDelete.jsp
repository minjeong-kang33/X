<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="admin.AdminDAO"%>
<%
// int S_numArr[]=Integer.valueOf(request.getParameterValues("ck"));
// AdminDAO dao=new AdminDAO();
// int S_num=0;
// if(S_numArr!=null){
// 	for(int i=0;i<S_numArr.length;i++){
// 		S_num=S_numArr[i];
// 		dao.adSellDelete(S_num);
// 	}
// }
%>
	<script type="text/javascript">
		alert("삭제완료");
		location.href="adSellList.jsp";
	</script>