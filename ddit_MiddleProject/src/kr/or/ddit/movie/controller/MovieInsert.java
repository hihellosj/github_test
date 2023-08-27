package kr.or.ddit.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServieImpl;
import kr.or.ddit.movie.vo.MovieListVO;

@WebServlet("/movieInsert.do")
public class MovieInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String m_id = request.getParameter("m_id");
		String m_name = request.getParameter("m_name");
		String m_story = request.getParameter("m_story");
		int m_time = Integer.parseInt(request.getParameter("m_time"));
		String m_director = request.getParameter("m_director");
		String m_age = request.getParameter("m_age");
		String m_cast = request.getParameter("m_cast");
		String m_translation = request.getParameter("m_translation");
		String m_opn_date = request.getParameter("m_opn_date");
		String m_showing = request.getParameter("m_showing");
		String m_type = request.getParameter("m_type");
		String m_trailer_url = request.getParameter("m_trailer_url");
		String m_pst = request.getParameter("m_pst");
		
		MovieListVO movieListVO = new MovieListVO();
		movieListVO.setM_id(m_id);
		movieListVO.setM_name(m_name);
		movieListVO.setM_story(m_story);
		movieListVO.setM_time(m_time);
		movieListVO.setM_director(m_director);
		movieListVO.setM_age(m_age);
		movieListVO.setM_cast(m_cast);
		movieListVO.setM_translation(m_translation);
		movieListVO.setM_opn_date(m_opn_date);
		movieListVO.setM_showing(m_showing);
		movieListVO.setM_type(m_type);
		movieListVO.setM_trailer_url(m_trailer_url);
		movieListVO.setM_pst(m_pst);
		
		IMovieService service = MovieServieImpl.getInstance();
		
		service.insertMovie(movieListVO);
		
		response.sendRedirect(request.getContextPath() + "/movieListMain.do");
	}
}
