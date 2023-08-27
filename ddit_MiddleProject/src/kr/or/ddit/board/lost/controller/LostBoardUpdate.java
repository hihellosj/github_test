package kr.or.ddit.board.lost.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.lost.service.ILostBoardService;
import kr.or.ddit.board.lost.service.LostBoardServiceImpl;
import kr.or.ddit.board.lost.vo.LostBoardVO;


@WebServlet("/lostBoardUpdate.do")
public class LostBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ILostBoardService service = LostBoardServiceImpl.getInstance();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int lb_no = Integer.parseInt(request.getParameter("lb_no"));
		
		
		LostBoardVO lostBoardVO = service.getBoard(lb_no);
		
		
		
		lostBoardVO.setLb_no(lb_no);
		
		System.out.println(lostBoardVO);
		
		request.setAttribute("lostBoardVO", lostBoardVO);
		
		request.getRequestDispatcher("/view/lostBoard/lostBoardUpdateForm.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String lb_title = request.getParameter("lb_title");
		String lb_content = request.getParameter("lb_content");
		String userId = request.getParameter("user_id");
		int lb_no = Integer.parseInt(request.getParameter("lb_no"));
		
		LostBoardVO lostBoardVO = new LostBoardVO();
		lostBoardVO.setLb_no(lb_no);
		lostBoardVO.setLb_title(lb_title);
		lostBoardVO.setLb_content(lb_content);
		lostBoardVO.setUser_id(userId);
		
		service.updateBoard(lostBoardVO);
		
		response.sendRedirect(request.getContextPath() + "/lostBoardList.do?user_id=" + lostBoardVO.getUser_id());
		
		
	
	
	
	}

}
