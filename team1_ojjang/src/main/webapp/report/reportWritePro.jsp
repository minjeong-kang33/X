<%@page import="java.io.PrintWriter"%>
<%@page import="java.awt.Window"%>
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
String R_type = request.getParameter("R_type"); // 신고유형
String M_id = request.getParameter("M_id"); 
String R_id = request.getParameter("R_id"); //가해자
String R_reason = request.getParameter("R_reason");


ReportDTO dto = new ReportDTO();
dto.setR_type(R_type);
dto.setM_id(M_id);
dto.setR_id(R_id); 
dto.setR_reason(R_reason);

ReportDAO dao = new ReportDAO();

dao.insertReport(dto);

%>

</body>
</html>