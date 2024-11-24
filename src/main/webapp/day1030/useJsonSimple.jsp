<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>

<%
// 1. JSONObject 생성
JSONObject jsonObj = new JSONObject();

// 2. 값 할당
jsonObj.put("name", "김현우");
jsonObj.put("age", 20);

// 3. jsonObj를 문자열로 얻기
String jsonStr = jsonObj.toJSONString();
%>
<%=jsonStr%>