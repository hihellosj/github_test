package kr.or.ddit.feed.vo;

public class ThumsVO {
	
	private String fb_no;
	private String user_id;
	private String thums;
	public ThumsVO() {
		super();
	}
	public ThumsVO(String fb_no, String user_id, String thums) {
		super();
		this.fb_no = fb_no;
		this.user_id = user_id;
		this.thums = thums;
	}
	public String getFb_no() {
		return fb_no;
	}
	public void setFb_no(String fb_no) {
		this.fb_no = fb_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getThums() {
		return thums;
	}
	public void setThums(String thums) {
		this.thums = thums;
	}
	@Override
	public String toString() {
		return "ThumsVO [fb_no=" + fb_no + ", user_id=" + user_id + ", thums=" + thums + "]";
	}
	
	

}
