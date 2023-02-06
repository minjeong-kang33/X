<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.buyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:setProperty name="buy" property="buytitle" />
<jsp:setProperty name="buy" property="buytext" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	// 로그인이랑 연결시 주석 해제
// 		String M_id = null;
// 		if (session.getAttribute("M_id") != null) {
// 			M_id = (String) session.getAttribute("M_id");
// 		}
// 		if (M_id == null){
// 			PrintWriter script = response.getWriter();
// 			script.println("<script>");
// 			script.println("alert('로그인을 하세요.')");
// 			script.println("location.href = '로그인.jsp'");
// 			// 로그인페이지로 이동
// 		}

		// 글 제목이나 내용을 입력하지않을 시 오류발생
		if (buy.getb_title() == null || buy.getb_text() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			buyDAO buyDAO = new buyDAO();
			int result = buyDAO.write(buy.getb_title(), M_id, buy.getb_text());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'buy.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>