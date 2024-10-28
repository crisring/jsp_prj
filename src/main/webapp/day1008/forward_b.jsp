<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://192.168.10.210/jsp_prj/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.210/jsp_prj/common/css/main_20240911.css">
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

<!-- jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>
</head>
<body>
	<div id="wrap">

		<%
		// name 속성 가져오기
		String name = (String) request.getAttribute("name");

		// data 속성 가져오기 및 형변환
		List<String> list = (List<String>) request.getAttribute("data");

		String paramSelectNum = request.getParameter("selectNum");
		int selectNum = paramSelectNum == null ? 0 : Integer.parseInt(paramSelectNum);

		// null 체크
		if (name != null && list != null) {
		%>

		<h3><%=name%></h3>
		<ul class="nav nav-underline">
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<li class="nav-item"><a
				class="nav-link <%=i == selectNum ? "active" : ""%>"
				aria-current="page" href="forward_a.jsp?selectNum=<%=i%>"> <%=list.get(i)%>
			</a></li>
			<%
			}
			%>
		</ul>

		<%
		} else {
		%>
		<p>데이터가 없습니다.</p>
		<%
		}
		%>

	</div>
</body>
</html>