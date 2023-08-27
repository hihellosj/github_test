<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	MemberVO vo=null;
	String loginInfo = null;
	String admin = null;
	if(session.getAttribute("loginMember")!=null){
		vo = (MemberVO)session.getAttribute("loginMember");
		loginInfo = vo.getUser_name();
		admin = vo.getAdmin();
	} 	
%>


<meta charset="UTF-8">
<title>마이페이지 : 회원정보 수정</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/update.css">
    
    <!-- 파비콘 -->
<!--     <link rel="icon" href="#"> -->
    
    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,
    900&display=swap&subset=korean" rel="stylesheet">
   
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.bxslider.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/tab.js"></script>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script src="<%=request.getContextPath() %>/js/join.js"></script>
    
    <script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script> 
    
    <script>
 	// html와 script가 로드되는 시점에서 발생 - 핸드폰번호 (-) 자동삽입
	document.addEventListener('DOMContentLoaded', function () {
		 document.getElementById("user_phone").addEventListener("keyup", function(event) {
	            inputPhoneNumber(event.target);
	      });
      
    });
 	
	// 로그인 여부 확인 및 버튼 표시/숨김 업데이트 함수
    function updateButtonDisplay() {
        var loginButton = document.getElementById("loginButton");
        var logoutButton = document.getElementById("logoutButton");
        var joinUsButton = document.getElementById("joinUsButton");
        var memberMypageButton = document.getElementById("memberMypage");
        var adminMypageButton = document.getElementById("adminMypage");
        
        var loginMember = "<%=loginInfo%>";

        if (loginMember == null || loginMember =="null") {
            loginButton.style.display = "block";
            joinUsButton.style.display = "block";
            logoutButton.style.display = "none";
            memberMypageButton.style.display = "none";
            adminMypageButton.style.display = "none";
        } else {
            loginButton.style.display = "none";
            joinUsButton.style.display = "none";
            logoutButton.style.display = "block";
            
         	// 관리자 여부에 따라 버튼 표시 여부 결정
            if ("<%=admin%>" == "admin") {
                memberMypageButton.style.display = "none";
                adminMypageButton.style.display = "block";
            } else {
                memberMypageButton.style.display = "block";
                adminMypageButton.style.display = "none";
            }
        }
    }
	
    // 페이지 로드 시 버튼 표시/숨김 업데이트 호출
    window.onload = function() {
        updateButtonDisplay();
    }; 

 	
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
    }// inputPhoneNumber 종료

    function checkPhoneNumber( number ) {
        const regExp = new RegExp( /^[0-9|-]*$/ );
        if( regExp.test( number ) == true ) { return true; }
        else { return false; }
    }
    
    
    $(function(){  
 		// 패스워드 변경 이벤트
 		$('#pwCheck').on('click',function(){
 			
 			/*
 			let userpw = $("#user_pass").val();     // 새비밀번호
 		    let userpw_re = $("#user_pass2").val(); // 새비밀번호 확인
 		    
 		   var inputPw = $('#user_pw').val().trim();
 			// 입력여부확인
 			if($('#user_pw').val().trim()==""){
 				alert("변경시 PW를 반드시 입력하세요!!!");
 				return;	// 기본값 false
 			}
 			
 		    if ($("#user_pass").val().length < 6 || $("#user_pass").val().length >= 12) {
 		        alert("패스워드는 6자 이상, 12자 미만으로 입력하세요!");
 		        $("#user_pass").focus();
 		        return false;
 		    }

 		    if (userpw != userpw_re) {
 		        alert("비밀번호가 일치하지 않습니다. 다시 확인하세요!");
 		        $("#user_pass2").focus();
 		        return false;
 		    }
 		    */
 		   var inputPw = $('#user_pw').val().trim();
 		    
 			$.ajax({
 				url : '<%=request.getContextPath()%>/memberPwCheck.do',
 				data : { "user_pw" : inputPw },
 				dataType : 'json',
 				success : function(result){
 					if(result == "OK"){		// PW일치시 출력X
 						$("#pwChkResult").html("PW 확인완료");
 					} else if(result == "Fail"){	//PW불일치 안내
 						$("#pwChkResult").html("PW 불일치");
 					}
 				},
 				error : function(xhr){
 					alert("status : "+xhr.status);
 				}
 				
 			});	//ajax닫기 
 			
 		}); //pw체크 닫기
 		
 		
    }) // 패스워드 변경 function종료
    
    function updateit() {
 		    
    	if($("#pwChkResult").html()=="PW 확인완료") {
    		
    		
    		let userpw = $("#user_pass").val();     // 새비밀번호
        	let userpw_re = $("#user_pass2").val(); // 새비밀번호 확인
     		
        	/*
        	if ($("#user_pass").val().length < 6 || $("#user_pass").val().length >= 12) {
            	alert("패스워드는 6자 이상, 12자 미만으로 입력하세요!");
            	$("#user_pass").focus();
            	return false;
            }
			*/
        	if (userpw != userpw_re) {
            	alert("비밀번호가 일치하지 않습니다. 다시 확인하세요!");
            	$("#user_pass2").focus();
            	return false;
            }
    		
    		
    		up_form.submit();
    		alert("회원 수정이 완료되었습니다.");
    	} else {
    		alert("비밀번호 검증을 진행해주세요!");
    	}
    	
    }
   
    
	$(function() {
	// 1. 탈퇴를 진행하시겠습니까?
	// 2. 탈퇴를 하시게 되면, 데이터는 절대 복구 불가능합니다.
	// 회원 탈퇴 버튼 클릭 시
    	    
		$("#delete").click(function() {
			if($("#pwChkResult").html()=="PW 확인완료") {
			
				if (confirm("탈퇴를 진행하시겠습니까?") && confirm("탈퇴를 하시게 되면, 데이터는 절대 복구 불가능합니다.")) {
				
					$.ajax({
						url: '<%=request.getContextPath()%>/memberDelete.do',
						data: { user_id: $('#user_id').val().trim() },
						method: 'GET', 
						dataType : 'json',
						success: function(result) {
							// 서버 응답 처리
							if (result === "OK") {
							alert("회원 탈퇴가 완료되었습니다.");
							// 삭제된 정보에 대한 처리 
							window.location.href = '<%=request.getContextPath()%>/view/main/index.jsp'
							} else if(result == "Fail") {
							 	alert("회원 탈퇴에 실패하였습니다.");
							 	
						 	}
						},
						error: function(xhr) {
							alert("status : "+xhr.status);
						}
					}); // ajax종료
				} //if문 종료
			
			} else {
	    		alert("비밀번호 검증을 진행해주세요!");
	    	}
		}); // 회원삭제 종료
	});
   
    
</script>
    
</head>
<body>
<%
MemberVO memVo=(MemberVO)request.getAttribute("memberVo");
System.out.println("페이지 회원정보 맞나여???-------------"+memVo);
%>

<div id="skip">
        <a href="#gnb">주메뉴 바로가기</a>
        <a href="#content2">본문바로가기</a>
    </div>

    <header id="header">
        <div id="header_wrap">
            <h1 class="logo fl_left">
                <a href="<%=request.getContextPath() %>/view/main/index.jsp">
                    <img src="<%=request.getContextPath() %>/images/2U4U로고.jpg" alt="2U4UCINEMA로고">
                </a>
            </h1>
            <div id="header_btn">
				<ul class="fl_right">
					<%-- 로그인 상태에 따라 버튼 표시 여부 결정 --%>
					<li class="fl_left" id="loginButton">
						<a  href="<%=request.getContextPath()%>/login.do" >로그인</a>
					</li>	
					<li class="fl_left" id="joinUsButton">
						<a href="<%=request.getContextPath()%>/view/member/agree.jsp">회원가입</a>
					</li>	
					<li class="fl_left" id="logoutButton" style="display: none;">
						<a href="<%=request.getContextPath()%>/logout.do">로그아웃</a>
					</li>
					<!-- 관리자여부에 따른 페이지  -->
					<li class="fl_left" id="memberMypage">
						<a  href="<%=request.getContextPath()%>/view/mypage/memberUpdate.jsp">마이페이지</a>
					</li>
					<li class="fl_left" id="adminMypage">
						<a href="<%=request.getContextPath()%>/allMemberList.do">마이페이지</a>
					</li>
					<li class="fl_left"><a href="<%=request.getContextPath()%>/view/lostBoard/lostBoardForm.jsp">고객센터</a></li>
				</ul>
			</div>
            <nav id="gnb" class="txt_cen cle_both:after">
                <ul>
                    <li class="nav_Menu"><a href="#">예매</a></li>
                    <li class="nav_Menu"><a href="#">영화</a></li>
                    <li class="nav_Menu"><a href="#">영화관</a></li>
                    <li class="nav_Menu"><a href="#">커뮤니티</a></li>
                  
                </ul>
            </nav>
        </div>
	</header>

<section>

    
        <div id="contents">
            <div id="update_tit">
                <form name="up_form" method="post" id="up_form" action="<%=request.getContextPath() %>/adminMemberUpdate.do">
                    <h2>회원 정보 수정</h2>
                    
                    
                    <div id="update_main">
                    
                        <table>
                            <tbody id="update">
                                <tr class="tr1">
                                    <th id="update_uid" scope="row">
                                        <label for="uid">아이디</label>
                                    </th>
                                    <td headers="up_uid" colspan="3" >
                                        <%=memVo.getUser_id() %>
	                                    <input type="hidden" id="user_id" name="user_id" value=<%=memVo.getUser_id() %>>
                                    </td>
                                </tr>

                                <tr class="tr2">
                                    <th id="update_name" scope="row">
                                        <label for="uname">이름</label>
                                    </th>
                                    <td headers="up_uname" colspan="3" >
                                    <input type="text" id="user_name" name="user_name" value=<%=memVo.getUser_name() %>>
                                    </td>
                                </tr>                     
                            </tbody>
                        </table>
                            
                        <table id="update_menu">
                            <tbody id="update">
                                <tr class="tr1">
                                    <th id="join_uid" scope="row">
                                        <label for="uid">현재 비밀번호</label>
                                    </th>
                                        <td headers="join_uid" colspan="3">
                                        <input type="password" id="user_pw" name="user_pw" maxlength="12">
                                        <button type="button" id="pwCheck">확인</button>
                                    	<span id="pwChkResult"></span>
                                    	<p class="jo_fz">회원정보 변경 및 탈퇴시 비밀번호 검증은 필수사항이오니, 반드시 진행바랍니다.</p>
                                    </td>
                                </tr>
                                                        
                                <tr class="tr2">
                                    <th scope="row">
                                        <label for="upw">새 비밀번호</label>
                                    </th>
                                    <td>
                                        <input type="password" id="user_pass" name="user_pass" minlength="6" maxlength="12">
                                        <p class="jo_fz">영어와 숫자로 6~12글자를 통해 구성해주세요.</p>
                                    </td>
                                </tr>
                                                            
                                <tr class="tr3">                                 
                                    <th scope="row">
                                        <label for="upwchk">새 비밀번호 확인</label>
                                    </th>
                                    <td>
                                        <input type="password" id="user_pass2" name="user_pass2" minlength="6" maxlength="12">
                                        <!--
                                        <button type="button" id="pwCheck">변경</button>
                                    	 -->
                                    </td>
                                </tr>
                                
                                <tr class="tr4">                       
                                    <th scope="row">
                                    <label for="unumber1">연락처</label>
                                    </th>
                                    <td>                           
                                        <input type="text" id="user_phone" name="user_phone" maxlength="13" value=<%=memVo.getUser_phone() %>>
                                    </td>           
                                </tr>

                                <tr class="tr5">
                                    <th scope="row">
                                        <label for="uemail">이메일</label>
                                    </th>
                                    <td scope="row">
                                        <input type="text" id="user_mail" name="user_mail" value=<%=memVo.getUser_mail() %>>
                                    
                                        <!-- //시간남으면 이메일 인증 진행  
                                        <button type="button" onclick="sendVerificationEmail()" class="boder_bx">본인인증</button>
                                                                        
                                        <input type="text" id="mailCheck" placeholder="인증번호 입력"	autocomplete="off">
                                        <button type="button" id="mailCheckButton">인증</button>
                                        -->   
                                    
                                    </td>
                                </tr>
                            </tbody>
                                <tr class="update_member">
                                    <th colspan="2">
                                    	<button type="button" onclick="updateit()" id="update">수정</button>
                                        <button type="reset" onclick="location.href='<%=request.getContextPath()%>/allMemberList.do'">취소</button>
                                    </th>
                                </tr>
                        </table>
                    </div><!--update_main 종료 -->
                </form><!--update_form 종료 -->
            </div><!--update_tit 종료 --> 

        </div><!-- contents 종료-->
    </div><!--container 종료-->

 </section> <!-- section 닫기 --> 
   <div class="wid1920">
        <footer id="footer">
            <div class="footerbox">
                <h1 class="logo">
                    <a href="index.html">
                        <img src="<%=request.getContextPath() %>/images/2U4U로고.jpg" alt="2U4U시네마 로고" style="width:180px;">
                    </a>
                </h1>
                <br>
                <ul class="cle_both">
                    <li>이용약관</li>
                    <li>채용정보</li>
                    <li>회사소개</li>
                    <li><a href="#">고객센터</a></li>
                    <li>제휴/광고/임대문의</li>
                    <li>개인정보처리방침</li>
                </ul>
                <address>
                    대전광역시 중구 오류동 2U4U CINEMA
                </address>
                <p>
            PL 송석원 &nbsp;DA 전수진 &nbsp;TA 신범종 &nbsp;AA 이수정 &nbsp;UI 박주연<br>
                    사업자 등록번호 555-55-55555 통신판매업신고번호 제 005호
                </p>
                <div class="footer_txt">
                    <strong>고객센터<br>1588 - 5555</strong>
                    <p class="copyR">
                        COPYRIGHT &copy; 2U4U CINEMA ALL RIGHT RESERVED.
                    </p>
                </div>
            </div>
        </footer>
       </div>
	</body>
</html>