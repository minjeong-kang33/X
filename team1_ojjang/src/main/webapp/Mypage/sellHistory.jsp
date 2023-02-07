<%@page import="sell.SellDAO"%>
<%@page import="sell.SellDTO"%>
<%@page import="deal.DealDAO"%>
<%@page import="deal.DealDTO"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <title>중고의류거래: 옺장</title>
</head>
<body>


    <div class="page-heading about-page-heading" id="top">
        <div class="container">
             <div class="inner-content2">
             	<h3>회원정보조회</h3>
             </div>
        </div>
    </div>
    <section>


<%
String M_id=(String)session.getAttribute("M_id");
DealDTO dto=new DealDTO();
DealDAO dao=new DealDAO();
SellDTO sdto=new SellDTO();
SellDAO sdao=new SellDAO();
ArrayList<DealDTO> dealList=dao.getdealList(M_id);
ArrayList<SellDTO> sellList=sdao.getsellList(M_id);
%>	
<section>
<div>
	<div>
<table border="1">
<tr><td>판매번호</td><td>아이디</td><td>글제목</td><td>가격</td>
<td>내용</td><td>작성일</td><td>카테고리</td><td>구매자</td><td>거래일자</td></tr>
<%
for(int i=0;i<sellList.size();i++){
	sdto=sellList.get(i);
	dto=dealList.get(i);
%>

	<tr>
		<td><%=sdto.getS_num() %></td>
		<td><%=sdto.getM_id() %></td>
		<td><%=sdto.getS_title() %></td>
		<td><%=sdto.getS_price() %></td>
		<td><%=sdto.getS_text() %></td>
		<td><%=sdto.getS_createdate() %></td>
		<td><%=sdto.getS_category() %></td>
		<td><%=dto.getD_buy() %></td>
		<td><%=dto.getD_date() %></td>
		
		
	</tr>
	<a href="main.jsp">메인</a>

<%
//이미지도 나오게 하기
}
%>

	<!-- ***** 회원정보조회 ***** -->
	

    
	<!-- ***** 회원정보조회 끝 ***** -->



  </body>
</html>