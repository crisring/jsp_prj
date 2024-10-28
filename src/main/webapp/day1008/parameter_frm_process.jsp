<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="HTML Form Control에 입력값을 받는 일"%>
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

		alert("<%=request.getMethod()%>
	방식의 요청")

	}); // document.ready
</script>
</head>
<body>
	<div id="wrap">
		<%
		String method = request.getMethod();
		%>
		<h2><%=method%>방식의 요청
		</h2>
		<%
		// POST방식일때만 동작 : 모든 charset을 변환
		request.setCharacterEncoding("UTF-8");

		String text = request.getParameter("text");
		String hid = request.getParameter("hid");
		String password = request.getParameter("password");

		/* 		// post방식일때 한글변환 = 유효성 검증
				if ("POST".equals(method)) {
			// String class를 사용한 변환 (문자열을 byte[]로 쪼개서 인코딩 수행)
			text = new String(text.getBytes("8859_1"), "UTF-8");
			// URLEncoder, URLDecoder
			hid = URLDecoder.decode(URLEncoder.encode(hid, "8859_1"), "UTF-8");
				} */
		%>
		<ul>
			<li>입력 값</li>
			<!-- 이름이 유일한 web paramether 받기 -->
			<li>text : <%=text%></li>
			<li>password : <%=password%></li>
			<li>checkbox : <%=request.getParameter("chk")%></li>
			<li>hidden : <%=hid%></li>
			<li>sel : <%=request.getParameter("sel")%></li>
			<li>ta : <%=request.getParameter("ta")%></li>

		</ul>
		<input type="text" value="<%=text%>">
	</div>
</body>
</html>