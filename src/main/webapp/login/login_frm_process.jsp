<%@page import="kr.co.sist.user.login.LoginDAO"%>
<%@page import="kr.co.sist.chipher.DataDecryption"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.chipher.DataEncryption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/jsp/post_chk.jsp"%>
<jsp:useBean id="wmVO" class="kr.co.sist.user.member.WebMemberVO"
	scope="page" />
<jsp:setProperty name="wmVO" property="*" />
<%
//비밀번호는 일방향 hash처리
wmVO.setPass(DataEncryption.messageDigest("SHA-1", wmVO.getPass()));
LoginDAO ld = LoginDAO.getInstance();

boolean loginFlag = false;
try {
	ld.selectLogin(wmVO);//method가 return을 하지 않더라도 인스턴스 주소는 하나이기 때문에
	//wmVO에서 조회 결과를 사용할 수 있다.
	//복호화 "abcdef0123456789"
	loginFlag = wmVO.getName() != null;
	if (loginFlag) {//이름이 존재하면 조회결과가 있다.=> 복호화
		DataDecryption dd = new DataDecryption("abcdef0123456789");
		wmVO.setName(dd.decrypt(wmVO.getName()));
		wmVO.setCellphone(dd.decrypt(wmVO.getCellphone()));

		//세션에 자주 사용하는 정보를 추가
		wmVO.setPass("");
		//session.setMaxInactiveInterval(60);
		session.setAttribute("userData", wmVO);
		//login history 테이블에 insert

	} //end if

} catch (SQLException se) {
	se.printStackTrace();
} //end catch

pageContext.setAttribute("loginFlag", loginFlag);
%>

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
	
<%-- <c:if test="${ not loginFlag }">
	alert("아이디나 비밀번호를 확인해주세요");
	history.back();
</c:if> --%>
	$(function() {

	});//ready
</script>
</head>
<body>
	<div id="wrap">
		<c:choose>
			<c:when test="${ not loginFlag }">
				<h2>로그인 실패</h2>
				<strong> 아이디나 비밀번호를 확인해주세요.</strong>
				<br />
				<a href="javascript:history.back()">뒤로</a>
				<br />
				<a href="#void">아이디 찾기</a>
				<a href="#void">비밀번호 찾기</a>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					location.replace("http://localhost/jsp_prj/index.jsp");
				</script>

			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>