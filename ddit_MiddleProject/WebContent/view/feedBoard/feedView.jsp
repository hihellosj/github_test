
<%@page import="kr.or.ddit.movie.vo.MovieListVO"%>
<%@page import="kr.or.ddit.moviebook.vo.MovieVO"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.feed.vo.ThumsVO"%>
<%@page import="kr.or.ddit.feed.vo.FeedVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

mypath='<%=request.getContextPath() %>';
console.log(mypath);


$(function(){
	
	

	var led = $('#fb_noo').val();

	console.log(led);

	var lec = $('#user_idd').val();
	
	console.log(lec);
	
	
	$("#btnList").on("click", function(){
		location.href = "<%=request.getContextPath() %>/feedList.do";
		/* opener.parent.location.reload(); 
		window.close(); */
		
	});
	
	$("#btnUpdate").on("click", function(){
		var form = document.getElementById("feedForm");
		form.method = "GET";
		form.action = "<%=request.getContextPath() %>/feedUpdate.do";
		form.submit();
		
		
		/* window.opener.location.href="/"; */
		/* window.close(); */
	});
	
	$("#btnDelete").on("click", function(){
		var form =document.getElementById("feedForm");
		form.action = "<%=request.getContextPath() %>/feedDelete.do";
		form.submit();
	});
	
	//추천 버튼 클릭시 (추가 or 제거)
	
	$("#rec_update").click(function(){
		$.ajax({
			url : "<%=request.getContextPath() %>/recUpdate.do",
			type : "POST",
			data:{
				"fb_no": led,
				"user_id": lec
			},
			success: function(){
				/* alert("왔니"); */
				recCount();
				
			}
			
		})
	})
	
	function recCount(){
		$.ajax({
			url: "<%=request.getContextPath() %>/recCount.do",
			type: "POST",
			data: {"fb_no" : led }
			,
			success: function(count){
				alert("0818!!");
				$(".rec_count").html(count);
				
				
			}
		});
	};
	//------------------------------
	
});
</script>
<style>
html{
    overflow: hidden;
}
.feedcon{

	text-align: center;
}

tr{
    display: block;
    padding: 10px;
}

.container.mt-3{
padding : 0;
margin: 0;

}

button#rec_update.btn.btn-link{
	padding : 0;
}

.layer-header{
	width: 100%;
    height: 45px;
    background: #503396;
    color : white;
}

.layer-header h3{

	color: #fff;
    padding: 15px 20px 0 20px;
    font-size: 1.2em;
    line-height: 1.1;
    }

</style>
</head>
<body>

	<% FeedVO feeVo = (FeedVO)request.getAttribute("tt"); %> <!-- 갖고올거면 여기서 갖고와야된다. -->
	<% int thumsList1 = (int)request.getAttribute("bigbang"); %>
	<%MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");%>
	<%-- <%ThumsVO tt = (ThumsVO)~~~~ %> 이렇게 또 갖고 올거임? 아니면 join 써서 갖고 올까--%>
	<header class="layer-header">
		<h3 class="tit">무비포스트 상세</h3>
		
	</header>
	<div class="tit-area mb30" style="padding:50px; border-bottom: 1px solid;">
			<h3 style="position:absolute; " class="tit"><%=feeVo.getM_name()%></h3>
		</div>
	<form style="margin : 50px;" name="feedForm" id="feedForm">
    <input type="hidden" id="fb_noo" name="fb_no" value="<%=feeVo.getFb_no() %>">
    <input type="hidden" id="user_idd" name="user_id" value="<%=loginMember.getUser_id() %>">
    
   
<table style="display : block; min-width: 400px; border: 1px solid #cacaca; border-radius: 10px;   padding:40px 20%;  margin: auto;">
<tbody>
    <tr class="feedcon">
    	<td><img style="max-width: 300px;" src="<%=request.getContextPath() %>/images/<%=feeVo.getMi_img() %>"></td>
    </tr>
    
    <tr>	
        <td><%=feeVo.getM_name()%></td>
    </tr>
   
   
    <tr>	
        <td><%=feeVo.getUser_id()%></td>
    </tr>
    <tr>	
       <td><%=feeVo.getFb_content() %></td>
    </tr>
    <tr>
       <td><%=feeVo.getFb_date() %></td>
    </tr>
    
    <tr>
        <td>조회수   <%=feeVo.getFb_count() %></td>
    </tr>
    <tr>
        <td>
        	<div class="container mt-3">
			  <button type="button" class="btn btn-link" id="rec_update"><i class="bi bi-heart-fill"></i></button>
			 &nbsp; <span class="rec_count"><%=thumsList1 %></span>
			</div>
        </td>
    </tr>
    <tr>
    <td colspan="2" style="text-align:center;">
    
    <%
    if(feeVo.getUser_id().equals(loginMember.getUser_id())  ){
    %>
    
    
       
            <input id="btnUpdate" type="button" value="수정"> 
            <input id="btnDelete" type="button" value="삭제"> 
            
    <%} %>
    <!-- <input type="button" id="btnList" value="게시판 목록"> -->
    </td>
    </tr>
</tbody>
</table>
</form>
	
</body>
</html>