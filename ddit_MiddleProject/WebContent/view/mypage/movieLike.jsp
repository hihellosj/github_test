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
<title>마이페이지 : 회원정보 수정</title>
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

 	
</script>
<style>

#like_tit{
  height : 60px;
}

#like_tit h2 {
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
  float: left;
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
                <a href="<%=request.getContextPath() %>/main/index.jsp">
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
                    <li class="fl_left"><a href="#">고객센터</a></li>
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
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/movieLike.jsp">보고싶어요</a>
            </li>
            
            <li class="mainmenu">문의내역</li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/QuestionList.do?user_id=<%=vo.getUser_id()%>">1:1문의내역</a></li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/lostItem.jsp">분실물문의</a>
            </li>
            
            <li class="mainmenu">나의정보</li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/memberUpdate.jsp">개인정보수정</a>
            </li>
        </ul>
        </div> <!--사이드 menu 닫기 -->
    
    <div id="contents">
      <div id="like_tit">
      <form name="like_form" method="" id="like_form" action="">
        <h2>보고싶어요</h2>
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