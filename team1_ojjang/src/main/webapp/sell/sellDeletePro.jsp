<%@page import="sell.SellDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int S_num = Integer.parseInt(request.getParameter("S_num"));

SellDAO dao = new SellDAO();
dao.deleteSellBoard(S_num);

response.sendRedirect("outer.jsp");

%>

