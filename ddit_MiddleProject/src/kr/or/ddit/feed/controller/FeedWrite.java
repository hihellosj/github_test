package kr.or.ddit.feed.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.feed.service.FeedServiceImpl;
import kr.or.ddit.feed.service.IFeedService;
import kr.or.ddit.feed.vo.FeedVO;




@WebServlet("/feedWrite.do")
public class FeedWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String taste = request.getParameter("taste");
		
		
		System.out.println("feedwrite userId : "+userId);
		System.out.println("feedwrite taste : "+taste);
		request.getRequestDispatcher("/view/feedBoard/feedWrite.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String fbContent = request.getParameter("fb_content");
		String userId = request.getParameter("user_id");
		
		
		
		FeedVO feedVo = new FeedVO();
		
		feedVo.setFb_content(fbContent);
		feedVo.setUser_id(userId);
		
		
		/* System.out.println(feedVo); */
		
		
		IFeedService service = FeedServiceImpl.getInstance();
		service.insertFeed(feedVo);
		
		response.sendRedirect(request.getContextPath()+"/feedList.do");
	}

}
