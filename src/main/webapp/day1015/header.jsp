<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="공통 디자인 header"%>


<div>
	<span id="header">header에 들어갈 디자인</span>

	<%
	String msg = "오늘은 화요일";
	%>
	<strong><%=msg%></strong>
	<%
	// 끼워지는 모든 페이지에서는 web parameter을 받을 수 있다.
	String birth = request.getParameter("birth");
	%>

	입력값: ${param.birth}

</div>