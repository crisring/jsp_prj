<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="cookies 읽기(request)"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://192.168.10.219/jsp_prj/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.219/jsp_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝-->

<style type="text/css">
</style>
<!-- jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

	}); // document.ready
</script>
</head>
<body>
	<div id="wrap">
		<%
		Cookie[] cookies = request.getCookies();
		boolean readFlag = false; // Initialize as false

		if (cookies != null) {

			String cookieName = "";
			String cookieValue = "";

			for (Cookie tempCookie : cookies) {
				cookieName = tempCookie.getName();

				if (!"JSESSIONID".equals(cookieName)) {
			cookieValue = tempCookie.getValue();
			readFlag = true; // Set to true if any cookie other than JSESSIONID is found
		%>
		쿠키명 :
		<%=cookieName%>, 쿠키 값 :
		<%=cookieValue%><br>
		<%
		}
		}
		}

		if (!readFlag) {
		%>
		<h2>쿠키가 존재하지 않습니다.</h2>
		쿠키<a href="add_cookie.jsp">심기</a>
		<%
		} else {

		%>쿠키<a href="remove_cookie.jsp">삭제</a>


		<%
		}
		%>



	</div>
</body>