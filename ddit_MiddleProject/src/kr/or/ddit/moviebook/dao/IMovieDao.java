package kr.or.ddit.moviebook.dao;

import java.util.List;

import kr.or.ddit.moviebook.vo.MovieVO;

public interface IMovieDao {

	public List<MovieVO> selectAll();
	
	
}
