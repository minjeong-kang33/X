<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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