package kr.or.ddit.board.onetoone.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.onetoone.vo.QnAboardVO;

public interface IQnAboardService {
	//글쓰기 - 실행된 행의갯수를 리턴 - 
	public int insertBoard(QnAboardVO vo);
	
	//글삭제
	public int deleteBoard(int csNo);
	
	//글수정
	
	
	//조회수 증가 
	
	//리스트 - 검색 포함 
	
	
	//댓글 삭제
	
		
	
	//전체글 갯수 구하기

	public List<QnAboardVO> getAllboard();

	public QnAboardVO getBoard(int csNo);

	public int insertAnswer(QnAboardVO vo);

	public int updateAnswer(QnAboardVO vo);

	/* public QnAboardVO selectBoard( QnAboardVO vo); */
	
	public List<QnAboardVO> selectBoard(QnAboardVO vo);

	

}
