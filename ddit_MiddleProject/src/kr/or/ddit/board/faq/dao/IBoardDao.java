package kr.or.ddit.board.faq.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.faq.vo.FaqBoardVO;

public interface IBoardDao {
	
	public List<FaqBoardVO> selectBoard();
	
	public int insertBoard(FaqBoardVO boardVO);
	
	public int updateBoard(FaqBoardVO boardVO);
	
	public int deleteBoard(int fb_no);
	
	public FaqBoardVO getBoard(int fb_no);
	
}
