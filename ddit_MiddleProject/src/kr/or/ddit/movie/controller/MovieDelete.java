package kr.or.ddit.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.faq.service.BoardServiceImpl;
import kr.or.ddit.board.faq.service.IBoardService;
import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServieImpl;

@WebServlet("/movieDelete.do")
public class MovieDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    //삭제할 게시글의 번호를 가져온다
	    String m_id = request.getParameter("m_id");
	    
	    //service 객체 얻기
	    IMovieService service = MovieServieImpl.getInstance();
	    
	    //service 메소드 호출
	    service.deleteMovie(m_id);
	    
	    //게시글 삭제 후 리스트로 이동
	    response.sendRedirect(request.getContextPath() + "/movieListMain.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
