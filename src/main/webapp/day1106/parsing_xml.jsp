<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="" trimDirectiveWhitespaces="true"%>

<%
// 1. 문서 객체 생성
Document doc = new Document();
// 2. 최상위 노드 생성
Element rootNode = new Element("names");
// 3. 자식 노드 생성
Element nameNode = new Element("name");
nameNode.setText("정동진");

// 4. 자식노드를 부모노드에 배치
rootNode.addContent(nameNode);
// 5. 부모노드를 문서객체에 배치
doc.addContent(rootNode);
// 6. 문서객체를 출력
XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
xOut.output(doc, out);
%>