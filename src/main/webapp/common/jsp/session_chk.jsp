<%@ page import="kr.co.sist.user.member.WebMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ empty userData }">
	<c:redirect url="http://localhost/jsp_prj/index.jsp" />
</c:if>

<%
String remoteIP = request.getRemoteAddr();
String sessionID = ((WebMemberVO) session.getAttribute("userData")).getId();
%>