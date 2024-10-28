<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/jsp/session_chk.jsp"%>
<%@ include file="../common/jsp/post_chk.jsp"%>
<jsp:useBean id="bVO" class="kr.co.sist.user.board.BoardVO" scope="page" />
<%-- 글제목, 글내용, 글번호 가 bVO객체에 입력--%>
<jsp:setProperty name="bVO" property="*" />
<%
//작성자는 로그인한 세션에서 받아온다.
bVO.setWriter(sessionID);

BoardDAO bDAO = BoardDAO.getInstance();
int rowCnt = 0;

try {
	rowCnt = bDAO.deleteBoard(bVO);//0-num을 외부에서 편집, 1 - 성공
} catch (SQLException se) {
	rowCnt = -1;// DB에서 문제 발생
	se.printStackTrace();
} //end catch

pageContext.setAttribute("rowCnt", rowCnt); //${ rowCnt }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://192.168.10.219/jsp_prj/common/images/favicon.ico" />
<script type="text/javascript">
	var msg = "문제가 발생했습니다. 잠시 후 다시 시도해주세요";
	var cnt = $
	{
		rowCnt
	};

	var flag = false;
	if (cnt == 0) {
		msg = "번호는 외부에서 임의로 편집할 수 없습니다.";
	}// end if 

	if (cnt == 1) {
		flag = true;
		msg = "${ param.num }번 글을 삭제하였습니다.";
	}// end if 

	alert(msg);

	if (flag) {
		location.href = "board_list.jsp?currentPage=${param.currentPage}";
	} else {
		history.back();
	}//end else

	$(function() {

	});//ready
</script>
</head>
<body>
</body>
</html>