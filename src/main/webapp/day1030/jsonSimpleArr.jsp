<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="netscape.javascript.JSObject"%>
<%@ page language="java" contentType="application/ 	json; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
// 1. JSONARR에 들어갈 JSONObject 생성
JSONObject jsonObj = new JSONObject();
JSONObject jsonObj2 = new JSONObject();
JSONObject jsonObj3 = new JSONObject();

jsonObj.put("name", "김지훈");
jsonObj.put("group", "3");

jsonObj2.put("name", "이인혁");
jsonObj2.put("group", "3");

jsonObj3.put("name", "김현우");
jsonObj3.put("group", "2");

// 2. jsonObj를 저장할 JSONArr생성
JSONArray jsonArr = new JSONArray();

jsonArr.add(jsonObj);
jsonArr.add(jsonObj2);
jsonArr.add(jsonObj3);

String jsonArrStr = jsonArr.toJSONString();
%>
<%=jsonArrStr%>