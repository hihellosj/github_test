package kr.or.ddit.board.faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.faq.service.BoardServiceImpl;
import kr.or.ddit.board.faq.service.IBoardService;

//FAQ게시판 게시글 삭제 서블릿
@WebServlet("/boardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    
	    //삭제할 게시글의 번호를 가져온다
	    int fb_no = Integer.parseInt(request.getParameter("fb_no"));
	    
	    //service 객체 얻기
	    IBoardService service = BoardServiceImpl.getInstance();
	    
	    //service 메소드 호출
	    service.deleteBoard(fb_no);
	    
	    //게시글 삭제 후 리스트로 이동
	    response.sendRedirect(request.getContextPath() + "/boardList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
