<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 

	request.setCharacterEncoding("utf-8");
	CommentDTO comment = new CommentDTO();	

    int Co_num=Integer.parseInt(request.getParameter("Co_num"));
	String Co_text=request.getParameter("Co_text");
	
	if(Co_text == ""){
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("alert('댓글을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			CommentDAO commentDAO=new CommentDAO();
			
			commentDAO.update(Co_num, Co_text);
			PrintWriter script= response.getWriter();
			script.println("<script>");
			script.println("window.opener.parent.location.reload();");
			script.println("window.close()");
			script.println("</script>");

			}
	%>
</body>
</html>