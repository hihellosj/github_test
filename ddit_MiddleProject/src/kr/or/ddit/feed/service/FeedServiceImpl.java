package kr.or.ddit.feed.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.feed.dao.FeedDaoImpl;
import kr.or.ddit.feed.dao.IFeedDao;
import kr.or.ddit.feed.vo.FeedVO;
import kr.or.ddit.feed.vo.ThumsVO;


public class FeedServiceImpl implements IFeedService{
	
	private IFeedDao dao;
	
	private static FeedServiceImpl service;
	
	private FeedServiceImpl() {
		
		dao = FeedDaoImpl.getInstance();
	}
	
	public static FeedServiceImpl getInstance() {
		if(service == null) service = new FeedServiceImpl();
		
		return service;
	}

	@Override
	public int insertFeed(FeedVO feedVo) {
		// TODO Auto-generated method stub
		return dao.insertFeed(feedVo);
	}

	@Override
	public List<FeedVO> getAllFeed() {
		// TODO Auto-generated method stub
		return dao.getAllFeed();
	}

	@Override
	public int deleteFeed(String userId) {
		// TODO Auto-generated method stub
		return dao.deleteFeed(userId);
	}

	@Override
	public FeedVO getFee(String feedNo) {
		// TODO Auto-generated method stub
		return dao.getFee(feedNo);
	}

	@Override
	public int updateFeed(FeedVO feedVo) {
		// TODO Auto-generated method stub
		return dao.updateFeed(feedVo);
	}

	@Override
	public int recCheck(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return dao.recCheck(m);
	}

	@Override
	public int recUpdate(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return dao.recUpdate(m);
	}

	@Override
	public int recDelete(Map<String, Object> m) {
		// TODO Auto-generated method stub
		return dao.recDelete(m);
	}

	@Override
	public int recCount(int no) {
		// TODO Auto-generated method stub
		return dao.recCount(no);
	}

	@Override
	public List<ThumsVO> getThumsCount(String feedNo) {
		// TODO Auto-generated method stub
		return dao.getThumsCount(feedNo);
	}

	@Override
	public int countFeed(FeedVO feedVo) {
		// TODO Auto-generated method stub
		return dao.countFeed(feedVo);
	}

	@Override
	public List<FeedVO> getSearchFeed(String feedVo) {
		// TODO Auto-generated method stub
		return dao.getSearchFeed(feedVo);
	}

	@Override
	public List<FeedVO> getSearchFeed(FeedVO vo) {
		// TODO Auto-generated method stub
		return dao.getSearchFeed(vo);
	}

	@Override
	public List<FeedVO> getMyPost(FeedVO vo) {
		// TODO Auto-generated method stub
		return dao.getMyPost(vo);
	}

	@Override
	public List<FeedVO> getAllImage(FeedVO vo) {
		// TODO Auto-generated method stub
		return dao.getAllImage(vo);
	}

	@Override
	public List<FeedVO> getFeedRank() {
		// TODO Auto-generated method stub
		return dao.getFeedRank();
	}

	@Override
	public int getThumsCount1(String feedNo) {
		// TODO Auto-generated method stub
		return dao.getThumsCount1(feedNo);
	}

	@Override
	public FeedVO getReservationTicket(FeedVO vo) {
		// TODO Auto-generated method stub
		return dao.getReservationTicket(vo);
	}

	
	

	/*
	 * @Override public FeedVO getThumsCount(String feedNo) { // TODO Auto-generated
	 * method stub return dao.getThumsCount(feedNo); }
	 */
	
	

}
