package kr.or.ddit.board.lost.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.lost.vo.LostBoardVO;
import kr.or.ddit.util.MybatisUtil;

public class LostBoardDAOImpl implements ILostBoardDAO {
	
	SqlSession session;
	
	// 싱글턴
	private static LostBoardDAOImpl dao;
	
	private LostBoardDAOImpl() { }
	
	public static LostBoardDAOImpl getInstance() {
		if(dao==null) dao = new LostBoardDAOImpl();
		return dao;
	}

	@Override
	public int insertLostboard(LostBoardVO lBoardVO) {

		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("lostboard.insertLostboard", lBoardVO);
			if(cnt>0) session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public List<LostBoardVO> getBoardList(String userId) {
		
		List<LostBoardVO> boardlist = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			boardlist = session.selectList("lostboard.getBoardList", userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return boardlist;
	}

	@Override
	public int deleteBoard(String lb_no) {
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("lostboard.deleteBoard", lb_no);
			if(cnt > 0) session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int updateBoard(LostBoardVO lBoardVO) {

		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("lostboard.updateBoard", lBoardVO);
			if(cnt > 0) session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public LostBoardVO getBoard(int lb_no) {

		LostBoardVO lostBoardVO = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			lostBoardVO = session.selectOne("lostboard.getBoard", lb_no);
			System.out.println("lbdaoimpl : "+ lostBoardVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return lostBoardVO;
	}

	
}
