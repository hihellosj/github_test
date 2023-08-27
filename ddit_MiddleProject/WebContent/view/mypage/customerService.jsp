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
<title>마이페이지 : 1:1 문의내역</title>
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
    
   
    $(document).ready(function () {
        var _boardList = $("#boardArea .boardList");
        _boardList.find("a").on("click", function () {
            $(this).find(".boardHead3").toggleClass("hoverColor");
            $(this).next().toggleClass("detailVisible");
            if ($(this).next().hasClass("detailVisible"))
                $(this).attr("title", "질문 상세접기");
            else
                $(this).attr("title", "질문 상세보기");
            return false;
        });
    });
    
    currentPage = 1;

    mypath = '<%= request.getContextPath()%>';

    console.log(mypath);

    reply = { } ; //동적 으로 속성과 기능을 추가 가능  reply.name = ""  reply.bonum = 31 
    $(function(){
    	//페이지별로 리스트 출력
    	  $.listPageServer(1);
    })
</script>

 	
<style>

#lostItem_tit{
  height : 60px;
  display: flex;
}

#lostItem_tit h2, #lostNotice {
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

p{
   padding : 4px;
   margin  :2px;
   word-break:keep-all;/* 줄바꿈: 단어단위로  */
}

#boardArea
{
    width : 1000px;
}
#boardHead
{
    height : 49px;
    line-height : 49px;
    border-bottom : 1px solid #eee;
}
.boardList
{
    width : 100%;
}
#boardArea .boardList > a
{
    display : block;
    width : 1000px;
    height : 49px;
    border-bottom : 1px solid #eee;
}

#boardArea .boardList > a:hover .boardHead3,
{
    color : #eb651e;
}
#boardArea .boardList .detail
{
    height : 0px;
    overflow : hidden;
    padding-left : 390px;
    transition : all 0.5s;
    background : #eee;
}
#boardArea .boardList .detail.detailVisible
{
    height : auto;
    padding : 50px 0px 50px 50px;
}
#boardArea .boardList a > span
{
    padding : 10px 0px;
}
#boardArea .boardHead1, #boardArea .boardHead2, #boardArea .boardHead4, #boardArea .boardHead5
{
    display : inline-block;
    width : 120px;
    text-align : center;
}

#boardArea .boardHead3
{
    display : inline-block;
    width : 450px;
    text-align: center;
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
             <a href="<%=request.getContextPath()%>/lostBoardList.do?user_id=<%=vo.getUser_id()%>">분실물문의</a>
            </li>
            
            <li class="mainmenu">나의정보</li>
            <li class="submenu">
            <a href="<%=request.getContextPath() %>/view/mypage/memberUpdate.jsp">개인정보수정</a>
            </li>
        </ul>
        </div> <!--사이드 menu 닫기 -->
        
  <div id="contents">
      <div id="custItem_tit">
      <form name="cust_form" method="" id="cust_form" enctype="" action="">
        <h2>1:1 문의 내역</h2>
        <p>【고객센터를 통해 남기신 1:1 문의내역을 확인하실 수 있습니다.】</p>
        <div id="lostNotice"></div>
      
        
        
    
 
       <div id="boardArea">
            <div id="boardHead">
                <span class="boardHead1">No.</span> <!-- wid150 -->
                <span class="boardHead2">카테고리</span> <!-- wid2-500 -->
                <span class="boardHead3">제목</span> <!-- wid2-500 -->
                <span class="boardHead4">답변상태</span> <!-- wid150 -->
                <span class="boardHead5">등록일</span> <!-- wid150 -->
            </div>
            <div class="boardList">
                <a href="" role="button" title="질문 상세보기">
                    <span class="boardHead1">1</span>
                    <span class="boardHead2">멤버십</span>
                    <span class="boardHead3">포인트 적립을 못받았어요 어떻게 해야하나요.</span>
                    <span class="boardHead4">등록</span>
                    <span class="boardHead5">2023.08.13</span>
                </a>
                <div class="detail">
                    <p>멤버십 포인트 적립은 상영시간 전까지만 가능하며,<br>
                        상영시간이 지난 티켓에 대해서는 사후 적립이 불가합니다.</p>
                </div>
            </div>
		</div>
            
     
     </form>
      </div>
      
    </div><!-- contents 닫기 -->
    </div><!-- container 닫기 -->
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
	</body>
</html>