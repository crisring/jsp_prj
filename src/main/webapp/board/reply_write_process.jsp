<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@page import="kr.co.sist.user.member.WebMemberVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%
request.setCharacterEncoding("UTF-8");
%> 
<jsp:useBean id="rVO" class="kr.co.sist.user.board.ReplyVO" scope="page"/>
<jsp:setProperty property="*" name="rVO"/>
<%
JSONObject jsonObj=new JSONObject();
String method=request.getMethod();
jsonObj.put("result", !"GET".equals(method)); //요청 방식에따라 성공, 실패

if( "POST".equals(method) ){
	
	Object obj=session.getAttribute("userData");
	WebMemberVO wmVO=null;
	if(obj != null){
		wmVO=(WebMemberVO)obj;
	}
	jsonObj.put("loginStatus", obj != null); //세션에 로그인 정보가 존재?
	
	if(wmVO != null){			
	rVO.setIp( request.getRemoteAddr() );
	rVO.setWriter( wmVO.getId() );
	//DB추가 작업
	ReplyDAO rDAO=ReplyDAO.getInstance();
	try{
		rDAO.insertReply(rVO);
		jsonObj.put("insertStatus", true); //
	}catch(SQLException se){
		jsonObj.put("insertStatus", false); //
		se.printStackTrace();
	}//end catch
	
	}//end if
}//end if

out.print(jsonObj.toJSONString());
%>
 