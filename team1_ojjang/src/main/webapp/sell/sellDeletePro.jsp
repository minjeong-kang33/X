<%@page import="deal.DealDAO"%>
<%@page import="sell.SellDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int S_num = Integer.parseInt(request.getParameter("S_num"));

SellDAO dao = new SellDAO();
DealDAO dealdao = new DealDAO();
%>

<!-- deal 중인 게시글은 삭제 불가하도록 -->


<% 
dao.deleteLikeSellBoard(S_num);
dao.deleteSellBoard(S_num);

response.sendRedirect("outer.jsp");

%>

