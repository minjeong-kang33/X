<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=buy.BuyDAO %>
<%@ page import=buy.BuyDTO %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판글읽기</title>
</head>
<body>
<%
	int B_num = 0;
	if(request.getParameter("B_num") != null ){
// 		B_num 이라는 매개변수가 존재한다면 buy_num
		B_num = Integer.parseInt(request.getParameter("B_num"));		
	}
	if (B_num == 0) {
  		PrintWriter script = response.getWriter();
  		script.println("<script>");
  		script.println("alert('유효하지않은 글입니다.')");
  		script.println("location.href = 'buyDTO.jsp'");
  		script.println("history.back()");
  		script.println("</script>");
  	}
	BuyDTO buy = new BuyDAO().getbuy(B_num);
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
				<td colspan="2"><%= buy.getB_title()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"> <%= buy.getM_id() %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td colspan="2"> <%= buy.getB_time()%> </td>
			</tr>
			<tr>
				<td>글내용</td>
				<td colspan="2"  style="min-height: 200px; text-align:left;"> <%= buy.getB_text() %></td>
			</tr>
		</tbody>		
	</table>
	<a href="buy.jsp" class="btn btn-primary">목록</a>
	
<!-- 	글작성자가 본인이라면 수정과 삭제 가능 -->
<%-- 	<% --%>
<!-- 		if(M_id != null && M_id.equals(buy.getM_id())) { -->
<!-- 	%> -->
<%-- 			<a href="update.jsp?B_num=<%= B_num %>" class="btn btn-primary">수정</a> --%>
<%-- 			<a href="update.jsp?B_num=<%= B_num %>" class="btn btn-primary">삭제</a> --%>
<%-- 	<% --%>
<!-- 		} -->
<!-- 	%> -->

	</div>
</div>
</body>
</html>