<%@page import="kr.or.ddit.board.lost.vo.LostBoardVO"%>
<%@page import="java.util.List"%>
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
<title>마이페이지 : 분실물 문의내역</title>
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
	
	
    $(document).ready(function() {
        $(document).on("click", ".que", function() {
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
    });
    

    
    $(function() {
    	
    	$(document).on("click", "#updateBoard", function() {
    	    var lb_no = $(this).data("lb_no");
    	    if (lb_no !== undefined) {
    	        location.href = "<%=request.getContextPath()%>/lostBoardUpdate.do?lb_no=" + lb_no;
    	    } else {
    	        alert("게시물 번호가 없습니다.");
    	    }
    	});
        
        $(document).on("click", "#deleteBoard", function() {
            console.log("Delete 버튼 클릭됨");
            	var lb_no = $(this).data("lb_no");
                if (confirm("게시물을 삭제하시겠습니까?")) {
                    $.ajax({
                        url: '<%=request.getContextPath()%>/lostBoardDelete.do',
                        data: { lb_no: lb_no}, // 이 부분에서 trim()을 호출하기 전에 undefined 체크
                        method: 'GET',
                        dataType: 'json',
                        success: function(result) {
                            if (result === "OK") {
                                alert("게시물 삭제가 완료되었습니다.");
                                window.location.href = '<%=request.getContextPath()%>/lostBoardList.do?user_id=<%=vo.getUser_id()%>';
                            } else if (result === "Fail") {
                                alert("게시물 삭제에 실패하였습니다.");
                            }
                        },
                        error: function(xhr) {
                            alert("status : " + xhr.status);
                        }
                    }); // ajax종료
                }	//if문 종료
        });
    });

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

#boardArea .boardList > a:hover .boardHead2,
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
#boardArea .boardHead1, #boardArea .boardHead3, #boardArea .boardHead4
{
    display : inline-block;
    width : 150px;
    text-align : center;
}
#boardArea .boardHead2
{
    display : inline-block;
    width : 500px;
    text-align: center;
}

.que{
  position: relative;
  padding: 17px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 1px solid #eee;
}
  
.que::before{
  display: inline-block;
  font-size: 14px;
  color: #006633;
  margin: 0 5px;
}

.que:hover::before {
  color: #700ff0;
  font-weight: bold;
}

.que.on>span{
  color: #700ff0; 
  font-weight: bold;
}
  
.anw {
  display: none;
  overflow: hidden;
  font-size: 14px;
  background-color: #f4f4f2;
  padding: 30px 75px;
}
  
.anw::before {
  display: inline-block;
  font-size: 14px;
  color: #ec7f7a;
  margin: 0 5px;
}

.arrow-wrap {
  position: absolute;
  top:50%; right: 10px;
  transform: translate(0, -50%);
}
.button-container input[type="button"]{
	display : block;
	float : left;
	margin-right: 10px;
}
.button-container{
	display: flex;
    justify-content: flex-end
}

#lostAnswer{
	display : block;
	margin-top: 50px;
	padding : 0px 15px;
	font-weight: 700;

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
<%
	List<LostBoardVO> boardList = (List<LostBoardVO>)request.getAttribute("boardList");
	
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
      <div id="lostItem_tit">
      <form name="lost_form" >
        <h2>분실물 문의내역</h2>
        <p>【고객센터를 통해 남기신 분실물 문의내역을 확인하실 수 있습니다.】</p>
        <div id="lostNotice"></div>
         <input type="hidden" id="user_id" name="user_id" value=<%=vo.getUser_id() %>>
         <div id="boardArea">
            <div id="boardHead">
                <span class="boardHead1">No.</span> <!-- wid150 -->
                <span class="boardHead2">제목</span> <!-- wid2-550 -->
                <span class="boardHead3">답변상태</span> <!-- wid150 -->
                <span class="boardHead4">등록일</span> <!-- wid150 -->
            </div>
      <div id="Accordion_wrap">      
    <% if (boardList == null || boardList.size()==0) { %>
        	<div class="que">
                <span style="padding-left: 38%;">목록이 하나도 없습니다</span>
                
            </div>
            
<% } else { %>           
<%

	for(LostBoardVO boardVo : boardList){
%>            
           	<div class="que">
                    <span class="boardHead1"><%=boardVo.getLb_no() %></span>
                    <span class="boardHead2"><%=boardVo.getLb_title() %></span>
                    <span class="boardHead3">
                   
                    <% 
				    String lbState = boardVo.getLb_state();
				    if (boardVo.getLb_state() == null) {
				        out.print("미등록");
				    } else if (boardVo.getLb_state().equals("OK")) {
				        out.print("등록");
				    }
				    %>
   					
   					</span>
                    <span class="boardHead4"><%=boardVo.getLb_date() %></span>
           </div>
           <div class="anw"> 
          		 <div class="button-container">
	            	 <input type="button" id="updateBoard" data-lb_no="<%=boardVo.getLb_no() %>" value="수정">
	            	 <input type="button" id="deleteBoard" data-lb_no="<%=boardVo.getLb_no() %>" value="삭제">
            	 </div>   
            	 
                <div class="detail">
                	<%-- br태그 줄바꿈으로 변경 --%>
                    <%=boardVo.getLb_content() %>
                    
                    <div id="lostAnswer">
                    <% 
				    String lbAnswer = boardVo.getLb_answer();
				    String lbAnsDate = boardVo.getLb_ans_date();
				    if (boardVo.getLb_answer() != null) {
				    %>
				   	<p>
				   	<% 	
				        out.print(lbAnsDate);
				   	%>
				   	<br>
				   	<%
				        out.print(lbAnswer);
				    %>
				    </p>
   					</div>
   					<% 
				    } 
				    %>
                </div>
            </div>
 <%
	}
}
 %>
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
       <div class="quick-area" style="display: block; position: fixed; bottom: 20px; right: 7%;">
    	<a href="#" class="btn-go-top" title="top">
    		<img src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png" alt="최상단으로 이동">
    	</a>
    	</div>
	</body>
</html>