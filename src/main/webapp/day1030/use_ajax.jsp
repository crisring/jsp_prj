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

		// text 파일 읽어들이기
		$("#btnTxt").click(function() {
			$.ajax({
				url : "text.txt",
				type : "get",
				dataType : "text",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					$("#output").html(data)
				}
			}); // ajax
		});// click

		// HTML 파일 읽어들이기
		$("#btnHtml").click(function() {
			$.ajax({
				url : "response_html.html",
				type : "get",
				dataType : "html",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					$("#output").html(data)
				}
			}); // ajax
		}); // click

		// XML불러오기
		$("#btnXml").click(function() {
			$.ajax({
				url : "response_xml.xml",
				type : "get",
				dataType : "xml",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					var msg = $(data).find("msg").text();
					$("#output").html(msg) /* XML은 파싱해서 보여줘야함 */
				}
			}); // ajax
		}); // click

		// JSON 불러오기
		$("#btnJson").click(function() {
			$.ajax({
				url : "response_json.json",
				type : "get",
				dataType : "json",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					$("#output").html(data.msg)/* json도 파싱 */
				}
			}); // ajax
		}); // click
		/* -------------------------------------- */
		// text 파일 읽어들이기
		$("#btnTxt2").click(function() {
			$.ajax({
				url : "response_text.jsp",
				type : "get",
				dataType : "text",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					$("#output").html(data)
				}
			}); // ajax
		});// click

		// HTML 파일 읽어들이기
		$("#btnHtml2").click(function() {
			$.ajax({
				url : "response_html.jsp",
				type : "get",
				dataType : "html",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					$("#output").html(data)
				}
			}); // ajax
		}); // click

		// XML불러오기
		$("#btnXml2").click(function() {
			$.ajax({
				url : "http://localhost/jsp_prj/day1030/response_xml.jsp",
				type : "post",
				dataType : "xml",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					var msg = $(data).find("msg").text();
					$("#output").html(msg) /* XML은 파싱해서 보여줘야함 */
				}
			}); // ajax
		}); // click

		// JSON불러오기
		$("#btnJson2").mouseover(function() {
			$.ajax({
				url : "response_json.jsp",
				type : "get",
				dataType : "json",
				error : function(xhr) {
					alert(xhr.status + " / " + statusText)
				},
				success : function(data) {
					$("#output").html(data.msg)/* json도 파싱 */
				}
			}); // ajax
		}); // click

	}); // document.ready
</script>
</head>
<body>
	<div id="wrap">
		<div id="output" style="height: 80px; border: 1px solid #333"></div>
		<input type="button" class="btn btn-primary" id="btnTxt" value="TEXT" />
		<input type="button" class="btn btn-secondary" id="btnHtml"
			value="HTML" /> <input type="button" class="btn btn-success"
			id="btnXml" value="XML" /> <input type="button"
			class="btn btn-danger" id="btnJson" value="JSON" /> <br> <strong>jSP의
			콘텐츠타입 속성</strong><br> <input type="button" class="btn btn-primary"
			id="btnTxt2" value="TEXT" /> <input type="button"
			class="btn btn-secondary" id="btnHtml2" value="HTML" /> <input
			type="button" class="btn btn-success" id="btnXml2" value="XML" /> <input
			type="button" class="btn btn-danger" id="btnJson2" value="JSON" />
	</div>
</body>
</html>