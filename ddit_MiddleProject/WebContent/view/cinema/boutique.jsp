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
    <title>상영관 : THE BOUTIQUE SUITE</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
<%--     <link rel="stylesheet" href="<%=request.getContextPath() %>/css/theater.css"> --%>
    
    <!-- 파비콘 -->
<!--     <link rel="icon" href="#"> -->
    
    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.bxslider.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/tab.js"></script>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=vyj3gi2ib2"></script>
    
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
  
    	
    </script>
<style type="text/css">
#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}

* {
    box-sizing: border-box;
}

div {
    display: block;
}

body {
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

.theater-detail-page {
    position: relative;
    z-index: 1;
    height: 190px;
    margin: 0;
    color: #ccc;
    background-color: #111;
}

div {
    display: block;
}

.theater-detail-page .bg-img {
    position: absolute;
    left: 50%;
    top: 0;
    z-index: 1;
    width: 1100px;
    margin: 0 0 0 -550px;
    height: 100%;
    background-position: center 0;
    background-repeat: no-repeat;
}

.theater-detail-page {
    color: #ccc;
}

.theater-detail-page .bg-pattern {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 2;
    width: 100%;
    height: 100%;
    background: url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-detail-pattern.png) repeat-x 0 0;
}

.theater-detail-page .bg-mask {
    position: absolute;
    left: 0;
    top: 0;
    z-index: 3;
    width: 100%;
    height: 100%;
    background: url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-detail-mask.png) no-repeat center 0;
}

.theater-detail-page .theater-specail.boutique .name {
    background-position: center 106px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/theater/bg-theater-boutique.png);
}

.theater-detail-page .theater-specail .name {
    overflow: hidden;
    display: block;
    height: 100%;
    margin: 0;
    padding: 0;
    font-size: 0;
    line-height: 0;
    background-repeat: no-repeat;
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
<section id="contents" class="no-padding">
	<div class="theater-detail-page">
		<div class="bg-img" style="background-image:url('https://img.megabox.co.kr/static/pc/images/theater/bg-detail-boutique.png');"></div>
		<div class="bg-pattern"></div>
		<div class="bg-mask"></div>
			<p class="name">부티크</p>		
	</div>
	<div class="theater-specail-cont">
		<div class="inner-wrap pt40">
			<div class="tab-list fixed mb40">
				
			</div>
		</div>
	</div>
</section>
     

    <div class="wid1920">
        <footer id="footer">
            <div class="footerbox">
                <h1 class="logo">
                    <a href="<%=request.getContextPath() %>/view/main/index.jsp">
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

</body>

</html>