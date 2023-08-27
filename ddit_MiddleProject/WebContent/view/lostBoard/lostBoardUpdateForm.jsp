<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.board.lost.vo.LostBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시물 수정</h2>
    <%
    	MemberVO vo=(MemberVO)session.getAttribute("loginMember");
    	LostBoardVO lostBoardVO = (LostBoardVO)request.getAttribute("lostBoardVO");
    	
    	System.out.println("dafdf"+lostBoardVO.getUser_id());
    %>
    <form action="<%=request.getContextPath()%>/lostBoardUpdate.do" method="post">
        <table>
            <tr>
                <td>제목:</td>
                
                <td><input type="text" name="lb_title" value="<%=lostBoardVO.getLb_title()%>"></td>
            </tr>
            <tr>
                <td>내용:</td>
                <td><input type="text" name="lb_content" value="<%=lostBoardVO.getLb_content()%>"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="hidden" name="lb_no" value="<%=lostBoardVO.getLb_no()%>">
                    <input type="hidden" name="user_id" value="<%=lostBoardVO.getUser_id()%>">
                    <input type="submit" value="수정">
                    <a href="<%=request.getContextPath()%>/lostBoardList.do?user_id=<%=lostBoardVO.getUser_id()%>">취소</a>
                </td>
            </tr>
        </table>
    </form>





</body>
</html>