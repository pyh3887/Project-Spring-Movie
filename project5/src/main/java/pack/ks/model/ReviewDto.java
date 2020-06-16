package pack.ks.model;

public class ReviewDto {
	private String review_no, gogek_id, pro_name, content, review_cnt, review_title, review_report, gogek_image, review_date;
	
	public String getReview_date() {
		return review_date;
	}
	
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	public String getGogek_image() {
		return gogek_image;
	}
	
	public void setGogek_image(String gogek_image) {
		this.gogek_image = gogek_image;
	}
	
	public String getReview_no() {
		return review_no;
	}
	
	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}
	
	public String getGogek_id() {
		return gogek_id;
	}

	public void setGogek_id(String gogek_id) {
		this.gogek_id = gogek_id;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReview_cnt() {
		return review_cnt;
	}

	public void setReview_cnt(String review_cnt) {
		this.review_cnt = review_cnt;
	}
	
	public String getReview_title() {
		return review_title;
	}
	
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	
	public String getReview_report() {
		return review_report;
	}
	
	public void setReview_report(String review_report) {
		this.review_report = review_report;
	}
}
