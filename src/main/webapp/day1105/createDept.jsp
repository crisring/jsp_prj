<%@page import="org.jdom2.Attribute"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day1031.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="day1031.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://192.168.10.219/jsp_prj/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.219/jsp_prj/common/css/main_20240911.css">
<!-- bootstrap CDN 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- bootstrap CDN 끝-->

<style type="text/css">
</style>
<!-- jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

	}); // document.ready
</script>
</head>
<body>
	<div id="wrap">

		<%
		DeptDAO dDAO = DeptDAO.getInstance();
		boolean flag = false;

		try {
			List<DeptVO> list = dDAO.selectALLDept();

			// 1. 문서 객체 생성
			Document doc = new Document();

			// 2. 최상위 부모노드 생성
			Element deptsNode = new Element("depts");

			// 3. 자식 노드를 생성
			Element deptNode = null;
			Element deptnoNode = null;
			Element dnameNode = null;
			Element locNode = null;

			int dataSize = 0;
			Attribute statusAttr = null;

			for (DeptVO dVO : list) {
				dataSize++;
				deptNode = new Element("dept");
				deptnoNode = new Element("deptno");
				dnameNode = new Element("dname");
				locNode = new Element("loc");

				deptnoNode.setText(String.valueOf(dVO.getDeptno()));
				dnameNode.setText(String.valueOf(dVO.getDname()));
				locNode.setText(String.valueOf(dVO.getLoc()));

				statusAttr = new Attribute("status", dVO.getStatus());

				// 속성을 가질 노드에 배치
				deptnoNode.setAttribute(statusAttr);

			}

			// 4. 자식노드를 부모노드에 배치
			deptNode.addContent(deptnoNode);
			deptNode.addContent(dnameNode);
			deptNode.addContent(locNode);

			// 5. 최상위 부모노드에 자식노드 배치
			deptsNode.addContent(deptNode);

			// 6. 취상위 부모노드를 XML문서객체 배치
			doc.addContent(deptsNode);
			// 7. 출력
			XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
			File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/depts.xml");
			FileOutputStream fos = new FileOutputStream(file);

			flag = true;

			xOut.output(doc, fos);
			if (fos != null) {
				fos.close();
			}

		} catch (SQLException se) {
			se.printStackTrace();
		} catch (IOException ie) {
			ie.printStackTrace();
		}

		if (flag) {
		%>

		<a href="depts.xml">XML읽기</a>
		<%
		} else {
		%>
		XML이 존재하지 않습니다.
		<%
		}
		%>

	</div>
</body>
</html>