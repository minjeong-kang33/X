<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>main에 옮기기</title>
   <link rel="stylesheet" href="css/style.css">
   <script>
function setCookie( name, value, expiredays ) {
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function getCookie( name ) {
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length ) {
	var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
		if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
		endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}
	x = document.cookie.indexOf( " ", x ) + 1;
	if ( x == 0 )
	break;
	}
	return "";
}

if ( getCookie( "popup1" ) != "done" ) {
	noticeWindow =
	window.open('popup1.jsp','popup1','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=300');
	noticeWindow.opener = self;
}

if ( getCookie( "popup2" ) != "done" ) {
	noticeWindow =
	window.open('popup2.jsp','popup2','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=310,height=510,top=90,left=200');
	noticeWindow.opener = self;
}

if ( getCookie( "popup3" ) != "done" ) {
	noticeWindow =
	window.open('popup3.jsp','popup3','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=310,height=510,top=100,left=400');
	noticeWindow.opener = self;
}
</script>
</head>
<body>

</body>
</html>