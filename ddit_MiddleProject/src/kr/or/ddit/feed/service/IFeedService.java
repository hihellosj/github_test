package kr.or.ddit.feed.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.feed.vo.FeedVO;
import kr.or.ddit.feed.vo.ThumsVO;



public interface IFeedService {
	public int insertFeed(FeedVO feedVo);
	
	public List<FeedVO> getAllFeed();
	
	public List<FeedVO> getFeedRank();
	
	public List<FeedVO> getSearchFeed(String feedVo);
	
	public List<FeedVO> getSearchFeed(FeedVO vo);
	
	public List<FeedVO> getMyPost(FeedVO vo);
	
	public List<FeedVO> getAllImage(FeedVO vo);
	
	//****************************************************
	
	public FeedVO getReservationTicket(FeedVO vo);
	
	public int deleteFeed(String userId);
	
	public FeedVO getFee(String feedNo);
	
	public int updateFeed(FeedVO feedVo);
	
	//*****************************************************
	public int recCheck(Map<String, Object> m);
	
	public int recUpdate(Map<String, Object> m);
	
	public int recDelete(Map<String, Object> m);
	
	public int recCount(int no);
	//*****************************************************
	
	/* public FeedVO getThumsCount(String feedNo); */
	
	public int getThumsCount1(String feedNo);
	
	public List<ThumsVO> getThumsCount(String feedNo);
	
	public int countFeed(FeedVO feedVo);
}
