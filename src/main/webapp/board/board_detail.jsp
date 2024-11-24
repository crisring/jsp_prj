<%@page import="kr.co.sist.user.board.BoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
//실제 글의 고유 번호를 받는다.
String tempNum = request.getParameter("num");
int num = 0;
try {
	num = Integer.parseInt(tempNum);
} catch (NumberFormatException nfe) {
	response.sendRedirect("board_list.jsp");
	return;
} //end catch

//입력된 글 번호로 상세조회 수행.
BoardDAO bDAO = BoardDAO.getInstance();

BoardVO bVO = null;
try {
	bVO = bDAO.selectDetailBoard(num);
} catch (SQLException se) {
	se.printStackTrace();
} //catch

pageContext.setAttribute("bVO", bVO);
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon"
	href="http://192.168.10.225/jsp_prj/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="http://192.168.10.210/jsp_prj/common/css/main_20240911.css">
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

<!-- jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>

<style type="text/css">
#replyMenu {
	cursor: pointer;
}

#replyContentDiv {
	display: none
}
</style>
<script type="text/javascript">
if( ${ empty bVO } ){
	alert("글 읽기 도중 문제가 발생했습니다.");
	location.href="board_list.jsp";
}

$(function(){
  $('#content').summernote({
       placeholder: '쓰고 싶은 글을 써 주세요.',
       tabsize: 2,
       height: 240,
       width:490,
       toolbar: [
           ['style', ['style']],
           ['font', ['bold', 'underline', 'clear']],
           ['insert', ['picture']],
           ['view', ['codeview', 'help']]
         ]
     });
	
  
  $("#btnWrite").click(function(){
	  chkNull();
  });//click
  
  $("#btnList").click(function(){
	  
	  var url="../board/board_list.jsp?currentPage=${ param.currentPage }";
	  
	  if(${ not empty param.keyword }){
		  url+="&field=${ param.field}&keyword=${ param.keyword }";
	  }//end if
	  
	  location.href=url;
  });//click
  
  $("#btnUpdate").click(function(){
	  movePage('u')
  });//click
  
  $("#btnDelete").click(function(){
	  movePage('d')
  });//click
  
  <c:if test="${ empty userData.id }">
  $("#btnReplyWrite").click(function(){
	 if( confirm("로그인 한 사용자만 댓글을 작성할 수 있습니다.\n로그인하시겠습니까?")){
		 location.href="../index.jsp";
	 }//end if 
  });
  </c:if>
  
  <c:if test="${ not empty userData.id }">
  $("#btnReplyWrite").click(function(){
	 
	  var content=$("#replyContent").val();
	 
	 if( content.trim() == ""){
		 alert("댓글의 내용은 필수 입력!!");
		 $("#replyContent").focus();
		 return ;
	 }//end if
	 
	 var param={ content: content, ref_num : ${ bVO.num } }
	 
	 $.ajax({
		 url:"reply_write_process.jsp",
		 type:"post",
		 data: param,
		 dataType:"json",
		 error:function( xhr ){
			 console.log( xhr.status );
			 alert("댓글이 정상적으로 입력되지 못하였습니다.")
		 },
		 success: function( jsonObj ){
			 if( jsonObj.result ){
				 if( !jsonObj.loginStatus ){
					 alert("로그인 정보가 존재하지 않습니다.");
					 return;
				 }//end if
				 
				 var msg="댓글 작성 실패!!";
				 if( jsonObj.insertStatus ){
					 msg="댓글을 작성하였습니다.";
				 }//end if
				 alert(msg);
			 }//end if
			 
			 $("#replyContent").val("");
		 }
		 
	 });//ajax
	 
  });//click
  </c:if>
  
  $("#replyMenu").click(function(){
	  chgTxt();
  });//chgTxt
  
  
  
});//ready

function rowCnt(){
var cnt = 0;

	$.ajax({
url:"replyCnt.jsp",
type:"get",
data:{ref_num : ${bVO.num}},
async:false,
dataType:"json",
error:function(xhr){
	console.log(xhr.status)
},
success:function(jsonObj){
cnt=jsonObj.rowCnt;
}
	
	
	});
	return cnt;
}


function chgTxt(){
	var txt=$("#replyMenu").text();

	var menuTxt="열기 (<span title='댓글의 수'>" + rowCnt()+"</span>)";
	
	if (txt.startsWith("열기")) {
	    menuTxt = "닫기";
	    searchReply();
	} // end if

	  $("#replyMenu").html("열기 (<span title='댓글의 수'>" + rowCnt()+"</span>)");	
	
	$("#replyMenu").html( menuTxt );
	$("#replyContentDiv").toggle();
	
}//chgTxt

function searchReply() {
    var param = { ref_num: ${bVO.num} };
    $.ajax({
        url: "reply_list.jsp",
        type: "get",
        data: param,
        dataType: "json",
        error: function(xhr) {
            console.log(xhr.status);
        },
        success: function(jsonObj) {
            if (jsonObj.resultFlag) {
                var outReply = "";
                outReply += "<div>";
                outReply += "총 게시물 수 : " + jsonObj.dataLength;
                
                $.each(jsonObj.data, function(ind, jsonTemp) {
                    outReply += "<div>" + jsonTemp.content + "</div>";
                    outReply += "<div><strong>작성자</strong> : " + jsonTemp.writer
                        + ", <strong>작성일</strong> : " + jsonTemp.input_date
                        + ", <strong>ip</strong> : " + jsonTemp.ip;

                    if (jsonTemp.writer == "${userData.id}") {
                        outReply += "<input type='button' value='삭제' onclick=\"removeReply('"
                            + jsonTemp.num + "', '" + jsonTemp.writer + "', this)\" class='btn btn-danger btn-sm'/> ";
                    } // end if

                    outReply += "</div>"; // Properly close the div inside the loop
                }); // each
                
                outReply += "</div>"; // Close the initial div block
                
                $("#replyContentDiv").html(outReply);
            } // end if
        }
    }); // ajax
} // searchReply


function removeReply( num, writer, divElement){
	
	if(!confirm("댓글을 삭제하시겠습니까?")){
		return;
	}//end if

	var param={ num:num, writer:writer };
	
	$.ajax({
		url:"reply_remove.jsp",
		type:"get",
		data:param,
		dataType:"json",
		error:function( xhr ){
			console.log( xhr.status );
		},
		success:function( jsonObj ){
			var msg="댓글이 정상적으로 삭제되지 않았습니다.";
			if( jsonObj.cnt != 0){
				msg="댓글이 정상적으로 삭제되었습니다.";
				$(divElement).parent().parent().remove() ;
			}//end if
			alert( msg );
		}
	});//ajax
	

}//removeReply

function movePage( flag ){
	//<form>태그의 action을 변경 document.폼이름.action="변경할action"
	//<form>태그의 method 변경 document.폼이름.method="변경할요청방식 get|post"
	var action="board_update.jsp";
	var msg="글을 수정하시겠습니까?";
	
	if( flag == 'd'){
		action="board_delete.jsp";
		msg="정말 글을 삭제하시겠습니까?";
	}//end if
	
	if(confirm(msg)){//사용자에게 한번 더 확인을 거친다.
	//폼태그 객체의 action속성을 변경.
	document.readFrm.action=action;
	//변경은 내용이 존재하는지 판단 : summernote <p><br></p>를 가진다.
	
	if(flag == 'u'){
		if($("#content").val().length < 15 ){
			alert("내용은 필수 입력 입니다.");
			return;
		}//end if
	}//end if
	
	$("#readFrm").submit(); //form를 전송
	
	}//end if
	
}//movePage

function chkNull(){
	if($("#subject").val().trim()==""){
		alert("제목은 필수 입력");
		$("#subject").focus();
		return;
	}//end if
	
	if($("#content").val().trim()==""){
		alert("내용은 필수 입력");
		return;
	}//end if
	
	$("#readFrm").submit();
}//chkNull

</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp" />
		</div>
		<div id="contentDiv">
			<div id="writeFrmDiv">
				<form name="readFrm" id="readFrm" method="post">
					<table>
						<tr>
							<th colspan="2"><h2>글읽기</h2></th>
						</tr>
						<tr>
							<td style="width: 80px">제목</td>
							<td style="width: 500px"><input type="text" name="subject"
								id="subject" value="${ bVO.subject }" style="width: 390px"
								autofocus="autofocus" /></td>
						</tr>
						<tr>
							<td style="width: 80px">내용</td>
							<td><textarea name="content" id="content">${ bVO.content }</textarea>
							</td>
						</tr>
						<tr>
							<td style="width: 80px">작성자</td>
							<td><c:out value="${ bVO.writer }" /></td>
						</tr>
						<tr>
							<td style="width: 80px">작성일</td>
							<td><fmt:formatDate value="${ bVO.input_date }"
									pattern="yyyy-MM-dd a HH:mm:ss" /></td>
						</tr>
						<tr>
							<td style="width: 80px">ip</td>
							<td><c:out value="${ bVO.ip }" /> <input type="hidden"
								name="num" id="num" value="${ bVO.num }" /> <input
								type="hidden" name="currentPage" value="${ param.currentPage }" /></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><c:if
									test="${ bVO.writer eq userData.id }">
									<input type="button" id="btnUpdate" value="글수정"
										class="btn btn-sm btn-success" />
									<input type="button" id="btnDelete" value="글삭제"
										class="btn btn-sm btn-warning" />
								</c:if> <input type="button" id="btnList" value="리스트"
								class="btn btn-sm btn-info" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="replyWriteDiv">
				<strong>댓글작성</strong><br> <label>내용</label> <input type="text"
					name="replyContent" id="replyContent" style="width: 300px">
				<label>작성자</label> <input type="text" name="replyWriter"
					style="width: 80px" value="${ userData.id }" readonly="readonly">
				<input type="button" value="댓글작성" id="btnReplyWrite"
					class="btn btn-success btn-sm">
			</div>
			<div id="replyReadDiv">
				<div id="replyMenuDiv">
					<span id="replyMenu">열기</span>
				</div>
				<div id="replyContentDiv"></div>
			</div>

		</div>
	</div>
</body>
</html>