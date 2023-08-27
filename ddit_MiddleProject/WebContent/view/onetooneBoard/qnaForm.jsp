<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<head>
<meta charset="utf-8">
<title>고객센터 : 1:1문의게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/csss/customerservice.css"> > 

<!-- 파비콘 -->
<!-- <link rel="icon" href="#"> -->

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">


<!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
<![endif]-->
<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.bxslider.min.js"></script>
<script src="<%=request.getContextPath() %>/js/tab.js"></script>
<script src="<%=request.getContextPath() %>/js/common.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"  type="text/javascript"></script>

<style type="text/css">
header{
	position: fixed;
    z-index: 90;
}



#content {
    width: 980px;
    margin: 0 auto;
    
}


.contents_customer .con_tit {
    font-size: 20px;
    margin: 20px 0;
}

.contents_customer .con_tit .group_rgt {
    float: right;
    margin-top: 4px;
}

table{
	
	height : 550px;
}

.bx_file {
	width : 100px;
    position: relative;
    display: inline-block;
}

.tbl_form {
    margin-bottom: 60px;
    font-size: 12px;
}

.tbl_form th {
    font-weight: bold;
    text-align: left;   
}

select, input, textarea{
	font-size: 12px;
}

textarea {
    width: 100%;
    line-height: 1.5;
    box-sizing: border-box;
    padding: 13px 18px;
    border: 1px solid #DDD;
    resize: none;
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
}

.fl_r {
    float: right !important;
}

.cs_title{
	margin-top : 110px;
	padding-top:0;

}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
	vertical-align: middle;
}



</style>
<script type="text/javascript">
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
</head>
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
%>
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


  
<div id="content" style="margin-top: 150px;">
<div class="cs_title">
    <a id="cst" href=""><h3>고객센터
    <span>무엇을 도와드릴까요?</span>
    </h3></a>
  </div>
  <div class="category_menu">
    <div class="category_coSntents_wrap">
      <ul class="category_content">
        <li id="cm1" name="categorymenu" >
          	<a href="<%=request.getContextPath()%>/boardList.do">FAQ</a>
        </li>
        <li id="cm2" name="categorymenu" class="">
			<a href="<%=request.getContextPath()%>/board/*">공지사항</a>
        </li>
        <li id="cm3" name="categorymenu" class="active">
          	<a href="<%=request.getContextPath()%>/qnaForm.jsp">1:1문의</a>
        </li>
        <li id="cm5" name="categorymenu" class="">
          	<a href="<%=request.getContextPath()%>/view/lostBoard/lostBoardForm.jsp">분실물문의</a>
        </li>
      </ul>
    </div>
  </div>

<div class="con_tit ty2">
<h4 class="tit">문의내용</h4>
</div>
<form id="qnaform" method="post" enctype="multipart/form-data"
	action="<%=request.getContextPath()%>/QnAboardWrite.do" >
	<input type="hidden" name="user_id" value="<%=loginMember.getUser_id() %>"> 
<table class="tbl_form" summary="문의내용작성 테이블">
	<colgroup><col style="width: 15%;"><col style="width: auto;"></colgroup>
	<tbody>
	<tr>
		<th scope="row" class="req">분류</th>
		<td><select style="height: 25px; padding-left:10px"title="문의내용 분류선택" name="cs_category" id="iDdivisionCode">
				<option value="미분류" selected="">분류 선택</option>
				<option value="영화관">영화관</option>
				<option value="영화">영화</option>
				<option value="멤버십">멤버십</option>
				<option value="결제">예매/결제</option>
				<option value="이벤트/시사회/무대인사">이벤트/시사회/무대인사</option>
				<option value="홈페이지/모바일">홈페이지/모바일</option>
				<option value="개인정보">개인정보</option>
				<option value="관람권/할인권">관람권/할인권</option>
			</select>
		</td>
	</tr>
	<tr>
		<th style="font-size: 12px;" scope="row" class="req">제목</th>
		<td ><input type="text" style="height: 25px; font-size: 11px" class="ty2 w_full" placeholder="제목을 입력해주세요" title="문의내용 제목입력" name="cs_title" id="iDtitle">
		</td>
	</tr>
	<tr  style="height: 350px;"><th style="vertical-align: middle;" scope="row" class="req" >내용</th>
		<td ><textarea class="ty2" name="cs_content" cols="10" rows="14" id="iDcontents" title="문의내용을 입력해주세요" placeholder="내용 및 첨부파일에 개인정보(카드번호, 계좌번호, 주민번호)가 포함되지 않도록 유의하여 입력해주세요."></textarea>
		</td>
	</tr>
	<tr><th scope="row">첨부파일</th>
		<td><div class="bx_file ">
			<input type="file" id="file" name="cs_photo">
			<div class="file_item"></div>
			</div><span class="txt_caution1 fl_r with_inp">첨부 파일형식 : jpg / jpeg / png / bmp / gif / pdf (5MB X 1개)</span>
		</td>
	</tr>

	
	<tr><td colspan="2" style="text-align:center;">
		<input type="submit" value="저장"> <input type="reset" value="취소">
				
		</td>
	</tr>
	</tbody>
</table>
</form>
  
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
</body>
</html>