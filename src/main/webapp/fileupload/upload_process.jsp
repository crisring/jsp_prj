<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="multipart/form-data인 경우 웹 파라미터가 전달되지 않는다."%>
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
		<%-- 		업로더 :
		<%=request.getParameter("uploader")%><br /> EL : ${ param.uploader}<br> --%>



		요청방식 :
		<%=request.getMethod()%><br>



		<%
		boolean uploadFlag = (boolean) session.getAttribute("uploadFlag");

		if (!uploadFlag) {

			// 업로드된 파일의 저장 디렉토리 얻기
			File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");

			// 업로드 파일의 최대 크기
			int maxSize = 1024 * 1024 * 12; // 10MBYTE까지의 업로드 가능 초과하면 예외발생
			int uploadSize = 1024 * 1024 * 600; // 10MBYTE까지의 업로드 가능 초과하면 예외발생

			try {
				// FileUpload Component를 생성 - 생성과 동시에 업로드가 진행
				MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

				// 웹 파라메터 받기 (request가 아닌 MultipartRequest 파일 컴퓨넌트를 사용하여 마라메터를 받는다.)
				String uploader = mr.getParameter("uploader");
				String[] extArr = mr.getParameterValues("ext");

				// 파일명 처리
				// 원본 파일명
				String originName = mr.getOriginalFileName("upfile");
				// 변경된 파일명
				String fileSysname = mr.getFilesystemName("upfile");

				// 업로드된 파일이 최대 크기를 초과하는지 체크
				File uploadFile = new File(saveDir.getAbsolutePath() + "/" + fileSysname);
				if (uploadFile.length() > maxSize) {
			uploadFile.delete(); // 업로드된 파일 삭제
		%>
		<%=originName%>은 10MByte(<%=maxSize%>byte)를 초과합니다. <br> 업로드 파일의
		크기내의 파일로 변환하여 업로드 해주세요. <br> <a href="javascript:history.back()">뒤로</a>

		<%
		} else {
		%>
		<h2>파일 업로드 성공</h2>
		업로더 :
		<%=uploader%><br> 확장자 :
		<%
		if (extArr == null) {
			out.print("선택 확장자 없음");

		} else {

			for (String tempExt : extArr) {
				out.print(tempExt);
				out.print("&nbsp;");

			}

		}
		%>
		<br> 원본 파일명 :
		<%=originName%><br> 변경 파일명 :
		<%=fileSysname%><br> <img
			src="http://localhost/jsp_prj/upload/<%=fileSysname%>" /> <a
			href="file_list.jsp">파일리스트보기</a>
		<%
		} // end else
		} catch (Exception e) {
		e.printStackTrace();
		%>
		파일 업로드 실패!
		<%
		} // end catch

		session.setAttribute("uploadFlag", true);
		} // end if
		%>
	</div>
</body>
</html>