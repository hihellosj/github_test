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
    <title>2U4U시네마</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    
    <!-- 파비콘 -->
   <!--  <link rel="icon" href="#"> -->
    
    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.bxslider.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/tab.js"></script>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script>
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
					<li class="fl_left"><a href="<%=request.getContextPath()%>/boardList.do">고객센터</a></li>
				</ul>
			</div>	
            <nav id="gnb" class="txt_cen cle_both:after">
                <ul>
                     <li class="nav_Menu"><a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp">예매</a></li>
                    <li class="nav_Menu"><a href="<%=request.getContextPath() %>/movieListMain.do">영화</a></li>
                    <li class="nav_Menu"><a href="<%=request.getContextPath() %>/view/cinema/cinema.jsp">영화관</a></li>
                    <li class="nav_Menu"><a href="<%=request.getContextPath() %>/feedList.do">커뮤니티</a></li> 
                   
                </ul>
            </nav>
        </div>
    </header>
    
    
    
    <div class="wid1920 cnt1wrap">
        <section class="section" id="content1">
            <h2 class="hide">최근소식 슬라이더</h2>
            <ul class="moviePosterSlider">
                <li><a href="#">콘크리트유토피아</a></li>
                <li><a href="#">몬스터패밀리2</a></li>
            </ul>
        </section>
    </div>
    <div class="contain">
        <section class="section cle_both" id="content2">
            <h2 class="hide">상영중인 영화 목록</h2>
            <div id="movieTab" class="txt_cen">
                <ul class="tablist" role="tablist" aria-label="박스오피스/최신개봉작">
                    <li class="tab first fl_left" role="tab" id="tab1" aria-controls="tabpanel1">박스오피스</li>
                    <li class="tab last fl_left" role="tab" id="tab2" aria-controls="tabpanel2">최신개봉작</li>
                </ul>
                <div class="tabpanel" role="tabpanel" id="tabpanel1" aria-labelledby="tab1">
                    <div>
                        <a href="<%=request.getContextPath() %>/movieListMain.do" class="boder_bx">전체보기</a>
                    </div>
                    <ul>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/미션임파서블.jpeg" alt="미션임파서블.jpeg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>미션임파서블</strong>
                                <p>15세 관람가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie8" class="">상세보기</a>
                            </div>
                        </li>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/엘리멘탈.jpg" alt="엘리멘탈.jpg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>엘리멘탈</strong>
                                <p>전체연령가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie6" class="">상세보기</a>
                            </div>
                        </li>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/코난.jpg" alt="코난.jpg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>명탐정코난: 흑철의 어영</strong>
                                <p>12세 관람가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie11" class="">상세보기</a>
                            </div>
                        </li>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/바비.jpg" alt="바비.jpg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>바비</strong>
                                <p>12세 관람가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie10" class="">상세보기</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="tabpanel" role="tabpanel" id="tabpanel2" aria-labelledby="tab2">
                    <div>
                        <a href="<%=request.getContextPath() %>/movieListMain.do" class="boder_bx">전체보기</a>
                    </div>
                    <ul>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/밀수.jpg" alt="밀수.jpg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>밀수</strong>
                                <p>15세 관람가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie3" class="">상세보기</a>
                            </div>
                        </li>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/더문.jpeg" alt="더문.jpeg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>더 문</strong>
                                <p>12세 관람가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie9" class="">상세보기</a>
                            </div>
                        </li>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/콘크리트유토피아.jpeg" alt="콘크리트유토피아.jpeg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>콘크리트유토피아</strong>
                                <p>15세 관람가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie2" class="">상세보기</a>
                            </div>
                        </li>
                        <li class="over fl_left po_relat">
                            <img src="<%=request.getContextPath() %>/images/main/오펜하이머.jpeg" alt="오펜하이머.jpeg" style="height:400px; width:270px;">
                            <div class="po_absol boder_bx">
                                <strong>오펜하이머</strong>
                                <p>15세 관람가</p>
                                <a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="">예매하기</a>
                                <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=movie1" class="">상세보기</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
    
    
    <div id="content3_wrap" class="wid1920">
        <section class="section txt_cen" id="content3">
            <h2 class="#">공지사항</h2>
            <div id="img_wrap">
                <div id="evtBaSliWarp">
                    <ul class="eventBannerSlider">
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                    </ul>
                </div>
                <div>
                    <a href="#"></a>
                </div>
                <div>
                    <a href="#"></a>
                </div>
            </div>
        </section>
    </div>
    
    
    <div class="contain po_relat">
        <section class="section" id="content4">
            <div id="con4_wrap">
                <div class="con4_tit">
                    <h3>할인 및 제휴</h3>
                </div>
                <ul>
                    <li>
                        <div class="overbox">
                            <div class="over">
                                <span>KT</span>
                                <strong>KT Membership 카드</strong>
                                <p>
                                    * 영화 3000원 할인 (월 1회)<br>
                                    * 매점 3000원 할인 (월 1회)
                                </p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="overbox">
                            <div class="over">
                                <span>삼성카드</span>
                                <strong>삼성카드 6 V3 카드</strong>
                                <p>
                                    * 현장예매 2000원 할인 (1일 1회)<br>
                                    * 영화 5000원 할인 (통합 월 1회)
                                </p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="overbox">
                            <div class="over">
                                <span>신한은행</span>
                                <strong>레져 체크 플러스 카드 </strong>
                                <p>
                                    * 온라인 결제 시 1000원 할인<br>
                                    * 영화 2500원 할인 (월 2회)
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
                <span>
                    * 중복할인 불가<br>
                    * 매달 마지막 주 수요일 ( 문화의 날 ) 의 경우 사용불가
                </span>
                <!-- 
                <a href="">카드 더 보기</a>
                 -->
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