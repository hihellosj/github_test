<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.onetoone.vo.QnAboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객센터 : 1:1문의게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/index.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/csss/customerservice.css"> 
<link rel="icon" href="#">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/tab.js"></script>
<script src="<%=request.getContextPath() %>/js/common.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




<style>
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
	vertical-align: middle;
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

th, td {
	padding: 10px;
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




</style>


<script type="text/javascript">
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

</head>

<body>
	<div style="display: none; text-align: center;" id="modifyform">
		<p style="text-align: left;"><textarea rows="10" cols="120"></textarea></p>
		<input type="button" value="확인" id="btnok"> 
		<input type="button" value="취소" id="btnreset">
	</div>


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


	<div id="container" style="margin-top: 150px;">
	
		<div id="contents">
		
			<div class="cs_title">
				<a href=""><h3>
						고객센터 <span>무엇을 도와드릴까요?</span>
					</h3></a>
			</div>
			
			<div class="category_menu">
				<div class="category_coSntents_wrap">
					<ul class="category_content">
						<li id="cm1" name="categorymenu" class="">
							<a href="<%=request.getContextPath()%>/boardList.do">FAQ</a></li>
						<li id="cm2" name="categorymenu" class="">
							<a href="<%=request.getContextPath()%>/board/*">공지사항</a>
						</li>
						<li id="cm3" name="categorymenu" class="active">
							<a href="<%=request.getContextPath()%>/view/onetooneBoard/qnaForm.jsp">1:1문의</a>
						</li>
						<li id="cm5" name="categorymenu" class="">
							<a href="<%=request.getContextPath() %>/view/lostBoard/lostBoardForm.jsp">분실물문의</a>
						</li>
					</ul>
				</div>
			</div>
			
			<fieldset class="search_wrap ty2">
				<input type="text" placeholder="검색어를 입력하세요." id="searchKeyword"
					title="검색어를 입력해주세요">
				<button type="button" class="btn_col2">검색</button>
			</fieldset>


			<form method="post" action="<%=request.getContextPath()%>/QnAboardDelete.do">
			
			<input id="btndelete" type="submit" value="선택삭제" style="float: right" >
	
			<div class="table-responsive">
				<table class="table table-hover">
					<colgroup>
						<col width="8%" />
						<col width="11%" />
						<col width="40%" />
						<col width="11%" />
						<col width="11%" />
						<col width="11%" />
						<col width="8%" />
					</colgroup>
					<thead class="table-dark">
						<tr class="listtr">
							<th>번호</th>
							<th>카테고리</th>
							<th class="anstit">제목</th>
							<th>문의자</th>
							<th class="tcen">문의일</th>
							<th>상태</th>
							<th><input style="-webkit-appearance: auto;" type="checkbox" id="allCheck">선택</th>
						</tr>
					</thead>
					<tbody id="yyy">

						<%
                             List<QnAboardVO> list = (List<QnAboardVO>)request.getAttribute("boardList");
                             if(list == null || list.size() == 0){
                             %>
                             
						<tr>
							<td colspan="7" style="text-align: center">조회하실 게시글이 존재하지 않습니다.</td>
						</tr>
						
						<%
                        	}else{
                            	for(int i = 0; i < list.size(); i++){
                                	QnAboardVO board = list.get(i);
                         %>
                         
						<tr class="listtr">
							<td class="listno"><%=board.getCs_no() %></td>
							<td><%=board.getCs_category() %></td>
							<td class="answercon">
							<a href="#" onclick="cstitle(this);">
									<%=board.getCs_title() %></a></td>
							<td><%=board.getUser_id() %></td>
							<td class="tcen"><%=board.getCs_date()%></td>
							<td><%=board.getCs_ans_state() %></td>
							<td><input style="-webkit-appearance: auto;" type="checkbox" name="chk_list" value="<%=board.getCs_no()%>"></td>
						</tr>
						
						<tr style="display: none; background: #fafafa;" class="qnatr">
							<td colspan="7" style="text-align: center;">
								<%-- <form id="qnaanswer" method="post"
									action="<%=request.getContextPath()%>/QnAboardAnswer.do?cs_no=<%=board.getCs_no()%>"> --%>
									<div id="qnaanswer">
									<input type="hidden" id="cs_no" name="cs_no"
										value="<%=board.getCs_no()%>">

									<table style="border: 1px soild; width: 800px; margin: 0 auto;">
										<tbody>
											<tr>
												<td class="ansattr">
												<img style="width : 19px;" src="<%=request.getContextPath()%>/images/icon_q.gif"></td>
												<td style="vertical-align: top; text-align: left; font-weight: bold; height : 41px; padding : 15px 0 0 0"><%=board.getCs_title()%></td>
											</tr>
											
											<tr id="contentform">
												<td class="ansattr"></td>
												<td class="cs_content" style="text-align: left; height : 41px; vertical-align: top; padding:0;"><%=board.getCs_content()%></td>
												
											</tr>
											<tr id="photoform">
												<td class="ansattr"></td>
												<% if(board.getCs_photo()==null){ %>
												<td><td>
												
												<%}else{%>
												<td class="cs_photo" style="vertical-align: middle; padding : 0; text-align: left; height : 41px; "><a href="<%=request.getContextPath() %>/FileDownload.do?cs_no=<%=board.getCs_no() %>" >첨부파일 : <%=board.getCs_photo()%></a></td>
												
											    <%
												  }
											    %>
											    
											</tr>

											<% if(board.getCs_answer()==null){ %>
											
											<tr class="answerform">
												<td class="ansattr">
												<img style="width : 19px;" src="<%=request.getContextPath()%>/images/icon_a.gif"></td>
												<td class="ans" style="text-align: left; height:30px; padding:0;">
												<p style="margin-top : 13px;" class="aa"></p>
												<p class="btn" style="text-align: left;"><textarea name="cs_answer" class="cs_answer" rows="10" cols="120" ></textarea>
												<div style="text-align: center;">
												<input class="btnAnswer" type="button" value="확인" > 
												</div>
												<p class="newbtn" style="display : none;">
												<input class="hiddenupd" type="button" value="수정"> 
												<input class="hiddencan" type="button" value="취소">
												</p>
												</td>
												
											</tr>
											

											
											<%}else{%>
											
											<tr class="notnullanswer">
												<td class="ansattr"><img style="width : 19px;"
													src="<%=request.getContextPath()%>/images/icon_a.gif"></td>
												<td class="beforeupdate" style="padding: 16px 0 0 0;  text-align: left;"><%=board.getCs_answer()%></td>
											</tr>

											<tr class="beforetr">
												<td class="ansattr"></td>
												<td style="">
												<input class="btnUpdate" type="button" value="수정"> 
											</tr>
											
											<%
												}
											%>


										</tbody>
									</table>
								 
								<%
                                     }
                                  }
                                %>
                                </div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<ul class="pagination">
				    <li class="active"><a class="page-link" href="#">&lt;
				    </a></li>
				    <li class="active"><a class="page-link" href="#">1</a></li>
				    <li class="active"><a class="page-link" href="#">2</a></li>
				    <li class="active"><a class="page-link" href="#">3</a></li>
				    <li class="active"><a class="page-link" href="#">&gt;</a></li>
  				</ul>
			</div>
		</form>
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

<div id="alertBox" style='z-index:99999'></div>
	
</body>

<script>



  
  $(function(){
	    //전체선택 체크박스 클릭
		$("#allCheck").click(function(){
			//만약 전체 선택 체크박스가 체크된상태일경우
			if($("#allCheck").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[type=checkbox]").prop("checked",true);
			// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked",false);
			}
		})
		
		
		
	})
  
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
 	
	  $('.btnAnswer').on('click', function(){
		  if($(this).parents('.answerform').find('.cs_answer').val().length == 0) {

					swal("확인","내용을 입력해주세요!");

	        }else{
			vidx = $(this).parents('#qnaanswer').find('#cs_no').val();
			console.log(vidx);
			console.log($(this).parents('.answerform').find('.cs_answer').val());
				
			//입력한 내용을 가져온다 - 엔터기호가 포함 
	    	bmcont = $(this).parents('.answerform').find('.cs_answer').val().trim();
	    	console.log(bmcont);
			
	    	//엔터기호를 <br>태그로 변경 
	    	amcont = bmcont.replace(/\n/g, "<br>");
	    	console.log(amcont);
	    	//rp3을 찾는다
	    	vp3 = $(this).parents('.ans').find('.aa')
	    	
	    	//modifyform을 body로 이동  -안보이도록 설정 
	    	$(this).parent('.btn').css('display', "none");
	    	$(vp3).html(amcont);
	    	console.log($(this).parents('.answerform').next('.beforetrr').show());
	    	$(this).parents('.ans').find('.newbtn').show();
	    	//서버로 보내기
	    	$.answerInsertServer();
	        }
		
		})
		
		
		
	/* 	$('.hiddenupd').on('click', function(){
			
			vidx = $(this).parents('#qnaanswer').find('#cs_no').val();
			console.log(vidx);
			
			if($('#modifyform').css('display') != "none"){
				replyReset();
			}
			
			modicont = $(this).parents('.ans').find('.aa').html().trim();
			console.log("cont", modicont)
			 
			modi = modicont.replace(/<br>/g, "\n");
			 
		 	$('#modifyform textarea').val(modi);
		 	$('#modifyform').show();
		 	
		 	$(this).parents('.ans').find('.aa').empty().append($('#modifyform'));
		 	$(this).parent().css("display", "none");
		
		
		}) */
	   
	$('.btnUpdate').on('click', function(){
		
		vidx = $(this).parents('#qnaanswer').find('#cs_no').val();
		console.log(vidx);
		if($('#modifyform').css('display') != "none"){
			replyReset();
		}
		
		modicont = $(this).parents('.beforetr').prev().find('.beforeupdate').html().trim();
		console.log("cont", modicont)
		 
		modi = modicont.replace(/<br>/g, "\n");
		 
	 	$('#modifyform textarea').val(modi);
	 	$('#modifyform').show();
	 	
	 	$(this).parents('.beforetr').prev().find('.beforeupdate').empty().append($('#modifyform'));
	 	$(this).parent().css("display", "none");
	
	
	})
	
	
	//댓글 수정창에서 확인버튼 
	$('#btnok').on('click', function(){
		if($('#modifyform textarea').val().length == 0) {

			swal("확인","내용을 입력해주세요!");

   		}else{
		  //입력한 내용을 가져온다 - 엔터기호가 포함 
    	bmcont = $('#modifyform textarea').val().trim();
    	
    	//엔터기호를 <br>태그로 변경 
    	amcont = bmcont.replace(/\n/g, "<br>");
    	console.log(amcont);
    	
    	//rp3을 찾는다
    	vp3 = $(this).parents('.beforeupdate');
    	
    	//modifyform을 body로 이동  -안보이도록 설정 
    	$('#modifyform').appendTo($('body'));
    	$('#modifyform').css('display', "none");
    	$('#modifyform').hide();
    	
    	$(vp3).html(amcont);
        $('.btnUpdate').parent().show();
    	//서버로 보내기
    	$.answerUpdateServer();
		  
		  //vp3에  입력한 내용(<br>태그로 변경한) 을 출력 - DB 수정 후 에 실행 
		  //$(vp3).html(amcont);
   		} 
	})//$btnok 
	
 	//댓글 수정창에서 취소버튼
	    $('#btnreset').on('click', function(){
		  replyReset(); 
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
	    
	    	
	   
	    
	    
	    
	    
})//$function


replyReset = function(){
		  
    vp3 = $('#modifyform').parent();

    $('body').append($('#modifyform'));
    $('#modifyform').hide();

    $(vp3).html(modicont);
    $('.btnUpdate').parent().show();
}
  

$.answerInsertServer = function(){
		
		$.ajax({
			url  :  '<%= request.getContextPath()%>/QnAboardAnswer.do',
			type : 'post',
			data : { 
				"cs_answer" : bmcont,
				"cs_no" : vidx
				},
			success : function(data){
				/* if(res.sw == "성공"){  */
					document.location.href = document.location.href;
					//화면 댓글의 본문을 변경
					location.href="<%=request.getContextPath() %>/QnAboardList.do";
			/* 		$(vp3).html(bmcont);
					console.log(bmcont); */
				/*  }  */
			},
			error : function(){
			},
			dataType : 'text'
		})  

}
 
$.answerUpdateServer = function(){
	
	$.ajax({
		url  :  '<%= request.getContextPath() %>/AnswerUpdate.do',
		type : 'post',
		data : { 
			"cont" : bmcont,
			"cs_no" : vidx
			},
		success : function(res){
			if(res.sw == "성공"){
				//화면 댓글의 본문을 변경
				$(vp3).html(bmcont);
				console.log(bmcont);
			}
		},
		error : function(){
		},
		dataType : 'json'
	})
}
  
$.boardDeleteServer = function(){
		
		$.ajax({
			url  :  '<%= request.getContextPath()%>/QnAboardDelete.do',
			type : 'post',
			data : { 
				"cs_no" : listno
				},
			success : function(res){
				document.location.reload();
			},
			error : function(){
			},
			dataType : 'json'
		})
		
}


</script>
</html>