<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

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

    <meta charset="utf-8">
    <title>2U4U시네마 : Join Us</title>
    
    
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/join.css">
    
    <!-- 파비콘 -->
<!--     <link rel="icon" href="#"> -->
    
    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,
    900&display=swap&subset=korean" rel="stylesheet">
   
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/tab.js"></script>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script src="<%=request.getContextPath() %>/js/join.js"></script>
    
    <script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script> 
    
    <script>
 	
   

		
		
   
 	$(function(){  
 		// 아이디 중복검사 이벤트
 		$('#idCheck').on('click',function(){
 			// 입력한 id값을 가져온다.
 			var inputId = $('#user_id').val().trim();
 			
 			// 입력여부확인
 			if(inputId==""){
 				alert("ID를 입력하세요!!!");
 				return;	// 기본값 false
 			}
 			
 			$.ajax({
 				url : '<%=request.getContextPath()%>/memberIdCheck.do',
 				data : { "user_id" : inputId },
 				dataType : 'json',
 				success : function(result){
 					if(result == "OK"){
 						/*$("#idChkResult").html("사용가능한 ID").css('color','red');*/
 						$("#idChkResult").html("사용가능한 ID");
 					} else if(result == "Fail"){
 						/*$("#idChkResult").html("ID 중복 - 사용불가").css('color','red');*/
 						$("#idChkResult").html("ID 중복 - 사용불가");
 					}
 				},
 				error : function(xhr){
 					alert("status : "+xhr.status);
 				}
 				
 			})	//ajax닫기 
 			
 		}) //id체크 닫기
 		
 	}) // function종료
 	
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

    
 	// html와 script가 로드되는 시점에서 발생 - 핸드폰번호 (-) 자동삽입
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
    
	
	function isEmail(asValue) {
		// 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식 → 형식에 맞는 경우 true 리턴
		const regExp = /^[A-Za-z0-9]([-_.]?[A-Za-z0-9])*@[A-Za-z0-9]([-_.]?[A-Za-z0-9])*.[A-Za-z]{2,3}$/;
		return regExp.test(asValue);
	}
    
    function checkBirthdate(birthdate) {
        const regExp = /^[12][0-9]{3}[01][0-9][0-3][0-9]$/; // 숫자만 포함되는지 검사하는 정규 표현식
       	return regExp.test(birthdate);
//         if (regExp.test(birthdate)) {
//             return true; // 숫자로만 구성된 경우
//         } else {
//             return false; // 숫자 이외의 문자가 포함된 경우
//         }
    }
    
    //const userBirthdate = $('#user_birthday');

    /*
    if (checkBirthdate(userBirthdate)) {
        console.log("유효한 생년월일입니다.");
    } else {
        console.log("숫자 이외의 문자가 포함되었습니다.");
    
    }
    */
    
    document.addEventListener("DOMContentLoaded", function() {
        var btnGoTop = document.querySelector(".btn-go-top");
            
            btnGoTop.addEventListener("click", function(event) {
                event.preventDefault();
                
                window.scrollTo({
                    top: 0,
                    behavior: "smooth"
                });
            });

        	    window.addEventListener("scroll", function() {
                if (window.scrollY > 0) {
                    btnGoTop.style.display = "block"; // Show the button
                } else {
                    btnGoTop.style.display = "none"; // Hide the button
                }
            });
        });
    </script>
    <style type="text/css">
    .quick-area {
    display: block;
    text-align: center;
}

 .btn-go-top {
     overflow: hidden; 
   display: block; 
    width: 40px; 
    height: 40px; 
     text-align: center; 
     line-height: 38px; 
     font-size: 24px; 
     border-radius: 50%; 
     background-color: #fff; 
    color: #fff; 
     box-shadow: 1px 1px 7px 0 rgba(0, 0, 0, .5); 
     text-decoration: none; 
     transition: opacity 0.3s ease-in-out;  
 } 

 .quick-area { 
    opacity: 1; 
    pointer-events: auto; 
    transition: opacity 0.4s; 
 } 

 .btn-go-top img {
 	margin-top:10px; 
     width: 12px; 
     height: 21px; 
 } 
    
    </style>
</head>

<body>
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
						<a  href="<%=request.getContextPath()%>/login.do">로그인</a>
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
                    <!--  
                    <li class="all_Menu"><a href="#sitemap"><img src="asset/images/common/icon_menu.gif" alt="전체메뉴보기"></a></li>
                    -->
                </ul>
            </nav>
        </div>
	</header>
	
	 <section id="join_content" class="po_relat">
        <div id="sub_m_tit" class="join_menu po_absol txt_cen">
            <h2>회 원 가 입</h2>
        </div>
        <div id="join_main">
            
            <div class="tabpanel txt_cen" role="tabpanel" id="tabpanel2" aria-labelledby="tab2">
                <form class="jo_form" id="jo_form" method="post"
                	action="<%=request.getContextPath() %>/memberInsert.do" >
                    <table>
                        <caption>아이디, 비밀번호, 생년월일, 이름 입력필수</caption>
                        <tbody id="join">
                            <tr class="tr1">
                                
                                <th id="join_uid" scope="row">
                                    <label for="uid">아이디</label>
                                </th>
                                <td headers="join_uid" colspan="3">
                                    <input type="text" id="user_id" name="user_id" maxlength="12">
                                    <button type="button" id="idCheck">중복확인</button>
                                <span id="idChkResult"></span>
                                </td>
                            </tr>
                            
                            <tr class="tr2">
                                <th scope="row">
                                    <label for="upw">비밀번호</label>
                                </th>
                                <td>
                                    <input type="password" id="user_pass" name="user_pw" minlength="6" maxlength="12">
                                    <p class="jo_fz">영어와 숫자로 6~12글자를 통해 구성해주세요.</p>
                                </td>
                                <th scope="row">
                                    <label for="upwchk">비밀번호 확인</label>
                                </th>
                                <td>
                                    <input type="password" id="user_pass2" name="user_pw2" minlength="6" maxlength="12">
                                </td>
                            </tr>
                            
                            <tr class="tr3">
                                <th scope="row">
                                    생년월일
                                </th>
                                <td>
                                	<input type="text" id="user_birthday" name="user_birthday" maxlength="8">
                                    <p class="jo_fz">YYYYMMDD 형식으로  작성해주세요.</p>
                                
                                </td>
                                <th scope="row">
                                    성별
                                </th>
                                <td>
                                    <input type="radio" id="gd_man" name="user_gender" value="남" checked>
                                    <label for="gd_man" class="jo_fz">남</label>
                                    <input type="radio" id="gd_woman" name="user_gender" value="여">
                                    <label for="gd_woman" class="jo_fz">여</label>
                           
                                </td>
                            </tr>
                            
                            <tr class="tr4">
                                <th scope="row">
                                    <label for="uname">이름</label>
                                </th>
                                <td>
                                    <input type="text" id="user_name" name="user_name" maxlength="8">
                                </td>
                                <th scope="row">
                                    <label for="unumber1">연락처</label>
                                </th>
                                 <td>
                                 
                                <input type="text" id="user_phone" name="user_phone" maxlength="13">
                                     <p class="jo_fz">
                                        <input type="checkbox" id="sms1" name="sms1" value="SMS 수신 동의">
                                        <label for="sms1" class="jo_fz">SMS 수신 동의</label>
                                    </p>
                                </td>
                                
                            
                            </tr>
                           <tr class="tr5">
                                <th scope="row">
                                    <label for="uemail">이메일</label>
                                </th>
                                <td colspan="3" scope="row">
                                    <input type="text" id="user_mail" name="user_mail">
                                   
                                    <!-- 
                                    <button type="button" onclick="emailSend()" id="emailCheck" class="boder_bx">인증요청</button>
                                    
                                    <input type="text" id="authNumber" placeholder="인증번호 입력" autocomplete="off">
									<button type="button" id="authBtn" onclick="emailAuth()">인증</button>
                                    <P>
                                     -->
                                     
                                    <input type="checkbox" id="sms2" name="sms2" value="SMS 수신 동의">
                                    <label for="sms2" class="jo_fz">SMS 수신 동의</label>
                                    </P>
									
                                </td>
                            </tr>
                        </tbody>
                        <tr class="join_member">
                            <th colspan="4">
                                <button type="button" onclick="sendit()" id="send" value="회원가입">회원가입</button>
                                <button type="reset" onclick="location.href='<%=request.getContextPath()%>/view/main/index.jsp'">취소</button>
                            </th>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>

	
	
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
            PL 송석원 &nbsp;DA 전수진 &nbsp;TA 신범종 &nbsp;AA 이수정 &nbsp;UA 박주연<br>
                    사업자 등록번호 111-22-33333 통신판매업신고번호 제 000호
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
<div class="quick-area" style="display: block; position: fixed; bottom: 20px; right: 7%;">
    	<a href="#" class="btn-go-top" title="top">
    		<img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="최상단으로 이동">
    	</a>
    	</div>
</body>

</html>