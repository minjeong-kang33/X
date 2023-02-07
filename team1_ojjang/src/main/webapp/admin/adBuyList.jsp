<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="buy.BuyDTO"%>
<%@page import="admin.AdminDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>중고의류거래: 옺장</title>
   <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="../assets/css/owl-carousel.css">
    <link rel="stylesheet" href="../assets/css/lightbox.css"> 
<meta charset="UTF-8">
</head>
<body>
    <!-- ***** 헤더 ***** -->
  <jsp:include page="../top.jsp" />
    <!-- ***** 헤더 끝 ***** -->
    
	<!-- ***** 구매글목록조회 ***** -->
    <div class="page-heading about-page-heading" id="top">
        <div class="container">
             <div class="inner-content2">
             
<h3>구매글목록조회</h3>
<%
BuyDTO dto=new BuyDTO();
AdminDAO dao=new AdminDAO();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
int pageSize=10;
String pageNum=request.getParameter("pageNum");
if(pageNum==null){pageNum="1";}
int currentPage=Integer.valueOf(pageNum);
int startRow=(currentPage-1)*pageSize+1;
int endRow=startRow+pageSize-1;
ArrayList<BuyDTO> adbuyList=dao.adBuyList(startRow,pageSize);
%>
<section>
<div class="container">
	<div>
	총 게시글 <%=dao.adBuyCount() %>개
	</div>
<form action="#.jsp" method="post">
<table border="1">
<tr><td>구매번호</td><td>아이디</td><td>제목</td><td>날짜</td><td>삭제</td></tr>
<%
for(int i=0;i<adbuyList.size();i++){
	dto=adbuyList.get(i);
%>
	<tr><td><a href=""><%=dto.getB_num() %></a></td>
		<td><a href=""><%=dto.getM_id() %></a></td>
		<td><%=dto.getB_title() %></td>
		<td><%=dateFormat.format(dto.getB_time()) %></td>
		<td><input type="button" value="삭제"></td></tr>
<%
}
%>
</table>
<%
int pageBlock=10;
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
int endPage=startPage+pageBlock-1;
int count=dao.adBuyCount();
int pageCount=count/pageSize+(count%pageSize==0?0:1);
if(endPage>pageCount){endPage=pageCount;}
for(int i=startPage;i<=endPage;i++){
if(startPage > pageBlock){
%>
<a href="adBuyList.jsp?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
<%
}
%>
<a href="adBuyList.jsp?pageNum=<%=i %>"><%=i %></a>
<%
}
if(endPage < pageCount){
%>
<a href="adBuyList.jsp?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
<%
}
%>
</form>
</div>
</section>
             </div>
        </div>
    </div>
    <!-- ***** 구매글목록조회 끝 ***** -->
    
    <!-- ***** 푸터 시작 ***** -->
   <jsp:include page="../bottom.jsp" />
    <!-- ***** 푸터 끝 ***** -->

 <!-- jQuery -->
    <script src="../assets/js/jquery-2.1.0.min.js"></script>

 <!--  Bootstrap -->
    <script src="../assets/js/popper.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>

 <!-- Plugins -->
    <script src="../assets/js/owl-carousel.js"></script>
    <script src="../assets/js/accordions.js"></script>
    <script src="../assets/js/datepicker.js"></script>
    <script src="../assets/js/scrollreveal.min.js"></script>
    <script src="../assets/js/waypoints.min.js"></script>
    <script src="../assets/js/jquery.counterup.min.js"></script>
    <script src="../assets/js/imgfix.min.js"></script> 
    <script src="../assets/js/slick.js"></script> 
    <script src="../assets/js/lightbox.js"></script> 
    <script src="../assets/js/isotope.js"></script> 
    
<!-- Global Init -->
    <script src="../assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script> 
</body>
</html>