package kr.or.ddit.board.lost.service;

import java.util.List;

import kr.or.ddit.board.lost.dao.ILostBoardDAO;
import kr.or.ddit.board.lost.dao.LostBoardDAOImpl;
import kr.or.ddit.board.lost.vo.LostBoardVO;



public class LostBoardServiceImpl implements ILostBoardService {
	
	private ILostBoardDAO dao;
	
	private static LostBoardServiceImpl service;
	
	private LostBoardServiceImpl() {
		dao =LostBoardDAOImpl.getInstance();
	}
	
	public static LostBoardServiceImpl getInstance() {
		if(service == null) service = new LostBoardServiceImpl();
		return service;
	}
	

	@Override
	public int insertLostboard(LostBoardVO lBoardVO) {
		return dao.insertLostboard(lBoardVO);
	}

	@Override
	public List<LostBoardVO> getBoardList(String userId) {
		return dao.getBoardList(userId);
	}

	@Override
	public int deleteBoard(String lb_no) {
		return dao.deleteBoard(lb_no);
	}

	@Override
	public int updateBoard(LostBoardVO lBoardVO) {
		return dao.updateBoard(lBoardVO);
	}

	@Override
	public LostBoardVO getBoard(int lb_no) {
		return dao.getBoard(lb_no);
	}

	
}
