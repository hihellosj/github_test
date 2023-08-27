package kr.or.ddit.board.lost.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.board.lost.service.ILostBoardService;
import kr.or.ddit.board.lost.service.LostBoardServiceImpl;


@WebServlet("/lostBoardDelete.do")
public class LostBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String lbNo = request.getParameter("lb_no");
		
		ILostBoardService service = LostBoardServiceImpl.getInstance();
		int cnt = service.deleteBoard(lbNo);
		
		Gson gson = new Gson();
		String result = null;	// 결과가 JSON으로 저장될 변수
		
		if(cnt>0) {
			result = gson.toJson("OK");
		} else {
			result = gson.toJson("Fail");
		}
		
		response.getWriter().write(result);
		response.flushBuffer();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
