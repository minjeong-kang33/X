<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header class="header-area header-sticky">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<nav class="main-nav">
					<!-- ***** 로고 시작 ***** -->
					<a href="index.html" class="logo"> <img
						src="../assets/images/otzang_logo_top.png" height="60px">
					</a>
					<!-- ***** 로고 끝 ***** -->
					<!-- ***** 상단 바 메뉴 시작 ***** -->
					<ul class="nav">
						<li><a href="#" class="active">홈</a></li>
						<li class="submenu"><a>회원관리</a>
							<ul>
								<li><a href="../admin/adUserList.jsp">전체회원목록</a></li>
								<li><a href="../admin/adUserReportList.jsp">신고회원목록</a></li>
								<li><a href="../admin/adOutList.jsp">탈퇴회원목록</a></li>
							</ul></li>
						<li class="submenu"><a>게시글관리</a>
							<ul>
								<li><a href="../admin/adSellList.jsp">판매글목록</a></li>
								<li><a href="../admin/adBuyList.jsp">구매글목록</a></li>
							</ul></li>
					</ul>
					<!-- ***** 상단 바 메뉴 끝 ***** -->
				</nav>
			</div>
		</div>
	</div>
</header>

