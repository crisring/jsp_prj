<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="JSTL 사용"%>
<!-- 지시자 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<!-- 2. tag lib에서 제공하는 태그를 사용  -->
		<!-- 변수 선언 -->
		<c:set var="msg" value="오늘은 목요일 입니다." />
		<c:set var="day" value="17" />


		<!-- 출력 => EL -->
		${ msg } <Br>
		<c:out value="msg"></c:out>
		<br>
		<c:out value="${ msg }" />
		<c:out value="${ day }" />
		일<br>
		<c:out value="${ day+1 }" />
		일<br>

		<!-- 변수 삭제 -->
		<h2>변수 삭제 후 출력</h2>
		<!-- 삭제 후 변수를 출력하면 아무것도 출력되지 않는다. -->
		<c:remove var="msg" />
		msg :
		<c:out value="${ msg }"></c:out>
		<br> day :
		<c:out value="${ day }"></c:out>
		<br>

		<h2>태그 출력</h2>
		<c:set var="tag" value="오늘은<strong>목요일</strong>입니다."></c:set>
		EL : ${ tag }<br>
		<c:out value="${ tag }"></c:out>
		<Br>
		<!-- 서식 적용 불가 -->
		<c:out value="${ tag }" escapeXml="false"></c:out>
		<br>
		<!-- 서식 적용 가능 -->

		<c:set var="name" value="이인혁"></c:set>
		<input type="checkbox" value="${ name }">
		<c:out value="${ name }"></c:out>
	</div>
</body>
</html>