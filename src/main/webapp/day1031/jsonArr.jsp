<%@page import="java.sql.SQLException"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="day1031.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="day1031.DeptDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%
// 1. JSONArray 생성
JSONArray jsonArr = new JSONArray();

// 2. JSONObject 생성 후
DeptDAO dDAO = DeptDAO.getInstance();

try {
	List<DeptVO> list = dDAO.selectALLDept();

	JSONObject jsonTemp = null;

	for (DeptVO dVO : list) {
		jsonTemp = new JSONObject();
		// 3. 값 할당
		jsonTemp.put("deptno", dVO.getDeptno());
		jsonTemp.put("dname", dVO.getDname());
		jsonTemp.put("loc", dVO.getLoc());
		jsonTemp.put("status", dVO.getStatus());

		jsonArr.add(jsonTemp);
	}

	// 4. 연결
} catch (SQLException e) {
	e.printStackTrace();

}
// 5. 출력
out.println(jsonArr.toJSONString());
%>