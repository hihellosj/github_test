package kr.or.ddit.board.faq.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.faq.dao.BoardDaoImpl;
import kr.or.ddit.board.faq.dao.IBoardDao;
import kr.or.ddit.board.faq.vo.FaqBoardVO;

public class BoardServiceImpl implements IBoardService {
	
	private static BoardServiceImpl service;

	private IBoardDao  dao;
	
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getInstance();
	}
	
	public static IBoardService  getInstance() {
		if(service == null)  service = new BoardServiceImpl();
		
		return service;
	}
	
	@Override
	public List<FaqBoardVO> selectBoard() {
		return dao.selectBoard();
	}

	@Override
	public int insertBoard(FaqBoardVO boardVO) {
		return dao.insertBoard(boardVO);
	}

	@Override
	public int updateBoard(FaqBoardVO boardVO) {
		return dao.updateBoard(boardVO);
	}

	@Override
	public int deleteBoard(int fb_no) {
		return dao.deleteBoard(fb_no);
	}

	@Override
	public FaqBoardVO getBoard(int fb_no) {
		return dao.getBoard(fb_no);
	}
}









