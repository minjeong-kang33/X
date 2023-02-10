<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="comment.CommentDAO" %>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 
		int B_num=request.getParameter("B_num");
		int Co_num=request.getParameter("Co_num");

				CommentDAO commentDAO=new CommentDAO();

				commentDAO.delete(B_num, Co_num);
				String url = "commentDetails.jsp?B_num" + B_num;
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("location.href='"+url+"'");
				script.println("</script>");

	%>
</body>
</html>