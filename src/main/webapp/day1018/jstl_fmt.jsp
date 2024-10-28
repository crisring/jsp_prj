<%@page import="day1018.ProductVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		int num = 20141018;
		pageContext.setAttribute("num", num);

		Date date = new Date();
		pageContext.setAttribute("date", date);

		ProductVO pVO = new ProductVO(1241, "img2.jpg", 1500000, new Date());
		pageContext.setAttribute("pVO", pVO);
		%>

		<c:out value="${ num }"></c:out>
		<br> 0패턴 :
		<fmt:formatNumber value="${ num }" pattern="0,000,000,000"></fmt:formatNumber>
		<br> #패턴 :
		<fmt:formatNumber value="${ num }" pattern="#,###,###,###"></fmt:formatNumber>
		<br>
	</div>

	<Div>
		<fmt:formatDate value="${ date }" pattern="yyyy-MM-dd" />
	</Div>
	<br>
	<Div>
		<img src="../common/images/${ pVO.getImg() }">
		<DIV>
			가격 :
			<fmt:formatNumber value="${ pVO.getPrice() }" pattern="#,###,###,###"></fmt:formatNumber>
			<bR> 발행일 :
			<fmt:formatDate value="${ pVO.getDate() }" pattern="MM-dd-yyyy" />
		</Div>
	</Div>
</body>
</html>