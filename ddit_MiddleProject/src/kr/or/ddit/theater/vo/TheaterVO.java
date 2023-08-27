package kr.or.ddit.theater.vo;

public class TheaterVO {

	private String t_no;
	private String t_room_name;
	private String t_state;
	private int t_seat_num;
	private String t_mid;

	public TheaterVO(String t_no, String t_room_name, String t_state, int t_seat_num, String t_mid) {
		super();
		this.t_no = t_no;
		this.t_room_name = t_room_name;
		this.t_state = t_state;
		this.t_seat_num = t_seat_num;
		this.t_mid = t_mid;
	}

	@Override
	public String toString() {
		return "TheaterVO [t_no=" + t_no + ", t_room_name=" + t_room_name + ", t_state=" + t_state + ", t_seat_num="
				+ t_seat_num + ", t_mid=" + t_mid + "]";
	}

	public String getT_no() {
		return t_no;
	}

	public void setT_no(String t_no) {
		this.t_no = t_no;
	}

	public String getT_room_name() {
		return t_room_name;
	}

	public void setT_room_name(String t_room_name) {
		this.t_room_name = t_room_name;
	}

	public String getT_state() {
		return t_state;
	}

	public void setT_state(String t_state) {
		this.t_state = t_state;
	}

	public int getT_seat_num() {
		return t_seat_num;
	}

	public void setT_seat_num(int t_seat_num) {
		this.t_seat_num = t_seat_num;
	}

	public String getT_mid() {
		return t_mid;
	}

	public void setT_mid(String t_mid) {
		this.t_mid = t_mid;
	}

	public TheaterVO() {
	}

}
