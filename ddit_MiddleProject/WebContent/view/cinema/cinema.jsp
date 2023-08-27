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
    <title>2U4U시네마 : 영화관 소개</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/cinema.css">
    
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
 
 theater-special-main .brn-link .cell a {
    color: #fff;
}

div {
    display: block;
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
					<li class="fl_left"><a href="<%=request.getContextPath()%>/boardList.do">고객센터</a></li>
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
   
  <section id="join_content" class="po_relat">
        <div id="sub_m_tit" class="join_menu po_absol txt_cen">
            <ul class="tablist cle_both contain" role="tablist" aria-label="영화관소개탭">
                <li class="tab" role="tab" id="tab1" aria-controls="tabpanel1">영화관 소개</li>
                <li class="tab" role="tab" id="tab2" aria-controls="tabpanel2">상영관 소개</li>
            </ul>
        </div>
        <div id="cinema_main">
            <div class="tabpanel" role="tabpanel" id="tabpanel1" aria-labelledby="tab1">
               
               <img alt="영화관 내부.png" src="<%=request.getContextPath() %>/images/cinema/영화관내부.png" style="width:900px; height:auto; margin-left : 11%;" >
               
               
               
               <!-- start of :: 극장소개 -->
        	        <div class="thearterIntr_contents" style="max-width:1280px; margin:60px auto;">
        	            <dl class="tit_area">
        	                <dt>2U4U multiplex since 1958</dt>
        	                <dd>예술영화부터 블록버스터까지,<br>
        	                    모든 영화를 만날 수 있는 아트플렉스 2U4U CINEMA
        	                </dd>
        	            </dl>
        	            <div class="intr_dece">
        	                2U4U CINEMA는 1958년 미국 20세기 폭스 필름의 설계에 따라 1,900여 개의 좌석을 네 갖추고 대전시 중구 오류동에 개관하였다.<br>
        	                &lt;벤허&gt;,  &lt;사운드 오브 뮤직&gt;, &lt;킬링필드&gt;,  &lt;마지막황제&gt; 등 대작 위주의 상영을 고집하며, 한창 때는 146만명의 연 최고 관객동원을 기록하였다.<br><br>
        	                최근들어 극장의 형태가 영화만을 상영하는 대형극장 위주에서 쇼핑과 식사까지 해결할 수 있는 멀티플렉스관으로 전환하는 추세에 따라<br>
        	                &lt;징기스칸&gt; 상영을 끝으로 문을 닫고 총 공사비 250억원을 투입하여 2001년 12월 15일 11개의 상영관을 갖춘 초대형 영화관으로 재개관 하였다.<br><br>
        	                대한민국 대표극장으로서 ‘최첨단 영화관’이라는 모토답게 다양한 편의 시설과 서비스 개발에 최선을 다할 것을 약속드립니다.
        	            </div>
                   
                        
                     <div class="location_contents" style="max-width:1280px; ">
      		            <b class="bold_txt">위치 및 교통편</b>
      		            
      		            
                     <div id="map" style="width:1200px; height:300px; margin:30px auto;"></div> 
                     
                     <script>
						var map = new naver.maps.Map('map', {
						    center: new naver.maps.LatLng(36.325054, 127.408945), // 대덕인재개발원을 중심으로 하는 지도
						    zoom: 15
						});
						
						var marker = new naver.maps.Marker({
						    position: new naver.maps.LatLng(36.325054, 127.408945),
						    map: map
						});
					</script>
					
                     <div class="location_desc">
      		                <b>2U4U CINEMA</b>
      		                <div class="desc_area">
      		                    <p class="left_txt">대전광역시 중구 오류동</p>
      		                <div class="right_area">
      		                     <dl>
      		                         <dt>상영관수</dt>
      		                         <dd>8관 1,512석</dd>
      		                     </dl>
      		                     <dl>
      		                         <dt>전화번호</dt>
      		                         <dd>1588-5555</dd>
      		                     </dl>
      		                    </div>
      		                </div>
      		            </div>
      		            <div class="traffic_conts">
      		                <div class="sec_type">
      		                    <p class="tit">지하철</p>
      		                    <div class="right_area subway_area">
      		                        <span class="orange">1</span>
      		                        <span>호선 서대전네거리역 하차 후, 4번 출구 2U4U CINEMA 전용 연결통로</span>
      		                    </div>
      		                </div>
      		                <div class="sec_type">
      		                    <p class="tit">버스</p>
      		                    <div class="right_area bus_area">
      		                        <dl class="mb30">
      		                            <dt>2U4U CINEMA 앞</dt>
      		                            <dd><span class="green">지선</span>614</dd>
      		                            <dd><span class="purple">간선</span>101, 103, 315, 603, 618</dd>
      		                        </dl>
      		                    </div>
      		                </div>
      		                <div class="sec_type">
      		                    <p class="tit">주차장</p>
      		                    <div class="right_area parking_area">
      		                        <p>극장 전용 대형 부설 주차장 (면적 1,088.3m, 오류동 175-13) 보유, 주차 가능 대수 100대</p>
      		                        <dl>
      		                            <dt>주차장 안내</dt>
      		                            <dd>신용카드전용 무인정산주차장 (오류동 175-13)</dd>
      		                        </dl>
      		                        <dl>
      		                            <dt>주차요금</dt>
      		                            <dd>영화관람고객: 3시간 5,000원 / 추가 10분당 1,000원</dd>
      		                            <dd><span>※ 심야영화 관람시에도 동일한 요금적용</span></dd>
      		                            <dd>단, 당일영화 티켓 소지시에만 영화관람고객요금 적용됨.</dd>
      		                        </dl>
      		                    </div>
      		                </div>
      		            </div>
      		        </div>
                </div>  
            </div>
         
            
            <div class="tabpanel txt_cen" role="tabpanel" id="tabpanel2" aria-labelledby="tab2">
            
		<div class="theater-special-main">
			<div class="inner-wrap">
				<div class="brn-link">
					<div class="cell tit-area">
						<p class="tit"><img src="<%=request.getContextPath() %>/images/cinema/sp-text-tit2.png" style="width:120px" alt="MEET PLAY SHARE"></p>
						<p class="txt">
							2U4U<br>
							특별관을<br>
							소개합니다.
						</p>
					</div>

					<div class="cell link-boutique">
						<a href="<%=request.getContextPath() %>/view/cinema/boutique.jsp" title="THE BOUTIQUE 페이지로 이동">
							<div class="link-txt">
								<p class="tit">THE BOUTIQUE</p>
								<p class="txt">부티크 호텔의 개성을 더한<br>메가박스만의 프리미엄 시네마</p>
							</div>
							<div class="hover">THE BOUTIQUE</div>
						</a>
					</div>

					<div class="cell link-db">
						<a href="<%=request.getContextPath() %>/view/cinema/dolby.jsp">
							<div class="link-txt">
								<p class="tit">DOLBY CINEMA</p>
								<p class="txt">국내 최초로 메가박스가 선보이는<br>세계 최고 기술력의 몰입 시네마</p>
							</div>

							<div class="hover">MEGABOXTM MX THE TRUE SOUND</div>
						</a>
					</div>

					<div class="cell link-mx">
						<a href="<%=request.getContextPath() %>/view/cinema/mx.jsp" title="MX 페이지로 이동">
							<div class="link-txt">
								<p class="tit">MX</p>
								<p class="txt">진정한 영화 사운드를 통한 최고의 영화<br>메가박스의 차세대 표준 상영관</p>
							</div>
							<div class="hover">MEGABOXTM MX THE TRUE SOUND</div>
						</a>
					</div>

					<div class="cell link-kids">
						<a href="<%=request.getContextPath() %>/view/cinema/kids.jsp" title="MEGA KIDS 페이지로 이동">
							<div class="link-txt">
								<p class="tit">MEGABOX KIDS</p>
								<p class="txt">아이와 가족이 함께 머물며<br>삶의 소중한 가치를 배우는<br>더 행복한 놀이공간</p>
							</div>
							<div class="hover">MEGABOX KIDS</div>
						</a>
					</div>

					<div class="cell link-comfort">
						<a href="<%=request.getContextPath() %>/view/cinema/comfort.jsp" title="COMFORT 페이지로 이동">
							<div class="link-txt">
								<p class="tit">COMFORT</p>
								<p class="txt">더욱 편안한 영화 관람을 위한<br>다양한 여유 공간</p>
							</div>
							<div class="hover">COMFORT</div>
						</a>
					</div>

					<div class="cell link-private">
						<a href="<%=request.getContextPath() %>/view/cinema/private.jsp" title="THE BOUTIQUE PRIVATE 페이지로 이동">
							<div class="link-txt">
								<p class="tit">THE BOUTIQUE PRIVATE</p>
								<p class="txt">당신의 특별한 순간을 빛나게 해줄<br>프리미엄 어메니티와 룸서비스</p>
							</div>
							<div class="hover">THE BOUTIQUE PRIVATE</div>
						</a>
					</div>

					<div class="cell link-puppy">
						<a href="<%=request.getContextPath() %>/view/cinema/puppy.jsp" title="PUPPY CINEMA 페이지로 이동">
							<div class="link-txt">
								<p class="tit">PUPPY CINEMA</p>
								<p class="txt">최초의 반려동물 동반 멀티플렉스<br>영화관람은 물론<br>다양한 부대시설까지</p>
							</div>
							<div class="hover">PUPPY CINEMA</div>
						</a>
					</div>
				</div>
			</div>
		</div>
      </div>   
       
        
    </section>
      </div>  

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