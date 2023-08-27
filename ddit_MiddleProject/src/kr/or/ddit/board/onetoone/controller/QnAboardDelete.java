package kr.or.ddit.board.onetoone.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.onetoone.service.IQnAboardService;
import kr.or.ddit.board.onetoone.service.QnAboardServiceImpl;
import kr.or.ddit.board.onetoone.vo.QnAboardVO;


@WebServlet("/QnAboardDelete.do")
public class QnAboardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//요청시 전송데이터 받기 - cont, renum
		//Vo
		//int csNo = Integer.parseInt(request.getParameter("cs_no"));
		String[] chk_list = request.getParameterValues("chk_list");
		int[] newArr = new int[chk_list.length];
		
		 for (int i = 0; i < chk_list.length; i++) {
	            newArr[i] = Integer.parseInt(chk_list[i]);
	        }

		 
		for(int i=0; i<newArr.length; i++) {
			System.out.println("========================="+newArr[i]);
			IQnAboardService service = QnAboardServiceImpl.getService();
			int res = service.deleteBoard(newArr[i]);
		}
		
		
		  //service객체 얻기 
		//	IQnAboardService service = QnAboardServiceImpl.getService();
		  
		  //service메소드 호출 - 결과 int 
		//	int res = service.deleteBoard(csNo);
		  
		  //결과값 request에 저장 
		//	request.setAttribute("result", res);
		  
		  //view페이지로 이동
		  response.sendRedirect(request.getContextPath()+"/QnAboardList.do");
		 
	}

}
