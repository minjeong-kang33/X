<%@page import="buy.BuyDTO"%>
<%@page import="buy.BuyDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판글읽기</title>
</head>
<body>
<%
int B_num = Integer.parseInt(request.getParameter("B_num"));
BuyDAO dao = new BuyDAO();
BuyDTO dto = dao.getBuyBoard(B_num);
String M_id = (String)session.getAttribute("M_id");

%>
<div class="container">
	<div class="row">
	<!--보내지는 내용 숨겨지도록(post) 작성한 글을 writeAction으로 보냄 -->
	<table class = "table table-striped" style="text-align:center; border:1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="3"  style="background-color: #eeeeee; text-align:center">게시판 글보기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="width:20%;">글제목</td>
				<td colspan="2"><%= dto.getB_title()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"> <%= dto.getM_id() %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td colspan="2"> <%= dto.getB_time()%> </td>
			</tr>
			<tr>
				<td>글내용</td>
				<td colspan="2"  style="min-height: 200px; text-align:left;"> <%= dto.getB_text() %></td>
			<tr><td colspan="2">
<%
if(M_id != null){
	// 세션값=id와 글쓴이가 일치해야만 글수정, 글삭제 표시
	if(M_id.equals(dto.getM_id())){
		%>
<%-- <input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=dto.getB_num() %>'">
<input type="button" value="글삭제" onclick="location.href='deletePro.jsp?num=<%=dto.getB_num() %>'"> --%>
		<%		
	}
}
%>
<!-- <input type="button" value="글목록" onclick="location.href='list.jsp'"></td> -->
</tr>
</tbody>		
</table>
</div>
</div>
</body>
</html>