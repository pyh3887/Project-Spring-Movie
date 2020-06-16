package pack.ks.model;

import java.util.List;

import pack.ks.controller.GenreBean;
import pack.ks.controller.PickBean;
import pack.ks.controller.ReviewBean;
import pack.ks.controller.StarBean;

public interface InfoInter {
	List<InfoDto> selectMovieInfo(String name);
	List<InfoDto> selectTvInfo(String name);
	void updateMoCnt(String name);
	void updateTvCnt(String name);
	void insertReview(ReviewBean bean);
	List<ReviewDto> selectReview(String name);
	void updateReview(String review_no);
	void updateReport(String review_no);
	void insertPick(PickBean bean);
	void deletePick(PickBean bean);
	List<PickDto> selectPickCheck(PickBean bean);
	String selectActor(String name);
	void deleteStar(StarBean bean);
	void insertStar(StarBean bean);
	double selectStar(StarBean bean);
	void updateStar1(StarBean bean);
	void updateStar2(StarBean bean);
	String point1(String name);
	String point2(String name);
	String point3(String name);
	String point4(String name);
	String point5(String name);
	List<InfoDto> moselgenre(GenreBean bean);
	List<InfoDto> tvselgenre(GenreBean bean);
	List<InfoDto> directorMovie(String director);
	List<InfoDto> directorTv(String director);
	List<InfoDto> actorMovieInfo(String actor);
	List<InfoDto> actorTvInfo(String actor);
	List<GogekDto> gogekInfo(String gogek_id);
	String gmStar(String gogek_id);
	String gtStar(String gogek_id);
	String gmPick(String gogek_id);
	String gtPick(String gogek_id);
	List<InfoDto> gogekMovie(String gogek_id);
	List<InfoDto> gogekTv(String gogek_id);
	List<InfoDto> gogekMop(String gogek_id);
	List<InfoDto> gogekTvp(String gogek_id);
}
