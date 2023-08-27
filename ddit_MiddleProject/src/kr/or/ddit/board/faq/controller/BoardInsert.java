package kr.or.ddit.board.faq.controller;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.faq.service.BoardServiceImpl;
import kr.or.ddit.board.faq.service.IBoardService;
import kr.or.ddit.board.faq.vo.FaqBoardVO;

@WebServlet("/boardInsert.do")
public class BoardInsert extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("boardmvc/boardInsertForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
		    
		 	//POST 요청이 오면 게시글을 등록
		 	//요청으로부터 제목과 내용을 가져온다
		    String title = request.getParameter("fb_title");
		    String content = request.getParameter("fb_content");
		    String category = request.getParameter("fb_ctg");
		    
		    //게시글 정보를 담는 VO객체를 생성하여 제목과 내용을 설정한다
		    FaqBoardVO boardVO = new FaqBoardVO();
		    boardVO.setFb_title(title);
		    boardVO.setFb_content(content);
		    boardVO.setFb_ctg(category);
		    
		    //service 객체 저장
		    IBoardService service = BoardServiceImpl.getInstance();
		    
		    //service 메소드 호출
		    service.insertBoard(boardVO);
		    
		    //등록 후 리스트 페이지로 이동
		    response.sendRedirect(request.getContextPath() + "/boardList.do");
	}
}
