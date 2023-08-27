package kr.or.ddit.rseat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.feed.service.FeedServiceImpl;
import kr.or.ddit.feed.service.IFeedService;
import kr.or.ddit.feed.vo.FeedVO;
import kr.or.ddit.reserveinsert.service.IReserveInsertService;
import kr.or.ddit.reserveinsert.service.ReserveInsertServiceImpl;
import kr.or.ddit.rseat.service.IReserveService;
import kr.or.ddit.rseat.service.ReserveServiceImpl;
import kr.or.ddit.rseat.vo.ReserveVO;


@WebServlet("/ticketInfo.do")
public class TicketInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String userId= request.getParameter("userId");
		String mId=request.getParameter("m_id");
		String t_no=request.getParameter("t_no");
		String showtime=request.getParameter("showtime");
		
		
		ReserveVO goSelect = new ReserveVO();
		
		goSelect.setM_id(mId);
		goSelect.setUser_id(userId);
		goSelect.setT_no(t_no);
		goSelect.setSHOWTIME(showtime);
		
		
		IReserveService service = ReserveServiceImpl.getService();
		
		ReserveVO happy =  service.selectOne(goSelect);
		
		
		request.setAttribute("happy", happy);
		request.getRequestDispatcher("/theatermvc/ticketView.jsp").forward(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		
		
		// 여기는 값을 받아온다.. 
		
		FeedVO feed= new FeedVO();
		
		//값을 집어 넣는다.
		
		IFeedService service = FeedServiceImpl.getInstance();
		
		
		FeedVO getTicket = service.getReservationTicket(feed);
		
		request.setAttribute("getTicket", getTicket);
		
		request.getRequestDispatcher("/view/feedBoard/ticketView.jsp").forward(request, response);
		
	}

}
