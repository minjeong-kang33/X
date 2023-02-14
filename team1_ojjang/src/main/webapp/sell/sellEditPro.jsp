<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="sell.SellDAO"%>
<%@page import="sell.SellDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String uploadPath = request.getRealPath("/img/sell");
System.out.println(uploadPath);
//3. 파일의 크기
int maxSize = 10*1024*1024;
//4. 한글처리
//5. 같은 이름의 파일이 있을 경우 이름 변경
MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

request.setCharacterEncoding("utf-8");
int S_num = Integer.parseInt(multi.getParameter("S_num"));
String S_title = multi.getParameter("S_title");
int S_price = Integer.parseInt(multi.getParameter("S_price"));
String S_text = multi.getParameter("S_text");
String S_send1 = multi.getParameter("S_send1");
String S_send2 = multi.getParameter("S_send2");
String S_sido1 = multi.getParameter("S_sido1");
String S_gugun1 = multi.getParameter("S_gugun1");
String S_category = multi.getParameter("S_category");
String S_img = multi.getFilesystemName("S_img");
//파일 변경없으면 기존 파일 유지
		if(S_img==null) {
			S_img = multi.getParameter("oldfile");
		}

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