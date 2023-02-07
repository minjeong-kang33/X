<%@page import="buy.BuyDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="buy.BuyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String M_id=request.getParameter("M_id");
String B_title=request.getParameter("B_title");
String B_text=request.getParameter("B_text");
int B_view=0;
Timestamp B_time=new Timestamp(System.currentTimeMillis());

BuyDTO dto=new BuyDTO();

dto.setM_id(M_id);
dto.setB_title(B_title);
dto.setB_text(B_text);
dto.setB_view(B_view);
dto.setB_time(B_time);

BuyDAO dao=new BuyDAO();
dao.insertBuyBoard(dto);

response.sendRedirect("buyList.jsp");

%>