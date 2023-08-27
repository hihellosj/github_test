<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.movie.controller.MovieDetail"%>
<%@page import="kr.or.ddit.movie.vo.MovieListVO"%>
<%@page import="java.util.List"%>
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

	MovieListVO movie = (MovieListVO) request.getAttribute("movie");
%>

    <meta charset="utf-8">
    <title><%=movie.getM_name() %> : 상세페이지</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <!-- 이거야~ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/csss/moviedetailcs.css">
    
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
        $("#mylikemovie").on("click", function () {
            $(this).find(".icon_wishheart").toggleClass("active");
        });
    });

    
  //로그인한 아이다가 admin이 아니라면...
    function updateButtonVisibility() {
        var loginMember = "<%= vo.getUser_id()%>"; 
        
        var updateButtons = document.querySelectorAll(".updateBtn");
        var deleteButtons = document.querySelectorAll(".deleteBtn");
        
        if (loginMember !== "admin") {
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
        
        function playTrailer(trailerUrl) {
        	var iframeElement = document.getElementById("trailerIframe");
        	var modal = document.getElementById("trailerModal");
        	iframeElement.src = trailerUrl;
        	modal.style.display = "block";
        }
        	
        function closeTrailerModal() {
        	var iframeElement = document.getElementById("trailerIframe");
        	var modal = document.getElementById("trailerModal");
        	iframeElement.src = "";
        	modal.style.display = "none";
        }
        
        function redirectToDetail(m_id) {
            var url = '/movieDetail.do?m_id=' + m_id;
            location.href = url;
        }

        $(function() {
        	$(".updateBtn").on("click", function () {
                var m_id = $(this).data("m_id");
                if (confirm("영화정보를 수정하시겠습니까?")) {
                    // 모달 창 띄우기
                    openUpdateModal(m_id);
                }
            });
            
            $(".deleteBtn").on("click", function() {
                var m_id =  $(this).data("m_id"); 
                if (confirm("영화정보를 삭제하시겠습니까?")) {
                    location.href = "<%=request.getContextPath()%>/movieDelete.do?m_id=" + m_id;
                }
            });
            
            document.querySelector(".close1").addEventListener("click", function() {
                closeModal();
            });

            function closeModal() {
                var modal = document.getElementById("updateModal");
                modal.style.display = "none";
            }
        })
        
        function openUpdateModal(m_id) {
        var modal = document.getElementById("updateModal");
        
        var m_idField = modal.querySelector("#m_id");
        m_idField.value = m_id;
        
        modal.style.display = "block";
    }
        
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
.modal1 {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); 
    z-index: 9999;
    overflow: auto;
}

.modal1-content {
  background-color: white;
    margin: 10% auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    width: 80%;
    max-width: 600px;
    height: 600px;	
}

.close1 {
    font-size: 30px;
    font-weight: bold;
    color: #888;
    cursor: pointer;
    float: right; 
    margin-top: -60px; 
    margin-right: -10px; 
    background: transparent;
}

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

th{
font-weight: bold;
}
    </style>
</head>

<body>
<%
    String m_id = request.getParameter("m_id");

	String trailerUrl = (String) request.getAttribute("trailerUrl"); 
	
	String movieName = movie.getM_name();
    String moviePosterImage = request.getContextPath() + "/images/" + movieName.replace(" ", "_").replace(":", "_") + ".jpg";
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
            <nav id="gnb" class="txt_cen cle_both:after" style="margin-top: -10px;">
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
<div id="contents_new23" style="margin-top: 200px;">
		<div id="contents" class="contents_movie_detail">
			<h2 class="hidden">영화</h2>
			<h3 class="hidden">영화 상세정보</h3>
			<div class="detail_top_wrap new22">
				<div class="poster_info">
					<img src="<%= moviePosterImage %>" alt="<%= movie.getM_name() %>">
				</div>
				<div class="tit_info">
   					<strong>${movie.m_name}</strong>
				</div>
				<ul class="mov_info1">
					<li>
						<span class="roboto">${movie.m_opn_date}</span>
						 개봉
					</li>
					<li>
						<span class="time">
							<span class="icon_clock_black"></span>
							<span class="roboto">${movie.m_time}</span>
							분 
						</span>
					</li>
					<li>
						<span class="grade_txt
					        <% if (movie.getM_age().equals("15세이상관람가")) { %>
					            gr_15
					        <% } else if (movie.getM_age().equals("12세이상관람가")) { %>
					            gr_12
					        <% } else { %>
					            gr_all
					        <% } %>"
    					>
        					<span class="roboto" style="font-weight: bold;">${movie.m_age}</span>
    					</span>
					</li>
				</ul>
				<ul class="mov_info2">
					<li>
					<button type="button" class="btn_trailer" onclick="playTrailer('${trailerUrl}')">
    					<span class="icon_trailerplay"></span>
    						예고편 재생
					</button>
					</li>
				</ul>
				<div class="txtarea_box movdetailtxt">
					<div class="txtarea">
						<span>
							${movie.m_story}
						</span>
					</div>
				</div>
				<a href="<%=request.getContextPath() %>/theatermvc/theaterRequest.jsp" class="btn_col1 ty7 rnd movreservation">예매하기</a>
				<div class="button-container">
        			<input type="button" class="updateBtn" data-m_id="<%=movie.getM_id() %>" value="수정">
            		<input type="button" class="deleteBtn" data-m_id="<%=movie.getM_id() %>" value="삭제">
        		</div>
			</div>
		</div>
		<div class="area__movingbar litype2">
			<ul class="tab_wrap outer moviedetailbar new22 actionmovingbar">
				<li class="active">
						<span>상세정보</span>
					</button>
					<div class="tab_con">
						<h4 class="hidden">상세정보</h4>
					<div class="innerfull gray">
						<div class="inner980">
							<div class="movi_tab_info1" style="margin-top: -100px;">
								<h5 class="tit_info type1">영화정보</h5>
								<ul class="detail_info2">
									<li>
										<em>상영타입 : </em>
										<span>${movie.m_translation}</span>
									</li>
									<li>
										<em>장르 : </em>
										<span>${movie.m_type}</span>
									</li>
									<li>
										<em>감독 : </em>
										<span>${movie.m_director}</span>
									</li>
									<li>
										<em>출연 : </em>
										<span>${movie.m_cast}</span>
									</li>
								</ul>
							</div>
						</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
<div id="trailerModal" class="modal">
    <div class="modal-content" style="width: 800px; height: 500px; margin-left: 50px;"> 
        <span class="close" onclick="closeTrailerModal()">&times;</span>
        <iframe id="trailerIframe" width="800" height="450" frameborder="0" allowfullscreen style="display: block; margin: 0 auto; margin-left: 75%;"></iframe>
    </div>
</div>
  <!-- 모달 -->
    <div class="modal1 fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
        <div class="modal1-dialog" role="document">
            <div class="modal1-content">
                <div class="modal-header">
                    <button type="button" class="close1" data-dismiss="modal" aria-label="Close1">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateForm" action="<%=request.getContextPath()%>/movieUpdate.do" method="post">
                        <input type="hidden" name="m_id" id="m_id"> 
                         <table>
           <tr>
                <th>포스터</th>
                <td>
                    <input type="file" name="m_pst" value="<%=movie.getM_pst()%>" style="margin-bottom: 10px;">
                </td>
            </tr>
            <tr>
                <th>영화코드</th>
                <td>
                    <input type="text" name="m_id" value="<%=movie.getM_id()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
            <tr>
                <th>영화제목</th>
                <td>
                    <input type="text" name="m_name" value="<%=movie.getM_name()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
             <tr>
                <th>줄거리</th>
                <td>
                	 <textarea name="m_story" id="m_story" rows="8" cols="50" style="margin-bottom: 10px;"><%=movie.getM_story() %></textarea>
                </td>
            </tr>
            <tr>
                <th>상영시간</th>
                <td>
                    <input type="text" name="m_time" value="<%=movie.getM_time()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
            <tr>
                <th>장르</th>
                <td>
                    <input type="text" name="m_type" value="<%=movie.getM_type()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
            <tr>
                <th>감독</th>
                <td>
                    <input type="text" name="m_director" value="<%=movie.getM_director()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
            <tr>
                <th>관람연령등급</th>
                <td>
                    <input type="text" name="m_age" value="<%=movie.getM_age()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
            <tr>
                <th>출연진</th>
                <td>
                    <input type="text" name="m_cast" value="<%=movie.getM_cast()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
            <tr>
                <th>상영타입</th>
                <td>
                    <input type="text" name="m_translation" value="<%=movie.getM_translation()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
            <tr>
                <th>상영날짜</th>
                <td>
                    <input type="date" name="m_opn_date" value="<%=movie.getM_opn_date()%>" style="margin-bottom: 10px;">
                </td>
            </tr>
            <tr>
                <th>상영종료날짜</th>
                <td>
                    <input type="date" name="m_showing" value="<%=movie.getM_showing()%>" style="margin-bottom: 10px;">
                </td>
            </tr>
            <tr>
                <th>예고편</th>
                <td>
                    <input type="text" name="m_trailer_url" value="<%=movie.getM_trailer_url()%>" style="margin-bottom: 10px; width: 335px;">
                </td>
            </tr>
        				</table>
                        <input type="reset" value="취소" id="cancelbtn" style="float: right;"> 
           				<input type="submit" value="수정" id="adddbtn" style="float: right;">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="wid1920" style="margin-top: 100px;">
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