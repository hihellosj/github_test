<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	MemberVO vo=(MemberVO)session.getAttribute("loginMember");
	String loginInfo = vo != null ? vo.getUser_name() : null;
%>


<meta charset="UTF-8">
<title>마이페이지 : 내가 본 영화</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">
    
    <!-- 파비콘 -->
<!--     <link rel="icon" href="#"> -->
    
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
 	
	// 로그인 여부 확인 및 버튼 표시/숨김 업데이트 함수
    function updateButtonDisplay() {
        var loginButton = document.getElementById("loginButton");
        var logoutButton = document.getElementById("logoutButton");
        var joinUsButton = document.getElementById("joinUsButton"); 
        
        var loginMember = "<%=loginInfo%>";

        if (loginMember == null || loginMember =="null") {
            loginButton.style.display = "block";
            joinUsButton.style.display = "block";
            logoutButton.style.display = "none";
        } else {
           /* loginButton.style.display = "none";*/
           /* joinUsButton.style.display = "none";*/
            logoutButton.style.display = "block";
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

<style>

#movielog_tit{
  height : 100px;
  display: flex;
}

#movielog_tit h2 {
	height: 80px;
	line-height: 100px;
	font-weight: 700;
	font-size: 30px;
	border-bottom: 1px solid #ddd;
}
form {
	padding-left : 30px;
	font-size: 15px;
	/*color : gray;*/
	width: 1000px;
	
}

h3{
	float: left;
    height: 34px;
    background-image: none;
    font-size: 17px;
    line-height: 34px;
    text-align: left;
    margin : 0;
    padding-top : 15px;
    color : black;
}
#movielog_op{
  width : 80px;
  height : 30px;
  float: right;
  display : block;
  margin-left: 5%;
  padding-top : 18px;
}
.year{
  width : 80px;
  height: 30px;
}
#movielog_ul{
  list-style: none;
  padding : 0;
}
.movielog_li{
  height : 170px;
  margin-left: 30px;
  border-bottom: 1px solid gray;
}
.thumb-image {
    display: block;
    position: relative;
}
.box_image {
    float: left;
    width: 110px;
    height: 158px;
    margin-right: 22px;
}
.box_image img {
    width: 100%;
}
.strong{
	margin-bottom: 8px;
    color: #222;
    font-weight: 500;
    font-size: 22px;
}

p{
  font-size: 12px;
  color : black;
}

.btn_review{
	text-decoration: none;
	outline: none;
	width: 100px;
	height: 30px;
	border-radius: 2px;
	background: #333;
	border: 1px solid #222;
	color: #fff;
	text-align: center;
	letter-spacing: 1px;
	font-size: 12px;
	margin-top : 25px;
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
                <%
                if (loginInfo == null || loginInfo.equals("null")) {
                %>
                    <li class="fl_left"><a href="<%=request.getContextPath()%>/login.do">로그인</a></li>
                    <li class="fl_left"><a href="<%=request.getContextPath()%>/view/member/agree.jsp">회원가입</a></li>
                <%
                } else {
                
                %>	
                	<li class="fl_left"><a id="logoutButton" href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
                	<li class="fl_left"><a href="#">마이페이지</a></li> 
                 <%
                }
                
                %>		
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
<section>

    <div id="container">
        <div id="menu">
        <ul id="menu_bar">
            <li class="mainmenu">결제내역</li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/ticketing.jsp">예매내역</a>
            </li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/cancel.jsp">취소내역</a>
            </li>
            
            <li class="mainmenu">나의 무비스토리</li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/movieLog.jsp">내가본영화</a>
            </li>
            
            <li class="mainmenu">문의내역</li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/QuestionList.do?user_id=<%=vo.getUser_id()%>">1:1문의내역</a></li>
            <li class="submenu">
             <a href="<%=request.getContextPath()%>/lostBoardList.do?user_id=<%=vo.getUser_id()%>">분실물문의내역</a>
            </li>
            
            <li class="mainmenu">나의정보</li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/memberUpdate.jsp">개인정보수정</a>
            </li>
        </ul>
        </div> <!--사이드 menu 닫기 -->
    
    <div id="contents">
       <div id="movielog_tit">
        <form name="log_form" method="" id="log_form" action="">
        <h2>내가 본 영화</h2>
        <p id="title_con">
	        <div id="movielog_op">
	          <select class="year" title="검색조건 구분 선택">
	            <option value="1900">전체</option>
	            <option value="2023">2023</option>
	            <option value="2022">2022</option>
	            <option value="2021">2021</option>
	            <option value="2020">2020</option>
	            <option value="2019">2019</option>
	            <option value="2018">2018</option>
	            <option value="2017">2017</option>
	            <option value="2016">2016</option>
	            <option value="2015">2015</option>
	          </select>
	        </div>
        </p>
      </div>
      
      <div id="movielog">
        <ul id="movielog_ul">
          <li class="movielog_li">
            <div class="movie_info">
              <div class="box_image">
                <a href="/movies/detail-view/?midx=86815"></a>
                <span class="thumb-image">
                <img alt="스즈메의 문단속 포스터" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86815/86815_185.jpg" onerror="errorImage(this)">
                </span>
              </div>
              <div class="box_contents">
              <div class="title" style="margin-bottom: 15px;"> 
				<a href="/movies/detail-view/?midx=86815">
                  <strong class="strong">스즈메의 문단속</strong>
                </a>
		      </div>
		      <p class="date">2023.04.01 (토) 15:50 ~ 17:57</p>
		      <p class="theater">CGV김천율곡 2관 5층 / 1명</p>
              </div>
            </div>
            <button type="submit" class="btn_review">리뷰작성</button>
	      </li>	                    	 
            

        </ul>
      </div>
       </form>
   
     
    </div>
    </div>
  </section> <!-- section 닫기 --> 
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