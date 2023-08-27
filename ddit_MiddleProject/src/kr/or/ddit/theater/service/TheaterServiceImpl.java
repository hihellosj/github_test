package kr.or.ddit.theater.service;

import java.util.List;

import kr.or.ddit.theater.dao.ITheaterdao;
import kr.or.ddit.theater.dao.TheaterDaoImpl;
import kr.or.ddit.theater.vo.TheaterVO;



public class TheaterServiceImpl implements ITheaterService{

	
	private static ITheaterService service;
	
	private ITheaterdao dao;
	
	private TheaterServiceImpl() {
		dao = TheaterDaoImpl.getDao();
	}
	
	
	public static ITheaterService getService() {
		if(service == null)service = new TheaterServiceImpl();
		return service;
	}
	
	
	
	@Override
	public List<TheaterVO> selectByMid(String mid) {
		// TODO Auto-generated method stub
		return dao.selectByMid(mid);
	}

	@Override
	public TheaterVO TheaterDetail(String no1) {
		// TODO Auto-generated method stub
		return dao.TheaterDetail(no1);
	}

}
