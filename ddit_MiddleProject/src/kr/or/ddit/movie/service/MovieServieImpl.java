package kr.or.ddit.movie.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.movie.dao.IMovieDao;
import kr.or.ddit.movie.dao.MovieDaoImpl;
import kr.or.ddit.movie.vo.MovieListVO;

public class MovieServieImpl implements IMovieService{

	private static MovieServieImpl service;
	
	private IMovieDao dao;
	
	private MovieServieImpl() {
		dao = MovieDaoImpl.getInstance();
	}
	
	public static IMovieService getInstance() {
		if(service == null) service = new MovieServieImpl();
		
		return service;
	}
	
	@Override
	public List<MovieListVO> selectMoviemain() {
		return dao.selectMoviemain();
	}

	@Override
	public MovieListVO selectMovieId(String m_id) {
		return dao.selectMovieId(m_id);
	}

	@Override
	public String selectMovieUrl(String m_id) {
		return dao.selectMovieUrl(m_id);
	}

	@Override
	public int insertMovie(MovieListVO movieListVO) {
		return dao.insertMovie(movieListVO);
	}


	@Override
	public int deleteMovie(String m_id) {
		return dao.deleteMovie(m_id);
	}

	@Override
	public int updateMovie(MovieListVO movieListVO) {
		return dao.updateMovie(movieListVO);
	}

	@Override
	public MovieListVO getMovie(String m_id) {
		return dao.getMovie(m_id);
	}


}
