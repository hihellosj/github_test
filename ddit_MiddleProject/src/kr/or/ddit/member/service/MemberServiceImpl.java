package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements ImemberService {

	private IMemberDao dao;
	
	private static MemberServiceImpl service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static MemberServiceImpl getInstance() {
		if(service==null) service = new MemberServiceImpl();
		return service;
	}
	
	@Override
	public MemberVO getMemberLogin(MemberVO memVo) {
		
		return dao.getMemberLogin(memVo);
	}

	@Override
	public int insertMember(MemberVO memVo) {
		return dao.insertMember(memVo);
	}

	@Override
	public int getMemberCount(String userId) {
		return dao.getMemberCount(userId);
	}

	@Override
	public String findMemberId(MemberVO memVo) {
		return dao.findMemberId(memVo);
	}

	@Override
	public String findMemberPw(MemberVO memVo) {
		return dao.findMemberPw(memVo);
	}

	@Override
	public int getMemberPwCount(String userPw) {
		return dao.getMemberPwCount(userPw);
	}

	@Override
	public int deleteMember(String userId) {
		return dao.deleteMember(userId);
	}

	@Override
	public int updateMember(MemberVO memVo) {
		return dao.updateMember(memVo);
	}

	@Override
	public MemberVO getMember(String userId) {
		return dao.getMember(userId);
	}

	@Override
	public List<MemberVO> getAllMember() {
		return dao.getAllMember();
	}






}
