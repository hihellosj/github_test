

<%@page import="kr.or.ddit.feed.vo.FeedVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function(){
	
	$("#btnList").on("click", function(){
		 location.href = "<%=request.getContextPath() %>/feedList.do"; 
		
		
	});
	
	
	$("#btnUpdate").on("click", function(){
	 	/* var form = document.getElementById("feedForm"); */
	 	<%--form.method = "POST";
		form.action = "<%=request.getContextPath() %>/feedUpdate.do";
		form.submit(); --%>
		contents = $(this).parents('.contable').find('#fb_content').val();
		fbno = $(this).parents('#feedForm').find('#fb_no').val();
		$.updateServer();
		
		/* window.open("about:blank", "_self").close(); */
		
	});
	
	
	
});

$.updateServer = function(){
		
		$.ajax({
			url  :  '<%= request.getContextPath()%>/feedUpdate.do',
			type : 'post',
			data : { 
				"fb_content" : contents,
				"fb_no" : fbno
				},
			success : function(data){
				/* if(res.sw == "성공"){  */
					document.location.href = document.location.href;
					//화면 댓글의 본문을 변경
				 /*  $(".popup01").hide(); 
                  $(".backon").hide(); */
					<%-- location.href="<%=request.getContextPath() %>/feedList.jsp"; --%>
			/* 		$(vp3).html(bmcont);
					console.log(bmcont); */
				/*  }  */
			},
			error : function(){
			},
			dataType : 'json'
		})  

}
 
</script>
<style>
html{
    overflow: hidden;
}
body{
	margin: 0;
}
.layer-header{
	width: 100%;
    height: 45px;
    background: #503396;
    color : white;
}

h3.tit{
	margin: 0;
}
tr{
    display: block;
    padding: 10px;
}
.layer-header h3 {
    color: #fff;
    padding: 15px 20px 0 20px;
    font-size: 1.2em;
    line-height: 1.1;
}
</style>
</head>



<body>

<%
	FeedVO feedVo = (FeedVO)request.getAttribute("tt");
%>


<header class="layer-header">
		<h3 class="tit">무비포스트 수정</h3>
		
	</header>
	<div style="">
	<h3  style="padding-left : 50px;  position:absolute; font-size: calc(1.3rem + .6vw); font-weight: 500;" ><%=feedVo.getM_name()%></h3>
	</div>
<form name="feedForm" id="feedForm" style="margin-top : 100px;">
    <input type="hidden" name="user_id" value="<%=feedVo.getUser_id() %>">
    <input type="hidden" name="fb_no" id="fb_no" value="<%=feedVo.getFb_no() %>">
    
<table class="contable" style="display : block; min-width: 400px; border: 1px solid #cacaca; border-radius: 10px; padding: 40px 20%;  margin: 50px;">
<tbody>
    <tr class="feedcon">
    	<td><img style="max-width: 300px;" src="<%=request.getContextPath() %>/images/<%=feedVo.getMi_img() %>"></td>
    </tr>
    <tr>
        <td><%=feedVo.getUser_id() %></td>
    </tr>
    
    <tr>
        <td class="con"><input style="width: 300px; height: 200px;" type="text" name="fb_content" id="fb_content" value="<%=feedVo.getFb_content() %>"></td>
    </tr>
    
    <tr>
     <td><%=feedVo.getFb_date() %></td>
    </tr>
    
    
    <tr>
        <td colspan="2" style="text-align:center;">
            <input id="btnUpdate" type="button" value="저장"> <!--  <input type="reset" value="취소">  -->
           <!--  <input type="button" id="btnList" value="리스트목록"></td> -->
    </tr>
</tbody>
</table>
</form>

</body>
</html>