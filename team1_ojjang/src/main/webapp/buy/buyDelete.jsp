<%@page import="buy.BuyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 왜..  9행 int B_num = Integer.parseInt(request.getParameter("B_num"));에서
	java.lang.NumberFormatException: null이 나올까... -->   
	 
<%
int B_num = Integer.parseInt(request.getParameter("B_num"));

BuyDAO dao = new BuyDAO();
dao.deleteBuyBoard(B_num);

response.sendRedirect("buyList.jsp");

%>