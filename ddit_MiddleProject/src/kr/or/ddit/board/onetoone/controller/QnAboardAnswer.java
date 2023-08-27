package kr.or.ddit.board.onetoone.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.onetoone.service.IQnAboardService;
import kr.or.ddit.board.onetoone.service.QnAboardServiceImpl;
import kr.or.ddit.board.onetoone.vo.QnAboardVO;

/**
 * Servlet implementation class QnAboardAnswer
 */
@WebServlet("/QnAboardAnswer.do")
public class QnAboardAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		QnAboardVO vo = new QnAboardVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		IQnAboardService service = QnAboardServiceImpl.getService();		
		
		//service메소드 호출 하기 - 결과값
		int res = service.insertAnswer(vo);
		//request에 저장
		//request.setAttribute("result", res);
		//view페이지로 이동
		//request.getRequestDispatcher("/qnaboardview/result.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/QnAboardList.do");
	}

	
}
