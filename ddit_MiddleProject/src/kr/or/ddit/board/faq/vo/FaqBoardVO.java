package kr.or.ddit.board.faq.vo;

public class FaqBoardVO {
	private int fb_no;
	private String fb_title;
	private String fb_content;
	private String user_id;
	private String fb_ctg;
	
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getFb_title() {
		return fb_title;
	}
	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFb_ctg() {
		return fb_ctg;
	}
	public void setFb_ctg(String fb_ctg) {
		this.fb_ctg = fb_ctg;
	}
	
}