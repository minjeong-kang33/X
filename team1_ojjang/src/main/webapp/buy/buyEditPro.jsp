<%@page import="buy.BuyDAO"%>
<%@page import="buy.BuyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

int B_num = Integer.parseInt(request.getParameter("B_num"));
String B_category = request.getParameter("B_category");
String B_title = request.getParameter("B_title");
String B_text = request.getParameter("B_text");
String B_send1 = request.getParameter("B_send1");
String B_send2 = request.getParameter("B_send2");
String B_sido1 = request.getParameter("B_sido1");
String B_gugun1 = request.getParameter("B_gugun1");

BuyDTO dto = new BuyDTO();
dto.setB_num(B_num);
dto.setB_category(B_category);
dto.setB_title(B_title);
dto.setB_text(B_text);
dto.setB_send1(B_send1);
dto.setB_send2(B_send2);
dto.setB_sido1(B_sido1);
dto.setB_gugun1(B_gugun1);

BuyDAO dao = new BuyDAO();
dao.updateBuyBoard(dto);

response.sendRedirect("buyList.jsp");

%>