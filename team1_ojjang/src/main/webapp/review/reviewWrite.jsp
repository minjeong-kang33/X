<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">
    <link rel="stylesheet" href="../assets/css/templatemo-hexashop.css">
    <link rel="stylesheet" href="../assets/css/owl-carousel.css">
    <link rel="stylesheet" href="../assets/css/lightbox.css"> 
   <link href="../assets/css/reviewWrite.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>중고 의류거래: 옺장 - 리뷰작성</title>

   <script type="text/javascript">     

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
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
					<!--  게시판제목 -->
						<h2>후기 작성</h2>
						<span>review Write</span>
					</div>
					
					<!--  리뷰작성 입력상자 시작 -->
					<form id="review" action="reviewWritePro.jsp" method="post" class="reviewWriteBox">
						<table>
							<tr>
								<th> 제목 </th>
								<th><input type="text" id="RE_title" name="RE_title" class="RE_title" placeholder="제목을 입력하세요"></th>
							</tr>
							<tr>
								<th> 내용 </th>
								<th><textarea rows="10" cols="30" id="RE_text" class="RE_text" placeholder="내용을 입력하세요"></textarea></th>
							</tr>
							<tr>
								<th></th>
								<th>
								<div class="RE_checkbox">
							<input type="checkbox" id="checkbox-btn-1" name="RE_delivery"  value="배송이 빨라요">
								<label for="checkbox-btn-1" class="btn">배송이 빨라요</label>
							<input type="checkbox" id="checkbox-btn-2" name="RE_manner" value="친절해요">
								<label for="checkbox-btn-2" class="btn">친절해요</label>
							<input type="checkbox" id="checkbox-btn-3" name="RE_ProductStatus" value="상품이 설명과 같아요">
								<label for="checkbox-btn-3" class="btn">상품이 설명과 같아요</label><br>
							<input type="checkbox" id="checkbox-btn-4" name="RE_fast"  value="응답이 빨라요">
								<label for="checkbox-btn-4" class="btn">응답이 빨라요</label>
							<input type="checkbox" id="checkbox-btn-5" name="RE_time" value="약속시간을 잘 지켜요">
								<label for="checkbox-btn-5" class="btn">약속시간을 잘 지켜요</label>
								</div>
								</th>
							</tr>
						</table>
						<div class="btn">
							<input type="submit" value="등록"/>
							<input type="reset" value="초기화"/>
						</div>
					</form> 
					
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
   


</body>
</html>