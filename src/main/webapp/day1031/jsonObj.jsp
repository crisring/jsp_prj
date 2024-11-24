<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>

<%
String subject = request.getParameter("subject");
Map<String, String> map = new HashMap();

map.put("java", "DeskTop에서 동작하는 프로그램을 제작할 수 있음");
map.put("oracle", "대용량 데이터를 저장, 관리");
map.put("jdbc", "java에서 DB 연동하는 저수준 API");
map.put("html", "web에서 구조를 담당");

//jSONOPbject 생성
JSONObject jsonObj = new JSONObject();

String value = "";
boolean searchFlag = map.containsKey(subject);

if (searchFlag) {
	value = map.get(subject);
}

jsonObj.put("searchFlag", searchFlag);
jsonObj.put("value", value);

out.println(jsonObj.toJSONString());
%>