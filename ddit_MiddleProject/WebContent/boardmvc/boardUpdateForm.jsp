<%@page import="kr.or.ddit.board.faq.vo.FaqBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board Update</title>
</head>
<body>
    <h2>게시물 수정</h2>
    <%
    	FaqBoardVO boardVO = (FaqBoardVO) request.getAttribute("boardVO");
    %>
    <form action="<%=request.getContextPath()%>/boardUpdate.do" method="post">
        <table>
        	<tr>
                <td>분류:</td>
                <td><input type="text" name="fb_ctg" value="<%=boardVO.getFb_ctg()%>"></td>
            </tr>
            <tr>
                <td>Q:</td>
                <td><input type="text" name="fb_title" value="<%=boardVO.getFb_title()%>"></td>
            </tr>
            <tr>
                <td>A:</td>
               <td> 
               <textarea name="fb_content" id="answer" rows="8" cols="50"><%=boardVO.getFb_content()%></textarea>
            	</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="hidden" name="fb_no" value="<%=boardVO.getFb_no()%>">
                    <input type="submit" value="수정">
                    <a href="<%=request.getContextPath()%>/boardList.do">취소</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
    