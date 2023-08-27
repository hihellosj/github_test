package kr.or.ddit.rseat.service;

import java.util.List;

import kr.or.ddit.rseat.dao.IReserveDao;
import kr.or.ddit.rseat.dao.ReserveDaoImpl;
import kr.or.ddit.rseat.vo.ReserveVO;

public class ReserveServiceImpl implements IReserveService {

	private static IReserveService service;
	
	private IReserveDao dao;
	
	private ReserveServiceImpl() {
		dao = ReserveDaoImpl.getdao();
	}
	
	public static IReserveService getService() {
		if(service == null)service = new ReserveServiceImpl();
		
		return service;
	}
	
	
	
	
	@Override
	public List<ReserveVO> selectAll(ReserveVO reserveVO) {

		return dao.selectAll(reserveVO);
	}

	@Override
	public ReserveVO selectOne(ReserveVO vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

}
