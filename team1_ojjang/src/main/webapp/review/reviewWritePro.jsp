<%@page import="review.reviewDAO"%>
<%@page import="review.reviewDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

String M_id=(String)session.getAttribute("M_id");
String RE_title=request.getParameter("RE_title");
String RE_text =request.getParameter("RE_text");
String RE_delivery = request.getParameter("RE_delivery");

String RE_manner = request.getParameter("RE_manner");
String RE_ProductStatus = request.getParameter("RE_ProductStatus");
String RE_fast = request.getParameter("RE_fast");
String RE_time = request.getParameter("RE_time");
int RE_view = 0;
Timestamp RE_createtime = new Timestamp(System.currentTimeMillis());

reviewDTO dto = new reviewDTO();
dto.setRE_writer(M_id);//잘 되는지 확인하기
dto.setRE_title(RE_title);
dto.setRE_text(RE_text);
dto.setRE_delivery(RE_delivery);

dto.setRE_manner(RE_manner);
dto.setRE_ProductStatus(RE_ProductStatus);
dto.setRE_fast(RE_fast);
dto.setRE_time(RE_time);
dto.setRE_view(RE_view); 
dto.setRE_createtime(RE_createtime);

reviewDAO dao = new reviewDAO();

dao.insertreview(dto);

response.sendRedirect("reviewList.jsp");

%>