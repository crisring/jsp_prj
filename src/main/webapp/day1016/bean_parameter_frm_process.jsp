<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="web parameter을 useBean 표준액션을 사용하여 VO로 손쉽게 받기"%>
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
		request.setCharacterEncoding("UTF-8");
		%>

		<!-- 객체 생성 -->
		<jsp:useBean id="fcVO" class="day1016.FormControlVO" scope="page"></jsp:useBean>
		<!-- setter method 호출 (* 설정시 web parameter명과 VO의 인스턴스 변수명이 일치하는 setter method를 자동으로 호출해준다.) -->
		<jsp:setProperty property="*" name="fcVO" />

		<h2>입력값</h2>
		<ul>
			<li>이름 : <jsp:getProperty property="name" name="fcVO" /></li>
			<li>나이 : <jsp:getProperty property="age" name="fcVO" /></li>
			<li>성별 : <jsp:getProperty property="gender" name="fcVO" /></li>
			<li>취미 : <%-- <jsp:getProperty property="hobby" name="fcVO" /> --%>
				<%
				String[] hobby = fcVO.getHobby();

				// 유효성 검증
				if (hobby == null) {
					out.println("<strong>선택한 취미가 없습니다!.</strong");
				} else {
					for (String temp : hobby) {
						out.print(temp);
						out.println("<br>");

					}

				}
				%>

			</li>





		</ul>

	</div>
</body>
</html>