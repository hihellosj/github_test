package kr.or.ddit.reserveinsert.service;

import kr.or.ddit.reserveinsert.dao.IReserveInsertDao;
import kr.or.ddit.reserveinsert.dao.ReserveInsertDaoImpl;
import kr.or.ddit.reserveinsert.vo.ReserveInsertVO;

public class ReserveInsertServiceImpl implements IReserveInsertService {

	private IReserveInsertDao dao;
	
	private static IReserveInsertService service;
	
	
	private ReserveInsertServiceImpl() {
		dao = ReserveInsertDaoImpl.getDao();
	}
	
	public static IReserveInsertService getService() {
		if(service == null) service = new ReserveInsertServiceImpl();
		
		return service;
	}
	
	
	@Override
	public int insertReserve(ReserveInsertVO vo) {
		// TODO Auto-generated method stub
		return dao.insertReserve(vo);
	}

}
