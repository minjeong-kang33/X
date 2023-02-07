<%@page import="report.ReportDAO"%>
<%@page import="report.ReportDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%

request.setCharacterEncoding("utf-8");

String id=(String)session.getAttribute("id"); // 세션에서 id값 받아오기

ReportDAO dao = new ReportDAO();

dto.setM_id(M_id);
dto.setR_type(R_type);
dto.setR_id("test"); //test값 
dto.setR_reason(r_reason);

ReportDAO dao = new ReportDAO();
dao.insertReport(dto);

%>

</body>
</html>