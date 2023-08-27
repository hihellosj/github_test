package kr.or.ddit.moviebook.service;

import java.util.List;

import kr.or.ddit.moviebook.dao.IMovieDao;
import kr.or.ddit.moviebook.dao.MovieDaoImpl;
import kr.or.ddit.moviebook.vo.MovieVO;

public class MovieServiceImpl implements IMovieService {
	
	private static IMovieService service;
	
	private IMovieDao dao;
	
	private MovieServiceImpl() {
		dao = MovieDaoImpl.getdao();
	}
	
	public static IMovieService getService() {
		if(service == null)service = new MovieServiceImpl();
		
		return service;
	
	}

	@Override
	public List<MovieVO> selectAll() {

		return dao.selectAll();
		
	}
}
	
	
	

