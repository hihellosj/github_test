package kr.or.ddit.board.onetoone.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.onetoone.vo.QnAboardVO;

public interface IQnAboardDao {
	
		//글쓰기 - 실행된 행의갯수를 리턴 - 
		public int insertBoard(QnAboardVO vo);
		
		//글삭제
		public int deleteBoard(int num);
		
		//글수정
		
		
		//조회수 증가 
		
		//리스트 - 검색 포함 
		
		//댓글쓰기
		
		//댓글 삭제
		
		//댓글 수정
		
		//댓글 리스트 
			
		//페이지별 정보구하기 - 페이지 처리 
		
		//전체글 갯수 구하기
		
		public List<QnAboardVO> getAllboard();
	
		public QnAboardVO getBoard(int csNo);

		public int insertAnswer(QnAboardVO vo);

		public int updateAnswer(QnAboardVO vo);

		/* public QnAboardVO selectBoard( QnAboardVO vo); */
		
		public List<QnAboardVO> selectBoard(QnAboardVO vo);
}
