package kr.or.ddit.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.movie.dao.IMovieDao;
import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServieImpl;
import kr.or.ddit.movie.vo.MovieListVO;

@WebServlet("/movieDetail.do")
public class MovieDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");

	    String m_id = request.getParameter("m_id");
	    
	    IMovieService service = MovieServieImpl.getInstance();
	    MovieListVO movie = service.selectMovieId(m_id);
	    String trailerUrl = service.selectMovieUrl(m_id);
	    
	    request.setAttribute("movie", movie);
	    request.setAttribute("trailerUrl", trailerUrl);
	    
	    System.out.println("Movie: " + movie);
	    System.out.println("Trailer URL: " + trailerUrl);
	    
	    request.getRequestDispatcher("/boardmvc/movieDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
