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

String category = "엥";
if(dto.getS_category().equals("1")){
	category = "아우터";
}
if(dto.getS_category().equals("2")){
	category = "상의";
}
if(dto.getS_category().equals("3")){
	category = "하의";
}
if(dto.getS_category().equals("4")){
	category = "원피스";
}
%>
<div class="container2">
	<div class="row">
	<!--보내지는 내용 숨겨지도록(post) 작성한 글을 writeAction으로 보냄 -->
	<table class = "table table-striped" style="text-align:center; border:1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="3"  style="background-color: #eeeeee; text-align:center">팝니다</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="width:20%;">글제목</td>
				<td colspan="2"><%= dto.getS_title()%></td>
			</tr>
			<tr>
				<td style="width:20%;">카테고리 - </td>
				<td colspan="2"><%= category %></td>
				<td style="width:20%;">거래유형 - </td>
				<td colspan="2"><%=	1이면 직거래 2면 택배거래?%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="2"> <%= dto.getM_id() %></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td colspan="2"> <%= dto.getS_createdate()%> </td>
			</tr>
			<tr>
				<td>글내용</td>
				<td colspan="2"  style="min-height: 200px; text-align:left;"> <%= dto.getS_text() %></td>
			<tr><td colspan="2">
</tr>
</tbody>		
</table>
<!-- 댓글시작 -->
<div class="comment">
<form method="post" action="commentAction.jsp?S_num=<%=S_num%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeeee; text-align: center;">댓글</th>
						</tr>
					</thead>
					<tbody>
					
						<%
						int pageNumber=1;
						// pageNumber는 URL에서 가져온다.
						if(request.getParameter("pageNumber")!=null){
							pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
						}
							CommentDAO comment=new CommentDAO();
							ArrayList<CommentDTO> List=comment.getList(S_num, pageNumber);
							for(int i=List.size()-1 ; i>=0 ; i--){
						%>

						<tr>
							<td style="text-align: left;"><%=List.get(i).getCo_text() %></td>
							<td style="text-align: right;"><%=List.get(i).getM_id() %>
							<a href="javascript:CoUpdate()" class="btn">수정</a>
							<a href="commentdeleteAction.jsp?S_num=<%=S_num %>&Co_num=<%=List.get(i).getCo_num() %>" class="btn ">삭제</a>
							</td> 
						</tr>
		
						<%
								}
						%>
			<td>
				<textarea type="text" class="form-control"
				placeholder="댓글을 입력하세요." name="Co_text" maxlength="2048"></textarea>
			</td>

					
					</tbody>
				</table>
				<input type="submit" class="btn" value="댓글입력">
			</form>
			</div>
<!-- 댓글끝 -->
</div>
			<div class="btn-naran">
<%
if(M_id != null){
	// 세션값=id와 글쓴이가 일치해야만 글수정, 글삭제 표시
	if(M_id.equals(dto.getM_id())){
		%>
<input type="button" class="btn btn-dark" value="글수정" onclick="location.href='sellEditForm.jsp?num=<%=dto.getS_num() %>'">
<input type="button" class="btn btn-dark" value="글삭제" onclick="location.href='SellDelete.jsp?num=<%=dto.getS_num() %>'"> 
		<%		
	}
}
%>
	<button type="button" class="btn btn-dark" onclick="location.href='sellList.jsp'" style="float:right">글목록</button>
</div>
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