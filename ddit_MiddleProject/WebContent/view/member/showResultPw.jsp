<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>2U4U시네마 : 비밀번호 찾기 결과</title>
    <!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,
	900&display=swap&subset=korean" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
<style type="text/css">
#toMain {
text-align:right; 
padding-right:20px;
color: #d6d6d6;
}


</style>    
    
    
</head>
<body id="particles-js">

<div class="animated bounceInDown">
  <div class="container1">
    <span class="error animated tada" id="msg"></span>
 	
 	
 	<form name="idform" class="box" >
 		<h6 id = "toMain"><a href="<%=request.getContextPath()%>/view/main/index.jsp">Main Page 이동 </a></h6>
		<h4>2U4U <span> CINEMA</span></h4>


	<body>
    <h5>비밀번호 찾기 결과</h5>
    <p id="result">비밀번호: <%= session.getAttribute("findPw") %></p>
    <input type="button" value="뒤로" id="back"  onClick="location.href='<%=request.getContextPath()%>/view/member/login.jsp'">
     	</div>  
 </div>  
</body>
</html>