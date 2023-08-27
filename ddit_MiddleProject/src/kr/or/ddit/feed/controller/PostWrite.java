package kr.or.ddit.feed.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.feed.service.FeedServiceImpl;
import kr.or.ddit.feed.service.IFeedService;
import kr.or.ddit.feed.vo.FeedVO;

@WebServlet("/postWrite.do")
public class PostWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("user_id");
		String mvNo = request.getParameter("mv_no");

		System.out.println("postwrite 값  아디" + userId);
		System.out.println("postwrite 값  영화" + mvNo);

		FeedVO feedVo = new FeedVO();
		feedVo.setM_id(mvNo);
		System.out.println("들어가졌니 postWrite" + feedVo.getM_id());

		IFeedService service = FeedServiceImpl.getInstance();
		List<FeedVO> feed = service.getAllImage(feedVo);

		System.out.println("여기" + feed.get(0).getMi_img());
		System.out.println("postWrite.java " + feed);

		request.setAttribute("getAllImage", feed);

		request.getRequestDispatcher("/view/feedBoard/postWrite.jsp").forward(request, response);

		/*
		 * request.setAttribute("myPost", feedVo);
		 * 
		 * request.getRequestDispatcher("/view/postView.jsp").forward(request,
		 * response);
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();

		String miImg = request.getParameter("mi_img");
		String userId = request.getParameter("user_id");
		String mvNo = request.getParameter("mv_no");
		String fbContent = request.getParameter("fb_content");
		

		FeedVO postInsert = new FeedVO();

		postInsert.setM_id(mvNo);
		postInsert.setUser_id(userId);
		postInsert.setMi_img(miImg);
		postInsert.setFb_content(fbContent);

		System.out.println("postinsert" + postInsert);

		IFeedService service = FeedServiceImpl.getInstance();

		int res = service.insertFeed(postInsert);

		try {
			if (res != 0) {
				out.println(res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

		/*
		 * out.println(res);
		 * 
		 * out.close();
		 */

	}

}
