package kr.or.ddit.board.notice.dao;

import java.util.List;

import kr.or.ddit.board.notice.vo.NoticeBoardVO;


public interface IBoardDAO {

	public int insertBoard(NoticeBoardVO boardVO);

	public List<NoticeBoardVO> selectBoardList();
	
	public NoticeBoardVO selectBoard(int parseInt);

	public int updateBoard(NoticeBoardVO board);

	public int deleteBoard(int bono);
	
	
	public int updateBoardHit(NoticeBoardVO board);
	

}
