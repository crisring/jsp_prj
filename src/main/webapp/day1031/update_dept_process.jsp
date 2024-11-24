<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day1031.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<jsp:useBean id="dVO" class="day1031.DeptVO" scope="page" />
<jsp:setProperty property="*" name="dVO" />

<%
int rowCnt = 0;
DeptDAO dDAO = DeptDAO.getInstance();

try {

	rowCnt = dDAO.updateDept(dVO);

} catch (SQLException e) {
	e.printStackTrace();
}

JSONObject jsonObj = new JSONObject();
jsonObj.put("rowCnt", rowCnt);
out.print(jsonObj.toJSONString());
%>