<%@page import="buy.BuyDTO"%>
<%@page import="admin.MypageDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sell.SellDAO"%>
<%@page import="sell.SellDTO"%>
<%@page import="deal.DealDAO"%>
<%@page import="deal.DealDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
    
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
<title>중고 의류거래: 옺장</title>
</head>
<body>
    <body>
     <!-- ***** 헤더 ***** -->
  <jsp:include page="../top.jsp" />
    <!-- ***** 헤더 끝 ***** -->
    
    <div class="page-heading about-page-heading" id="top">
        <div class="container">
             <div class="inner-content2">
            
 <!-- ***** 판매내역조회***** -->
    
    <h3>구매글내역조회</h3>
<%
String M_id=(String)session.getAttribute("M_id");

BuyDTO dto=new BuyDTO();
MypageDAO dao=new MypageDAO();


ArrayList<BuyDTO> WriteHistoryB=dao.WriteHistoryB(M_id);

SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
%>	
<section>
<table border="1">
<tr><td>구매글제목</td><td>내용</td><td>카테고리</td><td>이미지</td><td>조회수</td></tr>

<%
// System.out.println(dealListS.size());
// System.out.println(dealListB.size());
for(int i=0;i<WriteHistoryB.size();i++){
	dto=WriteHistoryB.get(i);
	
%>

	<tr>		
		<td><%=dto.getB_title() %></td>
		<td><%=dto.getB_text() %></td>
		<td><%=dto.getB_category() %></td>
		<td><%=dto.getB_img() %>
		<td><%=dto.getB_view() %>	
		
	</tr>

<%
}
%>
	</table>
</section>
	<!-- ***** 판매내역조회 끝 ***** -->
	       
             </div>
        </div>
    </div>     <!-- ***** 푸터 시작 ***** -->
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