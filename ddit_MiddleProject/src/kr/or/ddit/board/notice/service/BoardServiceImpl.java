package kr.or.ddit.board.notice.service;

import java.util.List;

import kr.or.ddit.board.notice.dao.BoardDAOImpl;
import kr.or.ddit.board.notice.dao.IBoardDAO;
import kr.or.ddit.board.notice.vo.NoticeBoardVO;


public class BoardServiceImpl implements IBoardService {

	private IBoardDAO dao;
	
	private static BoardServiceImpl service;
	
	private BoardServiceImpl() {
		dao = BoardDAOImpl.getInstance();
	}
	
	public static BoardServiceImpl getInstance() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}

	@Override
	public int insertBoard(NoticeBoardVO boardVO) {
		// TODO Auto-generated method stub
		return dao.insertBoard(boardVO);
	}

	@Override
	public List<NoticeBoardVO> selectBoardList() {
		// TODO Auto-generated method stub
		return dao.selectBoardList();
	}

	@Override
	public NoticeBoardVO selectBoard(int parseInt) {
		return dao.selectBoard(parseInt);
	}

	@Override
	public int updateBoard(NoticeBoardVO board) {
		// TODO Auto-generated method stub
		return dao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int bono) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(bono);
	}

	@Override
	public int updateBoardHit(NoticeBoardVO board) {
		// TODO Auto-generated method stub
		return dao.updateBoardHit(board);
	}


}
