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
import kr.or.ddit.feed.vo.ThumsVO;



/**
 * Servlet implementation class FeedView
 */
@WebServlet("/feedView.do")
public class FeedView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String fbNo = request.getParameter("fb_no");
		System.out.println("fbNo뽑아봐"+fbNo);
		
		
		IFeedService service = FeedServiceImpl.getInstance();
		FeedVO feedVo = service.getFee(fbNo);
		
		request.setAttribute("tt", feedVo);
		
		
		
		  int feedCount = Integer.parseInt(feedVo.getFb_count());
		  
		  feedCount++;
		 
		  feedVo.setFb_count(String.valueOf(feedCount));
		 
		
		service.countFeed(feedVo);
		
		
		int thumsList1 = service.getThumsCount1(fbNo);
		
		System.out.println(thumsList1);
		
		request.setAttribute("bigbang", thumsList1);
		
		
		request.getRequestDispatcher("/view/feedBoard/feedView.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
