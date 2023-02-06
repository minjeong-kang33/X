<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="sell.SellDTO"%>
<%@page import="sell.SellDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
	<title>중고의류거래: 옺장</title>
</head>
<body>
<h3>판매글목록조회</h3>
<%
SellDTO dto=new SellDTO();
SellDAO dao=new SellDAO();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
int pageSize=10;
String pageNum=request.getParameter("pageNum");
if(pageNum==null){pageNum="1";}
int currentPage=Integer.valueOf(pageNum);
int startRow=(currentPage-1)*pageSize+1;
int endRow=startRow+pageSize-1;
ArrayList<SellDTO> adSellList=dao.adSellList(startRow, pageSize);
%>
<section>
<div class="container">
	<div>
	총 게시글 <%=dao.adSellCount() %>개
	</div>
<form action="#.jsp" method="post">
<table border="1">
<tr><td>판매번호</td><td>카테고리</td><td>아이디</td><td>제목</td><td>가격</td><td>날짜</td><td>삭제</td></tr>
<%
for(int i=0;i<adSellList.size();i++){
	dto=adSellList.get(i);
%>
	<tr><td><a href=""><%=dto.getS_num() %></a></td>
		<td><%=dto.getS_category() %></td>
		<td><a href=""><%=dto.getM_id() %></a></td>
		<td><%=dto.getS_title() %></td>
		<td><%=dto.getS_price() %></td>
		<td><%=dateFormat.format(dto.getS_createdate()) %></td>
		<td><input type="button" value="삭제"></td></tr>
<%
}
%>
</table>
<%
int pageBlock=10;
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
int endPage=startPage+pageBlock-1;
int count=dao.adSellCount();
int pageCount=count/pageSize+(count%pageSize==0?0:1);
if(endPage>pageCount){endPage=pageCount;}
for(int i=startPage;i<=endPage;i++){
if(startPage > pageBlock){
%>
<a href="adSellList.jsp?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
<%
}
%>
<a href="adSellList.jsp?pageNum=<%=i %>"><%=i %></a>
<%
}
if(endPage < pageCount){
%>
<a href="adSellList.jsp?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
<%
}
%>
</form>
</div>
</section>
</body>
</html>