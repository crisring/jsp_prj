<%@page import="day1001.ImgVO"%>
<%@page import="java.util.List"%>
<%@page import="day1001.DataProcess"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="scriptlet과 expression 연습"%>



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
		$("#date").click(function() {
			printDate();
		});
	});//ready

	function printDate() {
		let year = $("#year").val();
		let month = $("#month").val();
		let day = $("#day").val();
		let output = "오늘은 " + year + "년 " + month + "월 " + day + "일 입니다.";

		$("#output").html(output);
	}
</script>
</head>
<body>
	<div id="wrap">
		<div>
			<select id="year">
				<%
				Calendar cal = Calendar.getInstance();
				int nowYear = cal.get(Calendar.YEAR);

				for (int i = nowYear; i >= 1950; i--) {
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
				}
				%>
			</select>년 <select id="month">
				<%
				LocalDate ld = LocalDate.now();
				int month = ld.getMonthValue() + 2;
				int nowMonth = ld.getMonthValue();

				for (int i = 1; i <= month; i++) {
					if (i == nowMonth) {
				%>
				<option value="<%=nowMonth%>" selected="selected"><%=nowMonth%></option>
				<%
				}
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
				}
				%>
			</select>월 <select id="day">
				<%
				int lastday = cal.getInstance().getActualMaximum(cal.DATE);
				int nowDay = cal.get(Calendar.DAY_OF_MONTH);
				for (int i = 1; i <= lastday; i++) {
				%>
				<option value="<%=i%>" <%=i == nowDay ? "selected='selected'" : ""%>><%=i%>
				</option>
				<%
				}
				%>
			</select>일 <input type="button" value="날짜얻기" id="date"
				class="btn btn-primary btn-sm">
			<div id="output" style="height: 40px"></div>

		</div>
		<div>
			<%
			for (int i = 1; i < 7; i++) {
			%>
			<img src="http://localhost/jsp_prj/day1001/images/dice_<%=i%>.png">
			<%
			}
			%>
		</div>
		<div style="width: 700px">
			<%
			String[] names = { "김지훈", "김현우", "이일환", "이인혁", "황찬욱" };
			%>
			<table class="table table-hover">
				<tr>
					<td style="width: 90px">이름</td>
					<td style="width: 610px">점수</td>
				</tr>

				<%
				for (int i = 0; i < names.length; i++) {
				%>
				<tr>
					<td><%=names[i]%></td>
					<td>
						<%
						for (int j = 0; j < 11; j++) {
						%> <input type="radio" name="score_<%=i%>" value="score_<%=i%>"
						<%=j == 0 ? "checked='checked'" : ""%>><%=j%> <%
 }
 %>
					</td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<%
		// List에 저장된 이미지와 설명을 Card로 출력
		DataProcess dp = new DataProcess();
		List<ImgVO> list = dp.searchData();

		if (list.isEmpty()) {
		%>
		<marque>로딩된 이미지가 없습니다.</marque>
		<%
		} // end if

		for (ImgVO iVO : list) {
		%><div class="card" style="width: 18rem; float: left;">
			<img
				src="http://192.168.10.219/jsp_prj/day1001/images/<%=iVO.getImg()%>"
				class="card-img-top" alt="">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text"><%=iVO.getInfo().length() > 50 ? iVO.getInfo().substring(0, 50) + "--" : ""%></p>
			</div>
		</div>
		<%
		}
		%>


	</div>
</body>
</html>