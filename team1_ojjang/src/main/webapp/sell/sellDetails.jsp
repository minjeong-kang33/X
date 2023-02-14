<%@page import="java.text.SimpleDateFormat"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="sell.SellDAO" %>
<%@ page import="sell.SellDTO" %>
<%@ page import="comment.CommentDTO" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>중고의류거래: 옺장</title>
   <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="../assets/css/owl-carousel.css">
    <link rel="stylesheet" href="../assets/css/lightbox.css"> 
   <link href="../assets/css/buyDetails.css" rel="stylesheet" type="text/css">
    <link href="../assets/css/buy.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>중고 의류거래: 옺장</title>
<script type="text/javascript">
function fun1(M_id){
	window.open("../report/reportWrite.jsp?R_id="+M_id,"pop","width=520,height=340");
}

</script>
</head>
    <body>
    <!-- ***** 로딩 일단 지금은 비어있음***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    
    <!-- ***** 헤더 ***** -->
  <jsp:include page="../top.jsp" />
    <!-- ***** 헤더 끝 ***** -->
    
<%
int S_num = Integer.parseInt(request.getParameter("S_num"));
SellDAO dao = new SellDAO();
SellDTO dto = dao.getSellBoard(S_num);
String M_id = (String)session.getAttribute("M_id");

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd hh:mm");
// String category1;

// if(dto.getS_category().equals("1")){
// 	category1 = "아우터";
// }
// else if(dto.getS_category().equals("2")){
// 	category1 = "상의";
// }
// else if(dto.getS_category().equals("3")){
// 	category1 = "하의";
// }
// else if(dto.getS_category().equals("4")){
// 	category1 = "원피스";
// }

// String like1;

// if(dto.getS_like() == 1){
// 	like1 = "직거래";
// }
// else if(dto.getS_like() == 2){
// 	like1 = "택배";
// }
%>

	<section class="section" id="products"> 
		<!-- 게시판 제목  -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="aa"></div>
					<div class="section-heading">
						<h2 style="margin-top: 180px">팝니다</h2>
						<span>sell</span>
					</div>
	<!--보내지는 내용 숨겨지도록(post) 작성한 글을 writeAction으로 보냄 --> 
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
			<!--	<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center">팝니다</th>
					</tr>
				</thead>
				<tbody>  -->
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%=dto.getS_title()%></td>
					</tr>
					<tr>

						<td style="width: 20%;">거래유형</td>
						<td colspan="2">
							<%
							if (dto.getS_like() == 1) {
								out.println("직거래");
							} else if (dto.getS_like() == 2) {
								out.println("택배거래");
							}
							%>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=dto.getM_id()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=dateFormat.format(dto.getS_createdate())%>
						</td>
					</tr>
					<tr>
						<td>글내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">
							<%= dto.getS_text() %></td>
					<tr>
						<td colspan="2">
					</tr>
				</tbody>
			</table>
				</div>
			</div>
			</div>
</section>
<!-- 댓글끝 -->
</div>
         <div class="btn-naran">
<%
if(M_id != null){
   // 세션값=id와 글쓴이가 일치해야만 글수정, 글삭제 표시
   if(M_id.equals(dto.getM_id())){
      %>
<input type="button" class="btn btn-dark" value="글수정" onclick="location.href='sellEditForm.jsp?S_num=<%=dto.getS_num() %>'">
<input type="button" class="btn btn-dark" value="글삭제" onclick="location.href='sellDeletePro.jsp?S_num=<%=dto.getS_num() %>'"> 
      <%      
   }
}
%>
   <button type="button" class="btn btn-dark" onclick="fun1('<%=dto.getM_id()%>')" style="float:right"> 신고하기</button>
   <button type="button" class="btn btn-dark" onclick="location.href='sellList.jsp'" style="float:right">글목록</button>
</div>

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