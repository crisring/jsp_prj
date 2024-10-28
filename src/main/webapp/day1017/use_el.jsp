<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="EL의 사용" isELIgnored="false"%>
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
		<form action="use_el.jsp">
			<h2>web parameter 출력</h2>



			<input type="text" name="name" placeholder="이름"> <br> <input
				type="text" name="addr" placeholder="주소"> <br> <label>취미</label><br>
			<input type="checkbox" name="hobby" value="등산" />등산 <br> <input
				type="checkbox" name="hobby" value="등산" />낚시 <br> <input
				type="checkbox" name="hobby" value="등산" />독서 <br> <input
				type="checkbox" name="hobby" value="등산" />운동 <br>
			<button type="submit" class="btn btn-info">전송</button>

			<div>
				<!-- empty 비교 -->
				입력값 <br> 이름 : ${empty param.name ? "이름입력":param.name } <br>
				주소 : ${empty param.addr ? "주소입력":param.addr } <br>
				<!-- 배열은 선택된 객수만큼 반복 -->
				취미 : ${empty paramValues.hobby ? "주소입력":paramValues.hobby } <br>
			</div>
			<br>

			<div>
				<label>닉네임</label> ${empty param.nick ? "아래 링크를 클릭해주세요" :  param.nick }<br>
				<label>나이 </label>${param.age } <br>
			</div>


			<div>
				<!-- nick이 없다면 아래 링크를 클릭해주세요를 웹 브라우저로 출력하고 nick이 존재한다면 nick과 age에 설정된 값을 웹 브라우저에 출력  -->
				<!-- 요청 링크를 클릭했을때 nick의 값으로 test, age를 20으로 설정하여 현재 페이지로 요청하는 URL과 Query String을 작성 -->
				<a href="use_el.jsp?nick=test&age=20">요청</a>
			</div>

			<div>
				<!-- 변수 직접 접근 불가 -->
				<%
				String msg = "오늘은 목요일";
				%>
				${msg}
			</div>


		</form>
	</div>
</body>
</html>