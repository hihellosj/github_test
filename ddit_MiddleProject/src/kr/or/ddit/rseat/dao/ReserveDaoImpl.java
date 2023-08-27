package kr.or.ddit.rseat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MybatisUtil;
import kr.or.ddit.rseat.vo.ReserveVO;

public class ReserveDaoImpl implements IReserveDao {

	private static IReserveDao dao;
	
	private SqlSession sql;
	
	public static IReserveDao getdao() {
		if(dao == null)dao = new ReserveDaoImpl();
		
		return dao;
	}
	
	
	
	
	@Override
	public List<ReserveVO> selectAll(ReserveVO reserveVO) {

		List<ReserveVO> list = null;
		
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("reserve.selectAll", reserveVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}
		
		
		return list;
	}




	@Override
	public ReserveVO selectOne(ReserveVO vo) {
		ReserveVO list = null;
		
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectOne("reserve.selectOne", vo);
			System.out.println("redaoimpl"+list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}
		
		
		return list;
	}

}
