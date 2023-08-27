<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">

<!--  -->
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

<meta charset="UTF-8">
<title>2U4U시네마 : 예매</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reservation.css">

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,
900&display=swap&subset=korean" rel="stylesheet">

<script src="../js/jquery-3.7.0.min.js"></script>

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

<!-- 부트스트랩 링크 및 스크립트 가져오기 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>

.list-group-item {
	background-color: #fff; /* 배경색 설정 */
	color: #333; /* 텍스트 색 설정 */
	border: none; /* 테두리 스타일 설정 */
	/* 추가적인 스타일 속성들을 원하는대로 설정하세요 */
}

/* 활성화된 .list-group-item 스타일 수정 */
.list-group-item.active {
	background-color: #B5B2FF;
	color: white;
	border-color: #B5B2FF;
	border-radius: 0;
}

ul, ol {
  list-style: none !important; /* 번호 숨기기 */
  padding-left: 0; /* 왼쪽 여백 제거 */
  text-align: center;
}

p {
	margin-top: 0;
	margin-bottom: 0; /* 또는 원하는 값을 설정하세요 */
}

#a-1,	#a-2,	#a-3,	#a-4,	#a-5,	#a-6,	#a-7,	#a-8,	#a-9,	#a-10,	#a-11,	#a-12,	#a-13,	#a-14,	#a-15,
#b-1,	#b-2,	#b-3,	#b-4,	#b-5,	#b-6,	#b-7,	#b-8,	#b-9,	#b-10,	#b-11,	#b-12,	#b-13,	#b-14,	#b-15,
#c-1,	#c-2,	#c-3,	#c-4,	#c-5,	#c-6,	#c-7,	#c-8,	#c-9,	#c-10,	#c-11,	#c-12,	#c-13,	#c-14,	#c-15,
#d-1,	#d-2,	#d-3,	#d-4,	#d-5,	#d-6,	#d-7,	#d-8,	#d-9,	#d-10,	#d-11,	#d-12,	#d-13,	#d-14,	#d-15,
#e-1,	#e-2,	#e-3,	#e-4,	#e-5,	#e-6,	#e-7,	#e-8,	#e-9,	#e-10,	#e-11,	#e-12,	#e-13,	#e-14,	#e-15{
  /* 원하는 크기 값으로 조정하세요 */
  width: 30px;
  height: 30px;
}

#screendiv {
  background-color: lightgray; /* 원하는 색상으로 변경 */
  width: 514px;
  text-align: center;
  
}

tr {
    text-align: center;
}

.aaa{
	width:20px;
}




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
                    <!--  
                    <li class="all_Menu"><a href="#sitemap"><img src="asset/images/common/icon_menu.gif" alt="전체메뉴보기"></a></li>
                    -->
                </ul>
            </nav>
        </div>
	</header>

<div id="theater_content" class="reservation">
	    <h2 id="reservation-title" class="title col-12 col-md-10">
            <P> 예매 </P>
        </h2>

	<div class="container t-1">
	
		<div class="mv">
			<label for="movie" class="subtitle form-label">영화</label>
			<ul id="movie-list" class="list-group">
			</ul>
		</div>
		<div class="the">
			<label for="theater" class="subtitle form-label">상영관</label>
			<ul id="theater-list" class="list-group">
			</ul>
		</div>

		<div>
			<h3 id="time-title" class="subtitle flex-shrink-0">시간</h3>
			<ul class="movie-list flex-column" aria-label="영화">
				<!-- mypage.js 상영시간표 출력 -->
				<li class="movie" data-timetable="harry" aria-label="상영 중인 영화">
					<h5 class="movie-name"></h5>
					<ol class="time-list flex-column" aria-label="상영시간">
						<li aria-label="시간">
							<input id="mtime0" class="hidden" type="checkbox" name="test" value="08:45">
							<label for="mtime0">08:45</label>
						</li>
						<li aria-label="시간">
							<input id="mtime1" class="hidden" type="checkbox" name="test" value="11:10">
							<label for="mtime1">11:10</label>
						</li>
						<li aria-label="시간">
							<input id="mtime2" class="hidden" type="checkbox" name="test" value="13:25">
							<label for="mtime2">13:25</label>
						</li>
						<li aria-label="시간">
							<input id="mtime3" class="hidden" type="checkbox" name="test" value="16:08">
							<label for="mtime3">16:08</label>
						</li>
						<li aria-label="시간">
							<input id="mtime4" class="hidden" type="checkbox" name="test" value="19:35">
							<label for="mtime4">19:35</label>
						</li>
						<li aria-label="시간">
							<input id="mtime5" class="hidden" type="checkbox" name="test" value="22:30">
							<label for="mtime5">22:30</label>
						</li>
					</ol>
				</li>
			</ul>
		</div>

		<div id="result"></div>
	</div>

	<main class="container">
		<article id="reservation" class="reservation d-flex justify-content-center" aria-labelledby="reservation-title">
			<form class="reservation-form row background d-flex flex-wrap justify-content-center align-items-center" 
				action="index.jsp" method="post" aria-labelledby="reservation-title">
				
				<input type="hidden" id="user_idd" name="user_id" value="<%=vo.getUser_id() %>">
				
				<h2 id="reservation-title" class="title col-12 col-md-10"></h2>
				<section id="step-count"
					class="step col-12 col-md-9 d-flex flex-column align-items-center"
					aria-labelledby="count-title">
					<h3 id="count-title" class="subtitle">관람 인원 선택</h3>
					<ol
						class="d-flex flex-column align-items-center flex-sm-wrap flex-sm-row justify-content-sm-around"
						aria-label="인원">
						<li class="d-flex align-center" data-count="adult" aria-label="구분">
							<p class="count-type">성인</p>
							<div class="d-flex button-group">
								<button id="adult-minus"
									class="square count-button down inactive" type="button">-</button>
								<p class="square adult-count">0</p>
								<button id="adult-plus" class="square count-button up"
									type="button">+</button>
							</div>
						</li>
						<li class="d-flex align-center" data-count="teen" aria-label="구분">
							<p class="count-type">청소년</p>
							<div class="d-flex button-group">
								<button id="teen-minus"
									class="square count-button down inactive" type="button">-</button>
								<p class="square teen-count">0</p>
								<button id="teen-plus" class="square count-button up"
									type="button">+</button>
							</div>
						</li>
						<li class="d-flex align-center" data-count="kid" aria-label="구분">
							<p class="count-type">어린이</p>
							<div class="d-flex button-group">
								<button id="kid-minus" class="square count-button down inactive"
									type="button">-</button>
								<p class="square kid-count">0</p>
								<button id="kid-plus" class="square count-button up"
									type="button">+</button>
							</div>
						</li>
						<li class="d-flex align-center" data-count="discount"
							aria-label="구분">
							<p class="count-type">우대</p>
							<div class="d-flex button-group">
								<button id="discount-minus"
									class="square count-button down inactive" type="button">-</button>
								<p class="square discount-count">0</p>
								<button id="discount-plus" class="square count-button up"
									type="button">+</button>
							</div>
						</li>
					</ol>
				</section>

				<section id="step-seat"
					class="step col-12 col-md-9 d-flex flex-column align-items-md-center"
					aria-labelledby="seat-title">
					<h3 id="seat-title" class="subtitle">좌석 선택</h3>
					
					<div id="screendiv">
					<h5>SCREEN</h5>
					</div>
					<div class="table-wrapper inactive">
						<table class="seat-table" aria-label="좌석">
							<thead>
								<tr>
									<th></th>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th> </th>
									<th>5</th>
									
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
									<th>10</th>
									
									<th>11</th>
									<th> </th>
									<th>12</th>
									<th>13</th>
									<th>14</th>
									<th>15</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th style="padding-left: 10px; padding-right: 10px">a</th>
									<td><input value="a-1" id="a-1" class="seat-input hidden"
										type="checkbox" > <label for="a-1" class="seat-label" ></label></td>
									<td><input value="a-2" id="a-2" class="seat-input hidden"
										type="checkbox"> <label for="a-2" class="seat-label"></label></td>
									<td><input value="a-3" id="a-3" class="seat-input hidden"
										type="checkbox"> <label for="a-3" class="seat-label"></label></td>
									<td><input value="a-4" id="a-4" class="seat-input hidden"
										type="checkbox"> <label for="a-4" class="seat-label"></label></td>
										
										<td> </td>
										
									<td><input value="a-5" id="a-5" class="seat-input hidden"
										type="checkbox"> <label for="a-5" class="seat-label"></label></td>
									<td><input value="a-6" id="a-6" class="seat-input hidden"
										type="checkbox"> <label for="a-6" class="seat-label"></label></td>
									<td><input value="a-7" id="a-7" class="seat-input hidden"
										type="checkbox"> <label for="a-7" class="seat-label"></label></td>
									<td><input value="a-8" id="a-8" class="seat-input hidden"
										type="checkbox"> <label for="a-8" class="seat-label"></label></td>
									<td><input value="a-9" id="a-9" class="seat-input hidden"
										type="checkbox"> <label for="a-9" class="seat-label"></label></td>
									<td><input value="a-10" id="a-10"
										class="seat-input hidden" type="checkbox"> <label
										for="a-10" class="seat-label"></label></td>	
									<td><input value="a-11" id="a-11"
										class="seat-input hidden" type="checkbox"> <label
										for="a-11" class="seat-label"></label></td>
										
										<td> </td>
										
									<td><input value="a-12" id="a-12"
										class="seat-input hidden" type="checkbox"> <label
										for="a-12" class="seat-label"></label></td>
									<td><input value="a-13" id="a-13"
										class="seat-input hidden" type="checkbox"> <label
										for="a-13" class="seat-label"></label></td>
									<td><input value="a-14" id="a-14"
										class="seat-input hidden" type="checkbox"> <label
										for="a-14" class="seat-label"></label></td>
									<td ><input value="a-15" id="a-15"
										class="seat-input hidden" type="checkbox"> <label
										for="a-15" class="seat-label"></label></td>
								</tr>
								<tr>
									<th>b</th>
									<td><input value="b-1" id="b-1" class="seat-input hidden"
										type="checkbox"> <label for="b-1" class="seat-label"></label></td>
									<td><input value="b-2" id="b-2" class="seat-input hidden"
										type="checkbox"> <label for="b-2" class="seat-label"></label></td>
									<td><input value="b-3" id="b-3" class="seat-input hidden"
										type="checkbox"> <label for="b-3" class="seat-label"></label></td>
									<td><input value="b-4" id="b-4" class="seat-input hidden"
										type="checkbox"> <label for="b-4" class="seat-label"></label></td>
									
									<td> </td>
									
									
									<td><input value="b-5" id="b-5" class="seat-input hidden"
										type="checkbox"> <label for="b-5" class="seat-label"></label></td>
									<td><input value="b-6" id="b-6" class="seat-input hidden"
										type="checkbox"> <label for="b-6" class="seat-label"></label></td>
									<td><input value="b-7" id="b-7" class="seat-input hidden"
										type="checkbox"> <label for="b-7" class="seat-label"></label></td>
									<td><input value="b-8" id="b-8" class="seat-input hidden"
										type="checkbox"> <label for="b-8" class="seat-label"></label></td>
									<td><input value="b-9" id="b-9" class="seat-input hidden"
										type="checkbox"> <label for="b-9" class="seat-label"></label></td>
									<td><input value="b-10" id="b-10"
										class="seat-input hidden" type="checkbox"> <label
										for="b-10" class="seat-label"></label></td>
									<td><input value="b-11" id="b-11"
										class="seat-input hidden" type="checkbox"> <label
										for="b-11" class="seat-label"></label></td>
										
										<td> </td>
										
									<td><input value="b-12" id="b-12"
										class="seat-input hidden" type="checkbox"> <label
										for="b-12" class="seat-label"></label></td>
									<td><input value="b-13" id="b-13"
										class="seat-input hidden" type="checkbox"> <label
										for="b-13" class="seat-label"></label></td>
									<td><input value="b-14" id="b-14"
										class="seat-input hidden" type="checkbox"> <label
										for="b-14" class="seat-label"></label></td>
									<td><input value="b-15" id="b-15"
										class="seat-input hidden" type="checkbox"> <label
										for="b-15" class="seat-label"></label></td>
								</tr>
								<tr>
									<th>c</th>
									<td><input value="c-1" id="c-1" class="seat-input hidden"
										type="checkbox"> <label for="c-1" class="seat-label"></label></td>
									<td><input value="c-2" id="c-2" class="seat-input hidden"
										type="checkbox"> <label for="c-2" class="seat-label"></label></td>
									<td><input value="c-3" id="c-3" class="seat-input hidden"
										type="checkbox"> <label for="c-3" class="seat-label"></label></td>
									<td><input value="c-4" id="c-4" class="seat-input hidden"
										type="checkbox"> <label for="c-4" class="seat-label"></label></td>
										
										<td> </td>
										
									<td><input value="c-5" id="c-5" class="seat-input hidden"
										type="checkbox"> <label for="c-5" class="seat-label"></label></td>
										
									<td><input value="c-6" id="c-6" class="seat-input hidden"
										type="checkbox"> <label for="c-6" class="seat-label"></label></td>
									<td><input value="c-7" id="c-7" class="seat-input hidden"
										type="checkbox"> <label for="c-7" class="seat-label"></label></td>
									<td><input value="c-8" id="c-8" class="seat-input hidden"
										type="checkbox"> <label for="c-8" class="seat-label"></label></td>
									<td><input value="c-9" id="c-9" class="seat-input hidden"
										type="checkbox"> <label for="c-9" class="seat-label"></label></td>
									<td><input value="c-10" id="c-10"
										class="seat-input hidden" type="checkbox"> <label
										for="c-10" class="seat-label"></label></td>
									<td><input value="c-11" id="c-11"
										class="seat-input hidden" type="checkbox"> <label
										for="c-11" class="seat-label"></label></td>
										
										<td> </td>
										
										
									<td><input value="c-12" id="c-12"
										class="seat-input hidden" type="checkbox"> <label
										for="c-12" class="seat-label"></label></td>
									<td><input value="c-13" id="c-13"
										class="seat-input hidden" type="checkbox"> <label
										for="c-13" class="seat-label"></label></td>
									<td><input value="c-14" id="c-14"
										class="seat-input hidden" type="checkbox"> <label
										for="c-14" class="seat-label"></label></td>
									<td><input value="c-15" id="c-15"
										class="seat-input hidden" type="checkbox"> <label
										for="c-15" class="seat-label"></label></td>
								</tr>
								<tr>
									<th>d</th>
									<td><input value="d-1" id="d-1" class="seat-input hidden"
										type="checkbox"> <label for="d-1" class="seat-label"></label></td>
									<td><input value="d-2" id="d-2" class="seat-input hidden"
										type="checkbox"> <label for="d-2" class="seat-label"></label></td>
									<td><input value="d-3" id="d-3" class="seat-input hidden"
										type="checkbox"> <label for="d-3" class="seat-label"></label></td>
									<td><input value="d-4" id="d-4" class="seat-input hidden"
										type="checkbox"> <label for="d-4" class="seat-label"></label></td>
										
										<td> </td>
										
										
									<td><input value="d-5" id="d-5" class="seat-input hidden"
										type="checkbox"> <label for="d-5" class="seat-label"></label></td>
									<td><input value="d-6" id="d-6" class="seat-input hidden"
										type="checkbox"> <label for="d-6" class="seat-label"></label></td>
									<td><input value="d-7" id="d-7" class="seat-input hidden"
										type="checkbox"> <label for="d-7" class="seat-label"></label></td>
									<td><input value="d-8" id="d-8" class="seat-input hidden"
										type="checkbox"> <label for="d-8" class="seat-label"></label></td>
									<td><input value="d-9" id="d-9" class="seat-input hidden"
										type="checkbox"> <label for="d-9" class="seat-label"></label></td>
									<td><input value="d-10" id="d-10"
										class="seat-input hidden" type="checkbox"> <label
										for="d-10" class="seat-label"></label></td>
									<td><input value="d-11" id="d-11"
										class="seat-input hidden" type="checkbox"> <label
										for="d-11" class="seat-label"></label></td>
										
										
										<td> </td>
										
									<td><input value="d-12" id="d-12"
										class="seat-input hidden" type="checkbox"> <label
										for="d-12" class="seat-label"></label></td>
									<td><input value="d-13" id="d-13"
										class="seat-input hidden" type="checkbox"> <label
										for="d-13" class="seat-label"></label></td>
									<td><input value="d-14" id="d-14"
										class="seat-input hidden" type="checkbox"> <label
										for="d-14" class="seat-label"></label></td>
									<td><input value="d-15" id="d-15"
										class="seat-input hidden" type="checkbox"> <label
										for="d-15" class="seat-label"></label></td>
								</tr>
								<tr>
									<th>e</th>
									<td><input value="e-1" id="e-1" class="seat-input hidden"
										type="checkbox"> <label for="e-1" class="seat-label"></label></td>
									<td><input value="e-2" id="e-2" class="seat-input hidden"
										type="checkbox"> <label for="e-2" class="seat-label"></label></td>
									<td><input value="e-3" id="e-3" class="seat-input hidden"
										type="checkbox"> <label for="e-3" class="seat-label"></label></td>
									<td><input value="e-4" id="e-4" class="seat-input hidden"
										type="checkbox"> <label for="e-4" class="seat-label"></label></td>
										
										<td style="padding-left: 25px;"> </td>
										
										
									<td><input value="e-5" id="e-5" class="seat-input hidden"
										type="checkbox"> <label for="e-5" class="seat-label"></label></td>
									<td><input value="e-6" id="e-6" class="seat-input hidden"
										type="checkbox"> <label for="e-6" class="seat-label"></label></td>
									<td><input value="e-7" id="e-7" class="seat-input hidden"
										type="checkbox"> <label for="e-7" class="seat-label"></label></td>
									<td><input value="e-8" id="e-8" class="seat-input hidden"
										type="checkbox"> <label for="e-8" class="seat-label"></label></td>
									<td><input value="e-9" id="e-9" class="seat-input hidden"
										type="checkbox"> <label for="e-9" class="seat-label"></label></td>
									<td><input value="e-10" id="e-10"
										class="seat-input hidden" type="checkbox"> <label
										for="e-10" class="seat-label"></label></td>
									<td><input value="e-11" id="e-11"
										class="seat-input hidden" type="checkbox"> <label
										for="e-11" class="seat-label"></label></td>
										
										<td style="padding-left: 25px;"></td>
										
										
									<td><input value="e-12" id="e-12"
										class="seat-input hidden" type="checkbox"> <label
										for="e-12" class="seat-label"></label></td>
									<td><input value="e-13" id="e-13"
										class="seat-input hidden" type="checkbox"> <label
										for="e-13" class="seat-label"></label></td>
									<td><input value="e-14" id="e-14"
										class="seat-input hidden" type="checkbox"> <label
										for="e-14" class="seat-label"></label></td>
									<td><input value="e-15" id="e-15"
										class="seat-input hidden" type="checkbox"> <label
										for="e-15" class="seat-label"></label></td>
									<td style="padding-left: 20px;"></td>	
								</tr>
								<tr>
									<td style="padding-top: 10px;"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>

				<section id="step-check" class="col-12 col-md-9 d-flex flex-column"
					aria-labelledby="check-title">
					<br>
					<h3 id="check-title" class="subtitle">선택 확인</h3>

					<dl
						class="mypage-dl d-flex flex-column flex-md-row justify-content-md-between"
						aria-label="확인사항">

						<div id="check-moviename">
							<h5>영화</h5>
							<h6 class="realmovie"></h6>
						</div>

						<div id="check-name">
							<h5>상영관</h5>
							<h6 class="movie-name"></h6>
						</div>

						<div id="check-realtime">
							<h5>시간</h5>
							<h6 class="time-choice"></h6>

						</div>

						<div id="check-seat">
							<dt class="mypage-term" aria-label="좌석">좌석</dt>
							<dd class="mypage-desc" aria-live="polite"></dd>
						</div>
						<div id="check-count">
							<dt class="mypage-term" aria-label="인원">인원</dt>
							<dd class="mypage-desc total" aria-live="polite">
								<strong>총 0명</strong>
							</dd>
							<dd class="mypage-desc details d-flex flex-wrap flex-md-column"
								aria-live="polite"></dd>
						</div>

						<div id="check-price"
							class="d-flex justify-content-end align-items-center">
							<dt class="mypage-term" aria-label="금액">금액</dt>
							<dd class="mypage-desc mypage-price" aria-live="polite">
								<strong>0원</strong>
							</dd>
						</div>
					</dl>
					<button type="button" id="completeButton">선택완료</button>
				</section>
			</form>
		</article>
	</main>
	
	<script>
	$(function () {
		let selectedMovieId;
		let selectedTheaterId;
		let selectedTheaterName;
		let selectedTime;
	    let reservedSeats = []; // 예약된 좌석 정보를 담을 배열
	    let adultCount = 0;
	    let teenCount = 0;
	    let kidCount = 0;
	    let discountCount = 0;
	    let totalPeople = 0;
	    let totalPrice = 0;
	    const adultPrice = 10000; // 성인 가격
	    const teenPrice = 8000;   // 청소년 가격
	    const kidPrice = 5000;    // 어린이 가격
	    const discountPrice = 7000; // 우대 가격
		
		// 예매 완료 버튼
		$('#completeButton').on('click', function () {
		    const movieId = $('.movie-item.active').attr('value');
		    const theaterId = $('.theater-item.active').attr('value');
		    const showtime = $(".time-list input[type='checkbox']:checked").val();
		    var userId = $('#user_idd').val();
		    let seatsArray = [];
		    $('.seat-input:checked').each(function () {
		    	seatsArray.push($(this).val());
		    });
		    const seats = seatsArray.join(',');

	    	console.log(
    			movieId, 
    			theaterId,
    			showtime,
    			seats,
	   			adultCount,
	   			teenCount,
	   			kidCount,
	   			discountCount,
	   			totalPrice,
	   			userId
	 		);
		   	
		    // AJAX 요청
		    $.ajax({
		        url: "<%=request.getContextPath()%>/reserveInsert.do",  // 서버의 요청 URL
		        type: 'POST',  // POST 방식으로 요청
		        data: {
		        	m_id: movieId,
		        	t_no: theaterId,
		            showtime: showtime,
		            seats: seats,
		            adult_count: adultCount,
		            teen_count: teenCount,
		            kid_count: kidCount,
		            discount_count: discountCount,
		            total_price: totalPrice,
		            user_id: userId
		        },
		        dataType: 'json',
		        success: function(res) {
		            // 성공적으로 예매가 완료되었을 때의 처리
		            
		            setInitialize(); // 이게 뭐냐 ?
		           
		            
		            if(res.sw=="성공"){
		            	 location.href="<%=request.getContextPath() %>/ticketInfo.do?userId="+userId+"&m_id="+movieId+"&t_no="+theaterId+"&showtime="+showtime+"";
		            }
		            	
		            
		            // 필요한 추가 작업 처리
		            <%-- location.href="<%=request.getContextPath() %>/ticketInfo.do?userId="; --%>
		        },
		        error: function(xhr) {
		        	alert("상태 : " + xhr.status);
		        }
		    });
	
			return false;	   
		}); 
	
	    // 영화 목록 클릭 시
	    $('#movie-list').on('click', '.movie-item', function () {
	    	setInitializeTimeList();
	    	
	        // 선택한 영화 ID 가져오기
	        selectedMovieId = $(this).attr('value').trim();
	        console.log("Selected Movie ID:", selectedMovieId);

			$('.movie-item').removeClass('active');
			
			$(this).addClass('active');
	
	        // 극장 목록 가져오기
	        $.ajax({
	            url: '<%=request.getContextPath()%>/theaterList.do',
	            data: { "id": selectedMovieId },
	            type: 'post',
	            dataType: 'json',
	            success: function (res) {
	                let code = "";
	                if (res.sw == "ok") {
	                    $.each(res.datas, function (i, v) {
	                        code += `<li value="${v.t_no}" class="list-group-item theater-item">${v.t_room_name}</li>`;
	                    });
	                } else {
	                    code += `<li value="0" class="list-group-item">데이터없음</li>`;
	                    $('#result').empty();
	                }

	                $('#theater-list').html(code);	
	                $('#theater-list .theater-item:first').click();
	            },
	            
	        });
	        
	        return false;
	    });
	    
	    $('#theater-list').on('click', '.theater-item', function () {
	    	setInitializeTimeList();
	    	
	        // 선택한 극장 ID와 이름 가져오기
	        selectedTheaterId = $(this).attr('value').trim();
	        selectedTheaterName = $(this).text().trim();
	        console.log("Selected Theater ID:", selectedTheaterId);
	        console.log("Selected Theater Name:", selectedTheaterName);

	        // 선택한 극장 이름을 h5.movie-name에 삽입
	        $('.movie-name').text(selectedTheaterName);
	        $('.theater-item').removeClass('active');
	        
	        // 영화 이름을 가져와서 h6 요소에 삽입
	        const selectedMovieName = $('.movie-item.active').text();
	        $('.realmovie').text(selectedMovieName);
	
	        $('.theater-item').removeClass('active');
	        $(this).addClass('active');
	        
	        $('.time-list').show();
	        return false;
	    });
	      
	     // 상영 시간 클릭 시
	  	$('.time-list').on('click', 'input[type="checkbox"]', function () {
			// 체크된 시간을 선택
			selectedTime = $(this).val();
		
			// 다른 시간들을 비활성화
			$('.time-list input[type="checkbox"]').not(this).prop('disabled', true);
		
	      	// 선택된 시간 해제 시 다른 시간들 활성화
	      	if ($(this).prop('checked') === false) {
	   	    	$('.time-list input[type="checkbox"]').prop('disabled', false);
	      	}
		      
		   	// 선택한 시간을 h6 요소에 삽입
	      	$('.time-choice').text(selectedTime);
		      
	      	// 서버에서 해당 상영시간에 대한 예약된 좌석 정보를 가져옴
	    	$.ajax({
				url: '/reservedSeat.do', // 백엔드 API 주소
				data: {
				    movie_id: selectedMovieId,
				    theater_id: selectedTheaterId,
				    showtime: selectedTime,
				},
				type: 'get',
				dataType: 'json',
				success: function (response) {
		          	// 예약 정보가 0개 이상일때 (예약정보 존재)
		          	if(response.length > 0) {
		          		// 좌석 체크박스 element 전부를 가져오기
						var ele = document.getElementsByClassName("seat-input");
	
		          		// 좌석에 부여된 이벤트 옵션들 전부다 초기화
						for(var k = 0; k < ele.length; k++){
							ele[k].disabled = false;
							ele[k].classList.remove("reserved");
						}
		
		          		// 결과로 넘어온 예약 정보 갯수만큼
						for(var i = 0; i < response.length; i++) {
							console.log(response[i].SHOWTIME);	// 시간
							console.log(response[i].SEATS);		// 예약 좌석
							const reservatedSeats = response[i].SEATS.split(",");	// 예약좌석 낱개 정보로 나누기

							for(var k = 0; k < reservatedSeats.length; k++){
								for(var j = 0; j < ele.length; j++){
									if(ele[j].id == reservatedSeats[k].trim()){
										ele[j].disabled = true;
										ele[j].classList.add("reserved");
									}
								}
							}
						}                		
					}
		        },
		        error: function (error) {
					console.error('Error fetching reserved seats:', error);
				}
	        });
	    });
	    
	    
	    // 좌석 클릭 이벤트
	    $('.seat-input').on('click', function () {
		    const selectedSeats = $('.seat-input:checked').map(function () {
		        return $(this).attr('id');
		    }).get();
	
		    if (selectedSeats.length > totalPeople) {
		        $(this).prop('checked', false);
		        alert('선택하신 좌석의 수가 선택한 인원을 초과합니다.');
		    } else {
		        $('#check-seat .mypage-desc').text(selectedSeats.join(', '));
		    }
		}); 
	
	    function updateCounts() {
	        totalPeople = adultCount + teenCount + kidCount + discountCount;
	        $('.adult-count').text(adultCount);
	        $('.teen-count').text(teenCount);
	        $('.kid-count').text(kidCount);
	        $('.discount-count').text(discountCount);
	        $('.total strong').text(`총 ${totalPeople}명`);
	
	        totalPrice = (adultCount * adultPrice) + (teenCount * teenPrice) + (kidCount * kidPrice) + (discountCount * discountPrice);
	        $('.mypage-price strong').text(`${totalPrice}원`);
	    }
	
	    $('#adult-minus').click(function () {
	        if (adultCount > 0) {
	            adultCount--;
	            updateCounts();
	        }
	    });
	 
	    
	    $('#adult-plus').click(function () {
	        adultCount++;
	        updateCounts();
	    });
	    
	
	    // 청소년, 아이, 우대에 대한 클릭 이벤트도 유사하게 구현
	    $('#teen-minus').click(function () {
	        if (teenCount > 0) {
	        	teenCount--;
	            updateCounts();
	        }
	    });
	
	    
	    $('#teen-plus').click(function () {
	    	teenCount++;
	        updateCounts();
	    });
	    
	    
	    $('#kid-minus').click(function () {
	        if (kidCount > 0) {
	        	kidCount--;
	            updateCounts();
	        }
	    });
	
	    
	    $('#kid-plus').click(function () {
	    	kidCount++;
	        updateCounts();
	    });
	    
	    
	    $('#discount-minus').click(function () {
	        if (discountCount > 0) {
	        	discountCount--;
	            updateCounts();
	        }
	    });
	
	    $('#discount-plus').click(function () {
	    	discountCount++;
	        updateCounts();
	    });
	 
	 	// 예약된 좌석을 비활성화하는 함수
	    function disableReservedSeats() {
		    if (reservedSeats && reservedSeats.length > 0) {
		        reservedSeats.forEach(seatId => {
		            const seatElement = document.getElementById(seatId);
		            if (seatElement) {
		                seatElement.disabled = true;
		                seatElement.classList.add("reserved");
		            }
		        });
		    }
		}
	 	
	 	const setInitializeTimeList = () => {
	 		$('.time-list').hide();
	 		$(".time-list input[type='checkbox']").prop('checked', false);
	 		$(".time-list input[type='checkbox']").prop('disabled', false);

	 	}
	 	
	 	const setInitialize = () => {
	 		$('#movie-list').empty();
	 		$('#theater-list').empty();
	 		setInitializeTimeList();
	 		 
		    // 맨 처음 호출 되는 영화 목록 가져오기
		    $.ajax({
		        url: "<%=request.getContextPath()%>/movieList.do",
		        type: 'get',
		        dataType: 'json',
		        success: function (res) {
		            let code = "";
		            $.each(res, function (i, v) {
		                code += `<li value="${v.m_id}" class="list-group-item movie-item">${v.m_name}</li>`;
		            });

		            $('#movie-list').html(code);
		        },
		    });

	 		updateCounts();
		    disableReservedSeats();	 		
	 	}
	 	
	 	setInitialize();
	});
	</script>
	
	
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

</body>
</html>
