package kr.or.ddit.board.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.notice.vo.NoticeBoardVO;
import kr.or.ddit.util.MybatisUtil;

public class BoardDAOImpl implements IBoardDAO {

private static BoardDAOImpl dao;
   
   private BoardDAOImpl() { }
   
   public static BoardDAOImpl getInstance() {
      if(dao==null) dao = new BoardDAOImpl();
      return dao; 
   }
   
   @Override
   public int insertBoard(NoticeBoardVO boardVO) {
      // 데이터베이스와 연결해서 내가 원하는 결과를 얻기 위한 쿼리를 실행할 준비를 한다.
      SqlSession session = null;
      int cnt = 0;
      
      try {
         session = MybatisUtil.getSqlSession();
         cnt = session.insert("NoticeBoard.insertBoard", boardVO);
         if(cnt>0) session.commit();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         if(session != null) session.close();
      }
      return cnt;
      
   }
   
   @Override
   public List<NoticeBoardVO> selectBoardList() {
      SqlSession session = null;
      List<NoticeBoardVO> boardList = null;
      
      try {
         session = MybatisUtil.getSqlSession();
               boardList = session.selectList("NoticeBoard.selectBoardList");
               
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         if(session != null) session.close();
      }
      
      return boardList;
   }

   @Override
   public NoticeBoardVO selectBoard(int bono) {
      SqlSession session = null;
      NoticeBoardVO board = null;
      
      try {
         session = MybatisUtil.getSqlSession();
         board = session.selectOne("NoticeBoard.selectBoard", bono);
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         if(session != null) session.close();
      }
      
      return board;
   
   }

@Override
public int updateBoard(NoticeBoardVO board) {
	SqlSession session = null;
	int cnt=0;
	
	try {
        session = MybatisUtil.getSqlSession();
        cnt = session.update("NoticeBoard.updateBoard", board);
        
        if(cnt>0) {
        	session.commit();
      
        }
        
     } catch (Exception e) {
        e.printStackTrace();
     }finally {
        if(session != null) session.close();
     }
	return cnt;
}

@Override
public int deleteBoard(int bono) {
	SqlSession session = null;
	int cnt=0;
	
	try {
        session = MybatisUtil.getSqlSession();
        cnt = session.update("NoticeBoard.deleteBoard", bono);
        
        if(cnt>0) {
        	session.commit();
      
        }
        
     } catch (Exception e) {
        e.printStackTrace();
     }finally {
        if(session != null) session.close();
     }
	return cnt;
}

@Override
public int updateBoardHit(NoticeBoardVO board) {
	SqlSession session = null;
	int cnt=0;
	
	try {
        session = MybatisUtil.getSqlSession();
        cnt = session.update("NoticeBoard.updateBoardHit", board);
        
        if(cnt>0) {
        	session.commit();
      
        }
        
     } catch (Exception e) {
        e.printStackTrace();
     }finally {
        if(session != null) session.close();
     }
	return cnt;
}

   
}