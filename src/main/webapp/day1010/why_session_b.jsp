<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="이전 페이지에서 사용했던 값들을 현재 페이지에서 사용"%>
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
		<div style="padding-top: 30px;">
			<%
			String name = request.getParameter("name");
			%>

			<button type="button" class="btn btn-primary position-relative">
				<%=name%>
				<span
					class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
					99+ <span class="visually-hidden">지략</span>
				</span>
			</button>
			<br> <a href="why_session_c.jsp">다음페이지로 이동</a> <br> 
			<!--  보안에 문제가 있음-->
			<%-- <a href="why_session_c.jsp?name<%=name%>">다음페이지로 이동</a> --%>
				
		</div>
	</div>
</body>
</html>