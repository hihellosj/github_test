package kr.or.ddit.rseat.dao;

import java.util.List;

import kr.or.ddit.rseat.vo.ReserveVO;

public interface IReserveDao {

	
	
	public List<ReserveVO> selectAll(ReserveVO reserveVO);
	
	public ReserveVO selectOne(ReserveVO vo);
	
	
}
