package kr.or.ddit.feed.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.feed.vo.FeedVO;
import kr.or.ddit.feed.vo.ThumsVO;
import kr.or.ddit.util.MybatisUtil;


public class FeedDaoImpl implements IFeedDao {
	
	private static FeedDaoImpl dao;
	
	private FeedDaoImpl() {}
	
	public static FeedDaoImpl getInstance() {
		if(dao ==null) dao =new FeedDaoImpl();
		
		return dao;
	}

	@Override
	public int insertFeed(FeedVO feedVo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("feed.insertFeed", feedVo);
			if(cnt>0) session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		
		return cnt;
	}

	@Override
	public List<FeedVO> getAllFeed() {
		SqlSession session = null;
		
		List<FeedVO> feedList =null;
		
		try {
			session = MybatisUtil.getSqlSession();
			feedList = session.selectList("feed.getFeed");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return feedList;
	}

	@Override
	public int deleteFeed(String userId) {
		SqlSession session = null;

		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.delete("feed.deleteFeed", userId);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return cnt;
	}

	@Override
	public FeedVO getFee(String feedNo) {
		SqlSession session = null;
		FeedVO feedGo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			feedGo = session.selectOne("feed.getFee", feedNo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null)session.close();
		}
		return feedGo;
	}

	@Override
	public int updateFeed(FeedVO feedVo) {
		SqlSession session =null;
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("feed.updateFeed", feedVo);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int recCheck(Map<String, Object> m) {
		
		SqlSession session = null;
		int result = 0;
		try {
			session = MybatisUtil.getSqlSession();
			result = session.selectOne("feed.recCheck", m);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null)session.close();
		}
		return result;
	}

	@Override
	public int recUpdate(Map<String, Object> m) {
		SqlSession session =null;
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("feed.recUpdate", m);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int recDelete(Map<String, Object> m) {
		SqlSession session =null;
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("feed.recDelete", m);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int recCount(int no) {
		SqlSession session = null;
		
		int count = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			
			count = session.selectOne("feed.recCount", no);
			System.out.println("feeddaoimpl"+count);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
		return count;
	}
//----------------------------------------------------------------------------하하하^^
	/*
	 * @Override public FeedVO getThumsCount(String feedNo) { SqlSession session =
	 * null; FeedVO feedGo = null;
	 * 
	 * try { session = MybatisUtil.getSqlSession(); feedGo =
	 * session.selectOne("boardfeed.selectThumsCount", feedNo); } catch (Exception
	 * e) { e.printStackTrace(); }finally { if(session != null)session.close(); }
	 * return feedGo; }
	 */

	@Override
	public List<ThumsVO> getThumsCount(String feedNo) {
		SqlSession session = null;
		
		List<ThumsVO> thumsList =null;
		
		try {
			session = MybatisUtil.getSqlSession();
			thumsList = session.selectList("thums.thumsCount", feedNo);
			System.out.println(thumsList);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return thumsList;
	}

	@Override
	public int countFeed(FeedVO feedVo) {
		SqlSession session =null;
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("feed.countFeed", feedVo);
			if(cnt>0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public List<FeedVO> getSearchFeed(String feedVo) {
		SqlSession session = null;
		
		List<FeedVO> feedList =null;
		
		try {
			session = MybatisUtil.getSqlSession();
			feedList = session.selectList("feed.getSearchFeed", feedVo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return feedList;
		
	}

	

	@Override
	public List<FeedVO> getSearchFeed(FeedVO vo) {
		SqlSession session = null;
		
		List<FeedVO> feedList =null;
		System.out.println("feeddaoimpl vo : "+vo.getM_cast());
		System.out.println("feeddaoimpl 내용 : "+ vo.getMvselect());
		System.out.println("feeddaoimpl 내용 : "+ vo.getSearchFeed());
		
		try {
			session = MybatisUtil.getSqlSession();
			feedList = session.selectList("feed.getSearchFeedList", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return feedList;
	}

	@Override
	public List<FeedVO> getMyPost(FeedVO vo) {
		SqlSession session = null;
		
		List<FeedVO> feedList =null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			feedList = session.selectList("feed.getMyPostList", vo);
			
			System.out.println("feeddaoimpl" + feedList.get(0).getMi_img());
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return feedList;
	}

	@Override
	public List<FeedVO> getAllImage(FeedVO vo) {
		SqlSession session = null;
		
		List<FeedVO> feedList =null;
		
		
		try {
			session = MybatisUtil.getSqlSession();
			feedList = session.selectList("feed.getAllImage", vo);
			System.out.println("이미지 뽑혔니"+feedList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return feedList;
	}

	@Override
	public List<FeedVO> getFeedRank() {
		SqlSession session = null;
		
		List<FeedVO> feedList =null;
		
		try {
			session = MybatisUtil.getSqlSession();
			feedList = session.selectList("feed.getFeedRank");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return feedList;
	}

	@Override
	public int getThumsCount1(String feedNo) {
		SqlSession session = null;
		
		int count = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			
			count = session.selectOne("thums.thumsCount", feedNo);
			System.out.println("feeddaoimpl 떰스"+count);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
		return count;
	}

	@Override
	public FeedVO getReservationTicket(FeedVO vo) {
		SqlSession session = null;
		FeedVO feedGo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			feedGo = session.selectOne("feed.getReservationTicket", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null)session.close();
		}
		return feedGo;
	}

	

	
	
	
	
	
}


