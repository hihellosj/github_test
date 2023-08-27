package kr.or.ddit.feed.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.feed.service.FeedServiceImpl;
import kr.or.ddit.feed.service.IFeedService;




@WebServlet("/recCount.do")
public class RecCount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int no = Integer.parseInt(request.getParameter("fb_no"));
		
		IFeedService service = FeedServiceImpl.getInstance();
		
		int count = service.recCount(no);
		
		out.println(count);
		out.close();
		
		
		
	}

}
