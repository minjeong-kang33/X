<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
				
					<!-- ***** 로고 시작 ***** -->
					<a href="index.html" class="logo"> 
					<img src="../assets/images/otzang_logo_top.png" height="60px">
					</a>
					<!-- ***** 로고 끝 ***** -->
					
					<!-- ***** 상단 바 메뉴 시작 ***** -->
					<ul class="nav">
						<li><a href="#" class="active">홈</a></li>
						<li><a href="../sell/outer.jsp">아우터</a></li>
						<li><a href="../sell/shirts.jsp">상의</a></li>
						<li><a href="../sell/pants.jsp">하의</a></li>
						<li><a href="../sell/dress.jsp">원피스</a></li>
						<li><a href="../buy/buyList.jsp">삽니다</a></li>
						<!-- 로그인 안 한 경우는 마이페이지 말고 로그인 버튼 보이도록 -->
						<li class="submenu"><a>마이페이지</a>
							<ul>
								<li><a href="../Mypage/profile.jsp");">프로필</a></li>
								<li><a href="#">찜목록</a></li>
								<li><a href="#">거래내역</a></li>
								<li><a href="#">거래후기</a></li>
								<li><a href="#">로그아웃</a></li>
							</ul></li>
						<li class="submenu"><a href="#">고객센터</a>
							<ul>
								<li><a href="#">회사정보</a></li>
								<li><a href="#">QnA</a></li>
								<li><a href="#">또뭐있지</a></li>
							</ul></li>
						<li class="submenu"><a href="../login/loginForm">로그인</a>
							<ul>
								<li><a href="javascript:void(window.open('../chat/find.jsp', '판매자찾기','width=400, height=400'))">판매자찾기</a></li>
								<li><a href="javascript:void(window.open('../chat/Testbox.jsp', '메세지함','width=300, height=400'))">메세지함</a></li>
							</ul></li>	
								</ul>
					<!-- ***** 상단 바 메뉴 끝 ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>

