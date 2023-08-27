<%@page import="kr.or.ddit.board.faq.vo.FaqBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
	function goToList() {
        location.href = "<%=request.getContextPath()%>/boardList.do";
    }
</script>
</head>
<body>
<h2>FAQ 등록</h2>
<form action="<%=request.getContextPath() %>/boardInsert.do" method="post" id="boardForm">
    <table border="1">
        <tbody>
        	<tr>
                <td>분류</td>
                <td>
                    <input type="text" name="fb_ctg" id="fb_ctg">
                </td>
            </tr>
            <tr>
                <td>Question</td>
                <td>
                    <input type="text" name="fb_title" id="question">
                </td>
            </tr>
            <tr>
                <td>Answer</td>
                <td>
                    <textarea name="fb_content" id="answer" rows="8" cols="50"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" value="등록">  <input type="reset" value="취소" onclick="goToList()"> 
                </td>
            </tr>
        </tbody>
    </table>
</form>
</body>
</html>
