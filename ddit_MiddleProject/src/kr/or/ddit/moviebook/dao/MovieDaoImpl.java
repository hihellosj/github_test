package kr.or.ddit.moviebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.moviebook.vo.MovieVO;
import kr.or.ddit.mybatis.config.MybatisUtil;

public class MovieDaoImpl implements IMovieDao{

	private static IMovieDao dao;
	
	private SqlSession sql;
	
	public static IMovieDao getdao() {
		
		if(dao == null)dao = new MovieDaoImpl();
		
		return dao;
		
	}
	
	
	
	
	@Override
	public List<MovieVO> selectAll() {
		
		List<MovieVO> list = null;
		
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("moviebook.selectAll");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}

		return list;
	}

}
