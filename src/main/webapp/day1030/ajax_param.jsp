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
		$("#btn").click(function() {
			chkNull();
		}); // click
	}); // document.ready

	function chkNull() {
		var name = $("#name").val();
		var age = $("#age").val();

		if (name.trim() == "") {
			alert("이름은 필수 입력입니다!")
			$("#name").focus();
			return;
		}

		if (age.trim() == "") {
			alert("나이는 필수 입력입니다!")
			$("#age").focus();
			return;
		}

		// 서버로 보낼 데이터 생성
		// queryString 작성
		// var param = "name=" + name + "&age=" + age;

		// JSONObject로 작성 (이름이 parameter명 {이름 : 값})
		var param = {
			name : name,
			age : age
		};

		$.ajax({
			url : "test_param.jsp",
			type : "get",
			data : param,
			dataType : "json",
			error : function(xhr) {
				console.log(xhr.status + "에러 발생");
			},
			success : function(jsonObj) {
				var inter = jsonObj.interests;
				var msg = jsonObj.msg;

				$("#output").html(msg + "<br>" + inter);
				$("#txtOut").val(inter);
			}

		});
	}// chkNUll
</script>
</head>
<body>
	<div id="wrap">
		<div id="output"
			style="width: 800px; height: 80px; border: 1px solid #000"></div>
		<div>
			<input type="text" id="txtOut" />
		</div>
		<label for="name">이름</label> <input type="text" name="name" id="name" />
		<label for="age">나이</label> <input type="text" name="age" id="age" />
		<input type="button" value="전송" class="btn btn-success" id="btn" />


	</div>
</body>
</html>