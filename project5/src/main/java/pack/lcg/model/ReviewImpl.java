package pack.lcg.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewImpl implements ReviewInter {
	
	@Autowired
	private ReviewAnnoInter reviewAnnoInter;
	
		// 해당 리뷰 볼 고객 정보 읽기
		@Override
		public ReviewDto selectReviewGogek(String gogek_id) {
			// TODO Auto-generated method stub
			return reviewAnnoInter.selectReviewGogek(gogek_id);
		}
		
		// 읽은 고객의 리뷰 목록 출력
		@Override
		public List<ReviewDto> selectReview(String gogek_id) {
			return reviewAnnoInter.selectReview(gogek_id);
		}
		
		// 삭제할 리뷰
		@Override
		public int selectDeleteReview(String pro_name) {
		// TODO Auto-generated method stub
		return reviewAnnoInter.selectDeleteReview(pro_name);
				}


		
}
