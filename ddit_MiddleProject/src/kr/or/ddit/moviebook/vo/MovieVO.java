package kr.or.ddit.moviebook.vo;

public class MovieVO {

	private String m_id;
	private String m_name;
	private String m_story;
	private int m_time;
	private String m_director;
	private int m_age;
	private String m_cast;
	private String m_translation;
	private String m_opn_date;
	private String m_showing;
	private String m_type;
	private String m_trailer_url;
	private String m_pst;

	public MovieVO(String m_id, String m_name, String m_story, int m_time, String m_director, int m_age, String m_cast,
			String m_translation, String m_opn_date, String m_showing, String m_type, String m_trailer_url,
			String m_pst) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_story = m_story;
		this.m_time = m_time;
		this.m_director = m_director;
		this.m_age = m_age;
		this.m_cast = m_cast;
		this.m_translation = m_translation;
		this.m_opn_date = m_opn_date;
		this.m_showing = m_showing;
		this.m_type = m_type;
		this.m_trailer_url = m_trailer_url;
		this.m_pst = m_pst;
	}

	@Override
	public String toString() {
		return "MovieVO [m_id=" + m_id + ", m_name=" + m_name + ", m_story=" + m_story + ", m_time=" + m_time
				+ ", m_director=" + m_director + ", m_age=" + m_age + ", m_cast=" + m_cast + ", m_translation="
				+ m_translation + ", m_opn_date=" + m_opn_date + ", m_showing=" + m_showing + ", m_type=" + m_type
				+ ", m_trailer_url=" + m_trailer_url + ", m_pst=" + m_pst + "]";
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_story() {
		return m_story;
	}

	public void setM_story(String m_story) {
		this.m_story = m_story;
	}

	public int getM_time() {
		return m_time;
	}

	public void setM_time(int m_time) {
		this.m_time = m_time;
	}

	public String getM_director() {
		return m_director;
	}

	public void setM_director(String m_director) {
		this.m_director = m_director;
	}

	public int getM_age() {
		return m_age;
	}

	public void setM_age(int m_age) {
		this.m_age = m_age;
	}

	public String getM_cast() {
		return m_cast;
	}

	public void setM_cast(String m_cast) {
		this.m_cast = m_cast;
	}

	public String getM_translation() {
		return m_translation;
	}

	public void setM_translation(String m_translation) {
		this.m_translation = m_translation;
	}

	public String getM_opn_date() {
		return m_opn_date;
	}

	public void setM_opn_date(String m_opn_date) {
		this.m_opn_date = m_opn_date;
	}

	public String getM_showing() {
		return m_showing;
	}

	public void setM_showing(String m_showing) {
		this.m_showing = m_showing;
	}

	public String getM_type() {
		return m_type;
	}

	public void setM_type(String m_type) {
		this.m_type = m_type;
	}

	public String getM_trailer_url() {
		return m_trailer_url;
	}

	public void setM_trailer_url(String m_trailer_url) {
		this.m_trailer_url = m_trailer_url;
	}

	public String getM_pst() {
		return m_pst;
	}

	public void setM_pst(String m_pst) {
		this.m_pst = m_pst;
	}

	public MovieVO() {
	}

}
