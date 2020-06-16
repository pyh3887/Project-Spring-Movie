package pack.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.admin.controller.ReviewSearch;

@Repository
public class AdminReviewImpl implements ReviewInter{
	@Autowired
	private AdminAnoInter adminAnoInter;

	
	
	// movie
	@Override
	public List<ReviewDto> reviewlist(int startRow) {
		return adminAnoInter.reviewlist(startRow);
	}
	
	//tv
	@Override
	public List<ReviewDto> reviewlist2(int startRow) {
		return adminAnoInter.reviewlist2(startRow);
	}
	
	@Override
	public int reviewCount() {
		return adminAnoInter.reviewCount();
	}
	
	@Override
	public List<ReviewDto> reviewsearchlist(ReviewSearch search) {
		return adminAnoInter.reviewsearchlist(search);
	}
	
	
	@Override
	public int reviewsearchCount(ReviewSearch search) {
		return adminAnoInter.reviewsearchCount(search);
	}
	
	@Override
	public boolean deletereviewData(String no) {
		return adminAnoInter.deletereviewData(no);
	}
	
	
	@Override
	public List<ReviewDto> recommenddata(int startRow) {
		return adminAnoInter.recommendlist(startRow);
	}
	
	@Override
	public List<ReviewDto> reportdata(int startRow) {
		return adminAnoInter.reportlist(startRow);
	}
	
	
	
}
