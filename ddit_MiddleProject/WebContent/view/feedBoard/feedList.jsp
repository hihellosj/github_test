<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.feed.vo.FeedVO"%>
<%@page import="java.util.List"%>
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
<meta charset="UTF-8">
<title>2U4U시네마 : 커뮤니티</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">

<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

<!-- 파비콘 -->
<!-- <link rel="icon" href="#"> -->

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/common.js"></script>

<script>

$(function(){
	console.log("한글");
	
	var led = $('#fb_noo').val();

	console.log(led);

	var lec = $('#user_idd').val();
	
	console.log(lec);
	
	$("#writeMoviePost").on("click", function(){
		var test = $(this).val();
		var test1 = $(this).attr("testParam");
		console.log(test);
		console.log(test1);
		
	location.href="<%=request.getContextPath() %>/postView.do?userId="+test+"&taste="+test1+"";
		
	});
	
	
	
	
	$('.content-bottom > div').hide();
    $(".content-bottom > div").slice(0, 4).css("display", "block"); // 맨 처음 몇 개 보여줄껀가용 ^_^
    $("#load").click(function(e){
    	console.log("통과하기1");
       e.preventDefault();
       $(".content-bottom >div:hidden").slice(0, 4).fadeIn(200).css('display', 'block'); // 클릭시 묯 개 씩  더 보여줄껀가dragon ^^7
       if($(".content-bottom >div:hidden").length == 0){ // 더 나올꺼 있냐~
           $('#load').fadeOut(100); // 응 없어~
       }
   });  
    
    
    $(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
    	var fbNo = $(this).attr("value");
    	
    	console.log(fbNo);
    	
    	
    	
    	
   
    	
    	
    	
        $("#"+fbNo).show();   //팝업 오픈
        $("body").append('<div class="backon"></div>'); //뒷배경 생성
        });
        
        $("body").on("click", function(event) { 
        	
            if(event.target.className == 'modal_close_btn' || event.target.className == 'backon'){
                $(".popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
                  $(".backon").hide();
            }
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

.content-top{
	display : block; 
}




.content{
	display : flex;
	flex-direction: column;
	padding: 120px 200px;
}

.post-lank-box {
    width: 100%;
    height: 331px;
    padding: 30px 225px;
    background: url(https://img.megabox.co.kr/static/pc/images/movie/bg-movie-post-top.png) no-repeat center 0;
}

ol{
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.post-lank li{
	float: left;
	padding : 20px;
}

.post-lank-box .post-lank li a .lank {
	position: absolute;
    font-style: italic;
}

.post-lank-box .post-lank li a .post-count {
    position: absolute;
    width: 150px;
    height: 200px;
    padding-top: 73px;
    background-color: rgba(0,0,0,.6);
    text-align: center;
    z-index: 2;
}

.post-lank-box .post-lank li .img img {
    width: 150px!important;
    height: 200px!important;
}

.top5Btn:hover .post-count{
	display:none;
}

.post-lank-box .post-lank li a .post-count .tit {
    font-size: .8667em;
    line-height: 1.1;
    color: #fff;
}

.post-lank-box .post-lank li a .post-count .count {
    font-size: 2.1333em;
    font-family: Roboto;
    color: #fff;
    font-weight: 300;
}

h2.tit {
    padding: 0 0 0 20px;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}

#writeMoviePost{
	padding-right: 20px;
}

.card-body{
	padding: 20px;
}

.inner-wrap {
    width: 1400px;
    margin: 0 auto;
}

.feed-container{
	float: left;
    width: 300px;
    margin: 0 0 40px 40px;
   /*   position: absolute; */ 
   
   
    left: 0px;
    top: 0px;
}

.btnpost btn-dark float-right {
       width: 123px;
    padding: 0;
}

.search-container{
	display: flex;
    flex-direction: row;
    margin : 10px 0 10px 0;
}

#card-body-container{
	padding : 10px 0 10px 0 ;
}

.feed-container .img{
 	width: 100%;
    height: 200px;
    overflow: hidden;	
}


.feed-container .img img {
    width : 100%;
    height: auto;
    min-height: 169px;
    display: block;
}

.content-feed{

    overflow: hidden;
    display: block;
    border-radius: 10px;
}

.content-bottom{
	position: relative;
    height: auto;
    display: flex;
    flex-wrap: wrap;
}


//---------------------------------------------------------



.popup01{
    display: none;
}

.popup01{
	width: 700px;

    top: 100px;

	height: 950px;
	position: absolute;
	left: 30%;
	background-color: #fff;
	z-index: 802; 
}

.backon{
    content: "";
    width: 100%;
    height: 100%;
    background: #00000054;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 801;
}


.openPopup{

  cursor:pointer;

}



.feediframe{
	width: 800px;
    height: 900px;
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

<%
List<FeedVO> feedList = (List<FeedVO>)request.getAttribute("bb"); 
List<FeedVO> getRank = (List<FeedVO>)request.getAttribute("getRank"); 
MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");


%>
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
					<li class="fl_left">
					<a href="<%=request.getContextPath()%>/boardList.do">고객센터</a>
					</li>
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
	<div class="post-lank-box">
	
	  
	    <div style="float: right;">

	  	  <button type="button" class="btnpost btn-dark float-right" id="writeMoviePost" value="<%=loginMember.getUser_id() %>" testParam="snack">무비포스트 작성</button>
	  	
	    </div>
	    
	    <h2 class="tit">무비포스트</h2>
        
        <ol class="post-lank">
           <% 
           int a = 0;
           for(FeedVO fvo : getRank){ 
           a+=1;
           %>
         	  <li>
         	    <a href="<%=request.getContextPath() %>/movieDetail.do?m_id=<%=fvo.getM_id() %>" class="top5Btn" >
         	      <p class="lank"> <%= a %></p>
         	      <div class="post-count">
					<p class="tit">POST</p>
					<p class="count"><%=fvo.getCountpost() %></p>
				  </div> 
				  <p class="img">
         	        <img src="<%=request.getContextPath() %>/images/<%=fvo.getMi_mainimg() %>.jpg"/></p>
         	    </a>
         	  </li>
         <%
         	if(a==5){
         		break;
         	}
           } %>   
        </ol>
                 
         
       </div>
    


  <div class="content-middle">

    <div class="topnav">
  
      <div class="search-container" style="margin-top: 50px;">
  	
      <form action="<%=request.getContextPath() %>/feedList.do" method="post">
    
        <button type="submit" class="searchbtn info" value="allPost"  id="allPost" name="allPost" style= "margin-left: 40px; float : none">모든 영화</button>
    
      </form>
    
      <form action="<%=request.getContextPath() %>/feedList.do" method="post">
    
        <button type="submit" class="searchbtn info" value="<%=loginMember.getUser_id() %>"  id="myPost" name="myPost" style= "margin-left:30px; float : none">내가 쓴 포스트</button>
    
      </form>
    
      <form action="<%=request.getContextPath() %>/feedList.do" method="post" style="margin-left:auto; margin-right: 40px;">
    
	    <select id="mvselect" name="mvselect" class="searchSelectBar">
	    	<option value="mvno">제목</option>
	    	<option value="mvgenre">장르</option>
	    	<option value="mvdirector">감독</option>
	    	<option value="mvcast">출연진</option>
	    </select>
    
	    <input type="text" placeholder="제목, 장르, 감독, 출연진 " name="searchFeed" class="searchSelectBar2">
	    
	     <!-- <button class="btn btn-primary btn-circle" type="submit">
   			 <i class="search-icon"></i>
  		 </button> -->
	    
      </form>
    </div>
  </div>





 </div>


 <div class="content-bottom">
 <%
	for(FeedVO fvo : feedList){

 %>



<!-- 카드 하나 -->
         
         <div class="feed-container">
          <div class="content-feed" style="border: 1px solid #cacaca;">
            <div class="img">
            <a href="#" class="openPopup" value="<%=fvo.getFb_no() %>">
            <%-- <a href="<%=request.getContextPath() %>/feedView.do?fb_no=<%=fvo.getFb_no() %>" --%>
              <img src="<%=request.getContextPath() %>/images/<%=fvo.getMi_img() %>" alt="" >
            </a>
			  <div class="popup01" id="<%=fvo.getFb_no() %>" style="height:auto; overflow:hidden;display: none; top: -500px;">
			  <div>
			    <iframe style="width:100%" src="<%=request.getContextPath() %>/feedView.do?fb_no=<%=fvo.getFb_no() %>" class="feediframe"></iframe>
			   </div>
			   <div style="text-align: center; margin:20px;"> <input type="button" class="modal_close_btn" onClick="window.location.reload()"value="닫기"></div>
		  	  </div>
 
            </div>
            
            <div class="content-feed-bottom" id="aaa">
              <div class="card-body">

                

                <div id="card-body-container">
                  <div>
                    <div class="card-text"><%=fvo.getUser_id() %></div>
                  </div>
                </div>
                
                 <div id="card-body-container">
                 <div>
                    <div class="card-text"><%=fvo.getM_name() %></div>
                  </div>
                </div>
              
                <div id="card-body-container">
                  <div>
                    <div class="card-text"><%=fvo.getFb_content() %></div>
                  </div>
                </div>
                
                <div id="card-body-container">
                  <div>
                    <div class="card-text"><%=fvo.getFb_date() %></div>
                  </div>
                </div>
              
                <div id="card-body-container">
                  <div class="feed-views">
                    <div>
                     	 조회수  <%=fvo.getFb_count() %>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </div>


	<%
	}
	%>



    </div>
  </div>
</div>

<div class = "more" style="text-align: center; margin-top: -70px; font-weight: bold;">
	<a href="#" id="load">MORE</a>	
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