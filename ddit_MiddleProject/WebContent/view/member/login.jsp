<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2U4U시네마 : Login</title>

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,
	900&display=swap&subset=korean" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">
<script>
	$(function(){
		$('#btn1').on('click',function(){
			var inputId = $('#user_id').val().trim();
		
			// 아이디 입력확인	
			if ($('#user_id').val() == "") {
				   //alert("ID를 입력하세요!");
				   
				     $("#modalId").attr("style", "display:block");
				    	
				     $("#modalId_close_btn").click(function(){
					     $("#modalId").attr("style", "display:none");
					     $("#user_id").focus();
				     });    
			      
			       return false;
			} 
			// 비밀번호 입력확인
			if ($('#user_pw').val() == "") {
				   //alert("PW를 입력하세요!");
				   
				   	$("#modalPw").attr("style", "display:block");
				    	
				    $("#modalPw_close_btn").click(function(){
				        $("#modalPw").attr("style", "display:none");
				        $("#user_pw").focus();
				    });
			       
			       return false;
			} 
			  
			// 회원등록여부확인
			$.ajax({
				url : '<%=request.getContextPath()%>/memberIdCheck.do',
				data : { "user_id" : inputId },
				dataType : 'json',
				success : function(result){
					if(result == "OK"){
						$("#idChkResult").html("미등록 ID");
						alert("미등록 회원입니다. 회원가입을 진행해주세요!");
						return false;
					} else {	
						// 로그인 성공시 폼제출
						form1.submit();
					} 
				},
				error : function(xhr){
					alert("status : "+xhr.status);
				}
					
			})	//ajax닫기 
			
		})
		
	})
	
	function showLoginFailureAlert() {
		alert("로그인에 실패하였습니다. 아이디와 비밀번호를 다시 확인하세요.");
	}

</script>
<style type="text/css">
#toMain {
text-align:right; 
padding-right:20px;
color: #d6d6d6;
}


#modalId {
	display : none;
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
}

#modalId button {
  display:inline-block;
  width:50px;
  margin-top: 30px;
  border: 2px solid #700ff0;
  color: #700ff0;
  
}

#modalId button:hover {
	color: #fff;
	background: #700ff0;
	border-color: #700ff0;
	font-weight: 700;
  
}

#modalId .modal_content {
  width:300px;
  margin:350px auto;
  padding:20px 10px;
  background:#fff;
  text-align: center;
  border-radius: 9px;
}

#modalId .modal_content img {
	width: 120px;
	margin-bottom: 15px;
}
#modalId .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}  

#modalPw {
	display : none;
	position:relative;
	width:100%;
	height:100%;
	z-index:1;
}

#modalPw button {
  display:inline-block;
  width:50px;
  margin-top: 30px;
  border: 2px solid #700ff0;
  color: #700ff0;
  
}

#modalPw button:hover {
	color: #fff;
	background: #700ff0;
	border-color: #700ff0;
	font-weight: 700;
  
}

#modalPw .modal_content {
  width:300px;
  margin:350px auto;
  padding:20px 10px;
  background:#fff;
  text-align: center;
  border-radius: 9px;
}

#modalPw .modal_content img {
	width: 120px;
	margin-bottom: 15px;
}
#modalPw .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}    

</style>




<%
	String error = (String)request.getAttribute("error");
	if(error != null){
		%>
		<script type="text/javascript">
			// 로그인 실패시 알림창 띄우기
			showLoginFailureAlert();
		</script>
		<%
	}
%>


</head>

<%
	// JSP문서에서의 세션은 'session'이라는 이름으로 저장되어 있다.
	// loginMember의 session은 처음은 null값저장
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");

%>

<body id="particles-js">

<%

	if(loginMember==null) {		//로그인이 안 된 상태
		
%>	


<div class="animated bounceInDown">
  <div class="container">
   
    <form name="form1" class="box" action="<%=request.getContextPath()%>/login.do" method="post">
    	<h6 id = "toMain"><a href="<%=request.getContextPath()%>/view/main/index.jsp">Main Page 이동 </a></h6>
      <h4>2U4U <span> CINEMA</span></h4>
      <h6>아이디, 비밀번호를 입력하신 후, <br>로그인 버튼을 눌러주세요.</h6>
      
        <input type="text" id="user_id" name="user_id" placeholder="ID를 입력하세요" autocomplete="off">
        
        <input type="password" name="user_pw" placeholder="Passsword를 입력하세요" id="user_pw" autocomplete="off">
       
        <input type="button" value="Login" id="btn1">
      </form>
      <div class="dnthave">
      	<a href="<%=request.getContextPath()%>/view/member/agree.jsp" class="">회원가입</a>
      	<span>|</span>
      	<a href="<%=request.getContextPath()%>/view/member/findId.jsp" class="" >아이디/비밀번호 찾기</a>
      </div>
 

</div>

<!-- 
<%		
	} else {	// 로그인이 되었을때

%>
	<a href="<%=request.getContextPath()%>/view/main/index.do">로그아웃</a>
<%

	} 

%>
 -->
 
 <!-- 아이디 확인 -->
 <div id="modalId">
    <div class="modal_content">
     <img src="<%=request.getContextPath() %>/images/2U4U로고.jpg" alt="2U4UCINEMA로고">
        <h4>ID를 입력하세요!</h4>
        <button type="button" id="modalId_close_btn">닫기</button>
       
    </div>
   
    <div class="modal_layer"></div>
</div>

<!-- 패스워드 확인 -->
 <div id="modalPw">
    <div class="modal_content">
     <img src="<%=request.getContextPath() %>/images/2U4U로고.jpg" alt="2U4UCINEMA로고">
        <h4>PW를 입력하세요!</h4>
        <button type="button" id="modalPw_close_btn">닫기</button>
       
    </div>
   
    <div class="modal_layer"></div>
</div>
 
 
 
</body>
</html>