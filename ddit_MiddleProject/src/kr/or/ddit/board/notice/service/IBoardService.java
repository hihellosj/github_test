package kr.or.ddit.board.notice.service;

import java.util.List;

import kr.or.ddit.board.notice.vo.NoticeBoardVO;


public interface IBoardService {

	public int insertBoard(NoticeBoardVO boardVO);

	public List<NoticeBoardVO> selectBoardList();

	public NoticeBoardVO selectBoard(int parseInt);

	public int updateBoard(NoticeBoardVO board);

	public int deleteBoard(int parseInt);
	
	
	
	public int updateBoardHit(NoticeBoardVO board);

	
	
}
