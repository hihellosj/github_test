<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2U4U시네마 : Find ID</title>

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,
	900&display=swap&subset=korean" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    
    
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css">



<script>

//html와 script가 로드되는 시점에서 발생 - 핸드폰번호 (-) 자동삽입
document.addEventListener('DOMContentLoaded', function () {
	 document.getElementById("user_phone").addEventListener("keyup", function(event) {
            inputPhoneNumber(event.target);
      });
  
});
	
function inputPhoneNumber( phone ) {
    if( event.keyCode != 8 ) {
        const regExp = new RegExp( /^[0-9]{2,3}-^[0-9]{3,4}-^[0-9]{4}/g );
        if( phone.value.replace( regExp, "").length != 0 ) {                
            if( checkPhoneNumber( phone.value ) == true ) {
                let number = phone.value.replace( /[^0-9]/g, "" );
                let tel = "";
                let seoul = 0;
                if( number.substring( 0, 2 ).indexOf( "02" ) == 0 ) {
                    seoul = 1;
                    phone.setAttribute("maxlength", "12");
                    console.log( phone );
                } else {
                    phone.setAttribute("maxlength", "13");
                }
                if( number.length < ( 4 - seoul) ) {
                    return number;
                } else if( number.length < ( 7 - seoul ) ) {
                    tel += number.substr( 0, (3 - seoul ) );
                    tel += "-";
                    tel += number.substr( 3 - seoul );
                } else if(number.length < ( 11 - seoul ) ) {
                    tel += number.substr( 0, ( 3 - seoul ) );
                    tel += "-";
                    tel += number.substr( ( 3 - seoul ), 3 );
                    tel += "-";
                    tel += number.substr( 6 - seoul );
                } else {
                    tel += number.substr( 0, ( 3 - seoul ) );
                    tel += "-";
                    tel += number.substr( ( 3 - seoul), 4 );
                    tel += "-";
                    tel += number.substr( 7 - seoul );
                }
                phone.value = tel;
            } else {
                const regExp = new RegExp( /[^0-9|^-]*$/ );
                phone.value = phone.value.replace(regExp, "");
            }
        }
    }
}

function checkPhoneNumber( number ) {
    const regExp = new RegExp( /^[0-9|-]*$/ );
    if( regExp.test( number ) == true ) { return true; }
    else { return false; }
}


$(function(){
	$('#findid').on('click',function(){
		
		idform.submit();
	})

})
function showFindIdFailureAlert() {
	alert("입력한 이름과 전화번호를 다시 확인하세요.");
}
</script>
<style type="text/css">
#findIdMenu {
	border:0;
	width: 100px;
	height: 30px;
	font-size: 14px;
	font-weight: 550;
	background : #00ff0000;
	color: #9999ff;
	text-align: center;
}

#findPwMenu  {
	border:0;
	width: 100px;
	height: 30px;
	font-size: 14px;
	font-weight: 550;
	background : #00ff0000;
	color: #dfdeee;
	text-align: center;

}

#findPwMenu:hover, 
#findPwMenu:focus,
#findPwMenu:active {
	color: #9999ff;
	background: #00ff0000;
	
}

#toMain {
text-align:right; 
padding-right:20px;
color: #d6d6d6;
}


</style>

<%
	String error = (String)request.getAttribute("error");
	if(error != null){
		%>
		<script type="text/javascript">
			// 아이디 찾기실패시 알림창 띄우기
	
			showFindIdFailureAlert();
		</script>
		<%
	} 
%>

</head>
<%
	MemberVO findInfo = (MemberVO)session.getAttribute("findInfo");

%>

<body id="particles-js">
<%

	if(findInfo==null) {		//아이디찾기가 안된상태
		
%>


<div class="animated bounceInDown">
  <div class="container">
    <span class="error animated tada" id="msg"></span>
 	
 	
 	<form name="idform" class="box" method = "POST" action="<%=request.getContextPath() %>/findMemberId.do">
 		<h6 id = "toMain"><a href="<%=request.getContextPath()%>/view/main/index.jsp">Main Page 이동 </a></h6>
		<h4>2U4U <span> CINEMA</span></h4>
		<h5>아이디/비밀번호찾기</h4>
		
		<input id="findIdMenu" type="button" value="아이디 찾기" onClick="location.href='<%=request.getContextPath()%>/view/member/findId.jsp'">
		<input id="findPwMenu" type="button" value="비밀번호 찾기" onClick="location.href='<%=request.getContextPath()%>/view/member/findPw.jsp'">
		
	
			<input type="text" name="user_name" class = "btn-name" placeholder = "이름입력">
			<input type="text" name="user_phone" id="user_phone" class = "btn-phone" placeholder = "핸드폰 번호 '-'없이 입력">
				
			<div class ="btnSearch">
				<input type="button" value="찾기" id="findid">
				<input type="button" value="취소" id="cancle" onClick="location.href='<%=request.getContextPath()%>/view/member/login.jsp'">
		 	</div>
	 	</div>
			
 	</form>
 
 <%
	}

%>
 	</div>  
 </div>

</body>
</html>