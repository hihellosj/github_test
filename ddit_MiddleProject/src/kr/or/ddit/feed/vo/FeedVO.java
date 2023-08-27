package kr.or.ddit.feed.vo;

import java.util.List;

public class FeedVO {
	private String fb_no;
	private String fb_content;
	private String fb_date;
	
	private String user_id;
	private String fb_count;
	



	private String mv_no;
	private String mv_name;
	private String mv_genre;
	private String mv_director;
	private String mv_cast;
	
	private String searchFeed="";
	private String mvselect="";
	
	private String myPost="";
	private String allPost="";
	
	
	//************************************************
	private String mvf_no;
	private String mvf_yseat;
	private String mvf_start;
	private String mvf_end;
	private String t_no;
	
	
	
	
	//************************************************
	
	private String r_no;
	
	private String p_no;
	
	
	//************************************************
	
	private String mi_no;
	private String mi_img;
	private String mi_mainimg;
	//************************************************
	private String post_check;
	
	private String countpost;
	
	
	//************************************************
	
	//동기화
	
	private String m_id;
	
	private String m_pst;
	private String m_name;
	private String m_story;
	private String m_time;
	private String m_director;
	private String m_age;
	private String m_cast;
	private String m_translation;
	private String m_opn_date;
	private String m_showing;
	private String m_type;
	private String m_trailer_url;
	
	
	 //**********************************************

	
		/* private String p_no; */
	private String p_ticket_price;
	private String p_date;
	private String p_method;
	private String p_state;
	
	
	
	
	
	
	 //**********************************************
	
	
	

	
	public String getCountpost() {
		return countpost;
	}

	public String getP_ticket_price() {
		return p_ticket_price;
	}

	public void setP_ticket_price(String p_ticket_price) {
		this.p_ticket_price = p_ticket_price;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public String getP_method() {
		return p_method;
	}

	public void setP_method(String p_method) {
		this.p_method = p_method;
	}

	public String getP_state() {
		return p_state;
	}

	public void setP_state(String p_state) {
		this.p_state = p_state;
	}

	public String getM_pst() {
		return m_pst;
	}

	public void setM_pst(String m_pst) {
		this.m_pst = m_pst;
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

	public String getM_time() {
		return m_time;
	}

	public void setM_time(String m_time) {
		this.m_time = m_time;
	}

	public String getM_director() {
		return m_director;
	}

	public void setM_director(String m_director) {
		this.m_director = m_director;
	}

	public String getM_age() {
		return m_age;
	}

	public void setM_age(String m_age) {
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

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getMi_mainimg() {
		return mi_mainimg;
	}

	public void setMi_mainimg(String mi_mainimg) {
		this.mi_mainimg = mi_mainimg;
	}

	public FeedVO(String fb_no, String fb_content, String fb_date, String user_id, String fb_count, String mv_no,
			String mv_name, String mv_genre, String mv_director, String mv_cast, String searchFeed, String mvselect,
			String myPost, String allPost, String mvf_no, String mvf_yseat, String mvf_start, String mvf_end,
			String t_no, String r_no, String p_no, String mi_no, String mi_img, String post_check, String countpost,
			List<ThumsVO> thumsList) {
		super();
		this.fb_no = fb_no;
		this.fb_content = fb_content;
		this.fb_date = fb_date;
		this.user_id = user_id;
		this.fb_count = fb_count;
		this.mv_no = mv_no;
		this.mv_name = mv_name;
		this.mv_genre = mv_genre;
		this.mv_director = mv_director;
		this.mv_cast = mv_cast;
		this.searchFeed = searchFeed;
		this.mvselect = mvselect;
		this.myPost = myPost;
		this.allPost = allPost;
		this.mvf_no = mvf_no;
		this.mvf_yseat = mvf_yseat;
		this.mvf_start = mvf_start;
		this.mvf_end = mvf_end;
		this.t_no = t_no;
		this.r_no = r_no;
		this.p_no = p_no;
		this.mi_no = mi_no;
		this.mi_img = mi_img;
		this.post_check = post_check;
		this.countpost = countpost;
		this.thumsList = thumsList;
	}
	
	
	

	@Override
	public String toString() {
		return "FeedVO [fb_no=" + fb_no + ", fb_content=" + fb_content + ", fb_date=" + fb_date + ", user_id=" + user_id
				+ ", fb_count=" + fb_count + ", mv_no=" + mv_no + ", mv_name=" + mv_name + ", mv_genre=" + mv_genre
				+ ", mv_director=" + mv_director + ", mv_cast=" + mv_cast + ", searchFeed=" + searchFeed + ", mvselect="
				+ mvselect + ", myPost=" + myPost + ", allPost=" + allPost + ", mvf_no=" + mvf_no + ", mvf_yseat="
				+ mvf_yseat + ", mvf_start=" + mvf_start + ", mvf_end=" + mvf_end + ", t_no=" + t_no + ", r_no=" + r_no
				+ ", p_no=" + p_no + ", mi_no=" + mi_no + ", mi_img=" + mi_img + ", post_check=" + post_check
				+ ", countpost=" + countpost + ", thumsList=" + thumsList + "]";
	}

	public void setCountpost(String countpost) {
		this.countpost = countpost;
	}

	public String getPost_check() {
		return post_check;
	}

	public void setPost_check(String post_check) {
		this.post_check = post_check;
	}

	public String getMvf_no() {
		return mvf_no;
	}

	public void setMvf_no(String mvf_no) {
		this.mvf_no = mvf_no;
	}

	public String getMvf_yseat() {
		return mvf_yseat;
	}

	public void setMvf_yseat(String mvf_yseat) {
		this.mvf_yseat = mvf_yseat;
	}

	public String getMvf_start() {
		return mvf_start;
	}

	public void setMvf_start(String mvf_start) {
		this.mvf_start = mvf_start;
	}

	public String getMvf_end() {
		return mvf_end;
	}

	public void setMvf_end(String mvf_end) {
		this.mvf_end = mvf_end;
	}

	public String getT_no() {
		return t_no;
	}

	public void setT_no(String t_no) {
		this.t_no = t_no;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getMi_no() {
		return mi_no;
	}

	public void setMi_no(String mi_no) {
		this.mi_no = mi_no;
	}

	public String getMi_img() {
		return mi_img;
	}

	public void setMi_img(String mi_img) {
		this.mi_img = mi_img;
	}



	
	
	public String getSearchFeed() {
		return searchFeed;
	}

	public String getAllPost() {
		return allPost;
	}
	
	public void setAllPost(String allPost) {
		this.allPost = allPost;
	}


	public String getMyPost() {
		return myPost;
	}





	public void setMyPost(String myPost) {
		this.myPost = myPost;
	}



	public void setSearchFeed(String searchFeed) {
		this.searchFeed = searchFeed;
	}




	public String getMvselect() {
		return mvselect;
	}



	public void setMvselect(String mvselect) {
		this.mvselect = mvselect;
	}



	private List<ThumsVO> thumsList;
	
	
	public FeedVO() {
		super();
	}
	


	public String getMv_name() {
		return mv_name;
	}



	public void setMv_name(String mv_name) {
		this.mv_name = mv_name;
	}






	public String getMv_genre() {
		return mv_genre;
	}







	public void setMv_genre(String mv_genre) {
		this.mv_genre = mv_genre;
	}








	public String getMv_director() {
		return mv_director;
	}




	public void setMv_director(String mv_director) {
		this.mv_director = mv_director;
	}





	public String getMv_cast() {
		return mv_cast;
	}



	public void setMv_cast(String mv_cast) {
		this.mv_cast = mv_cast;
	}




	




































	public String getMv_no() {
		return mv_no;
	}


	public void setMv_no(String mv_no) {
		this.mv_no = mv_no;
	}


	public String getFb_count() {
		return fb_count;
	}



	public void setFb_count(String fb_count) {
		this.fb_count = fb_count;
	}



	public String getFb_no() {
		return fb_no;
	}
	public void setFb_no(String fb_no) {
		this.fb_no = fb_no;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public String getFb_date() {
		return fb_date;
	}
	public void setFb_date(String fb_date) {
		this.fb_date = fb_date;
	}
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	





	





































	public List<ThumsVO> getThumsList() {
		return thumsList;
	}



	public void setThumsList(List<ThumsVO> thumsList) {
		this.thumsList = thumsList;
	}
	
	
	
	

}
