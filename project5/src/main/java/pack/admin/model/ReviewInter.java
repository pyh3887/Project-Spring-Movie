package
pack.admin.model;

import java.util.List;

import pack.admin.controller.ReviewSearch;

public interface ReviewInter {

	
	List<ReviewDto> reviewlist(int startRow);
	 List<ReviewDto> reviewlist2(int startRow);
	int reviewCount();
	 List<ReviewDto> reviewsearchlist(ReviewSearch search); 
	 int reviewsearchCount(ReviewSearch search) ;
	 boolean deletereviewData(String no);
	 List<ReviewDto> recommenddata(int startRow);
	 List<ReviewDto> reportdata(int startRow);
}
