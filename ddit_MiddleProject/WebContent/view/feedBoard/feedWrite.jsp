

<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function(){
	
	$("#btnList").on("click", function(){
		location.href = "<%=request.getContextPath() %>/feedList.do";
		
	});
	
	
	$("#btnInsert").on("click", function(){
		var form = document.getElementById("insertForm");
		form.method = "POST";
		form.action = "<%=request.getContextPath() %>/feedWrite.do";
		form.submit();
	});
	
});
</script>


</head>




<body>
<h2> feedwrite에서 왔습니다!</h2>

	<%MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	System.out.println(loginMember.getUser_id());
	%>
	
	<div class="modal-body">
	
	<form id="insertForm" name="insertForm" >
	
	
	
  
        
            <label>아이디</label>
            <input type="text" class="txt" name="user_id" value="<%=loginMember.getUser_id() %>" readonly> <br> 

          	<!--   <label>제목</label>
            <input type="text" class="txt" name="subject"> <br>  -->

          
            

            <label>내용</label>
            <br>
            <textarea rows="5" cols="40"  class="txt" name="fb_content"></textarea>
            <br>
            <br>
            <input id="btnInsert" type="button" value="저장">
            <input type="reset" value="취소">
            <input type="button" id="btnList" value="리스트목록">
        
     
      
	</form>

 </div>


</body>
</html>