package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.MybatisUtil;

public class MemberDaoImpl implements IMemberDao {
	private static MemberDaoImpl dao;
	
	private MemberDaoImpl() { }

	public static MemberDaoImpl getInstance() {
		if(dao==null) dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public MemberVO getMemberLogin(MemberVO memVo) {
		SqlSession session = null;	// Web의 세션과 다른 아이... Mybatis의 session
		MemberVO LoginMemVo = null;	// 반환값이 저장될 변수

		try {
			session = MybatisUtil.getSqlSession();
			LoginMemVo = session.selectOne("member.getMemberLogin", memVo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		return LoginMemVo;
	}

	@Override
	public int insertMember(MemberVO memVo) {
		SqlSession session = null;
		
		int cnt = 0;  // 반환값이 저장될 변수 선언
		
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.insert("member.insertMember", memVo);
			if(cnt > 0) session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return cnt;
	}

	@Override
	public int getMemberCount(String userId) {
		SqlSession session = null;
		
		int count = 0;
		try {
			session = MybatisUtil.getSqlSession(); 
			count = session.selectOne("member.getMemberCount", userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		
		return count;
	}

	@Override
	public String findMemberId(MemberVO memVo) {
	    SqlSession session = null;
	    String memId = null;

	    try {
	        session = MybatisUtil.getSqlSession(); 
	        memId = session.selectOne("member.findMemberId", memVo);

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if(session != null) session.close();
	    } 
	    
	    return memId;
	}

	@Override
	public String findMemberPw(MemberVO memVo) {
		SqlSession session = null;
	    String memPw = null;

	    try {
	        session = MybatisUtil.getSqlSession(); 
	        memPw = session.selectOne("member.findMemberPw", memVo);

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if(session != null) session.close();
	    } 
		return memPw;
	}

	@Override
	public int getMemberPwCount(String userPw) {
		SqlSession session = null;
		
		int count = 0;
		try {
			session = MybatisUtil.getSqlSession(); 
			count = session.selectOne("member.getMemberPwCount", userPw);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		
		return count;
	}

	@Override
	public int deleteMember(String userId) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.delete("member.deleteMember", userId);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return cnt;
	}

	@Override
	public int updateMember(MemberVO memVo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession(); 
			cnt = session.update("member.updateMember", memVo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return cnt;
	}

	@Override
	public MemberVO getMember(String userId) {
		SqlSession session = null; 
		MemberVO loginMemberVo = null;
		try {
			session = MybatisUtil.getSqlSession();
			loginMemberVo = session.selectOne("member.getMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		return loginMemberVo;
	}

	@Override
	public List<MemberVO> getAllMember() {
		SqlSession session = null;
		List<MemberVO> memberList = null;  // 반환값이 저장될 변수
		
		try {
			session = MybatisUtil.getSqlSession(); 
			memberList = session.selectList("member.getAllMember");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return memberList;
	}
	
	
	

	
	
}
