<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.onetoone.vo.QnAboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 : 1:1문의내역</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">
<link rel="icon" href="#">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/tab.js"></script>
<script src="<%=request.getContextPath() %>/js/common.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js" type="text/javascript"></script>





<style>

.col-detail{
	padding: 30px 0 0 0;
}

body{
	display: flex;
	flex-direction: column;
}
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

.bx_file {
	width : 100px;
    position: relative;
    display: inline-block;
}

.tbl_form {
    border-top: 1px solid #BBBBBB;
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

}

thead {
	background: gray;
}

.card-body {
	text-align: center;
}

.page-body-wrapper {
	padding-top: 0px;
}

.tcen {
	text-align: center;
}

.text-right {
	text-align: right !important;
	margin-right: 80px;
}

.listtr {
	border-bottom: 1px solid gray;
}

.qnatr td.ans {
	width: 650px;
	height: 170px;
}

.ansattr {
	width: 40px;
	padding: 14px 0 0 0;
	vertical-align: top;
}

.anstit {
	width: 500px;
}

.table-responsive {
	text-align: center;
}

#beforeupdate{
	padding : 0;
}


input{
	cursor: pointer;
}

.pagination{
	display : flex;
    justify-content: center;
}

.pagination a{
	border: 1px solid #ebebeb;
	border-radius: 4px;
	padding: 0 8px;
	font-size: 1.2rem;
	margin : 5px;
}

.pagination .active {
	
} 

.set-btn{
  float: right;
}

#myboard {
    width: 100%;
    border-bottom: 1px solid gray;
    border-top: 1px solid gray;
    color: #666;
    text-align: center;
}
.myboardth{
	background: #d2d2d2;
}
.tbl-data td.nodata {
    padding: 45px 0;
    text-align: center;
}
span{
  font-size: 13px;
}

.nodata{
  font-size: 13px;
}

.box-inner{
  margin-top: 50px;
}

table {
    border-spacing: 2px;
    border-collapse:separate;
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
	MemberVO vo=null;
	String loginInfo = null;
	String admin = null;
	if(session.getAttribute("loginMember")!=null){
		vo = (MemberVO)session.getAttribute("loginMember");
		loginInfo = vo.getUser_name();
		admin = vo.getAdmin();
	} 	
%>

<%
	List<QnAboardVO> list = (List<QnAboardVO>)request.getAttribute("questionList");
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
					<li class="fl_left"><a href="<%=request.getContextPath()%>/boardList.do">고객센터</a></li>
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
			 <div class="col-detail" id="mycgv_contents">
				    
				<div>
				<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMjAyMTIyMTg0MmRku2RkFAvCkD19J2zWnHfTY+qaCQ0=">
				</div>
				
				<div>
				
					<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="D1AE53DC">
				</div>
				
			    <div class="tit-mycgv">
				    <h3>나의 문의내역</h3>
			    </div>
			    
				<div class="tit-mycgv">
				    <h4>1:1 문의</h4>
				</div>
				
				<form method="post" action="<%=request.getContextPath()%>/QuestionDelete.do">
				<input type="hidden" id="user_id" name="user_id" value="<%=vo.getUser_id() %>">
				
			    <div class="set-btn">
			     <p class="del">
			        <button type="submit" id="btndelete" class="btndelete"><span>선택삭제</span></button>
			     </p>
			    </div>
			    
			    <div class="tbl-data">
			        <table id="myboard" summary="문의내역 및 답변내역에 대한 정보 제공">
					    <colgroup>
					        <col width="3%">
					        <col width="8%">
					        <col width="15%">
					        <col width="*">
					        <col width="20%">
					        <col width="10%">
					    </colgroup>
			            <thead>
			                <tr>
			                    <th class="myboardth" scope="col"><input type="checkbox" id="chkAllItem" name="chkAllItem"><label for="chkAllItem"></label></th>
			                    <th class="myboardth" scope="col">번호</th>
			                    <th class="myboardth" scope="col">문의유형</th>
			                    <th class="myboardth" scope="col">제목</th>
			                    <th class="myboardth" scope="col">등록일</th>
			                    <th class="myboardth" scope="col">상태</th>
			                </tr>
			            </thead>
			            <tbody id="items">
			                
			                <%
			                    if(list == null || list.size() == 0){
			                 %>
			                <tr>
			                    <td colspan="6" class="nodata">
			                        
			                    	    고객님의 상담 내역이 존재하지 않습니다.
			                        
			                    </td>
			                </tr>
			                <%
			                        	}else{
			                            	for(int i = 0; i < list.size(); i++){
			                                	QnAboardVO board = list.get(i);
			                %>
			                <tr class="listtr">
			                 	<td><input type="checkbox" name="chk_list" value="<%=board.getCs_no()%>"></td>
			                    <td class="listno"><%=board.getCs_no() %></td>
			                    <td><%=board.getCs_category() %></td>
			                    <td><a href="#" onclick="cstitle(this);">
												<%=board.getCs_title() %></a></td>
			                    <td class="tcen"><%=board.getCs_date()%></td>
			                    <td><%=board.getCs_ans_state() %></td>
			                </tr>
			                
			                <tr style="display: none; background: #fafafa;" class="qnatr">
								<td colspan="7" style="text-align: center;">
									<%-- <form id="qnaanswer" method="post"
										action="<%=request.getContextPath()%>/QnAboardAnswer.do?cs_no=<%=board.getCs_no()%>"> --%>
									<div id="qnaanswer">
										<input type="hidden" id="cs_no" name="cs_no" value="<%=board.getCs_no()%>">
										<table style="border: 1px soild; width: 800px; margin: 0 auto;">
											<tbody>
												<tr>
													<td class="ansattr">
													<img style="width: 19px;" src="<%=request.getContextPath()%>/images/icon_q.gif"></td>
													<td style="text-align: left; font-weight: bold; height : 41px; "><%=board.getCs_title()%></td>
												</tr>
												<tr id="contentform">
													<td class="ansattr"></td>
													<td class="cs_content" style="text-align: left; height : 41px; vertical-align: top; "><%=board.getCs_content()%></td>
													
												</tr>
												<tr id="photoform">
													<td class="ansattr"></td>
													<% if(board.getCs_photo()==null){ %>
													<td></td>
													<%}else{%>
													<td class="cs_photo" style="text-align: left; height : 41px; ">첨부파일 : <a href="<%=request.getContextPath() %>/FileDownload.do?cs_no=<%=board.getCs_no() %>" ><%=board.getCs_photo()%></a></td>
												
												    <%
													 }
												    %>
												</tr>
												
												<% if(board.getCs_answer()==null){ %>
												<tr id="photoform">
												  <td class="ansattr"><img style="width : 19px;" src="<%=request.getContextPath()%>/images/icon_a.gif"></td>
												   <td class="noans" style="text-align: left;">
			                        
			                    					   답변 내역이 존재하지 않습니다.<br>
			                    					   
			                   					   </td>
			                   					 <%}else{%>
			                   					 <tr>
													<td class="ansattr"><img style="width: 19px;"
														src="<%=request.getContextPath()%>/images/icon_a.gif"></td>
													<td class="beforeupdate" style="text-align: left;"><%=board.getCs_answer()%></td>
												 </tr>
												
												 <%
													}
												 %>
			                   							 
													</tbody>
												</table>
											</div>
										</td>
									</tr>
													
													
			                
			                
			    		    <%
			                       }
			                    }
			                %>
			            </tbody>
			        </table>
			    </div>
			    </form>
			    <!--?xml version="1.0" encoding="utf-8"?-->
				<div class="paging"></div>
			
			    <div class="sect-mycgv-reserve qna">
			        <div class="box-polaroid">
				        <div class="box-inner qna">
				            <p><strong>자주하시는 질문</strong> <a href="<%=request.getContextPath() %>/boardList.do" class="round gray on"><span>바로가기</span></a></p>
				            <span>고객님들께서 주로 하시는 질문에 대한 답변을 한곳에 모아두었습니다.</span>
				        </div>
				        <div class="box-inner words">
				            <p><strong>고객의 말씀</strong> <a href="<%=request.getContextPath() %>/view/onetooneBoard/qnaForm.jsp" class="round gray on"><span>문의하기</span></a></p>
				            <span>불편사항과 문의사항을 남겨주시면 친절히 답변드리겠습니다.</span>
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
                    <li class="fl_left"><a href="<%=request.getContextPath()%>/boardList.do">고객센터</a></li>
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

<script>
function updateButtonVisibility() {
    var loginMember = "<%= vo.getUser_id()%>"; 
    
    var addBtn = document.getElementById("addBtn");
    var updateButtons = document.querySelectorAll(".updateBtn");
    var deleteButtons = document.querySelectorAll(".deleteBtn");
    
    if (loginMember !== "admin") {
        addBtn.style.display = "none";
        for (var i = 0; i < updateButtons.length; i++) {
            updateButtons[i].style.display = "none";
            deleteButtons[i].style.display = "none";
        }
    }
}

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
    
function cstitle(target){
	 vnext =   $(target).parents('tr').next();
	 $(vnext).toggle();
	 
	 
	 
	 brcontent=$(target).parents('.listtr').next('.qnatr').find(".cs_content").text().replace(/\n/g, "<br>");
	 branswer=$(target).parents('.listtr').next('.qnatr').find('.beforeupdate').text().replace(/\n/g, "<br>");
	 /*console.log($(target).parents('.listtr').next('.qnatr').find('.beforeupdate').text());*/
	
	$(target).parents('.listtr').next('.qnatr').find('.cs_content').empty().html(brcontent); 
	 $(target).parents('.listtr').next('.qnatr').find('.beforeupdate').empty().html(branswer);
	  
	 
 }
 
$(function(){
    //전체선택 체크박스 클릭
	$("#chkAllItem").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#chkAllItem").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	})
	
	
	
	
	
	 $('#btndelete').on('click', function(){
	
	 	if($("input:checkbox[name = 'chk_list']:checked").length === 0){
	 		alert("삭제할 항목을 선택해 주세요");
	 		return;
	 	}
	 
	 	$('input:checkbox[name=chk_list]').each(function (index) {
	 		if($(this).is(":checked")==true){
	 	    	console.log($(this).val());
	 	    	listno = $(this).val();
	 	    }
	 
	 	})
	 	
	 
	 
	 
	 		})
	 		
	 		
	
	
	
	
})

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
</html>