<%@page import="day1016.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="useBean 표준 action tag"%>
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
	<div id="wrap"
		<%TestVO tVO = new TestVO();
// 2. scope 객체에 할당
pageContext.setAttribute("tVO", tVO);
// 3. setter method 호출
tVO.setName("김현우");
tVO.setMyAge(20);%>>
		이름 :
		<%=tVO.getName()%>
		, 나이 :
		<%=tVO.getMyAge()%>
		<br>

		<%
		// scope 객체에 저장된 값 얻기
		TestVO tVO2 = (TestVO) pageContext.getAttribute("tVO");
		%>

		이름 :
		<%=tVO2.getName()%>
		, 나이 :
		<%=tVO2.getMyAge()%><Br>

		<h2>useBean 표준 액션 사용</h2>
		<!-- 객체화 scope에 할당 -->
		<jsp:useBean id="tVO3" class="day1016.TestVO" scope="page"></jsp:useBean>

		<!-- setter 사용 -->
		<jsp:setProperty property="name" name="tVO3" value="이일환" />
		<jsp:setProperty property="myAge" name="tVO3" value="25" />

		이름 :
		<jsp:getProperty property="name" name="tVO3" />
		나이 :
		<jsp:getProperty property="myAge" name="tVO3" />

		<%
		tVO3.setName("일환");
		tVO3.setMyAge(30);
		%>


	</div>
</body>
</html>