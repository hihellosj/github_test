package kr.or.ddit.movie.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.movie.vo.MovieListVO;

public interface IMovieService {

	public List<MovieListVO> selectMoviemain();
	
	public MovieListVO selectMovieId(String m_id);
	
	public String selectMovieUrl(String m_id);
	
	public int insertMovie(MovieListVO movieListVO);
	
	public int deleteMovie(String m_id);
	
	public int updateMovie(MovieListVO movieListVO);

	public MovieListVO getMovie(String m_id);
	
}
