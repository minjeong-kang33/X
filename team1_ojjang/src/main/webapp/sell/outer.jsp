<%@page import="sell.SellDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sell.SellDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   <link href="../assets/css/sell.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>중고 의류거래: 옺장</title>

   <script type="text/javascript">     
   	 <%-- 토글 --%>
    	var set_state = true;
    	var img_icon = new Array(); 
    	img_icon[0] = new Image(); 
    	img_icon[1] = new Image();
    	img_icon[0].src = "hart.png"; 
    	img_icon[1].src = "fullhart.png"; 
    	
    function hartToggle(){
    	document.all.icon_btn.src = (set_state ? img_icon[0].src : img_icon[1].src);
    	   if(set_state){ 
    		   set_state = false;
    	   } else {
    	       set_state = true;
    	   }
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

	<section class="section" id="products">


		<!-- 게시판 제목  -->
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>아우터</h2>
						<span>outer</span>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="item">
						<div class="down-content">
<!-- 게시판 내용 여기부터 넣으세요  -->
						
							<!-- 상품게시글 table  -->
	<%
	SellDAO dao =new SellDAO();
	
	int pageSize = 9;
	
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum==null){
		pageNum="1";
	}
	
	int currentPage=Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	
	int endRow = startRow + pageSize -1;
	
	ArrayList<SellDTO> sellList = dao.getsellList(startRow, pageSize);
			
	%>						
<table>
	<tr> <!--  테이블................1칸 -->
	<%
	for(int i=0; i<sellList.size();i++){
		SellDTO dto = sellList.get(i);
	
	%>
		<td>
			<table class="item-table">
				<tr>
					<td colspan="2" class="S_img"><img src="../assets/images/sample_img.jpg" width=300px height=300px class="goodsImg"></td>
				</tr>
				<tr>
					<td colspan="2" class="S_title" ><%=dto.getS_title()%></td> <!-- 제목 -->
				</tr>
				<tr>
					<td class="price"><%=dto.getS_price()%></td> <td class="like_id"><input type="image" name="button"  class="hart" src="hart.png" onclick="hartToggle()">
				</tr>
				<tr>
					<td class="S_sido1"><%=dto.getS_sido1()%></td> <td class="S_gugun1"><%=dto.getS_gugun1()%></td> <!-- 구군 -->
				</tr>
				<tr>
					<td colspan="2" class="S_createdate" ><%=dto.getS_createdate()%></td> <!-- 게시글 생성일자 -->
				</tr>
				<tr>
					<td colspan="2" class="S_send"> <%=dto.getS_send()%> </td> <!-- 선호거래유형 -->
				</tr>
			</table>
		</td>		
			<%
			if((i+1) %3 ==0){
			%>
				</tr>
				<tr>
				
			<%
			 }
			%>
	<%
	 }
	%>	
	
</tr>
</table>
		



							
<!-- 게시판 내용 여기 넘어가면 안됨.  -->							
					</div>
					</div>
				</div>
			</div>
		</div>
	</section>


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
    
<!-- JSP -->    

    
</body>
</html>