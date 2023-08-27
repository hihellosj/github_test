package kr.or.ddit.board.onetoone.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.onetoone.dao.IQnAboardDao;
import kr.or.ddit.board.onetoone.dao.QnAboardDaoImpl;
import kr.or.ddit.board.onetoone.vo.QnAboardVO;

public class QnAboardServiceImpl implements IQnAboardService {
	
	private IQnAboardDao  dao;
	
	private static IQnAboardService service;
	
	private QnAboardServiceImpl() {
		dao = QnAboardDaoImpl.getDao();
	}
	
	public static IQnAboardService  getService() {
		if(service == null)  service = new QnAboardServiceImpl();
		
		return service;
	}
	
	@Override
	public int insertBoard(QnAboardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int csNo) {
		// TODO Auto-generated method stub
		return dao.deleteBoard(csNo);
	}

	@Override
	public List<QnAboardVO> getAllboard() {
		// TODO Auto-generated method stub
		return dao.getAllboard();
	}

	@Override
	public QnAboardVO getBoard(int csNo) {
		System.out.println("service-------------------"+csNo);
		return dao.getBoard(csNo);
	}

	@Override
	public int insertAnswer(QnAboardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertAnswer(vo);
	}

	@Override
	public int updateAnswer(QnAboardVO vo) {
		// TODO Auto-generated method stub
		return dao.updateAnswer(vo);
	}

	@Override
	public List<QnAboardVO> selectBoard(QnAboardVO vo) {
		// TODO Auto-generated method stub
		return dao.selectBoard(vo);
	}

	

	

	

}
