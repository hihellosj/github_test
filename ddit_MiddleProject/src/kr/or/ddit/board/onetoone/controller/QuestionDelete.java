package kr.or.ddit.board.onetoone.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.onetoone.service.IQnAboardService;
import kr.or.ddit.board.onetoone.service.QnAboardServiceImpl;


@WebServlet("/QuestionDelete.do")
public class QuestionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] chk_list = request.getParameterValues("chk_list");
		
		String userId= request.getParameter("user_id");
		int[] newArr = new int[chk_list.length];
		
		 for (int i = 0; i < chk_list.length; i++) {
	            newArr[i] = Integer.parseInt(chk_list[i]);
	        }

		 
		for(int i=0; i<newArr.length; i++) {
			System.out.println("========================="+newArr[i]);
			IQnAboardService service = QnAboardServiceImpl.getService();
			int res = service.deleteBoard(newArr[i]);
		}
		
		response.sendRedirect(request.getContextPath()+"/QuestionList.do?user_id="+userId);
	}

}
