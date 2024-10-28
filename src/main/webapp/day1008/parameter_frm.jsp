<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="사용자가 입력하는 폼"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://192.168.10.225/jsp_prj/common/images/favicon.ico" />
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

		$("#btn").click(function() {
			// HTML Form Control의 값을 전달하려면 submit() 호출해야한다.
			$("#frmGet").submit();

		});

		$("#btnPost").click(function() {
			// HTML Form Control의 값을 전달하려면 submit() 호출해야한다.
			$("#frmPost").submit();
		});

	});//ready
</script>
</head>
<body>
	<div id="wrap">
		<h2>GET방식 HTML Form Control 값 전송</h2>
		<form name="frmGet" id="frmGet" action="parameter_frm_process.jsp"
			method="GET">
			<table>
				<tr>
					<td><label for="text">text</label></td>
					<td><input type="text" name="text" id="text" class="inputBox"
						style="width: 150px" /></td>
				</tr>
				<tr>
					<td><label for="pass">password</label></td>
					<td><input type="password" name="pass" id="pass"
						class="inputBox" style="width: 150px" /></td>
				</tr>
				<tr>
					<td><label for="chk">checkbox</label></td>
					<td><input type="checkbox" name="chk" id="chk" /></td>
				</tr>
				<tr>
					<td><label>hidden</label></td>
					<td><input type="hidden" name="hid" id="hid" value="숨김값" /></td>
				</tr>
				<tr>
					<td><label for="select">select</label></td>
					<td><select name="sel" id="select" class="inputBox"
						style="width: 150px">
							<option value="자바">Java SE</option>
							<option value="오라클">Oracle DBMS</option>
							<option value="JDBC">JDBC</option>
							<option value="HTML">HTML5</option>
							<option value="CSS">CSS3</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="textarea">textarea</label></td>
					<td><textarea name="ta" id="ta" class="inputBox"
							style="width: 300px; height: 100px"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="값 전송"
						class="btnMy" id="btn" /></td>
				</tr>
			</table>
		</form>

		<h2>POST방식 HTML Form Control 값 전송</h2>
		<form name="frmPost" id="frmPost" action="parameter_frm_process.jsp"
			method="POST">
			<table>
				<tr>
					<td><label for="text">text</label></td>
					<td><input type="text" name="text" id="text" class="inputBox"
						style="width: 150px" /></td>
				</tr>
				<tr>
					<td><label for="pass">password</label></td>
					<td><input type="password" name="pass" id="pass"
						class="inputBox" style="width: 150px" /></td>
				</tr>
				<tr>
					<td><label for="chk">checkbox</label></td>
					<td><input type="checkbox" name="chk" id="chk" /></td>
				</tr>
				<tr>
					<td><label>hidden</label></td>
					<td><input type="hidden" name="hid" id="hid" value="숨김값" /></td>
				</tr>
				<tr>
					<td><label for="select">select</label></td>
					<td><select name="sel" id="select" class="inputBox"
						style="width: 150px">
							<option value="자바">Java SE</option>
							<option value="오라클">Oracle DBMS</option>
							<option value="JDBC">JDBC</option>
							<option value="HTML">HTML5</option>
							<option value="CSS">CSS3</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="textarea">textarea</label></td>
					<td><textarea name="ta" id="ta" class="inputBox"
							style="width: 300px; height: 100px"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="POST 값 전송"
						class="btnMy" id="btnPost" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>