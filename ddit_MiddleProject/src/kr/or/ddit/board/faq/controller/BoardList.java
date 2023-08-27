package kr.or.ddit.board.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.faq.service.BoardServiceImpl;
import kr.or.ddit.board.faq.service.IBoardService;
import kr.or.ddit.board.faq.vo.FaqBoardVO;

//FAQ게시판 게시글 리스트 불러오는 서블릿
@WebServlet("/boardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
        
        //service 객체 저장
        IBoardService service = BoardServiceImpl.getInstance();
        
        //service 메소드 호출
        List<FaqBoardVO> list = service.selectBoard();
        
        //request에 저장
        request.setAttribute("boardlist", list);
        
        //view페이지로 이동
        request.getRequestDispatcher("/boardmvc/FAQmain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
