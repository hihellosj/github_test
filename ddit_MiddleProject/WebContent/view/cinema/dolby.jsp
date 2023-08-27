<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<head>

	<meta charset="utf-8">
    <title>상영관 : DOLBY CINEMA</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    
    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.bxslider.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/tab.js"></script>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>

<style>
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
     
#contents.no-padding {
    padding-top: 0;
}

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
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}

html {
    -webkit-text-size-adjust: 100%;
}

.theater-detail-page {
    position: relative;
    z-index: 1;
    height: 190px;
    margin: 0;
    color: #ccc;
    background-color: #111;
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

.theater-detail-page .theater-specail {
    position: relative;
    z-index: 4;
    width: 1100px;
    height: 100%;
    margin: 0 auto;
    padding: 0;
}

.theater-detail-page .theater-specail.db .name {
    background-position: center 84px;
    background-image: url(https://img.megabox.co.kr/static/pc/images/theater/bg-theater-db.png);
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

p {
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.inner-wrap {
    width: 1100px;
    margin: 0 auto;
}

.pt40 {
    padding-top: 40px!important;
}

.inner-wrap:after, .inner-wrap:before {
    content: '';
    display: table;
}

.tab-list {
    position: static;
    width: 100%;
    background-color: rgba(255,255,255);
}

.mb40 {
    margin-bottom: 40px!important;
}

.tab-list:after, .tab-list:before {
    content: '';
    display: table;
}

.inner-wrap:after {
    clear: both;
}

.inner-wrap:after, .inner-wrap:before {
    content: '';
    display: table;
}

.theater-specail-cont .section .bg-wrap {
    padding: 0;
    background-color: #fff;
}

inner-wrap {
    width: 1100px;
    margin: 0 auto;
}

.inner-wrap:after, .inner-wrap:before {
    content: '';
    display: table;
}

.theater-specail-cont .tit-theater-special {
    position: relative;
    padding: 30px 0;
    border: 1px solid #d8d9db;
    text-align: center;
    background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-box-slash.png);
    border-radius: 10px;
}

.theater-specail-cont .tit-theater-special .tit {
    padding: 0;
    line-height: 1.1;
}

.theater-specail-cont p {
    margin: 0;
}

* {
    box-sizing: border-box;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.theater-specail-cont .tit-theater-special .tit em {
    display: block;
    padding: 0 0 10px 0;
    font-size: 1.8666em;
    color: #503396;
    font-weight: 700;
}

em {
    font-style: normal;
}

.theater-specail-cont .tit-theater-special .tit span.txt {
    font-size: 1em;
    color: #222;
    padding: 0;
}

.theater-specail-cont .tit-theater-special .tit span {
    display: block;
}

.theater-specail-cont .cont-theater {
    padding: 30px 0 0 0;
}

.theater-specail-cont .cont-theater .col-group {
    overflow: hidden;
    position: relative;
}

.theater-specail-cont .cont-theater .col-group.col-1 .col {
    float: none;
    width: 100%;
}

.theater-specail-cont .cont-theater .col-group .col {
    position: relative;
}

.theater-specail-cont .cont-theater .col-group .col .img1 {
    font-size: 0;
    line-height: 0'';
}

.theater-specail-cont p {
    margin: 0;
    padding: 0;
}

.inner-wrap:after {
    clear: both;
}

.inner-wrap:after, .inner-wrap:before {
    content: '';
    display: table;
}

.mt70 {
    margin-top: 70px!important;
}

.theater-specail-cont .section .bg-wrap.bg {
    padding: 70px 0;
    background-color: #f2f3f5;
}

.inner-wrap {
    width: 1100px;
    margin: 0 auto;
}

.inner-wrap:after, .inner-wrap:before {
    content: '';
    display: table;
}

.theater-specail-cont .cont-theater {
    padding: 30px 0 0 0;
}

.pt00 {
    padding-top: 0!important;
}

.theater-specail-cont .cont-theater .col-group.col-3 {
    margin-left: 0;
    text-align: center;
    padding: 0 47px;
}

.theater-specail-cont .cont-theater .col-group {
    overflow: hidden;
    position: relative;
}

.theater-specail-cont .cont-theater .col-group.col-3 .col {
    width: 335px;
    margin: 0;
}

.theater-specail-cont .cont-theater .col-group .col {
    position: relative;
    float: left;
}

.theater-specail-cont .cont-theater .col-group .col .img1 {
    font-size: 0;
    line-height: 0'';
}

.theater-specail-cont p {
    margin: 0;
    padding: 0;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.theater-specail-cont .cont-theater .col-group .col .bottom-txt {
    margin: 30px 0 0 0;
    color: #444;
    text-align: center;
}

.theater-specail-cont p {
    padding: 0;
}

.theater-specail-cont .cont-theater .col-group .col .bottom-txt strong {
    display: block;
    margin: 0 0 20px 0;
    font-size: 1.2em;
    color: #222;
}

.font-roboto.regular {
    font-weight: 400!important;
}

.font-roboto {
    font-family: Roboto,Dotum,'돋움',sans-serif!important;
}

.mt70 {
    margin-top: 70px!important;
}

.theater-specail-cont .section .bg-wrap {
    padding: 0;
    background-color: #fff;
}

.inner-wrap {
    width: 1100px;
    margin: 0 auto;
}

.inner-wrap:after, .inner-wrap:before {
    content: '';
    display: table;
}

.theater-specail-cont .cont-theater {
    padding: 30px 0 0 0;
}

.pt00 {
    padding-top: 0!important;
}

.theater-specail-cont .cont-theater .cont-tit {
    margin: 0 0 30px 0;
    font-size: 1.4666em;
    text-align: center;
    line-height: 32px;
    color: #503396;
}

.theater-specail-cont p {
    padding: 0;
}

.theater-specail-cont .cont-theater .col-group {
    overflow: hidden;
    position: relative;
}

.theater-specail-cont .cont-theater .col-group.col-1 .col {
    float: none;
    width: 100%;
}

.theater-specail-cont .cont-theater .col-group .col {
    position: relative;
}

.theater-specail-cont .cont-theater .col-group .col .img1 {
    font-size: 0;
    line-height: 0'';
}

.theater-specail-cont p {
    margin: 0;
    padding: 0;
}
</style>
<script type="text/javascript">
//로그인한 아이다가 admin이 아니라면...
function updateButtonVisibility() {
    var loginMember = "<%= vo.getUser_id()%>"; 
    
    var addBtn = document.getElementById("addBtn");
    var qnaboard = document.getElementById("qnaboard");
    var adminqna = document.getElementById("adminqna");
    var updateButtons = document.querySelectorAll(".updateBtn");
    var deleteButtons = document.querySelectorAll(".deleteBtn");
    
    if (loginMember !== "admin") {
    	 addBtn.style.display = "none";
    	 adminqna.style.display = "none";
    	 qnaboard.style.display = "block";
        for (var i = 0; i < updateButtons.length; i++) {
            updateButtons[i].style.display = "none";
            deleteButtons[i].style.display = "none";
        }
    }
}


    $(document).ready(function () {
        $('#content1 .moviePosterSlider').bxSlider({
            mode: "fade", // horizontal(기본값), vertical, fade
            auto: true, // false(기본값), true(자동실행)
            pause: 4000, // 4000(기본값 4초)
            autoControls: true, // false(기본값) 시작과 정지버튼 생성 autoHover(기본값 false) 마우스 올리면 멈춤
            ariaLive: true, // sr 사용자에게 변경된 정보를 알릴지 여부
            ariaHidden: true, // 보여지는 슬라이더 내용인지 여부
            prevText: "이전 슬라이더 보기",
            nextText: "다음 슬라이더 보기",
            startText: "애니메이션 시작",
            stopText: "애니메이션 정지"
        });

        $('#evtBaSliWarp .eventBannerSlider').bxSlider({
            mode: "fade", // horizontal(기본값), vertical, fade
            pause: 2000, // 4000(기본값 4초)
            ariaLive: true, // sr 사용자에게 변경된 정보를 알릴지 여부
            ariaHidden: true, // 보여지는 슬라이더 내용인지 여부
            prevText: "이전 슬라이더 보기",
            nextText: "다음 슬라이더 보기",
        });
        
        //호출
        updateButtonVisibility();
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
	


</head>
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
    
    	
<!-- contents -->
<section style="height: 2400px;">
	<div id="contents" class="no-padding" style="margin-top: 120px;"> 

		<!-- theater-detail-page -->
		<div class="theater-detail-page">

			<div class="bg-img" style="background-image:url('https://img.megabox.co.kr/static/pc/images/theater/bg-detail-db.png');"></div><!--20200626 이미지 파일명 -->
			<div class="bg-pattern"></div>
			<div class="bg-mask"></div>

			<div class="theater-specail db"><!--20200626 클래스 db-->

				<p class="name">DOLBY CINEMA</p>
			</div>
			<!--// theater-specail -->
		</div>
		<!--// theater-detail-page -->

		<!-- theater-specail-cont -->
		<div class="theater-specail-cont">
			<div class="inner-wrap pt40">
				<div class="tab-list fixed mb40">
				</div>
			</div>

			<!-- section -->
			<div class="section sectionInfo">
				<!-- bg-wrap -->
				<div class="bg-wrap">
					<div class="inner-wrap">
						<div class="tit-theater-special" style="margin-top: -30px;">
							<p class="tit">
								<em>DOLBY CINEMA</em>
								<span class="txt">단지, 보고, 듣는 영화에 만족할 수 없는 당신을 위해! 드라마틱한 이미지, 입체적인 사운드, 몰입에 최적화 된 공간까지!<br>최상의 영화를 경험하는 단 하나의 시네마, Dolby Cinema 를 메가박스에서 만나보세요.</span>
							</p>
						</div>

						<!-- cont-theater -->
						<div class="cont-theater">

							<div class="col-group col-1">
								<div class="col">
									<p class="img"><img src="https://img.megabox.co.kr/static/pc/images/theater/img-theater-db-view01.png" alt="" style="width: 1100px; height: 500px;"></p>
								</div>
							</div>
						</div>
						<!--// cont-theater -->
					</div>
				</div>
				<!--// bg-wrap -->
			</div>
			<!--// section -->

			<!-- section -->
			<!-- 가이드 수정 -->
			<div class="section mt70">
				<!-- bg-wrap -->
				<div class="bg-wrap bg">
					<div class="inner-wrap">
						<div class="cont-theater pt00">

							<div class="col-group col-3">
								<div class="col">
									<p class="img"><img src="https://img.megabox.co.kr/static/pc/images/theater/img-theater-db-view02.png" alt=""></p>
									<p class="bottom-txt">
										<strong class="font-roboto regular">DRAMATIC IMAGING</strong>
										Dolby Vision은 본연의 색 그대로를 구현하고<br>
										작은 디테일도 놓치지 않는 생생함으로<br>
										영화의 리얼리티를 극대화합니다
									</p>
								</div>

								<div class="col">
									<p class="img"><img src="https://img.megabox.co.kr/static/pc/images/theater/img-theater-db-view03.png" alt=""></p>
									<p class="bottom-txt">
										<strong class="font-roboto regular">MOVING AUDIO</strong>
										Dolby Atmos의 움직이는 사운드 설계는<br>
										역동적이고 입체적인 사운드로<br>
										마치 영화 속에 있는 듯한 경험을 선사합니다
									</p>
								</div>

								<div class="col">
									<p class="img"><img src="https://img.megabox.co.kr/static/pc/images/theater/img-theater-db-view04.png" alt=""></p>
									<p class="bottom-txt">
										<strong class="font-roboto regular">INSPIRED SPACE</strong>
										Dolby Space는 어느 자리에서도<br>
										스크린 시야각에 방해 받지 않으며 빛의 반사를 <br>
										최소화한 매트 블랙 디자인으로 온전한 몰입이 가능합니다.
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- bg-wrap -->
			</div>
			<!--// section -->

			<!-- section -->
			<!-- 가이드 수정 -->
			<div class="section mt70">
				<!-- bg-wrap -->
				<div class="bg-wrap">
					<div class="inner-wrap">

						<!-- cont-theater -->
						<!-- 가이드 수정 -->
						<div class="cont-theater pt00">
							<p class="cont-tit">돌비의 기술로 영화의 새로운 경험이 시작된다<br><b style="font-weight:900;">영화 그대로, 온전히 몰입<br>Dolby Cinema</b></p>
							<div class="col-group col-1">
								<div class="col">
									<p class="img"><img src="https://img.megabox.co.kr/static/pc/images/theater/img-theater-db-view05.png" alt="" style="width: 1100px; height: 500px;"></p>
								</div>
							</div>
						</div>
						<!--// cont-theater -->
					</div>
				</div>
				<!--// bg-wrap -->
			</div>
			<!--// section -->
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