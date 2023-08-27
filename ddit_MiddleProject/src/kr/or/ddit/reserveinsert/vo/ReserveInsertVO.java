package kr.or.ddit.reserveinsert.vo;

public class ReserveInsertVO {
	private String user_id;
	private String m_id;
	private String t_no;
	private String showtime;
	private String seats;
	private int adult_count;
	private int teen_count;
	private int kid_count;
	private int discount_count;
	private int total_price;
	private String reservation_date;
	
	
	
	
	
	public ReserveInsertVO() {}
		
	public ReserveInsertVO(String user_id, String m_id, String t_no, String showtime, String seats, int adult_count,
			int teen_count, int kid_count, int discount_count, int total_price, String reservation_date) {
		super();
		this.user_id = user_id;
		this.m_id = m_id;
		this.t_no = t_no;
		this.showtime = showtime;
		this.seats = seats;
		this.adult_count = adult_count;
		this.teen_count = teen_count;
		this.kid_count = kid_count;
		this.discount_count = discount_count;
		this.total_price = total_price;
		this.reservation_date = reservation_date;
	}
	@Override
	public String toString() {
		return "ReserveInsertVO [user_id=" + user_id + ", m_id=" + m_id + ", t_no=" + t_no + ", showtime=" + showtime
				+ ", seats=" + seats + ", adult_count=" + adult_count + ", teen_count=" + teen_count + ", kid_count="
				+ kid_count + ", discount_count=" + discount_count + ", total_price=" + total_price
				+ ", reservation_date=" + reservation_date + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public String getSeats() {
		return seats;
	}
	public void setSeats(String seats) {
		this.seats = seats;
	}
	public int getAdult_count() {
		return adult_count;
	}
	public void setAdult_count(int adult_count) {
		this.adult_count = adult_count;
	}
	public int getTeen_count() {
		return teen_count;
	}
	public void setTeen_count(int teen_count) {
		this.teen_count = teen_count;
	}
	public int getKid_count() {
		return kid_count;
	}
	public void setKid_count(int kid_count) {
		this.kid_count = kid_count;
	}
	public int getDiscount_count() {
		return discount_count;
	}
	public void setDiscount_count(int discount_count) {
		this.discount_count = discount_count;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}
	
	
	
	
	
	
	

}
