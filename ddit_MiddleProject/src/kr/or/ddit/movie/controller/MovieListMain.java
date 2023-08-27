package kr.or.ddit.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServieImpl;
import kr.or.ddit.movie.vo.MovieListVO;

@WebServlet("/movieListMain.do")
public class MovieListMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");
	
        IMovieService service = MovieServieImpl.getInstance();
        
        List<MovieListVO> list = service.selectMoviemain();
        
        request.setAttribute("movieList", list);
        
        request.getRequestDispatcher("/boardmvc/movielist1.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
