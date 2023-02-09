<%@page import="sell.SellDAO"%>
<%@page import="sell.SellDTO"%>
<%@page import="buy.BuyDAO"%>
<%@page import="buy.BuyDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String M_id=request.getParameter("M_id");
String S_title=request.getParameter("S_title");
int S_price= Integer.parseInt(request.getParameter("S_price"));
String S_text=request.getParameter("S_text");
int S_like=0;
int S_view=0;
String S_send=request.getParameter("S_send");
String S_sido1=request.getParameter("S_sido1");
String S_gugun1=request.getParameter("S_gugun1");
Timestamp s_createdate=new Timestamp(System.currentTimeMillis());
String S_category=request.getParameter("S_category");

SellDTO dto=new SellDTO();

dto.setM_id(M_id);
dto.setS_title(S_title);
dto.setS_price(S_price);
dto.setS_text(S_text);
dto.setS_like(S_like);
dto.setS_view(S_view);
dto.setS_send(S_send);
dto.setS_sido1(S_sido1);
dto.setS_gugun1(S_gugun1);
dto.setS_createdate(s_createdate);
dto.setS_category(S_category);

SellDAO dao=new SellDAO();
dao.insertSellBoard(dto);

response.sendRedirect("#");

%>
