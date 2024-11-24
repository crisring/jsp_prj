<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.tomcat.util.json.JSONParserTokenManager"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.sist.user.board.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%
String paramRefNum=request.getParameter("ref_num");
int ref_num=0;
if( paramRefNum != null ){
	ref_num=Integer.parseInt(paramRefNum);
}//end if

JSONObject jsonObj=new JSONObject();
boolean resultFlag=false;

ReplyDAO rDAO=ReplyDAO.getInstance();
JSONArray jsonArr=new JSONArray();
try{
	List<ReplyVO> list=rDAO.selectReply(ref_num);
	resultFlag=true;
	JSONObject jsonTemp=null;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
	for( ReplyVO rVO : list){
		jsonTemp=new JSONObject();
		jsonTemp.put("num", rVO.getNum());
		jsonTemp.put("content", rVO.getContent());
		jsonTemp.put("writer", rVO.getWriter());
		jsonTemp.put("ip", rVO.getIp());
		jsonTemp.put("input_date", sdf.format(rVO.getInput_date()) );
		
		jsonArr.add(jsonTemp);
	}//end for
}catch(SQLException se){
	se.printStackTrace();
}//end catch

	jsonObj.put("resultFlag",resultFlag);
	jsonObj.put("data",jsonArr);
	jsonObj.put("dataLength",jsonArr.size());
	
	out.print( jsonObj.toJSONString() );
%>    





