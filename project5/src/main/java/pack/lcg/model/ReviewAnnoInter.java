package pack.lcg.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

public interface ReviewAnnoInter {

	// 리뷰 목록 볼 해당 아이디 검사
	@Select("select gogek_id from team.gogek where gogek_id = #{gogek_id}")
	public ReviewDto selectReviewGogek(String gogek_id);
	
	// 해당 고객 리뷰 목록
	@Select("SELECT review_no, review.pro_name, review_title, review.content, gogek_id,review_date FROM review LEFT JOIN tv ON review.pro_name = tv.`name` LEFT JOIN movie ON review.pro_name = movie.`name` WHERE gogek_id = #{gogek_id} order by review_no desc")
	public List<ReviewDto> selectReview(String gogek_id);
	

	// 지울 리뷰
	@Delete("DELETE FROM review WHERE pro_name = #{pro_name}")
	public int selectDeleteReview(String pro_name);
}
