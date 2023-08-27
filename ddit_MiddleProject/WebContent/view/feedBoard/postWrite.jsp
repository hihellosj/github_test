
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.feed.vo.FeedVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">

<title>커뮤니티 : 무비포스트 작성</title>

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

<!-- 파비콘 -->
<!-- <link rel="icon" href="#"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function(){
	
	var lec = $('#user_idd').val();
	var mvno = $('#mv_noo').val();
	
	
	
	
	$("#btnList").on("click", function(){
		var form = document.getElementById("insertForm");
		form.method = "GET";
		form.action = "<%=request.getContextPath() %>/postView.do";
		form.submit();
		
	});
	
	
	$("#btnInsert").on("click", function(){
		var form = document.getElementById("insertForm");
		form.method = "POST";
		form.action = "<%=request.getContextPath() %>/postView.do";
		form.submit();
	});
	
	$('.click-img').click(function(){
		$(this).clone().appendTo('.clone-img'); // 이 것(.click-img)을 복사(clone())해서 첨부하고 싶어 어디에? .clone-img에...
		
		
		
	});
	
	$('.clone-img').click(function(){
		$('.clone-img img').detach(); // .clone-img 내 모든 <img>를 삭제한다.

		
	});
	
	$('#testsb').on("click", function(){
		var str = $('#select .clone-img img').attr('src');
		var fileName = str.split("/").pop();
		var fbcontent = $('#fb_content').val();
		console.log(fbcontent);
		console.log(fileName);
		
		$.ajax({
			url : "<%=request.getContextPath() %>/postWrite.do",
			type : "POST",
			data:{
				"mi_img" : fileName,
				"user_id" : lec,
				"mv_no" : mvno,
				"fb_content" : fbcontent
			},
			success: function(res){
				if(res!=0){
					alert("등록됐습니다");
					console.log(res);
					//document.location.href = document.location.href;
					location.href= "<%=request.getContextPath() %>/feedList.do";
				
				}else{
					alert("오류");
				}
				
				 
			}
		});
		
	
	});
	
	
	
	
});

//로그인 여부 확인 및 버튼 표시/숨김 업데이트 함수
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

<style>

#header{
}

#footer{
	position: absolute;
}
.content{

	min-height: 700px;
 	display: flex;
    height: auto;
    flex-direction: column;
    width: 100%;
    align-items: center;
}

.inner-wrap{
	width: 60%;
	
	padding: 120px 100px;
	margin : 20px;

}

.feedwrite{
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}


h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #503396;
    line-height: 1.1;
}

.movielisttit {
    overflow: hidden;
    height: 50px;
    padding-top: 10px;
    border-top: 1px solid #555;
}

#moviecon{
    border: 1px solid #cacaca;
    border-radius: 10px;
    width: 500px;
    margin: 0 auto;
    padding-top: 40px;
    height: 650px;
}
.movielist{
	overflow: auto;
	border: 1px solid #cacaca;
	border-radius: 10px;
	width : 500px;
	margin : 0 auto;
}

.modal-body{
	margin : 0px auto;
	width : 400px;
	height: 650px;
	padding-top : 30px;
}

.click-img{
	text-align: center;
	margin: 10px;'
}
.click-img img{
    width: 100%;
    }
.btns{
	text-align: center;
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
 
 #select .click-img img{
 height: 150px;
 }

</style>

</head>




<body>

<%MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	
	%>
	
	<%List<FeedVO> image = (List<FeedVO>)request.getAttribute("getAllImage"); %>
	
	

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
                   <%
                   System.out.print(request.getContextPath()); %>
                </ul>
            </nav>
        </div>
	</header>

<div class="content">
 
  <div class="inner-wrap">
   <h3 class="tit">무비포스트 작성</h3>
   <div class="movielisttit">
      </div>
     
    <div class="feedwrite">  
    
    <div>  
    <p>원하시는 스틸컷을 선택해주세요.</p><br>
     <div class="movielist"> 

	<%-- 
	<%testVO loginMember = (testVO)session.getAttribute("loginMember");
	System.out.println(loginMember.getUser_id());
	%>
	 --%>
	  <div class="modal-body">
	
	  <form id="insertForm" name="insertForm" >
	
	
      <input type="hidden" id="user_idd" name="user_id" value="<%=loginMember.getUser_id() %>">
      <input type="hidden" id="mv_noo" name="mv_no" value="<%=image.get(0).getM_id() %>">
	
	
	  <%for(FeedVO a : image){ %>
			<div class="click-img">
			
			<img  src="<%=request.getContextPath() %>/images/<%=a.getMi_img() %>">
			
			</div>
			
			<!-- 이제 여기다가 클릭 이벤트 걸고 옆에 화면에 띄우는 -->
	
  <%} %>
        

      
	</form>
    </div>
   </div>
   </div>
   <div>
   <p>무비포스트를 작성해주세요.</p><br>
          <div id="moviecon" style="padding : auto"> 
        
     
        
        <div style= "height : 500px">
          <div id="select" style="height: 200px;">
        <div class="clone-img" style="padding-top:20px;margin: auto;  width: 300px;">
        
        </div>
        </div>
        <div style="margin: 20px;">
            <textarea style="padding: 10px; width: 80%; margin : 10px 50px" rows="10" cols="40"  class="txt" id="fb_content" name="fb_content"></textarea>
            
            </div>
           
            <div class="btns">
	            
	        	<input type="button" id="testsb" value="저장">
	            <input type="button" id="btnList" value="취소">
        	</div>
        	
        </div>
        	
       </div>
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
</body>
</html>