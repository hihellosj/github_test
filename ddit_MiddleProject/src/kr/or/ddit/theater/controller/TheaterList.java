package kr.or.ddit.theater.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.theater.service.ITheaterService;
import kr.or.ddit.theater.service.TheaterServiceImpl;
import kr.or.ddit.theater.vo.TheaterVO;


@WebServlet("/theaterList.do")
public class TheaterList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String mid = request.getParameter("id");
		
		ITheaterService  service = TheaterServiceImpl.getService();
		
		List<TheaterVO> list = service.selectByMid(mid);
		
		request.setAttribute("theaterList", list);
		
		request.getRequestDispatcher("/theaterview/theaterList.jsp").forward(request, response);
	}

}
