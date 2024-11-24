<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info="" trimDirectiveWhitespaces="true"%>

<%
JSONObject jsonObj = new JSONObject();
jsonObj.put("msg", "JSP에서 JSONObject 응답!!");
out.print(jsonObj.toJSONString());
%>
