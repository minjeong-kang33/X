<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="database.buyDAO" %>
<%@ page import="database.buyDTO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a,a:hover {
	color:#000000;
	text-decoration : none;
	}
</style>
</head>
<body>
<%
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<div class="container">
	<table class = "table table-striped" style="text-align:center; border:1px solid #dddddd">
		<thead>
			<tr>
					<th style="background-color: #eeeeee; text-align:center;">글번호</th>
					<th style="background-color: #eeeeee; text-align:center;">글제목</th>
					<th style="background-color: #eeeeee; text-align:center;">작성자</th>
					<th style="background-color: #eeeeee; text-align:center;">작성일</th>
			</tr>
		</thead>
		<tbody>
			<%
				buyDAO buyDAO = new buyDAO();
				ArrayList<buyDTO> list = buyDAO.getList(pageNumber);
				for(int i=0; i<list.size(); i++){
			%>
			<tr>
				<td><%= list.get(i).getB_num() %></td>
				<td><a href="view.jsp?B_num=<%=list.get(i).getB_num() %>"><%=list.get(i).getB_title() %></a></td>
				<td><%= list.get(i).getM_id() %></td>
				<td><%= list.get(i).getB_time() %></td>
			</tr>
			<%
				}
			%>
			
		</tbody>
	</table>
	<%
		if(pageNumber != 1) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
		}if(buyDAO.nextPage(pageNumber)){
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
		}
	%>
	<!-- 	글 작성 버튼을 오른쪽 아래에 고정 -->
	<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>

</div>
</body>
</html>