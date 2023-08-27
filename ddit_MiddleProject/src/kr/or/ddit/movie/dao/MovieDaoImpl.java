package kr.or.ddit.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.faq.vo.FaqBoardVO;
import kr.or.ddit.movie.vo.MovieListVO;
import kr.or.ddit.util.MybatisUtil;

public class MovieDaoImpl implements IMovieDao{

	private static IMovieDao dao;
	
	private MovieDaoImpl() {}
	
	public static IMovieDao getInstance() {
		if(dao == null) dao = new MovieDaoImpl();
		return dao;
	}
	
	@Override
	public List<MovieListVO> selectMoviemain() {
		SqlSession session = null;
		List<MovieListVO> list = null;  
		try {
			session = MybatisUtil.getSqlSession(); 
			list = session.selectList("Movie.selectMoviemain");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public MovieListVO selectMovieId(String m_id) {
		SqlSession session = null;
		MovieListVO list = null; 
		try {
			session = MybatisUtil.getSqlSession(); 
			list = session.selectOne("Movie.selectMovieId", m_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public String selectMovieUrl(String m_id) {
		SqlSession session = null;
		String trailerUrl = null;
		try {
			session = MybatisUtil.getSqlSession(); 
			trailerUrl = session.selectOne("Movie.selectMovieUrl", m_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return trailerUrl;
	}

	@Override
	public int insertMovie(MovieListVO movieListVO) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.insert("Movie.insertMovie", movieListVO);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

	@Override
	public int deleteMovie(String m_id) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.insert("Movie.deleteMovie", m_id);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

	@Override
	public int updateMovie(MovieListVO movieListVO) {
		SqlSession session = null;
		int cnt = 0; 
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.update("Movie.updateMovie", movieListVO);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

	@Override
	public MovieListVO getMovie(String m_id) {
		SqlSession session = null;
        MovieListVO movieListVO = null;
        try {
            session = MybatisUtil.getSqlSession();
            movieListVO = session.selectOne("Movie.getMovie", m_id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return movieListVO;
    }



}
