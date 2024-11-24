<%@page import="java.net.URL"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="외부에서 제공되는 XML(RSS)을 파싱"%>
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
a {
	font-size: 16px;
	color: #212529;
	text-decoration: none
}

a:hover {
	font-size: 16px;
	color: #dfdfdf
}
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
		String[] titleArr = { "이슈 Top10", "정치", "경제", "사회", "국제", "문화", "연예", "스포츠", "날씨" };
		String[] urlArr = { "issue", "section/10", "section/20", "section/30", "section/40", "section/50", "section/60",
				"section/70", "section/80" };
		%>
		<div>
			<table class="table">
				<tr>
					<%
					for (int i = 0; i < titleArr.length; i++) {
					%>
					<td><a href="jtbc_rss.jsp?url=<%=urlArr[i]%>"><%=titleArr[i]%></a></td>
					<%
					}
					%>

				</tr>
			</table>
		</div>
		<div>
			<c:if test="${ not empty param.url}">
				<%
				String prefixUrl = "https://news-ex.jtbc.co.kr/v1/get/rss/";
				String paramUrl = request.getParameter("url");

				String URL = prefixUrl + paramUrl;

				try {
					// 1. Create SAX parser
					SAXBuilder builder = new SAXBuilder();

					// 2. Get the top-level document object
					Document doc = builder.build(new URL(URL));

					// 3. Get root node
					Element rootNode = doc.getRootElement();
					System.out.println(rootNode);

					// 4. Get child elements
					Element channelNode = rootNode.getChild("channel");
					Element pubDateNode = rootNode.getChild("pubDate");
					Element titleNode = rootNode.getChild("title");

					// Get children nodes (items)
					List<Element> itemNodes = channelNode.getChildren("item");
				%>

				<strong>뉴스생성일 : <%=pubDateNode != null ? pubDateNode.getValue() : "N/A"%></strong>
				<br>
				<strong>제공자 : <%=titleNode != null ? titleNode.getValue() : "N/A"%></strong>
				<br>
				<strong>뉴스의 수 : <%=itemNodes.size()%></strong>
				<br>

				<%
				if (itemNodes.isEmpty()) {
				%>
				<div>작성된 뉴스가 없습니다.</div>
				<%
				}
				%>

				<%
				int ind = 0;

				for (Element itemNode : itemNodes) {
					Element itemTitleNode = itemNode.getChild("title");
					Element itemLinkNode = itemNode.getChild("link");
					Element itemDescriptionNode = itemNode.getChild("description"); // Corrected the typo
					Element itemPubDateNode = itemNode.getChild("pubDate");

					// Check for null values to prevent NullPointerException
					String itemTitle = (itemTitleNode != null) ? itemTitleNode.getValue() : "No Title";
					String itemLink = (itemLinkNode != null) ? itemLinkNode.getValue() : "#";
					String itemDescription = (itemDescriptionNode != null) ? itemDescriptionNode.getValue()
					: "No description available";
					String itemPubDate = (itemPubDateNode != null) ? itemPubDateNode.getValue() : "No date available";
				%>

				<div>
					<ul>
						<li><%=++ind%> 기사명: <a href="<%=itemLink%>"><%=itemTitle%></a>,
							작성일: <%=itemPubDate%></li>
						<li><strong>기사내용: </strong> <%=itemDescription%></li>
					</ul>
				</div>

				<%
				}
				} catch (Exception e) {
				e.printStackTrace(); // Handle errors in RSS parsing
				}
				%>
			</c:if>

		</div>
	</div>
</body>
</html>