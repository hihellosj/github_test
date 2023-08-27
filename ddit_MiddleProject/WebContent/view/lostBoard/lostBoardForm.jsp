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
<title>고객센터 : 분실물게시판</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/lost.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/csss/customerservice.css">
	
    
    <!-- 파비콘 -->
    <link rel="icon" href="#">
    
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
 	
	$(function(){
		   var qnaboard = document.getElementById("qnaboard");
		   var adminqna = document.getElementById("adminqna");
		   
			   if ("<%=admin%>" !== "admin") {
			      adminqna.style.display = "none";
		     	  qnaboard.style.display = "block";
			      
			   }

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
	    
	    var charCountElement = document.getElementById("charCount"); 
	    
	    function countCharacters() {
	        var textarea = document.getElementById("lostcont");
	        var charCountElement = document.getElementById("charCount");
	        var maxLength = parseInt(textarea.getAttribute("maxlength"));
	        var currentLength = textarea.value.length;
	        
	        charCountElement.textContent = currentLength;
	    }
	    
	    
	    
	$(function(){    
		$('#send').on('click', function() {
			if ($("#lostdate").val() == "") {
				alert("분실일자를 입력하세요");
				$("#lostdate").focus();
				return false;
			}
			if ($("#user_name").val() == "") {
				alert("이름을 입력하세요");
				$("#user_name").focus();
				return false;
			}
			if ($("#user_phone").val() == "") {
				alert("핸드폰번호를 입력하세요");
				$("#user_name").focus();
				return false;
			}
			if ($("#user_mail").val() == "") {
				alert("메일을 입력하세요");
				$("#user_mail").focus();
				return false;
			}
			if ($("#losttitle").val() == "") {
				alert("제목을 입력하세요");
				$("#losttitle").focus();
				return false;
			}
			if ($("#lostcont").val() == "") {
				alert("내용을 입력하세요");
				$("#lostcont").focus();
				return false;
			}	
			
			// 'lostcont' 텍스트영역 내의 줄바꿈 문자를 <br> 태그로 바꿈
	        var textarea = document.getElementById("lostcont");
	        textarea.value = textarea.value.replace(/\n/g, "<br>");
			
			var agreeValue = $('input[name="agree"]:checked').val();
		        
			if (agreeValue === "동의함") {
		            lostForm.submit();
		            alert("분실물문의글 접수가 완료되었습니다.");
		    } else {
		            alert("개인정보 수집에 동의해야 등록할 수 있습니다.");
		    }
		});
        
	})//$function   
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
    
 <style>
  
    #red{
    	color:red;
    }
    
    #qnaboard{
 		display : none;
	}
	
	input{
		-webkit-appearance: auto;
	}
	
	.questionTxt2
	{
  	  	width:920px;
	}
	
	#lostForm{
		width: 920px;
	}
	#lostForm tr{
		border: none;
	}
	
    
 </style>
    
</head>

<body>

<body>
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
					<li class="fl_left">
						<a id="loginButton" href="<%=request.getContextPath()%>/login.do" >로그인</a>
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
					<li class="fl_left">
					<a href="<%=request.getContextPath()%>/boardList.do">고객센터</a></li>
				</ul>
			</div>
            <nav id="gnb" class="txt_cen cle_both:after">
                <ul>
                     <li class="nav_Menu"><a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp">예매</a></li>
                    <li class="nav_Menu"><a href="<%=request.getContextPath() %>/movieListMain.do">영화</a></li>
                    <li class="nav_Menu"><a href="<%=request.getContextPath() %>/view/cinema/cinema.jsp">영화관</a></li>
                    <li class="nav_Menu"><a href="<%=request.getContextPath() %>/feedList.do">커뮤니티</a></li> 
                   <%
                   System.out.print(request.getContextPath()); %>
                </ul>
            </nav>
        </div>
    </header>


<div id="container" style="margin-top: 150px;">
<div id="contents">
            <div class="cs_title">
            	<a href=""><h3>고객센터
            	<span>무엇을 도와드릴까요?</span>
            	</h3></a>
            </div>
            <div class="category_menu">
                <div class="category_coSntents_wrap">
                    <ul class="category_content">
                        <li id="cm1" name="categorymenu" class="">
                            <a href="<%=request.getContextPath()%>/boardList.do">FAQ</a>
                        </li>
                        <li id="cm2" name="categorymenu" class="">
                            <a href="<%=request.getContextPath()%>/board/*">공지사항</a>
                        </li>
                        <li id="cm3" name="categorymenu" class="">
                            <a id="qnaboard" href="<%=request.getContextPath()%>/view/onetooneBoard/qnaForm.jsp">1:1문의</a>
                            <a id="adminqna" href="<%=request.getContextPath()%>/QnAboardList.do">1:1문의</a>
                        </li>
                        <li id="cm5" name="categorymenu" class="active">
                            <a href="<%=request.getContextPath() %>/view/lostBoard/lostBoardForm.jsp">분실물문의</a>
                        </li>
                    </ul>
                </div>
            </div>
	<div class="questionTxt">
		<p>2U4U CINEMA에서 잃어버린 물건이 있다면 ‘분실물 문의/접수’를 통해 접수해주세요.</p>
		<p>담당자 확인 후 신속히 답변을 드리겠습니다.</p>
		
	</div>
	<div style="padding-left: 42px;">
	<strong>개인정보 수집에 대한 동의</strong>
	
	<div id="agreementTxt">
		<p>
                귀하께서 문의하신 다음의 내역은 법률에 의거 개인정보 수집.이용에 대한 본인동의가 필요한 항목입니다.<br><br>

                개인정보의 수집 및 이용목적<br>
                회사는 분실물 문의내역의 확인, 요청사항 처리 또는 완료 시<br>
                원활한 의사소통 경로 확보를 위해 수집하고 있습니다.<br><br>

                수집하는 개인정보의 항목<br>
                이름, 연락처, 이메일 주소<br><br>

                개인정보의 보유기간 및 이용기간<br>
                문의 접수 ~ 처리 완료 후 6개월<br>
                (단, 관계법령의 규정에 의하여 보존 할 필요성이 있는 경우에는 관계 법령에 따라 보존)<br>
                자세한 내용은 '개인정보 처리방침'을 확인하시기 바랍니다.<br>
		</p>
	</div>
	</div>
	<div class="questionTxt2 po_relat">
	<strong>
		개인정보 수집에 동의하십니까?
		<span id="radioWrap" class="po_absol">
			<input type=radio value="동의함" name="agree" id="agree1" checked><label for="agree1">동의함</label>
			<input type=radio value="동의안함" name="agree" id="agree2"><label for="agree2">동의안함</label>
		</span>
		<br>
	</strong>
	<strong>
		원활한 서비스 이용을 위한 최소한의 개인정보이므로 동의하지 않을 경우 서비스를 이용하실 수 없습니다.
	</strong>
 	</div>

	<form id="lostForm" method="post" action="<%=request.getContextPath()%>/lostboardWrite.do">
		<table>
			<h3 style="text-align: center;" >분실물 문의 작성폼</h3>
			<colgroup>
				<col class="wid140">
		
			</colgroup>
			
			<p id="red" style="margin-left: 30px;">* 필수</p>
			
			<tbody>
				<tr>
					<th scope="row" id="quesLocation">
						<label for="place">분실장소</label> <em class="font-orange">*</em>
					</th>
					<td>
						<p>2U4U CINEMA</p>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="lostdate">분실일자</label> <em class="font-orange">*</em></th>
					<td><input type="date" name="lostdate" id="lostdate"></td>
				</tr>
				
			
				<tr>
					<th scope="row" id="quesName">
						<label for="name">이름</label> <em class="font-orange">*</em>
					</th>
					<td headers="quesName">
						<input type="hidden" name="user_id" id="user_id" value=<%=vo.getUser_id() %>>
						<input type="text" name="user_name" id="user_name" value=<%=vo.getUser_name() %>>
					</td>
				</tr>
				<tr>
					<th scope="row" id="quesTel">
					<label for="tel">연락처</label> <em class="font-orange">*</em>
					</th> 
					<td headers="quesTel">
						<input type="text" name="user_phone" id="user_phone" value=<%=vo.getUser_phone() %>>
					</td>
				</tr>
				<tr>	
					<th scope="row" id="quesEmail">
						<label for="email">이메일</label> <em class="font-orange">*</em>
					</th>
					<td headers="quesEmail">
						<input type="text" name="user_mail" id="user_mail" value=<%=vo.getUser_mail() %>>
					</td>
				</tr>
				
				<tr>
					<th scope="row" id="quesTitle">
						<label for="quesTit">제목</label> <em class="font-orange">*</em>
					</th>
					<td colspan="3" headers="quesTitle">
						<input type="text" name="losttitle" id="losttitle">
					</td>
				</tr>
				
				<tr>
					<th scope="row" id="quesContent">
						<label for="quesTarea">내용</label> <em class="font-orange">*</em>
					</th>
					<td colspan="3" headers="quesContent">
					<textarea name="lostcont" id="lostcont" cols="100" rows="10" maxlength="2000" title="내용입력"
						placeholder=
						"※ 문의 내용에 개인정보(이름, 연락처, 카드번호 등)가 포함되지 않도록 유의하시기 바랍니다.
※ 분실장소와 분실물에 대한 상세 정보를 작성해주시면 분실물을 찾는데 도움이 됩니다.
- 관람 영화정보(영화제목, 상영 회차, 상영시간 등) :
- 좌석/장소 정보 :
- 분실물 상세정보"
						class="input-textarea" oninput="countCharacters()"></textarea>
						<p>
							<span id="charCount">0</span>/2000자
						</p>
					</td>
				</tr>
				<tr>
					<td class="txt_cen" colspan="4">
						<input type="button" value="등록" id="send">
					</td>
				</tr>
			</tbody>
		</table>
    </form>
    </div>
   </div>
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