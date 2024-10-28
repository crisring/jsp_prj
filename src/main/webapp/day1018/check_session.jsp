<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ empty user_id }">
	<c:redirect url="http://Localhost/jsp_prj/dat1018/create_session.jsp"></c:redirect>
</c:if>