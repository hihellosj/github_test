<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.faq.vo.FaqBoardVO"%>
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
%>

    <meta charset="utf-8">
    <title>고객센터 : 자주 묻는 질문</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/csss/customerservice.css"> 
    
    <!-- 파비콘 -->
<!--     <link rel="icon" href="#"> -->
    
    <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  
    <script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery.bxslider.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/tab.js"></script>
    <script src="<%=request.getContextPath() %>/js/common.js"></script>
    <script>
    
    $(function() {
        $(".que").on("click", function() {
        	//클릭된 요소의 다음 형제 요소 중 "anw" 클래스를 가진 요소를 찾는다.
        	//슬라이드 토글 애니메이션 수행(요소가 숨겨져 있으면 나타나고, 보이는 상태면 숨김)
            $(this).next(".anw").stop().slideToggle(300);
        	
        	//클릭된 요소에 "on" 클래스의 존재 여부를 토글(클래스가 없으면 추가하고, 있으면 제거함)
        	//클릭된 요소의 형제 요소들에 대해서는 "on" 클래스를 제거(클릭된 요소만 강조)
            $(this).toggleClass('on').siblings().removeClass('on');
        	
        	//클릭된 요소의 다음 형제 요소 중 "anw" 클래스를 가진 다른 요소들을 찾는다.
    		//찾은 요소들에 대해서 슬라이드 업 애니메이션을 수행하여 요소들을 숨김
            $(this).next(".anw").siblings(".anw").slideUp(300);
        });
        
        $("#cm1").on("click", function() {
    		location.href = "/boardList.do";
    	})
    	
    	$("#addBtn").on("click", function(){
    		location.href = "<%=request.getContextPath()%>/boardInsert.do";
    	});
        
        $(".updateBtn").on("click", function(){
        	var fb_no = $(this).data("fb_no");
        	 if (confirm("게시물을 수정하시겠습니까?")) {
                 location.href = "<%=request.getContextPath()%>/boardUpdate.do?fb_no=" + fb_no;
             }
    	});
        
        $(".deleteBtn").on("click", function() {
            var fb_no =  $(this).data("fb_no"); 
            if (confirm("게시물을 삭제하시겠습니까?")) {
                location.href = "<%=request.getContextPath()%>/boardDelete.do?fb_no=" + fb_no;
            }
        });
        
     	//입력한 검색어와 일치하는 질문과 답변을 필터링
        function filterContent(searchText) {
            $(".que").each(function() {
            	//대소문자 구분없이 검색할라고 
            	//현재 질문
                var question = $(this).find("span").text().toLowerCase();
            	//답변 내용
                var answer = $(this).next(".anw").find("span").text().toLowerCase();
                
            	//질문 또는 답변이 검색어를 포함하면 해당 질문 항목을 보여줌
                if (question.includes(searchText) || answer.includes(searchText)) {
                    $(this).show();
                    //질문이 선택되면 질문에 대한 답변이 보이도록
                    if ($(this).hasClass("on")) {
                        $(this).next(".anw").addClass("visible");
                    }
                } else {
                	//검색어를 포함하지 않으면 숨김
                    $(this).hide();
                 	//답변도 숨겨지도록
                    if ($(this).hasClass("on")) {
                        $(this).next(".anw").removeClass("visible");
                    } else {
                    	//질문이 선택되지 않은 경우 답변 숨김
                        $(this).next(".anw").hide();
                    }
                }
            });
        }

     	//이건 검색 버튼인데 저렇게 검색어 입력해서 촤르륵 나오면 굳이 ..?
        $("#searchBtn").on("click", function() {
            var searchText = $("#search").val().toLowerCase();
            filterContent(searchText);
        });

     	//이것도 엔터키 누르면 검색어 포함되어 있는거 나오게 했는데 이것도 뺄깡..?
        $("#search").on("keydown", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                var searchText = $(this).val().toLowerCase();
                filterContent(searchText);
            }
        });

     	//검색어 입력값이 변경되면 실행됨
//         $("#search").on("input", function() {
//             var searchText = $(this).val().toLowerCase();
//             //검색값이 없으면(검색어입력X) 전체 게시글 보여줌
//             if (searchText === "") {
//                 $(".que").show();
//                 //답변 펼쳐져 나오면 지저분해서
//                 $(".anw").hide(); 
//                 $(".que.on + .anw").addClass("visible"); 
//             } else {
//                 filterContent(searchText);
//             }
//         });
     	
        var itemsPerPage = 10; //한 페이지에 표시할 항목 수
        var currentPage = 1; //현재 페이지 번호

        function showPage(pageNumber) {
            var startIndex = (pageNumber - 1) * itemsPerPage;
            var endIndex = startIndex + itemsPerPage;

            $(".que, .anw").hide(); //모든 항목 숨기기

            $(".que").slice(startIndex, endIndex).show(); //현재 페이지의 질문 항목 표시
        }

        function updatePaginationButtons() {
            if (currentPage === 1) {
                $("#prev-page-btn").prop("disabled", true);
            } else {
                $("#prev-page-btn").prop("disabled", false);
            }

            var totalPageCount = Math.ceil($(".que").length / itemsPerPage);
            if (currentPage === totalPageCount) {
                $("#next-page-btn").prop("disabled", true);
            } else {
                $("#next-page-btn").prop("disabled", false);
            }
        }

        $("#prev-page-btn").on("click", function() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
                updatePaginationButtons();
            }
        });

        $("#next-page-btn").on("click", function() {
            var totalPageCount = Math.ceil($(".que").length / itemsPerPage);
            if (currentPage < totalPageCount) {
                currentPage++;
                showPage(currentPage);
                updatePaginationButtons();
            }
        });

        //초기화
        showPage(currentPage);
        updatePaginationButtons();
    });
    
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
    <style type="text/css">

.updateBtn, .deleteBtn {
    margin-left: 10px;
    margin-right: 10px;
}

.button-container {
    display: flex;
    justify-content: flex-end; 
}

.button-wrapper {
    margin-left: auto; 
}

#pagination {
    display: flex;
    justify-content: center;
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
 
 #qnaboard{
 	display : none;
 }

</style>
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
<%
	List<FaqBoardVO> list = (List<FaqBoardVO>)request.getAttribute("boardlist");
%>

<section style="height: 1600px;">
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
                        <li id="cm1" name="categorymenu" class="active">
                            <a href="<%=request.getContextPath()%>/boardList.do">FAQ</a>
                        </li>
                        <li id="cm2" name="categorymenu" class="">
                            <a href="<%=request.getContextPath()%>/board/*">공지사항</a>
                        </li>
                        <li id="cm3" name="categorymenu" class="">
                            <a id="qnaboard" href="<%=request.getContextPath()%>/view/onetooneBoard/qnaForm.jsp">1:1문의</a>
                            <a id="adminqna" href="<%=request.getContextPath()%>/QnAboardList.do">1:1문의</a>
                        </li>
                        <li id="cm5" name="categorymenu" class="">
                            <a href="<%=request.getContextPath() %>/view/lostBoard/lostBoardForm.jsp">분실물문의</a>
                        </li>
                    </ul>
                </div>
            </div>
            <fieldset class="search_wrap ty2">
			    <form id="searchForm">
			        <input type="text" placeholder="검색어를 입력하세요." id="search" title="검색어를 입력해주세요">
			        <button type="button" id="searchBtn" class="btn_col2">검색</button>
			    </form>
			</fieldset>
            	<p _ngcontent-rnb-c156="">찾으시는 답변이 없으면 <strong _ngcontent-rnb-c156=""><a href="<%=request.getContextPath()%>/view/onetooneBoard/qnaForm.jsp">1:1 문의하기</a></strong>를 이용해 주세요.</p><br>
	<input type="button" id="addBtn" value="등록">
	<div id="Accordion_wrap">
    <%
    	if (list == null || list.size()==0) {
    %>
        <div class="que">
                <span>목록이 하나도 없습니다</span>
                <div class="arrow-wrap">
                    <span class="arrow-top">▲</span>
                    <span class="arrow-bottom">▼</span>
                </div>
            </div>
            <div class="anw">
                <span>목록이 하나도 없습니다</span>
            </div>
    <%
    	} else {
    %>
        <%
        	for (FaqBoardVO faqvo : list) {
        %>
            <div class="que">
           <span style="color: #037b94; font-size: 14px;"><%= faqvo.getFb_ctg() %></span><br>
                <span><%= faqvo.getFb_title() %></span>
                <div class="arrow-wrap">
                    <span class="arrow-top">▲</span>
                    <span class="arrow-bottom">▼</span>
                </div>
            </div>
            <div class="anw">
                <span><%= faqvo.getFb_content() %></span>
                <div class="button-container">
                	<input type="button" class="updateBtn" data-fb_no="<%=faqvo.getFb_no() %>" value="수정">
            	 	<input type="button" class="deleteBtn" data-fb_no="<%=faqvo.getFb_no() %>" value="삭제">
            	</div>
            </div>
        <% } 
    	 } %>
	</div>
        </div>
    </div>
    <div id="pagination">
    <button id="prev-page-btn" disabled style="font-weight: bold; font-size: 15px;">←</button>
    <button id="next-page-btn" style="margin-left: 50px; font-weight: bold; font-size: 15px;">→</button>
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