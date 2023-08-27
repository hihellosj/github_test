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
 * Servlet implementation class QuestionList
 */
@WebServlet("/QuestionList.do")
public class QuestionList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String user_id = request.getParameter("user_id");
		
		QnAboardVO vo = new QnAboardVO();
		
		vo.setUser_id(user_id);
		System.out.println("이거안뜨면 잘래"+vo.getUser_id());

		//service객체 얻기
		IQnAboardService service = QnAboardServiceImpl.getService();
		
		List<QnAboardVO> list = service.selectBoard(vo);
		
		System.out.println("리스트. 뽑 "+list);
		
		request.setAttribute("questionList", list);
		
		request.getRequestDispatcher("/view/onetooneBoard/questionList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
