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
    
    <script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script> 
    
    <script>
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

 	// html와 script가 로드되는 시점에서 발생 
	document.addEventListener('DOMContentLoaded', function () {
	
		 $('#agreeCheck').on('click',function(){
 			 
	 			vcheck1 = $('#jo_priv1').prop('checked');
	 			vcheck2 = $('#jo_priv2').prop('checked');
	 			
	 			console.log(vcheck1, vcheck2);
	 			
	 			if(vcheck1 && vcheck2) {
	 				window.location.href = 'join.jsp';
	 			} else {
	 				alert("모든약관에 동의해주세요!")
	 				return;
	 			}
	 	 		
	 	});
      
    });
 	
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
            <div class="tabpanel" role="tabpanel" id="tabpanel1" aria-labelledby="tab1">
                <div class="join_privacy po_relat">
                    <div class="border_bx">
                        <h3>2U4U 시네마 이용약관</h3>
                        <p>제 1 조 (목적)<br>
                            이 약관은 주식회사 2U4U Cinema(이하 “회사”)가 제공하는 서비스의 이용에 관한 회사와 서비스 이용자의 권리, 의무 및 책임사항, 기타 필요한 사항을
                            규정하는 것을 목적으로 합니다.<br>
                            <br>
                            제 2 조 (용어의 정의)<br>
                            이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                            1. “서비스”라 함은 퍼스널 컴퓨터, 스마트폰, 태블릿 등의 유무선 통신 단말기(이하 “단말기”)를 통해 회사가 회원에게 콘텐츠를 제공하는 서비스 및 이에 부수하는 일체의
                            서비스를 뜻합니다.<br>
                            2. “콘텐츠”라 함은 회사가 서비스에 접속한 회원에게 제공하는 이미지, 영상물, 텍스트, 오디오 등의 일체의 정보를 의미합니다.<br>
                            3. “회원”이라 함은 이 약관에 따라 회사와 서비스 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 자를 뜻합니다.<br>
                            4. “계정”이란 서비스 제공 환경이나 이용되는 단말기 등과 관계없이 유지되는 회원의 고유 식별단위를 뜻하며, 각 회원의 계정은 그 계정에 연결된 아이디에 의해
                            대표됩니다.<br>
                            5. “애플리케이션”이란 회사가 제공하는 프로그램으로서 회원이 서비스를 이용하기 위하여 단말기에 설치하여야 하는 프로그램 일체를 의미합니다.<br>
                            <br>
                            제 3 조 (약관의 공지와 변경)<br>
                            ① 회사는 이 약관의 내용을 회원이 알 수 있도록 서비스 내 또는 연결화면에 게시하거나 기타 회원에게 그 내용이 잘 전달될 수 있는 방법으로 공지합니다.<br>
                            ② 회사는 필요한 경우 관련 법령을 위반하지 않는 범위에서 이 약관을 개정할 수 있습니다. 회사가 약관을 변경하는 경우에는 변경사항을 시행일과 함께 명시하여 그 시행일 7일
                            전부터 제1항과 동일한 방법으로 회원에게 공지합니다. 그러나 만약 회원에게 불리한 내용으로 변경되는 경우라면 그 시행일 30일 전부터 공지하고, 이메일 발송, 서비스 내
                            쪽지 기능, 팝업 메뉴 등 합리적인 방법으로 각 회원에게 변경사항을 공지 또는 통지합니다.<br>
                            ③ 회사는 약관을 변경하는 경우 변경약관 공지 후 변경약관의 적용에 대한 회원의 동의 여부를 확인합니다. 만약 회사가 제2항의 공지 또는 통지를 하면서 회원이 변경약관에
                            대해 거부의 의사표시를 하지 않으면 동의한 것으로 보겠다는 뜻을 고지하였음에도 불구하고 회원이 변경약관의 시행일까지 거부의 의사표시를 하지 않는다면 그 회원은 변경약관의
                            적용에 동의한 것으로 볼 수 있습니다.<br>
                            ④ 회원이 변경약관의 적용에 동의하지 않는 경우 회사 또는 회원은 서비스 이용계약을 해지할 수 있습니다.<br>
                            <br>
                            제 4 조 (서비스 이용계약의 체결)<br>
                            ① 서비스 이용계약은 회원이 되고자 하는 자(이하 “신청인”)가 이 약관의 내용에 동의한 뒤 서비스 이용을 신청하고 회사가 그 신청을 승낙함으로써 체결됩니다. 신청인은
                            회사가 정한 양식에 따라 필수 정보를 입력하여야 하며, 신청인은 회사와 서비스 이용계약을 체결함에 따라 회원의 자격을 갖게 됩니다.<br>
                            ② 회사는 제1항에 따른 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 그러나 회사는 다음 각 호의 어느 하나에 해당하는 신청에 대해서는 승낙을 거절하거나 사후에
                            서비스 이용계약을 해지할 수 있습니다.<br>
                            1. 신청인이 이 약관에 의하여 이전에 회원 자격을 상실한 적이 있는 경우<br>
                            2. 신청서의 내용 중 전부 또는 일부를 허위로 기재하거나 미기재하는 등 이용 신청 요건을 충족하지 못한 경우<br>
                            3. 회사가 서비스를 제공하지 않는 국가에서 비정상적이거나 우회적인 방법을 통해 서비스를 이용하고 있거나 이용한 적이 있는 경우<br>
                            4. 관련 법령에서 금지하는 행위를 할 목적 등 부정한 목적으로 신청을 하는 경우<br>
                            5. 영리를 추구할 목적으로 서비스를 이용하고자 하는 경우<br>
                            6. 신청인의 귀책사유로 인하여 승낙이 불가능하거나 기타 회사가 규정한 제반 사항을 위반하여 신청한 경우<br>
                            7. 위 각 호에 준하는 사유로서 회사가 승낙하기에 부적절한 사유가 있다고 판단하는 경우<br>
                            <br>
                            ③ 회사는 회사의 설비에 여유가 없거나 특정 단말기의 지원이 어렵거나 기타 기술상 또는 업무상 장애가 있는 경우 그 사유가 해소될 때까지 제1항의 신청에 대한 승낙을 유보할
                            수 있습니다.<br>
                            ④ 제1항에 따른 신청을 승낙하기 위하여 회사는 외부 전문기관을 통하여 신청인의 실명확인 및 본인인증 등을 요청할 수 있습니다.<br>
                            <br>
                            제 5 조 (회원 정보의 변경)<br>
                            ① 회원은 서비스에 접속하여 언제든지 본인의 정보를 열람하고 회사가 정한 범위에서 이를 수정할 수 있습니다.<br>
                            ② 회원은 회원 정보가 변경되었을 경우 서비스에 접속하여 직접 수정하거나 이메일 등의 수단을 이용하여 회사에 그 변경사항을 통지하여야 합니다.<br>
                            ③ 회원이 제2항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.<br>
                            <br>
                            제 6 조 (개인정보의 보호 및 사용)<br>
                            ① 회사는 관련 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위하여 노력합니다.<br>
                            ② 회사는 서비스의 제공에 필요한 범위에서 회원의 동의를 얻어 회원의 개인정보를 수집할 수 있고 회원이 동의한 범위 내에서 이를 사용할 수 있습니다. 개인정보의 보호 및
                            사용에 관해서는 관련 법령 및 회사의 개인정보처리방침에 따릅니다.<br>
                            ③ 회사는 회원의 귀책사유로 개인정보가 유출되어 발생한 피해에 대하여 책임지지 않습니다.<br>
                            <br>
                            제 7 조 (회사의 의무)<br>
                            ① 회사는 관련 법령과 이 약관 및 회사가 정한 운영방침을 준수하며, 회원에 대한 권리 행사 및 의무 이행에 있어 신의에 따라 성실하게 회원을 대합니다.<br>
                            ② 회사는 회원이 계속적이고 안정적으로 서비스를 이용할 수 있도록 서비스 제공 및 품질 개선, 회원의 개인정보 보호에 최선을 다합니다.<br>
                            <br>
                            제 8 조 (회원의 의무)<br>
                            ① 회원은 서비스 이용과 관련하여 다음 각 호에 해당하는 행위를 해서는 안 됩니다.<br>
                            1. 이용 신청 또는 회원 정보 변경 시 허위의 사실을 기재 또는 입력하는 행위<br>
                            2. 타인(회사의 직원 포함)을 사칭하거나 타인의 정보를 도용하는 행위<br>
                            3. 회사의 동의 없이 콘텐츠의 전부 또는 일부를 무단으로 변경, 복제하거나 전송하는 등 회사와 기타 제3자의 저작권 등 지적재산권을 침해하는 행위<br>
                            4. 회사와 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
                            5. 외설적, 폭력적 또는 사행적인 내용의 문자, 화상, 음성 기타 공서양속에 반하는 정보를 서비스에 공개 또는 개시하는 행위<br>
                            6. 회사의 동의 없이 서비스를 영리, 홍보, 정치활동, 선거운동 등의 목적으로 이용하는 행위<br>
                            7. 회사가 정한 기술적 제한을 우회하거나 무력화하려는 시도<br>
                            8. 회사의 동의 없이 애플리케이션을 변경하거나, 애플리케이션 또는 서비스와 관련된 서버에 대한 해킹, 역설계 등을 통해 회사가 공개하지 않은 정보를 취득하는 행위 및
                            그러한 정보를 전파하는 행위<br>
                            9. 그 밖에 관련 법령에 위반되거나 공서양속에 반하는 행위<br>
                            ② 회원의 계정 및 애플리케이션이 설치된 단말기에 대한 관리 책임은 회원에게 있으며, 회원이 그러한 관리를 소홀히 하거나 타인에게 자신의 계정을 이용하도록 허락하여 발생하는
                            손해에 대하여 회사는 책임지지 않습니다.<br>
                            <br>
                            제 9 조 (서비스의 제공 및 변경)<br>
                            ① 서비스를 이용하고자 하는 회원은 애플리케이션 등을 통해 ID와 비밀번호를 입력하여 자신의 계정으로 서비스에 접속하여야 합니다.<br>
                            ② 회사는 연중무휴, 1일 24시간 무료로 서비스를 제공하는 것을 원칙으로 합니다.<br>
                            ③ 회사는 대한민국 내에서만 서비스를 제공하는 것을 원칙으로 합니다. 따라서 회원은 회사가 허용할 수 있는 일부 예외적인 경우를 제외하고는 해외에서 서비스를 이용할 수
                            없습니다.<br>
                            ④ 회사는 시설의 보수점검, 교체 및 고장, 통신두절, 버그ㆍ오류의 수정, 긴급 업데이트, 그 밖에 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수
                            있습니다.이 경우 회사는 회원에게 서비스 제공 중단을 합리적인 방법으로 사전에 공지 또는 통지하지만, 사전 공지 또는 통지가 불가능한 부득이한 사유가 있는 경우에는 사후에
                            공지 또는 통지할 수 있습니다.<br>
                            ⑤ 회사는 제공되는 콘텐츠, 회원의 등급이나 연령 등에 따라 차등을 두거나 이용 기간 및 시간을 달리하여 서비스를 제공할 수 있습니다.<br>
                            ⑥ 회사는 운영상 또는 기술상의 필요, 서비스의 품질 개선 등 상당한 이유가 있는 경우에 서비스 및 서비스 제공에 필요한 서버나 애플리케이션 등을 변경할 수 있습니다. 관련
                            법령에 특별한 규정이 없는 한 회사는 이러한 변경에 대하여 회원에게 별도의 보상을 하지 않습니다.<br>
                            <br>
                            제 10 조 (정보의 수집)<br>
                            회사는 원활하고 안정적인 서비스 운영, 서비스의 품질 개선, 효율적인 광고의 제공, 서비스 통계 등을 위하여 필요한 범위에서 단말기의 기기정보, 회원의 서비스 이용내역 등의
                            정보를 수집할 수 있으며,회원은 회사가 그와 같은 목적으로 회원의 정보를 수집할 수 있다는 데에 동의합니다. 그러나 회사는 서비스와 무관한 이익을 추구할 목적으로 그러한
                            정보를 수집, 사용 또는 제3자에게 제공하지 않습니다.<br>
                            <br>
                            제 11 조 (광고 및 정보의 제공)<br>
                            ① 서비스를 통해 회원에게 제공되는 콘텐츠에는 광고가 포함될 수 있습니다.<br>
                            ② 회사는 광고주와 회원 간에 발생할 수 있는 분쟁에 관여하지 않습니다.<br>
                            ③ 회사는 서비스 운영에 필요한 사항 및 회원의 서비스 이용에 필요하거나 도움이 되는 사항에 관한 다양한 정보를 공지사항이나 이메일, SMS, 서비스 내 쪽지나 팝업 메뉴,
                            푸시 메시지 등의 방법으로 회원에게 제공할 수 있습니다.<br>
                            ④ 회원은 콘텐츠에 포함된 광고를 임의로 삭제하거나 변경하는 행위, 제3항에 따른 회사의 정보 제공을 방해하는 행위를 해서는 안 되고, 그러한 행위를 시도해서도 안
                            됩니다.<br>
                            <br>
                            제 12 조 (회원의 게시물)<br>
                            ① 회사는 회원이 서비스 내에서 게시하거나 등록한 문자, 영상, 음성 또는 이들의 조합으로 이루어진 정보(이하 “게시물”)이 다음 각 호에 해당한다고 판단되는 경우에는 사전
                            통지 없이 그 게시물을 삭제하거나 이동 또는 등록 거부를 할 수 있으며, 그러한 게시물의 양 또는 게시 횟수가 회사가 정한 기준을 초과하는 경우 서비스 이용계약을 해지할 수
                            있습니다.<br>
                            1. 다른 회원, 회사, 기타 타인을 비방하거나 명예를 손상시키는 내용인 경우<br>
                            2. 공공질서와 미풍양속에 위반되는 내용이거나 그러한 내용으로 연결되는 링크를 포함하는 경우<br>
                            3. 회사 또는 제3자의 저작권 기타 법적으로 보호되는 권리를 침해하는 내용인 경우<br>
                            4. 범죄행위와 결부된 것으로 인정되는 경우<br>
                            5. 영리를 목적으로 하는 광고 또는 홍보를 내용으로 하는 경우<br>
                            6. 회사의 정상적인 서비스 운영을 방해하는 경우<br>
                            7. 회사에서 정한 게시물 원칙에 어긋나거나, 게시판의 성격에 부합하지 않는 경우<br>
                            8. 기타 관계 법령에 위반된다고 판단되는 경우<br>
                            ② 회원의 게시물이 정보통신망법, 저작권법 등 관련 법령에 위반되는 내용을 포함하는 경우, 권리자는 관련 법령이 정한 절차에 따라 해당 게시물의 게시 중단 또는 삭제 등을
                            요청할 수 있으며, 이러한 요청에 대하여 회사는 관련 법령에 따른 조치를 취합니다.<br>
                            <br>
                            제 13 조 (권리의 귀속 및 이용허락)<br>
                            ① 서비스와 콘텐츠에 대한 저작권 기타 지적재산권은 회사에 귀속합니다.<br>
                            ② 회원의 게시물에 대한 저작권은 그 게시물을 작성한 회원에게 귀속합니다. 그러나 콘텐츠의 전부 또는 일부를 직접 표시하거나 재생하는 게시물의 저작권은 회사에
                            귀속합니다.<br>
                            ③ 회사는 회원에게 콘텐츠를 감상 이외의 다른 어떠한 방법으로도 이용하는 것을 허락하지 않습니다. 따라서 회원은 회사의 허락 없이 콘텐츠의 전부 또는 일부를 변경하거나
                            캡쳐하거나 타인에게 전송하는 등의 행위를 할 수 없습니다.<br>
                            ④ 회사는 서비스의 원활한 제공 및 품질 향상을 위해 회원의 게시물을 수집, 분석하여 이용할 수 있습니다.<br>
                            <br>
                            제 14 조 (계약의 해지 및 이용 제한)<br>
                            ① 회원은 언제든지 회사의 고객센터에 신청하거나 서비스 내 메뉴 등을 통하여 서비스 이용계약을 해지할 수 있습니다.<br>
                            ② 회사는 회원이 제8조 제1항 또는 제11조 제4항을 위반한 경우, 혹은 그 밖에 이 약관에서 해지할 수 있는 것으로 정한 사유에 해당하는 경우, 그 회원과의 서비스
                            이용계약을 해지하거나 그 회원의 서비스 이용을 제한할 수 있습니다.<br>
                            ③ 서비스 이용계약이 해지된 회원은 회사와 재계약하지 않는 이상 회사가 제공하는 서비스를 이용할 수 없고, 서비스 이용계약이 해지된 회원의 게시물은 즉시 또는 회사가 정한
                            시기에 서비스 내에서 삭제될 수 있습니다.<br>
                            ④ 회사는 규정에 의하여 서비스의 이용을 제한한 회원에게 그 사유 및 제한기간을 통지하여야 하며, 회원은 그러한 통지를 받은 날로부터 7일 이내에 회사에 이의를 신청할 수
                            있습니다. 회원의 이의가 정당하다고 판단하는 경우 회사는 그 회원이 서비스 이용을 재개할 수 있도록 조치합니다.<br>
                            <br>
                            제 15 조 (책임 및 보증의 부인)<br>
                            ① 회사는 콘텐츠의 제공과 관련하여서는 관련 법령에서 정하는 경우를 제외하고는 회원에게 어떠한 책임도 부담하지 않습니다.<br>
                            ② 회사는 천재지변 또는 이에 준하는 불가항력 기타 회사의 책임 없는 사유로 인한 손해에 대해서는 책임지지 않습니다.<br>
                            ③ 회사는 회원의 귀책사유로 인해 발생한 손해에 대해서는 책임지지 않습니다.<br>
                            ④ 회사는 회원의 게시물 및 콘텐츠에 포함된 광고의 신뢰성, 정확성, 적법성, 안정성 등을 보증하지 않고 그와 관련된 책임도 지지 않습니다.<br>
                            ⑤ 회사는 회원간 또는 회원과 광고주 기타 제3자 사이의 분쟁 발생으로 인한 책임 및 그러한 분쟁에 관여할 책임이 없습니다.<br>
                            <br>
                            제 16 조 (준거법 및 재판관할)<br>
                            ① 이 약관의 해석 및 이 약관에 관한 분쟁에 적용되는 준거법은 대한민국법입니다.<br>
                            ② 회사와 회원간에 발생한 분쟁에 관한 소송의 제1심 전속관할은 제소 당시의 회원의 주소에 의하고, 주소가 없는 경우 거소에 의하며, 주소와 거소가 모두 불분명한 경우에는
                            민사소송법에 따라 관할 법원을 정합니다.<br>
                            <br>
                            [부 칙]<br>
                            (시행일) 이 약관은 2023. 07. 25.부터 적용됩니다.
                        </p>
                    </div>
                    <div class="jo_chk po_absol">
                        <input type="checkbox" id="jo_priv1" name="jo_priv1" value="2U4U 시네마 이용약관 동의">
                        <label for="jo_priv1" class="jo_fz">2U4U 시네마 이용약관에 동의 <span>(필수)</span></label>
                    </div>
                </div>
                <div class="join_privacy po_relat">
                    <div class="border_bx">
                        <h3>개인정보 수집 및 이용약관</h3>
                        <p>제1조(목적)<br>
                            본 회원약관은 2U4U Cinema(이하 '갑'라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'라
                            한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.<br>
                            <br>
                            제2조 (약관의 효력)<br>
                            1.본 약관은 '갑'에 회원 가입 시 회원들에게 통지함으로써 효력을 발생합니다.<br>
                            2.'갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.<br>
                            3.약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시합니다.<br>
                            <br>
                            제3조 (약관 이외의 준칙)<br>
                            이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따릅니다.<br>
                            <br>
                            제4조 (이용계약의 체결)<br>
                            회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.<br>
                            <br>
                            제5조 (용어의 정의)<br>
                            이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                            1.회원: '갑'과 서비스 이용에 관한 계약을 체결한 자<br>
                            2.아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합<br>
                            3.비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합<br>
                            <br>
                            제6조 (이용신청)<br>
                            1.회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있습니다.<br>
                            2.가입희망 회원은 반드시 자신의 본명 및 주민등록번호로 이용신청을 하여야 하며, 1개의 ID만 신청을 할 수 있습니다.<br>
                            <br>
                            제7조 (회원가입의 승낙)<br>
                            '갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.<br>
                            <br>
                            제8조(회원가입 신청거절 및 강제 탈퇴)<br>
                            1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.<br>
                            2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 회손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수
                            있다.<br>
                            <br>
                            제9조 (서비스 제공의 중지)<br>
                            '갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있습니다.<br>
                            1.설비의 보수 등을 위하여 부득이한 경우<br>
                            2.전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우<br>
                            3.기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.<br>
                            <br>
                            제10조 ('갑'의 의무)<br>
                            1. '갑'은 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.<br>
                            2.'갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 합니다.<br>
                            <br>
                            제11조 (개인정보보호)<br>
                            1.'갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집합니다.<br>
                            2.제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '갑'이 집니다. 다만, 다음의 경우에는 예외로
                            합니다.<br>
                            ①통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우<br>
                            ②전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우<br>
                            ③범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우<br>
                            ④기타 관계법령에서 정한 절차에 따른 요청이 있는 경우<br>
                            3.회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리합니다.<br>
                            <br>
                            제12조 (회원의 의무)<br>
                            1.회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안됩니다.<br>
                            2.회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.<br>
                            3.회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수
                            없습니다.<br>
                            4.회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 합니다.<br>
                            5.회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.<br>
                            ①다른 회원의 아이디(ID)를 부정 사용하는 행위<br>
                            ②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위<br>
                            ③선량한 풍속, 기타 사회질서를 해하는 행위<br>
                            ④타인의 명예를 훼손하거나 모욕하는 행위<br>
                            ⑤타인의 지적재산권 등의 권리를 침해하는 행위<br>
                            ⑥해킹행위 또는 컴퓨터바이러스의 유포행위<br>
                            ⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위<br>
                            ⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위<br>
                            ⑨기타 관계법령에 위배되는 행위<br>
                            ⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위<br>
                            <br>
                            제13조 (게시물 또는 내용물의 삭제)<br>
                            '갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있습니다.<br>
                            <br>
                            제14조 (게시물에 대한 권리·의무)<br>
                            게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.<br>
                            <br>
                            제15조 (양도금지)<br>
                            회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br>
                            <br>
                            제16조 (계약해지 및 이용제한)<br>
                            1.회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자 우편을 통하여 해지하고자 하는 날의 1일전까지 (단, 해지일이 법정 공휴일인 경우 공휴일 개시
                            2일전까지)이를 '갑'에게 신청하여야 합니다.<br>
                            2.'갑'은 해지 및 탈퇴를 한 회원이 다시 이용신청을 하는 경우 일정기간 그 승낙을 제한할 수 있습니다.<br>
                            <br>
                            제17조 (면책·배상)<br>
                            1.'갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 회원은 자기의 책임아래 서비스를 이용하며,
                            서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은
                            회원에게 있습니다.<br>
                            2.'갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의
                            이용과<br>
                            관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.<br>
                            3.회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.<br>
                            4.회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이
                            약관을 위반한 회원은 '갑'에게 발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 합니다.<br>
                            <br>
                            제18조 (분쟁의 해결)<br>
                            1.'갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br>
                            2.1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 합니다.<br>
                            <br>
                            부 칙<br>
                            제 1 조 (시행일) 이 약관은 2023년 07월 24일부터 시행한다.
                        </p>
                    </div>
                    <div class="jo_chk po_absol">
                            <input type="checkbox" id="jo_priv2" name="jo_priv2" value="개인정보 수집 및 이용약관 동의">
                            <label for="jo_priv2" class="jo_fz">개인정보 수집 및 이용약관에 동의 <span>(필수)</span></label>
                        </div>
                </div>
                <br>
                <button type="button" id="agreeCheck">다음</button>
                
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