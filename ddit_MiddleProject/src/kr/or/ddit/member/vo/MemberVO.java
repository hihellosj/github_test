package kr.or.ddit.member.vo;


/*
 	DB테이블에 있는 컬럼을 기준으로 데이터를 객체화 할 클래스
 	
 	DB테이블의 '컬럼명'이 이 클래스의 '멤버변수명'이 된다.
 	
 	DB테이블의 컬럼과 클래스의 멤버변수를 매핑하는 역할을 수행한다.
 	
 */

public class MemberVO {
	//소문자로 바꿔서 쓴다.
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_birthday;
	private String user_phone;
	private String user_mail;
	private String admin;
	private String user_gender;
	
	// VO클래스에서 별도의 생성자를 만들 때에는 
	// 기본 생성자도 반드시 같이 만들어 준다.
	public MemberVO() {	}

	public MemberVO(String user_id, String user_pw, String user_name, String user_birthday, String user_phone,
			String user_mail, String admin, String user_gender) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_birthday = user_birthday;
		this.user_phone = user_phone;
		this.user_mail = user_mail;
		this.admin = admin;
		this.user_gender = user_gender;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_birthday() {
		return user_birthday;
	}

	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_mail() {
		return user_mail;
	}

	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	@Override
	public String toString() {
		return "MemberVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_birthday="
				+ user_birthday + ", user_phone=" + user_phone + ", user_mail=" + user_mail + ", admin=" + admin
				+ ", user_gender=" + user_gender + "]";
	}
	
	
}