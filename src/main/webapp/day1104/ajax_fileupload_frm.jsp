<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="AJAX를 이용한 file upload"%>
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
		$("#btnSend").click(function() {
			$("#frm").submit();
		});//click

		//file에서 이벤트가 발생하면
		$("#profile").change(function(evt) {
			preview(evt);
		});//click

		$("#btnUpdate").click(function() {
			ajaxFileUpload();
		});
	});//ready

	function ajaxFileUpload() {

		if ($("#profile").val() == "") {
			alert("이미지를 선택해주세요.");
			return;
		}//end if

		//1.form태그 얻기 // FormControl의 값을 AJAX로 전달
		var form = $("#frm")[0];
		//2.HTML Form Control의 값을 data속성으로 전달하기 위해 생성.
		var formData = new FormData(form);

		$.ajax({
			url : "upload_img_process.jsp",
			contentType : false,
			processData : false,
			data : formData,
			type : "post",
			dataType : "json",
			error : function(xhr) {
				console.log(xhr.status), alert("이미지 업로드 실패");
			},
			success : function(jsonObj) {
				var msg = "이미지 업로드 실패";
				if(!jsonObj.uploadFlag){
					msg="이미지가 업로드 되었습니다."
				}
				alert(msg)
			}

		});
	}

	function preview(evt) {
		if ($("#profile").val() == "") {
			alert("이미지를 선택해주세요.");
			return;
		}//end if
		//1. 파일 컴포넌트 얻기
		//alert( evt.target )
		var file = evt.target.files[0];
		//2.스트림 생성
		var reader = new FileReader();

		//3. FileReader객체의 onload 이벤틀 핸들러를 설정
		reader.onload = function(evt2) {//이미지 로딩이 되면
			$("#preview").prop("src", evt2.target.result); //이미지명을 설정	
		}
		//4.파일에서 읽어들여 실제img 태그에 출력( 미리보기 )
		reader.readAsDataURL(file);

	}//preview
</script>
</head>
<body>
	<div id="wrap">
		<form action="fielupoad_process.jsp" method="post" name="frm" id="frm">
			<img src="images/default_img.png" id="preview"
				style="width: 171px; height: 176px" /><br> <label>프로필이미지</label>
			<input type="file" name="profile" id="profile" /> <input
				type="button" value="이미지업로드" id="btnUpdate"
				class="btn btn-sm btn-success" /> <br> <label>이름</label> <input
				type="text" name="name" id="name" /><br> <label>id</label> <input
				type="text" name="id" id="id" /><br> <input type="button"
				value="전송" id="btnSend" /><br>
		</form>
	</div>
</body>
</html>