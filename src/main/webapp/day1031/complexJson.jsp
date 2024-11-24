<%@page import="org.apache.tomcat.util.json.JSONParserTokenManager"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Date"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day1031.EmpVO"%>
<%@page import="java.util.List"%>
<%@page import="day1031.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>

<%
String paramDeptno = request.getParameter("deptno");

DeptDAO dDAO = DeptDAO.getInstance();
JSONObject jsonObj = new JSONObject();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
jsonObj.put("pubDate", sdf.format(new Date()));
jsonObj.put("dataLength", 0);
jsonObj.put("searchFlag", false);

try {
	List<EmpVO> list = dDAO.selectDeptEmp(Integer.parseInt(paramDeptno));
	jsonObj.put("dataLength", list.size());
	jsonObj.put("searchFlag", true);

	JSONArray jsonArr = new JSONArray();
	JSONObject jsonTemp = null;

	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
	/*hiredate  */
	for (EmpVO eVO : list) {
		jsonTemp = new JSONObject();
		jsonTemp.put("empno", eVO.getEmpno());
		jsonTemp.put("mgr", eVO.getMgr());
		jsonTemp.put("sal", eVO.getSal());
		jsonTemp.put("ename", eVO.getEname());
		jsonTemp.put("job", eVO.getJob());
		jsonTemp.put("hiredate", sdf2.format(eVO.getHiredate()));

		jsonArr.add(jsonTemp);
	} // end for

	jsonObj.put("data", jsonArr);

} catch (SQLException e) {
	e.printStackTrace();

}

out.print(jsonObj.toJSONString());
%>