<%@page import="kr.or.ddit.movie.vo.MovieListVO"%>
<%@page import="java.util.List"%>
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
    <title>2U4U시네마 : 무비차트</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <!-- 이거야~ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/csss/MovieMain.css"> 
    
    <!-- 파비콘 -->
<!--     <link rel="icon" href="#"> -->
    
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
        
      	//로그인한 아이다가 admin이 아니라면...
        function updateButtonVisibility() {
            var loginMember = "<%= vo.getUser_id()%>"; 
            
            var addBtn = document.getElementById("addBtn");
            
            if (loginMember !== "admin") {
                addBtn.style.display = "none";
               }
        }
    
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
        	updateButtonVisibility();
            updateButtonDisplay();
        };
        
        $(function() {
        	
        	//체크박스 상태 변경시..
            $("#chk_nowshow").on("change", function () {
		        if ($(this).is(":checked")) {
		            hideFutureMovies();
		            hidePastMovies(); // 이전 상영 종료일인 영화도 숨기기
		        } else {
		            showAllMovies();
		        }
		    });

        	//현재 상영작만
            function hideFutureMovies() {
        		//현재 날짜 저장
                var currentDate = new Date();
        		//날짜만 비교
                currentDate.setHours(0, 0, 0, 0);
                $("#movieList li").each(function() {
                	//해당 영화의 개봉일 정보를 가져옴
                    var releaseDateStr = $(this).find(".date").text().replace("개봉일 ", "");
                	//Date객체로 변환해서 저장
                    var releaseDate = new Date(releaseDateStr);
                	//현재 날짜보다 개봉일이 이후라면 숨긴다.
                    if (releaseDate > currentDate) {
                        $(this).hide();
                    }
                });
            }
        	

        	//모든 영화 리스트 출력
            function showAllMovies() {
                $("#movieList li").show();
            }
        	
         	//검색 버튼 클릭 이벤트
            $("#btnSearch").on("click", function() {
                performSearch();
            });

            //엔터 키 이벤트 처리
            $("#ibxMovieNmSearch").on("keydown", function(event) {
                if (event.key === "Enter") {
                    event.preventDefault();
                    performSearch();
                }
            });

            //돋보기 버튼 클릭 이벤트
            $(".btn-search-input").on("click", function() {
                performSearch();
            });

            //검색어 담는 변수
            var searchText = "";

            function performSearch() {
                searchText = $("#ibxMovieNmSearch").val().toLowerCase();
                filterContent();
            }

            //영화명 포함 여부 체크 및 필터링 
            function filterContent() {
            $("#movieList li").each(function() {
                var movieName = $(this).find(".tit").attr("title").toLowerCase();
                var movieListItem = $(this);

                if (searchText !== "" && movieName.includes(searchText)) {
                    movieListItem.show();
                    //순위 표시 숨기기
                    movieListItem.find(".ranking-badge").hide();
                } else {
                    movieListItem.hide();
                }
            });
        }
            
            var currentDate = new Date();
            currentDate.setHours(0, 0, 0, 0);

            var $movieList = $("#movieList");
            var $rankingBadges = $(".ranking-badge");
            var isNowShowingChecked = false;

            $("#chk_nowshow").on("change", function () {
                isNowShowingChecked = $(this).is(":checked");
                updateRankingAndVisibility();
            });

            updateRankingAndVisibility();

            function updateRankingAndVisibility() {
                $movieList.find("li").each(function () {
                    var showingEndDateStr = $(this).find(".hidden").text().replace("상영종료일 ", "");
                    var showingEndDate = new Date(showingEndDateStr);
                    var movieListItem = $(this);

                    if (showingEndDate < currentDate) {
                        movieListItem.hide();
                    } else {
                        movieListItem.show();
                        updateRanking();
                    }
                });
            }
            
            var $movieList = $("#movieList");
            var $rankingBadges = $(".ranking-badge");
            //초기화
            var isNowShowingChecked = false;

            //초기 순위 
            updateRanking();

            //체크박스 상태 변경 시 업데이트
            $("#chk_nowshow").on("change", function() {
                isNowShowingChecked = $(this).is(":checked");
                //현재 상영작 순위 업데이트(1..2..3..)
                updateRanking();
            });

            //순위 업데이트
            function updateRanking() {
            	var $visibleMovies = $movieList.find("li:visible");
                
                if (isNowShowingChecked) {
                    $visibleMovies.each(function (index) {
                        var rankingBadge = $(this).find(".ranking-badge");
                        rankingBadge.text(index + 1);
                    });
                } else {
                    $rankingBadges.each(function (index) {
                        $(this).text(index + 1);
                    });
                }
            }
        });//$(function()) end..

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
        
        $(document).ready(function () {

            $("#addBtn").on("click", function () {
                $("#myModal").css("display", "block");
            });

            $(".close").on("click", function () {
                $("#myModal").css("display", "none");
            });

            $(window).on("click", function (event) {
                if (event.target === $("#myModal")[0]) {
                    $("#myModal").css("display", "none");
                }
            });

        });
        
    </script>
    <style type="text/css">
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: white;
    margin: 10% auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    width: 80%;
    max-width: 600px;
    height: 600px;	
}

.close {
    font-size: 30px;
    font-weight: bold;
    color: #888;
    cursor: pointer;
    float: right; 
    margin-top: -60px; 
    margin-right: -10px; 
    background: transparent;
}

h2 {
    margin-top: 0;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    border: 1px solid #222;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 20px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

input[type="reset"] {
    background-color: white;
    color: #222;
    border: 1px solid #222;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 20px;
}

input[type="reset"]:hover {
    background-color: #DFDEDE;
}

</style>
</head>

<body>
	<% List<MovieListVO> list = (List<MovieListVO>)request.getAttribute("movieList");%>
	<% MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");%>
   
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
    
    <div class="container" style="margin-top: 30px; height: 2950px;">
		<div id="contents">
			<div class="inner-wrap">
				<div class="tit-heading-wrap">
					<h3>무비차트</h3>
					<input type="button" id="addBtn" value="등록" data-toggle="modal" data-target="#myModal" style="margin-top: -20px; margin-left: 10px;">
					<div class="submenu">
						<ul>
							<li class="on">
								<a href="<%=request.getContextPath()%>/movieListMain.do" title="선택">무비차트</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/movieListMain2.do">상영예정작</a>
							</li>
						</ul>
					</div>
					<div class="sect-sorting">
						<div class="nowshow">
							<input type="checkbox" id="chk_nowshow">
							<label for="chk_nowshow">현재 상영작만 보기</label>
						</div>
						<div class="movie-search">
							<input type="text" title="영화명 검색" id="ibxMovieNmSearch" name="bxMovieNmSearch" placeholder="영화명 검색" class="input-text"> 
							<button type="button" class="btn-search-input" id="btnSearch">검색</button>
						</div>
					</div>
				</div>
				<div class="movie-list">
					<ol class="list" id="movieList">
				<% 
					for(MovieListVO movielist : list) 	{
						
						String movieGrade = movielist.getM_age();
						String ageRatingImage = request.getContextPath() + "/images/" + movieGrade + ".png";
						
						String movieName = movielist.getM_name();
   						String moviePosterImage = request.getContextPath() + "/images/" + movieName.replace(" ", "_").replace(":", "_") + ".jpg";
				%>
						<li tabindex="0" class="no-img">
							<div class="movie-list-info">
								<div class="ranking-badge"></div>
								<a href="<%=request.getContextPath()%>/movieDetail.do?m_id=<%= movielist.getM_id() %>">
    								<img src="<%= moviePosterImage %>" alt="<%= movielist.getM_name() %>" class="poster lozad" onerror="noImg(this)">
								</a>
							</div>
							 <div class="tit-area">
                				<p class="movie-grade age-15">
                    				<img src="<%= ageRatingImage %>" alt="<%= movielist.getM_age() %>" style="width: 23px; height: 23px;">
                				</p>
								<p title="<%=movielist.getM_name() %>" class="tit"><%=movielist.getM_name() %></p> 
							</div>
							<div class="rate-date">
								<span class="rate">
									예매율 <%=movielist.getM_res()%>%
								</span>
								<span class="date">
									개봉일 <%=movielist.getM_opn_date() %>
								</span>
								<span class="hidden">
									상영종료일 <%=movielist.getM_showing() %>
								</span>
							</div>
							<div class="btn-util">
									<div class="case col-2 movieStat3" style="display: none">        
										<a href="#" class="button purple bokdBtn" data-no="23029300" title="영화 예매하기">예매</a>        
										<a href="#" class="button purple img splBtn" data-no="23029300">
										</a>
									</div>
								<div class="case movieStat4" style="">        
									<a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="button purple bokdBtn" data-no="23029300" title="영화 예매하기">예매</a>    
								</div>
							</div>
						</li>
						<% } %>
					</ol>
				</div>
			</div>
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
</div>
<div id="myModal" class="modal">
    <div class="modal-content">
     	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
         </button>
        <form action="<%=request.getContextPath() %>/movieInsert.do" method="post" id="movieForm">
            <table border="1">
                <tbody>
                    <tr>
                        <th>포스터</th>
                        <td>
                            <input type="file" name="m_pst" id="m_pst" style="margin-bottom: 10px;">
                        </td>
                    </tr>
                    <tr>
                <th>영화코드</th>
                <td>
                    <input type="text" name="m_id" id="m_id" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
            <tr>
                <th>영화제목</th>
                <td>
                    <input type="text" name="m_name" id="m_name" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
             <tr>
                <th style="vertical-align: middle;">줄거리</th>
                <td>
                	 <textarea name="m_story" id="m_story" rows="8" cols="50" style="margin-bottom: 10px;"></textarea>
                </td>
            </tr>
            <tr>
                <th>상영시간</th>
                <td>
                    <input type="text" name="m_time" id="m_time" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
            <tr>
                <th>장르</th>
                <td>
                    <input type="text" name="m_type" id="m_type" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
            <tr>
                <th>감독</th>
                <td>
                    <input type="text" name="m_director" id="m_director" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
            <tr>
                <th>관람연령등급</th>
                <td>
                    <input type="text" name="m_age" id="m_age" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
            <tr>
                <th>출연진</th>
                <td>
                    <input type="text" name="m_cast" id="m_cast" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
            <tr>
                <th>상영타입</th>
                <td>
                    <input type="text" name="m_translation" id="m_translation" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
            <tr>
                <th>상영날짜</th>
                <td>
                    <input type="date" name="m_opn_date" id="m_opn_date" style="margin-bottom: 10px;">
                </td>
            </tr>
            <tr>
                <th>상영종료날짜</th>
                <td>
                    <input type="date" name="m_showing" id="m_showing" style="margin-bottom: 10px;">
                </td>
            </tr>
            <tr>
                <th>예고편</th>
                <td>
                    <input type="text" name="m_trailer_url" id="m_trailer_url" style="margin-bottom: 10px; width: 350px;">
                </td>
            </tr>
                </tbody>
            </table>
            <input type="reset" value="취소" id="cancelbtn" style="float: right;"> 
            <input type="submit" value="등록" id="adddbtn" style="float: right;">
        </form>
    </div>
</div>

<button id="addBtn"></button>
</body>
</html>