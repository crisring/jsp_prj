<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="scope 생성 및 사용 범위 "%>
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
		<!-- 객체생성  -->
		<!-- scope : 값을 저장하고 사용하는 범위를 제공하는 객체 -->
		<jsp:useBean id="cVO" class="day1016.CounterVO" scope="session" />

		<!-- setter -->
		<jsp:setProperty property="cnt" name="cVO" value="1" />
		당신은 이 페이지에 <strong><jsp:getProperty property="cnt" name="cVO" />

			<%
			String cnt = String.valueOf(cVO.getCnt());
			%> </strong>번째 방문자입니다. <a href="usescope2.jsp">이동</a>

		<%-- 		<%
		RequestDispatcher rd = request.getRequestDispatcher("usescope2.jsp");
		rd.forward(request, response);
		%> --%>
	</div>
</body>
</html>