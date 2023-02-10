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
 		int B_num=Integer.parseInt(request.getParameter("B_num"));
		int Co_num=Integer.parseInt(request.getParameter("Co_num"));
		
				CommentDAO commentDAO=new CommentDAO();

				commentDAO.delete(Co_num);
				String url = "buyDetails.jsp?B_num=" + B_num;
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("location.href='"+url+"'");
				script.println("</script>");

	%> 
</body>
</html>