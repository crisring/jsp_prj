<%@page import="kr.co.sist.chipher.DataEncryption"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원 가입 데이터 처리 페이지"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/jsp/post_chk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.225/jsp_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.210/jsp_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>
<body>
<div id="wrap">
<div id="header">
<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp"/>
</div>
<jsp:useBean id="wmVO" class="kr.co.sist.user.member.WebMemberVO" scope="page"/>
<jsp:setProperty property="*" name="wmVO"/>

<%
//접속자의 ip주소를 저장( 부인방지용 )
wmVO.setIp(request.getRemoteAddr());

if(wmVO.getSave() == null ){
	wmVO.setSave("N");
}//end if

MemberDAO mDAO=MemberDAO.getInstance();
try{
	//비연결성의 문제( 한정적인 자원의 사용문제)
	boolean flag=mDAO.selectId(wmVO.getId());
	if( flag ){
	%>
	<h2>아이디가 사용중입니다.</h2>
	<strong><c:out value="${ param.id }"/></strong>는 이미 사용 중입니다.<br>
	<a href="javascript:history.back()">뒤로</a>
	<%	
	}else{
 	//저장할 데이터의 중요도에 따라 일방향 Hash, 양방향 암호화 수행		
	//비번 : 일방향 Hash
	wmVO.setPass(DataEncryption.messageDigest("SHA-1",wmVO.getPass()));

 	DataEncryption de=new DataEncryption("abcdef0123456789");
 	//이름, 이메일,전화번호 양방향 암호화처리
 	wmVO.setName(de.encrypt(wmVO.getName()));
 	wmVO.setCellphone(de.encrypt(wmVO.getCellphone()));
 	wmVO.setEmail(de.encrypt(wmVO.getEmail()));
	
	//입력된 회원 정보를 DB에 추가
	mDAO.insertWebMember(wmVO);
%>
<h2>${ param.name }님 회원가입해 주셔서 감사합니다.</h2>
<a href="login.jsp">로그인 페이지로</a>
<%
	}//end else
}catch(SQLException se){
	se.printStackTrace();
	%>
	회원 가입 중 문제가 발생했습니다.<br>
	잠시 후 다시 시도해 주세요. <br>
	<a href="join_frm.jsp">메인화면으로 이동</a>
	<%
}//end catch
%>

</div>
</body>
</html>