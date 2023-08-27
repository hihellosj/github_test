package kr.or.ddit.theater.service;

import java.util.List;

import kr.or.ddit.theater.vo.TheaterVO;

public interface ITheaterService {
	
	public List<TheaterVO> selectByMid(String mid);
	
	public TheaterVO TheaterDetail(String no1);
	

}
