<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="sell.SellDAO"%>
<%@page import="sell.SellDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String uploadPath = request.getRealPath("../img/sell");
System.out.println(uploadPath);
int maxSize = 10 * 1024 * 1024;
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");

String M_id=(String)session.getAttribute("M_id");
String S_title = multi.getParameter("S_title");
int S_price = Integer.parseInt(multi.getParameter("S_price"));
String S_text = multi.getParameter("S_text");
int S_like = 0;
int S_view = 0;
String S_send1 = multi.getParameter("S_send1");
String S_send2 = multi.getParameter("S_send2");
String S_sido1 = multi.getParameter("S_sido1");
String S_gugun1 = multi.getParameter("S_gugun1");
Timestamp S_createdate = new Timestamp(System.currentTimeMillis());
String S_category = multi.getParameter("S_category");
String S_img = multi.getFilesystemName("S_img");

SellDTO dto = new SellDTO();

dto.setM_id(M_id);
dto.setS_title(S_title);
dto.setS_price(S_price);
dto.setS_text(S_text);
dto.setS_like(S_like);
dto.setS_view(S_view);
dto.setS_send1(S_send1);
dto.setS_send2(S_send2);
dto.setS_sido1(S_sido1);
dto.setS_gugun1(S_gugun1);
dto.setS_createdate(S_createdate);
dto.setS_category(S_category);
dto.setS_img(S_img);

SellDAO dao = new SellDAO();
dao.insertSellBoard(dto);

response.sendRedirect("outer.jsp");
%>
