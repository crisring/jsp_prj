
<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>


<%
JSONObject jsonObj = new JSONObject();
int cnt = 0;

try {
	int ref_num = Integer.parseInt(request.getParameter("ref_num"));

	ReplyDAO rDAO = ReplyDAO.getInstance();
	cnt = rDAO.selectReplyCnt(ref_num);

} catch (Exception e) {
	e.printStackTrace();
}
jsonObj.put("rowCnt", cnt);
out.print(jsonObj.toJSONString());
%>