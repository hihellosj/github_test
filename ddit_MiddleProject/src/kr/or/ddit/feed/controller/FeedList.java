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



/**
 * Servlet implementation class FeedList
 */
@WebServlet("/feedList.do")
public class FeedList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("도착GG");
		System.out.println("모달창 왜 여기오니");
		IFeedService service =FeedServiceImpl.getInstance();
		
		List<FeedVO> feedList = service.getAllFeed();
		
		List<FeedVO> getRank = service.getFeedRank();
		
		
		request.setAttribute("bb", feedList);
		request.setAttribute("getRank", getRank);
		
		
		request.getRequestDispatcher("/view/feedBoard/feedList.jsp").forward(request,response);
		 
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String searchFeed = request.getParameter("searchFeed");
		String mvselect = request.getParameter("mvselect");
		
		String myPost = request.getParameter("myPost");
		String allPost = request.getParameter("allPost");
		
		System.out.println("myPost :" + myPost);
		System.out.println("allPost :" + allPost);
		
		System.out.println(searchFeed);
		System.out.println("feedlist mvselect : "+mvselect);
		
		FeedVO feed = new FeedVO();
		if(myPost==null) {
			
			feed.setSearchFeed(searchFeed);
			feed.setMvselect(mvselect);
		}else {
			System.out.println("들어오니");
			feed.setM_cast(myPost);
		}
		
		
		
		
		
		
		
		
		IFeedService service = FeedServiceImpl.getInstance();
		List<FeedVO> feedVo = service.getSearchFeed(feed);
		List<FeedVO> getRank = service.getFeedRank();
		
		 System.out.println("feedvo :" + feedVo); 
		
		request.setAttribute("bb", feedVo);
		request.setAttribute("getRank", getRank);
		
		request.getRequestDispatcher("/view/feedBoard/feedList.jsp").forward(request, response);
	}

}
