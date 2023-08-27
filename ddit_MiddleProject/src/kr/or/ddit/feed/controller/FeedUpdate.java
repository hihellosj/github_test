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



/**
 * Servlet implementation class FeedUpdate
 */
@WebServlet("/feedUpdate.do")
public class FeedUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String fbNo = request.getParameter("fb_no");
		
		IFeedService service = FeedServiceImpl.getInstance();
		FeedVO feedVo	= service.getFee(fbNo);
		
		request.setAttribute("tt", feedVo);
		request.getRequestDispatcher("/view/feedBoard/feedUpdateForm.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String fbContent = request.getParameter("fb_content");
		String fbNo = request.getParameter("fb_no");
		System.out.println(fbContent);
		System.out.println(fbNo);
		
		FeedVO feedVo = new FeedVO();
		
		feedVo.setFb_content(fbContent);
		feedVo.setFb_no(fbNo);
		
		System.out.println(feedVo);
		
		IFeedService service = FeedServiceImpl.getInstance();
		service.updateFeed(feedVo);
		
		response.sendRedirect(request.getContextPath()+"/feedList.do");
	}

}
