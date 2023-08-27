package kr.or.ddit.rseat.vo;

public class ReserveVO {

	private String RESERVATION_ID;
	private String MOVIE_ID;
	private String THEATER_ID;
	private String SHOWTIME;
	private String SEATS;
	private int ADULT_COUNT;
	private int TEEN_COUNT;
	private int KID_COUNT;
	private int DISCOUNT_COUNT;
	private int TOTAL_PRICE;
	private String RESERVATION_DATE;
	
	private String user_id;
	private String m_id;
	private String t_no;
	private String m_name;
	
	private String randomNo="";
	

	
	
	
	public String getRandomNo() {
		return randomNo;
	}



	public void setRandomNo(String randomNo) {
		this.randomNo = randomNo;
	}



	public String getM_name() {
		return m_name;
	}



	public void setM_name(String m_name) {
		this.m_name = m_name;
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



	public ReserveVO() {}
		
	

	public ReserveVO(String rESERVATION_ID, String mOVIE_ID, String tHEATER_ID, String sHOWTIME, String sEATS,
			int aDULT_COUNT, int tEEN_COUNT, int kID_COUNT, int dISCOUNT_COUNT, int tOTAL_PRICE,
			String rESERVATION_DATE) {
		super();
		RESERVATION_ID = rESERVATION_ID;
		MOVIE_ID = mOVIE_ID;
		THEATER_ID = tHEATER_ID;
		SHOWTIME = sHOWTIME;
		SEATS = sEATS;
		ADULT_COUNT = aDULT_COUNT;
		TEEN_COUNT = tEEN_COUNT;
		KID_COUNT = kID_COUNT;
		DISCOUNT_COUNT = dISCOUNT_COUNT;
		TOTAL_PRICE = tOTAL_PRICE;
		RESERVATION_DATE = rESERVATION_DATE;
	}
	
	@Override
	public String toString() {
		return "ReserveVO [RESERVATION_ID=" + RESERVATION_ID + ", MOVIE_ID=" + MOVIE_ID + ", THEATER_ID=" + THEATER_ID
				+ ", SHOWTIME=" + SHOWTIME + ", SEATS=" + SEATS + ", ADULT_COUNT=" + ADULT_COUNT + ", TEEN_COUNT="
				+ TEEN_COUNT + ", KID_COUNT=" + KID_COUNT + ", DISCOUNT_COUNT=" + DISCOUNT_COUNT + ", TOTAL_PRICE="
				+ TOTAL_PRICE + ", RESERVATION_DATE=" + RESERVATION_DATE + "]";
	}
	public String getRESERVATION_ID() {
		return RESERVATION_ID;
	}
	public void setRESERVATION_ID(String rESERVATION_ID) {
		RESERVATION_ID = rESERVATION_ID;
	}
	public String getMOVIE_ID() {
		return MOVIE_ID;
	}
	public void setMOVIE_ID(String mOVIE_ID) {
		MOVIE_ID = mOVIE_ID;
	}
	public String getTHEATER_ID() {
		return THEATER_ID;
	}
	public void setTHEATER_ID(String tHEATER_ID) {
		THEATER_ID = tHEATER_ID;
	}
	public String getSHOWTIME() {
		return SHOWTIME;
	}
	public void setSHOWTIME(String sHOWTIME) {
		SHOWTIME = sHOWTIME;
	}
	public String getSEATS() {
		return SEATS;
	}
	public void setSEATS(String sEATS) {
		SEATS = sEATS;
	}
	public int getADULT_COUNT() {
		return ADULT_COUNT;
	}
	public void setADULT_COUNT(int aDULT_COUNT) {
		ADULT_COUNT = aDULT_COUNT;
	}
	public int getTEEN_COUNT() {
		return TEEN_COUNT;
	}
	public void setTEEN_COUNT(int tEEN_COUNT) {
		TEEN_COUNT = tEEN_COUNT;
	}
	public int getKID_COUNT() {
		return KID_COUNT;
	}
	public void setKID_COUNT(int kID_COUNT) {
		KID_COUNT = kID_COUNT;
	}
	public int getDISCOUNT_COUNT() {
		return DISCOUNT_COUNT;
	}
	public void setDISCOUNT_COUNT(int dISCOUNT_COUNT) {
		DISCOUNT_COUNT = dISCOUNT_COUNT;
	}
	public int getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}
	public void setTOTAL_PRICE(int tOTAL_PRICE) {
		TOTAL_PRICE = tOTAL_PRICE;
	}
	public String getRESERVATION_DATE() {
		return RESERVATION_DATE;
	}
	public void setRESERVATION_DATE(String rESERVATION_DATE) {
		RESERVATION_DATE = rESERVATION_DATE;
	}
	
	
	
	
	
	
	

}
