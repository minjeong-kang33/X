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
    <link rel="stylesheet" href="../assets/cs/bootstrap.css">
	<link rel="stylesheet" href="../assets/cs/custom.css">
<meta charset="UTF-8">
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
    
	<div class="content1">
    <div class="container bootstrap snippet">
        <div class="row">
            <div class="col-xs-12">
                <div class="portlet portlet-default">
                    <div class="portlet-heading">
                        <div class="portlet-title">
                            <h4><i class="fa fa-circle text-green"></i>실시간 채팅창</h4>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div id="chat" class="panel-collapse collapse in">
                        <div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 400px;">
                        </div>
                        <div class="portlet-footer">
                            <div class="row" style="height: 90px;">
                                <div class="form-group col-xs-10">
                                    <textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
                                </div>
                                <div class="form-group col-xs-2">
                                    <button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="alert alert-success" id="successMessage" style="display: none;">
        <strong>메시지 전송에 성공했습니다.</strong>
    </div>
        <div class="alert alert-danger" id="dangerMessage" style="display: none;">
        <strong>이름과 내용을 모두 입력해주세요.</strong>
        
    </div>
        <div class="alert alert-warning" id="warningMessage" style="display: none;">
        <strong>데이터베이스 오류가 발생했습니다.</strong>
    </div>
    <%
        String messageContent = null;
        if (session.getAttribute("messageContent") != null) {
        	messageContent = (String) session.getAttribute("messageContent");
        }
        String messageType = null;
        if (session.getAttribute("messageType") != null) {
        	messageType = (String) session.getAttribute("messageType");
        }
        if (messageContent != null) {
    %>
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
                    <div class="modal-header panel-heading">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title">
                            <%= messageType %>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <%= messageContent %>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
 </div>
    <script>
        $('#messageModal').modal("show");
    </script>
    <%     	
        session.removeAttribute("messageContent");
        session.removeAttribute("messageType");
        }
    %>    
    <script type="text/javascript">
	    $(document).ready(function() {
	    	getUnread();
	        chatListFunction('0');
	        getInfiniteChat();
	        getInfiniteUnread();
	    });
    </script>
  


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