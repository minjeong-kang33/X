<%@page import="members.MembersDTO"%>
<%@page import="members.MembersDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String M_id=request.getParameter("m_id");
String M_pw=request.getParameter("M_pw");
String M_name=request.getParameter("M_name");
String M_nick=request.getParameter("M_nick");
String M_gender=request.getParameter("M_gender");
String M_phone=request.getParameter("M_phone");
String M_address=request.getParameter("M_address");
String M_address2=request.getParameter("M_address2");
String M_email=request.getParameter("M_email");
Timestamp M_createdate=new Timestamp(System.currentTimeMillis());
String M_admin=request.getParameter("M_admin");

MembersDTO dto=new MembersDTO();

dto.setM_id(M_id);
dto.setM_pw(M_pw);
dto.setM_name(M_name);
dto.setM_nick(M_nick);
dto.setM_gender(M_gender);
dto.setM_phone(M_phone);
dto.setM_address(M_address);
dto.setM_address(M_address2);
dto.setM_email(M_email);
dto.setM_createdate(M_createdate);
dto.setM_admin(M_admin);

MembersDAO dao=new MembersDAO();
dao.insertMembers(dto);
response.sendRedirect("loginForm.jsp");


%>
