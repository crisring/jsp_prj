<%@page import="day1018.DataVO"%>
<%@page import="java.util.List"%>
<%@page import="day1018.DataDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
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
		<%
		DataDAO dDAO = new DataDAO();
		List<DataVO> list = dDAO.selectData();

		// scope객체에 전달
		pageContext.setAttribute("list", list);
		%>
		<table class="table table-hover">
			<thead>
				<tr>
					<td style="width: 80px">번호</td>
					<td style="width: 120px">이미지</td>
					<td style="width: 200px">이름</td>
					<td style="width: 400px">설명</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">이미지가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dataVO" items="${list}" varStatus="ind">
					<tr>
						<td><c:out value="${ ind.count }"></c:out></td>
						<td><img src="../common/images/	${dataVO.img}"
							style="width: 110px; height: 80px"></td>
						<td><a href="detail.jsp?num=${dataVO.itemNum }"><c:out
									value="${dataVO.name }"></c:out></a></td>
						<td><c:out value="${dataVO.info }"></c:out></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
</body>
</html>