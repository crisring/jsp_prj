<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head>
  <script src="http://192.168.10.210/jsp_prj/login/js/color-modes.js"></script>

  <meta charset="utf-8">
  <title>로그인</title>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="http://192.168.10.210/jsp_prj/login/css/bootstrap.min.css" rel="stylesheet">

<meta name="theme-color" content="#712cf9">
<!-- jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    
    <!-- Custom styles for this template -->
    <link href="http://192.168.10.210/jsp_prj/login/sign-in.css" rel="stylesheet">
 	<script type="text/javascript">
 	window.onload=function(){
 		document.getElementById("id").addEventListener("keyup",enterKey);
 		document.getElementById("pass").addEventListener("keyup",enterKey);
 		document.getElementById("btnLogin").addEventListener("click",chkNull);
 	}//onload
 	
 	function enterKey( evt ){
 		if( evt.which == 13){
 			chkNull();
 		}//end if
 	}//enterKey
 	
 	function chkNull(){
 		var obj=document.loginFrm;
 		
 		var idNode=obj.id;
 		if(idNode.value.replaceAll(/ /g,"") == ""){
 			idNode.value="";
 			idNode.focus();
 			return;
 		}//end if
 		
 		var passNode=obj.pass;
 		if(passNode.value.replaceAll(/ /g,"") == ""){
 			passNode.value="";
 			passNode.focus();
 			return;
 		}//end if
 		
 		$("#loginFrm").submit();		
 		
 	}//chkNull
 	
 	
 	</script>
 
  </head>
  <body class="d-flex align-items-center py-4 bg-body-tertiary">

<main class="form-signin w-100 m-auto">
  <form name="loginFrm" id="loginFrm" action="login_frm_process.jsp" method="post">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="email" name="id" id="id" class="form-control" placeholder="name@example.com">
    </div>
    <div class="form-floating">
      <input type="password" name="pass" id="pass" class="form-control" placeholder="Password">
    </div>

    <input class="btn btn-primary w-100 py-2" id="btnLogin" type="button" value="로그인"/>
  </form>
</main>
<script src="http://192.168.10.210/html_prj/js0920/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
