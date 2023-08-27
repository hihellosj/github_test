package kr.or.ddit.feed.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.feed.service.FeedServiceImpl;
import kr.or.ddit.feed.service.IFeedService;





@WebServlet("/recUpdate.do")
public class RecUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// no id 값을 map에 저장
		
		Map<String, Object> m = new HashMap<>();
		m.put("fb_no", request.getParameter("fb_no"));
		m.put("user_id", request.getParameter("user_id"));
		System.out.println(m);
		
		//동일 게시글에 대한 이전 추천여부 검색
		
		IFeedService service = FeedServiceImpl.getInstance();
		int result = service.recCheck(m);
		
		if(result == 0) { //추천 x ==> update
			service.recUpdate(m);
		}else { //추천o ==> delete
			service.recDelete(m);
		}
		
		// 이제 이 값을 ajax 로 넘기는건데 .  sw 성공시 . 그걸 하는게 좋은것인가 . 성공의 기준은 ?
		
		/*
		 * request.setAttribute("result", result);
		 * 
		 * request.getRequestDispatcher("/view/result.jsp").forward(request, response);
		 */
		
		
		
	}

}
