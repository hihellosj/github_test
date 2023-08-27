package kr.or.ddit.moviebook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.moviebook.service.IMovieService;
import kr.or.ddit.moviebook.service.MovieServiceImpl;
import kr.or.ddit.moviebook.vo.MovieVO;


@WebServlet("/movieList.do")
public class MovieList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MovieList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		IMovieService service = MovieServiceImpl.getService();
		
		List<MovieVO> list = service.selectAll();
		
		request.setAttribute("MovieList", list);
	
		request.getRequestDispatcher("/theaterview/movieList.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
