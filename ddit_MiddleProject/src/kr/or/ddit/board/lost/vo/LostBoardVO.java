package kr.or.ddit.board.lost.vo;

public class LostBoardVO {
	
	private int lb_no;				// 분실물게시판 번호
	private String lb_title;		// 분실물게시판 제목
	private String lb_content;		// 분실물게시판 내용
	private String lb_date;			// 분실물게시판 날짜
	private String lb_state;		// 분실물게시판 상태(OK-등록, Null-미등록)
	private String lb_answer;		// 분실물게시판 답변
	private String lb_ans_date;		// 분실물게시판 날짜
	private String user_id;			// user명
	
	public LostBoardVO() {	}

	public LostBoardVO(int lb_no, String lb_title, String lb_content, String lb_date, String lb_state, String lb_answer,
			String lb_ans_date, String user_id) {
		super();
		this.lb_no = lb_no;
		this.lb_title = lb_title;
		this.lb_content = lb_content;
		this.lb_date = lb_date;
		this.lb_state = lb_state;
		this.lb_answer = lb_answer;
		this.lb_ans_date = lb_ans_date;
		this.user_id = user_id;
	}

	public int getLb_no() {
		return lb_no;
	}

	public void setLb_no(int lb_no) {
		this.lb_no = lb_no;
	}

	public String getLb_title() {
		return lb_title;
	}

	public void setLb_title(String lb_title) {
		this.lb_title = lb_title;
	}

	public String getLb_content() {
		return lb_content;
	}

	public void setLb_content(String lb_content) {
		this.lb_content = lb_content;
	}

	public String getLb_date() {
		return lb_date;
	}

	public void setLb_date(String lb_date) {
		this.lb_date = lb_date;
	}

	public String getLb_state() {
		return lb_state;
	}

	public void setLb_state(String lb_state) {
		this.lb_state = lb_state;
	}

	public String getLb_answer() {
		return lb_answer;
	}

	public void setLb_answer(String lb_answer) {
		this.lb_answer = lb_answer;
	}

	public String getLb_ans_date() {
		return lb_ans_date;
	}

	public void setLb_ans_date(String lb_ans_date) {
		this.lb_ans_date = lb_ans_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "LostBoardVO [lb_no=" + lb_no + ", lb_title=" + lb_title + ", lb_content=" + lb_content + ", lb_date="
				+ lb_date + ", lb_state=" + lb_state + ", lb_answer=" + lb_answer + ", lb_ans_date=" + lb_ans_date
				+ ", user_id=" + user_id + "]";
	}

	
	
	
}
