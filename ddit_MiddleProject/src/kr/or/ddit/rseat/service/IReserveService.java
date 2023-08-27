package kr.or.ddit.rseat.service;

import java.util.List;

import kr.or.ddit.rseat.vo.ReserveVO;

public interface IReserveService {
	
	public List<ReserveVO> selectAll(ReserveVO reserveVO);
	
	public ReserveVO selectOne(ReserveVO vo);

}
