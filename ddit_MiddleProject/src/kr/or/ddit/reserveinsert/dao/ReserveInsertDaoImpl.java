package kr.or.ddit.reserveinsert.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MybatisUtil;
import kr.or.ddit.reserveinsert.vo.ReserveInsertVO;

public class ReserveInsertDaoImpl implements IReserveInsertDao {

	
	SqlSession sql;
	
	private static IReserveInsertDao dao;
	
	public static IReserveInsertDao getDao() {
		if(dao == null) dao = new ReserveInsertDaoImpl();
		
		return dao;
	}
	
	
	
	@Override
	public int insertReserve(ReserveInsertVO vo) {
		
		int res = 0;
		
		try {
			sql = MybatisUtil.getSqlSession();
			res = sql.insert("reserveinsert.insertReserve",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}
		
		
		
		return res;
	}

}
