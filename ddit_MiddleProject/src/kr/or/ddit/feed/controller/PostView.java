package kr.or.ddit.feed.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.feed.service.FeedServiceImpl;
import kr.or.ddit.feed.service.IFeedService;
import kr.or.ddit.feed.vo.FeedVO;




@WebServlet("/postView.do")
public class PostView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		
		
		
		FeedVO feed = new FeedVO();
		
		feed.setUser_id(userId);
		
		IFeedService service = FeedServiceImpl.getInstance();
		List<FeedVO> feedVo = service.getMyPost(feed);
		
		System.out.println("이미지ff"+feedVo);
				
		request.setAttribute("myPost", feedVo);
		
		request.getRequestDispatcher("/view/feedBoard/postView.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
