package kr.or.ddit.board.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.faq.vo.FaqBoardVO;
import kr.or.ddit.util.MybatisUtil;

public class BoardDaoImpl implements IBoardDao {

	private static IBoardDao dao;
	
	private BoardDaoImpl() {}
	
	public static  IBoardDao  getInstance() {
		if(dao == null)  dao = new BoardDaoImpl();
		return dao;
	}
	
	@Override
	public List<FaqBoardVO> selectBoard() {
		SqlSession session = null;
		List<FaqBoardVO> list = null;  
		try {
			session = MybatisUtil.getSqlSession(); 
			list = session.selectList("Faqboard.selectBoard");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}

	@Override
	public int insertBoard(FaqBoardVO boardVO) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("Faqboard.insertBoard", boardVO);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

	@Override
	public int updateBoard(FaqBoardVO boardVO) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("Faqboard.updateBoard", boardVO);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return cnt;
	}

	@Override
	public int deleteBoard(int fb_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.delete("Faqboard.deleteBoard", fb_no);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		return cnt;
	}

	@Override
	public FaqBoardVO getBoard(int fb_no) {
		SqlSession session = null;
        FaqBoardVO boardVO = null;
        try {
            session = MybatisUtil.getSqlSession();
            boardVO = session.selectOne("Faqboard.getBoard", fb_no);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return boardVO;
    }
}
