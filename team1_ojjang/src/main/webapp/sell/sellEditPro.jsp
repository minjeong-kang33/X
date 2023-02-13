<%@page import="sell.SellDAO"%>
<%@page import="sell.SellDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
int S_num = Integer.parseInt(request.getParameter("S_num"));
String S_title = request.getParameter("S_title");
int S_price = Integer.parseInt(request.getParameter("S_price"));
String S_text = request.getParameter("S_text");
String S_send1 = request.getParameter("S_send1");
String S_send2 = request.getParameter("S_send2");
String S_sido1 = request.getParameter("S_sido1");
String S_gugun1 = request.getParameter("S_gugun1");

String S_category = request.getParameter("S_category");
/* 이미지의 수정방법은...??? */
String S_img = request.getParameter("S_img");

SellDTO dto = new SellDTO();
dto.setS_num(S_num);
dto.setS_title(S_title);
dto.setS_price(S_price);
dto.setS_text(S_text);
dto.setS_send1(S_send1);
dto.setS_send2(S_send2);
dto.setS_sido1(S_sido1);
dto.setS_gugun1(S_gugun1);
dto.setS_category(S_category);
dto.setS_img(S_img);

SellDAO dao = new SellDAO();
dao.updateSellBoard(dto);

response.sendRedirect("outer.jsp");

%>