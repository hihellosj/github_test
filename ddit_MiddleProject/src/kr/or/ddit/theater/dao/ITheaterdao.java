package kr.or.ddit.theater.dao;

import java.util.List;

import kr.or.ddit.theater.vo.TheaterVO;

public interface ITheaterdao {

	public List<TheaterVO> selectByMid(String mid);
	
	public TheaterVO TheaterDetail(String no1);
	
	
}
