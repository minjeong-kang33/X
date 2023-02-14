<%@page import="sell.SellDTO"%>
<%@page import="admin.MypageDAO"%>
<%@page import="like.LikeDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likePro</title>
</head>
<body>
<h1>likePro.jsp</h1>
<%

request.setCharacterEncoding("utf-8");
// String M_id=(String)session.getAttribute("M_id");
int S_num=Integer.parseInt(request.getParameter("S_num"));
String M_id=request.getParameter("M_id");

MypageDAO dao=new MypageDAO();

LikeDTO getLikeDto=dao.getLike(M_id, S_num);


if(getLikeDto==null){
	dao.insertlike(S_num, M_id);
	%>
    <script type="text/javascript">
		alert("찜완료");
    </script>
<%
} else{
%>
    <script type="text/javascript">
		alert("이미 찜한 상품입니다.");
    </script>
<%
}
%>



</body>
</html>