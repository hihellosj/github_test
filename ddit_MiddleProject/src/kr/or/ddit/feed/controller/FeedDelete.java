package kr.or.ddit.feed.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.feed.service.FeedServiceImpl;
import kr.or.ddit.feed.service.IFeedService;




@WebServlet("/feedDelete.do")
public class FeedDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("fb_no");
		System.out.println("feeddleltejava"+userId);
		
		IFeedService service = FeedServiceImpl.getInstance();
		service.deleteFeed(userId);
		
		response.sendRedirect(request.getContextPath() +"/feedList.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
