package kr.or.ddit.board.onetoone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.onetoone.service.IQnAboardService;
import kr.or.ddit.board.onetoone.service.QnAboardServiceImpl;
import kr.or.ddit.board.onetoone.vo.QnAboardVO;

/**
 * Servlet implementation class QnAboardList
 */
@WebServlet("/QnAboardList.do")
public class QnAboardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		//service객체 얻기
		IQnAboardService service = QnAboardServiceImpl.getService();
		
		List<QnAboardVO> list = service.getAllboard();
		
		request.setAttribute("boardList", list);
		
		
		//view페이지로 이동
		request.getRequestDispatcher("/view/onetooneBoard/qnaList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
