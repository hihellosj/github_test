package kr.or.ddit.board.onetoone.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.onetoone.vo.QnAboardVO;
import kr.or.ddit.mybatis.config.MybatisUtil;

public class QnAboardDaoImpl implements IQnAboardDao {

	SqlSession  sql ;
	
	private static IQnAboardDao dao;
	
	public static  IQnAboardDao  getDao() {
		if(dao == null)  dao = new QnAboardDaoImpl();
		
		return dao;
	}
	
	@Override
	public int insertBoard(QnAboardVO vo) {

		int res = 0;
		try {
			sql = MybatisUtil.getSqlSession();
			res=sql.insert("board.insertBoard", vo);
		} catch(Exception e){
			e.printStackTrace();
        } finally {
			sql.commit();
			sql.close();
		}
		return res;
	}

	@Override
	public int deleteBoard(int csNo) {
		int res = 0;
		try {
			sql = MybatisUtil.getSqlSession();
			res=sql.insert("board.deleteBoard", csNo);
		} catch(Exception e){
			e.printStackTrace();
        } finally {
			sql.commit();
			sql.close();
		}
		return res;
	}

	




	@Override
	public List<QnAboardVO> getAllboard() {
		List<QnAboardVO> list = null;
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("board.getAllboard");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}
		
		return list;
	}

	@Override
	public QnAboardVO getBoard(int csNo) {
		QnAboardVO boardVo =null;
		try {
			sql = MybatisUtil.getSqlSession();
			boardVo = sql.selectOne("board.getBoard", csNo);
			System.out.println("dao-------------------"+boardVo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}
		return boardVo;
	}

	@Override
	public int insertAnswer(QnAboardVO vo) {
		int res = 0;
		try {
			sql = MybatisUtil.getSqlSession();
			res=sql.update("board.updateAnswer", vo);
		} catch(Exception e){
			e.printStackTrace();
        } finally {
			sql.commit();
			sql.close();
		}
		return res;
	}

	@Override
	public int updateAnswer(QnAboardVO vo) {
		int res = 0;
		try {
			sql = MybatisUtil.getSqlSession();
			res=sql.update("board.insertAnswer", vo);
		} catch(Exception e){
			e.printStackTrace();
        } finally {
			sql.commit();
			sql.close();
		}
		return res;
	}

	@Override
	public List<QnAboardVO> selectBoard(QnAboardVO vo) {
		List<QnAboardVO> list = null;
		try {
			sql = MybatisUtil.getSqlSession();
			list = sql.selectList("board.selectBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sql.commit();
			sql.close();
		}
		
		return list;
	}


	

	

}
