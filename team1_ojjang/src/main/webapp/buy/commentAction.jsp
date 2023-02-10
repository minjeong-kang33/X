<%@page import="comment.CommentDTO"%>
<%@page import="buy.BuyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
</head>
<body>
	<%
	
	
		int B_num=1;
		if(request.getParameter("B_num")!=null){
			B_num=Integer.parseInt(request.getParameter("B_num"));
		}
	
		String M_id=null;
		if(session.getAttribute("M_id")!=null){
			M_id=(String)session.getAttribute("M_id");
		}
		if(M_id==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}
		
		else{
			CommentDTO comment = new CommentDTO();	
			String Co_text=request.getParameter("Co_text");
			if(
				Co_text == null ){
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("alert('댓글을 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				CommentDAO commentDAO=new CommentDAO();
				
				commentDAO.write(B_num, Co_text, M_id);
				
				String url = "buyDetails.jsp?B_num=" + B_num;
				PrintWriter script= response.getWriter();
				script.println("<script>");
				script.println("location.href='"+url+"'");
				script.println("</script>");

				}
			}
		
	%>

</body>
</html>