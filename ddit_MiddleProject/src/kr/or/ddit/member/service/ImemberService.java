package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;

public interface ImemberService {
	
	/**
	 * 회원ID와 패스워드가 저장된 MemberVO객체를 파라미터로 받아서
	 * 해당 회원을 검색하여 반환하는 메서드
	 * 
	 * @param memVo 검색할 회원ID와 패스워드가 저장된 MemberVO객체
	 * @return 검색결과가 저장된 MemberVO객체(검색된 데이터가 없으면 null반환)
	 */
	public MemberVO getMemberLogin(MemberVO memVo);
	
	/**
	 * MemberVO객체에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param memVo DB에 insert할 자료가 저장된 MemberVO객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertMember(MemberVO memVo);
	
	/**
	 * 회원ID를 인수값으로 받아서 해당 회원ID의 개수를 반환하는 메서드
	 * 
	 * @param memId 검색할 회원ID
	 * @return 검색된 회원ID의 개수
	 */
	public int getMemberCount(String userId);
	
	/**
	 * 회원이름과 전화번호가 저장된 MemberVO객체를 파라미터로 받아서 
	 * 해당회원ID를 검색하여 반환
	 * 
	 * @param memVo 검색할 회원이름과 전화번호가 저장된 MemberVO객체
	 * @return
	 */
	public String findMemberId(MemberVO memVo);
	
	/**
	 * 회원아이디과 전화번호가 저장된 MemberVO객체를 파라미터로 받아서 
	 * 해당회원PW를 검색하여 반환
	 * 
	 * @param memVo 검색할 회원아이디와 전화번호가 저장된 MemberVO객체
	 * @return
	 */
	public String findMemberPw(MemberVO memVo);

	/**
	 * 회원PW를 인수값으로 받아서 해당 회원PW의 개수를 반환하는 메서드
	 * 
	 * @param memPw 검색할 회원PS
	 * @return 검색된 회원PW의 개수
	 */
	public int getMemberPwCount(String userPw);
	
	/**
	 * 회원ID를 인수값으로 받아서 해당 회원 정보를 삭제하는 메서드
	 * 
	 * @param memId 삭제할 회원ID
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteMember(String userId);
	
	/**
	 * MemberVO자료를 이용하여 DB에 update하는 메서드
	 * 
	 * @param memVo update할 회원 정보가 저장된 MemberVO객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int updateMember(MemberVO memVo);
	
	/**
	 * 회원ID와 패스워드가 저장된 MemberVO객체를 인수값으로 받아서
	 * 해당 조건에 맞는 회원정보를 검색해서 반환하는 메서드
	 * 
	 * @param memVo 검색할 회원정보가 저장된 MemberVO객체
	 * @return 검색 결과가 저장된 MemberVO객체
	 */
	public MemberVO getMember(String userId);

	/**
	 * DB의 전체 회원 정보를 가져와서 List에 담아서 반환하는 메서드
	 * 
	 * @return MemberVO객체가 저장된 List객체
	 */
	public List<MemberVO> getAllMember();
}
