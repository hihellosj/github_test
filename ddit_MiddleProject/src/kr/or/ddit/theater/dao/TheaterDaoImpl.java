package kr.or.ddit.theater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MybatisUtil;
import kr.or.ddit.theater.vo.TheaterVO;

public class TheaterDaoImpl implements ITheaterdao {
	
	private SqlSession sql;
	
	private static ITheaterdao dao;
	
	public static ITheaterdao getDao() {
		if(dao == null)dao = new TheaterDaoImpl();
		return dao;
	}
	
	

	@Override
	public List<TheaterVO> selectByMid(String mid) {
		
		List<TheaterVO> list = null;
		
		try {
			System.out.println(mid);
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("theater.selectByMid",mid);
			System.out.println("-------");
			System.out.println(list.size());
			System.out.println(list.get(0).getT_seat_num());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}
		
		return list;
	}

	@Override
	public TheaterVO TheaterDetail(String no1) {
		
		TheaterVO vo = null;
		
		try {
			sql = MybatisUtil.getSqlSession();
			vo = sql.selectOne("theater.theaterDetail",no1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}

		
		
		return vo;
	}

}
