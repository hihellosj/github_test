package kr.or.ddit.board.lost.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.lost.service.ILostBoardService;
import kr.or.ddit.board.lost.service.LostBoardServiceImpl;
import kr.or.ddit.board.lost.vo.LostBoardVO;



@WebServlet("/lostBoardList.do")
public class LostBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("user_id");
	
		
		System.out.println("userId 넘어갓나여??-------------"+userId);

		ILostBoardService service = LostBoardServiceImpl.getInstance();
		List<LostBoardVO> boardList = service.getBoardList(userId);
		
		System.out.println("보드리스트 값있나여??------------------"+boardList);
		
		request.setAttribute("boardList", boardList);
		
		request.getRequestDispatcher("/view/mypage/lostItem.jsp").forward(request, response);
	
	
	}

}
