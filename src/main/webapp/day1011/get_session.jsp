<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="세션에 설정된 값을 얻는 페이지"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 값 확인</title>
<link rel="shortcut icon"
	href="http://192.168.10.219/jsp_prj/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.219/jsp_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝 -->

<style type="text/css">
</style>
<!-- jQuery CDN 시작 -->
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
		try {
			String name = (String) session.getAttribute("name");
			Integer age = (Integer) session.getAttribute("age");

			session.setMaxInactiveInterval(1800); // 30분으로 세션 타임아웃 설정

			if (name == null || age == null) {
		%>
		<p>세션의 값이 존재하지 않습니다.</p>
		<form action="set_session.jsp">
			<label for="name">이름</label> <input type="text" name="name" id="name"><br>
			<label for="age">나이</label> <select name="age" id="age">
				<%
				for (int i = 20; i < 40; i++) {
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
				}
				%>
			</select>
			<button type="submit" class="btn btn-sm btn-primary">입력</button>
		</form>
		<%
		} else {
		%>
		<p>${ param.name }님의
			세션 정보가 존재합니다! (나이:
			${ param.age })
		</p>
		<%
		}
		} catch (NullPointerException e) {
		e.printStackTrace();
		}
		%>
	</div>
</body>
</html>
