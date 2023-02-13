<%@page import="java.text.SimpleDateFormat"%>
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
    	img_icon[0].src = "heart.png"; 
    	img_icon[1].src = "fullheart.png"; 
    	
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
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	
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
					<td colspan="2" class="S_img"><img src="/img/sell/<%=dto.getS_img()%>" width=300px height=300px class="goodsImg"></td>
				</tr>
				<tr>
					<td colspan="2" class="S_title" ><%=dto.getS_title()%></td> <!-- 제목 -->
				</tr>
				<tr>
					<td class="price"><%=dto.getS_price()%>원</td> <td align="right" class="like_id"><input type="image" name="button"  class="heart" src="heart.png" onclick="hartToggle()">
				</tr>
				<%-- <tr>
					<td class="S_sido1"><%=dto.getS_sido1()%></td> <td class="S_gugun1"><%=dto.getS_gugun1()%></td> <!-- 구군 -->
				</tr> --%>
				<tr>
					<td colspan="2" class="S_createdate" ><%= dateFormat.format(dto.getS_createdate())%></td> <!-- 게시글 생성일자 -->
				</tr>
				<tr>
					<td colspan="2" class="S_send"> <% if(dto.getS_send1()!=null&&dto.getS_send2()!=null){%> <%= "<b>택배거래</b>, <b>직거래</b>"%><%}
						else if(dto.getS_send1()!=null){%> <%= "<b>택배거래</b>"%><%}
						else if(dto.getS_send2()!=null){%> <%= "<b>직거래</b>"%><%}%> </td> <!-- 선호거래유형 -->
				</tr>
				<tr>
					<td colspan="2"> <% if(dto.getS_send2()!=null){%> <img src="location_icon.png" class="location"><%= dto.getS_sido1()%> <%= dto.getS_gugun1()%><%} else { %>　<%}%> </td>
					<!-- else에 안보이는 공백문자있어요 지우지마세요 지우면 정렬깨짐 -->
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
				<!--  페이지 번호  -->
				<%
					int pageBlock = 10;
				int startPage=(currentPage-1)/pageBlock*pageBlock+1;
				int endPage=startPage+pageBlock-1;
				int count = dao.getSellBoardCount();
				int pageCount=count/pageSize+(count%pageSize==0?0:1);
				if(endPage > pageCount){
					endPage = pageCount;
				}
				
				if(startPage>pageBlock){
					%>
					<a href="reviewList.jsp?pageNum=<%=startPage-pageBlock%>"> [10페이지 이전]</a>
					<%
				}
				
				for(int i=startPage;i<=endPage;i++){
					%>
					<a href="reviewList.jsp?pageNum=<%=i%>"><%=i%></a>
					<%
				}
				
				%>
					</div>
				</div>
			</div>
		</div>
<!-- 	글 작성 버튼을 오른쪽 아래에 고정 -->
	<button type="button" class="btn btn-dark" onclick="location.href='sellInsertForm.jsp'" style="float:right">글쓰기</button>
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