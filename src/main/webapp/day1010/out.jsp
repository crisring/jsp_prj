<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="out 내장객체의 사용"%>
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
		String msg = "오늘은 목요일 입니다.";
		out.print("<strong>"); // 소스보기 시에 줄 변경이 x
		out.print(msg);
		out.println("</strong>");

		out.println("<strong>"); // 소스보기 시에 줄 변경이 O
		out.println(msg);
		out.println("</strong>");

		for (int i = 1; i < 7; i++) {

			out.print("<h");
			out.print(i);
			out.print(">");
			out.print(msg);
			out.print("</h");
			out.print(i);
			out.print(">");

		} // end for

		String[] url = { "https://www.google.co.kr/", "https://www.naver.com/", "https://www.daum.net/" };
		String[] urlText = { "구글", "네이버", "다음" };
		StringBuilder linkTxt = new StringBuilder();

		// a태그로 사이트 누르면 이동하기
		out.println("사이트 이동하기<br>");

		for (int i = 0; i < url.length; i++) {
			linkTxt.append("<a href=").append(url[i]).append("/>").append(urlText[i]).append("로 이동하기").append("\n<br>");
		}

		out.println(linkTxt);
		%>
	</div>
</body>
</html>