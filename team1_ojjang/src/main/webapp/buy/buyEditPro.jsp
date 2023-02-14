<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="buy.BuyDAO"%>
<%@page import="buy.BuyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String uploadPath = request.getRealPath("/img/buy");
System.out.println(uploadPath);
int maxSize = 10*1024*1024;
MultipartRequest multi=new MultipartRequest
(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

int num = Integer.parseInt(request.getParameter("B_num"));
String B_category=multi.getParameter("B_category");
String B_title=multi.getParameter("B_title");
String B_text=multi.getParameter("B_text");
String B_send1=multi.getParameter("B_send1");
String B_send2=multi.getParameter("B_send2");
String B_sido1=multi.getParameter("B_sido1");
String B_gugun1=multi.getParameter("B_gugun1");
String B_img = multi.getFilesystemName("B_img");

//파일 변경없으면 기존 파일 유지
		if(B_img==null) {
			B_img = multi.getParameter("oldfile");
		}

BuyDTO dto = new BuyDTO();
dto.setB_num(num);
dto.setB_category(B_category);
dto.setB_title(B_title);
dto.setB_text(B_text);
dto.setB_send1(B_send1);
dto.setB_send2(B_send2);;
dto.setB_sido1(B_sido1);
dto.setB_gugun1(B_gugun1);
dto.setB_img(B_img);


BuyDAO dao = new BuyDAO();
dao.updateBuyBoard(dto);

response.sendRedirect("buyList.jsp");

%>