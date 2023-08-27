package kr.or.ddit.board.lost.service;

import java.util.List;

import kr.or.ddit.board.lost.vo.LostBoardVO;


public interface ILostBoardService {
	/**
	 * LostBoardVO객체에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param lBoardVO DB에 insert할 자료가 저장된 LostBoardVO객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int insertLostboard(LostBoardVO lBoardVO);
	
	/**
	 * 회원ID를 인수값으로 받아 해당 List를 반환
	 * 
	 * @param userId 검색할 회원 ID
	 * @return 검색된 게시판List
	 */
	public List<LostBoardVO> getBoardList(String userId);

	/**
	 * 게시판번호를 인수값으로 받아서 해당 게시판정보를 삭제하는 메서드
	 * @param lb_no 삭제할 게시판번호
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int deleteBoard(String lb_no);
	
	/**
	 * LostBoardVO자료를 이용하여 DB에 update하는 메서드 
	 * @param lBoardVO update할 회원 정보가 저장된 LostBoardVO객체
	 * @return 작업 성공 : 1, 작업 실패 : 0
	 */
	public int updateBoard(LostBoardVO lBoardVO);
	
	/**
	 * 게시판 번호를 인수값으로 받아 게시판정보를 받아옴
	 * @param lb_no 검색할 게시판번호
	 * @return 검색된 게시판정보
	 */
	public LostBoardVO getBoard(int lb_no);

	

}
