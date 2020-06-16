package pack.lcg.model;

import java.util.List;

public interface ReviewInter {


	ReviewDto selectReviewGogek(String gogek_id);
	List<ReviewDto> selectReview(String gogek_id);

	// reviewInter

		int selectDeleteReview(String pro_name);



}
