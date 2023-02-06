<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=buy.buyDAO %>
<%@ page import=buy.buyDTO %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int B_num = 0;
	if(request.getParameter("B_num") != null ){
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
	buyDTO buy = new buyDTO().getbuyDTO(B_num);
	// d
%>
<div class="container">
	<div class="row">
	<form method="post" action="writeAction.jsp">
	<!--보내지는 내용 숨겨지도록(post) 작성한 글을 writeAction으로 보냄 -->
	<table class = "table table-striped" style="text-align:center; border:1px solid #dddddd">
		<thead>
			<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align:center;">게시판 글쓰기 양식</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" class="form-contol" placeholder="글제목" name="buyTitle" maxlength="50"></td>
			</tr>
			<tr>
				<td><textarea class="form-contol" placeholder="글내용" name="buytext" maxlength="2048" style="height:350px;"></textarea></td>
				<!--input : 특정한 정보를 액션페이지로 보냄 -->
			</tr>
		</tbody>		
	</table>
	<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
	</form>
	</div>
</div>
</body>
</html>
</body>
</html>