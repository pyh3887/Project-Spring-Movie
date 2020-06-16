package pack.ks.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import pack.ks.controller.GenreBean;
import pack.ks.controller.PickBean;
import pack.ks.controller.ReviewBean;
import pack.ks.controller.StarBean;

@Service("infoImpl")
public class InfoImpl implements InfoInter{
	@Autowired
	private InfoAnnoInter inter;
	
	@Override
	public List<InfoDto> selectMovieInfo(String name) {
		return inter.selectMovieInfo(name);
	}
	
	@Override
	public List<InfoDto> selectTvInfo(String name) {
		return inter.selectTvInfo(name);
	}
	
	@Override
	public void updateMoCnt(String name) {
		inter.updateMoCnt(name);
	}
	
	@Override
	public void updateTvCnt(String name) {
		inter.updateTvCnt(name);
	}
	
	@Override
	public void insertReview(ReviewBean bean) {
		inter.insertReview(bean);
	}
	
	@Override
	public List<ReviewDto> selectReview(String name) {
		return inter.selectReview(name);
	}
	
	@Override
	public void updateReview(String review_no) {
		inter.updateReview(review_no);
	}
	
	@Override
	public void updateReport(String review_no) {
		inter.updateReport(review_no);
	}
	
	@Override
	public void insertPick(PickBean bean) {
		inter.insertPick(bean);
	}
	
	@Override
	public void deletePick(PickBean bean) {
		inter.deletePick(bean);
	}
	
	@Override
	public List<PickDto> selectPickCheck(PickBean bean) {
		return inter.selectPickCheck(bean);
	}
	
	@Override
	public String selectActor(String name) {
		return inter.selectActor(name);
	}
	
	@Override
	public void deleteStar(StarBean bean) {
		inter.deleteStar(bean);
	}
	
	@Override
	public void insertStar(StarBean bean) {
		inter.insertStar(bean);
	}
	
	@Override
	public double selectStar(StarBean bean) {
		return inter.selectStar(bean);
	}
	
	@Override
	public void updateStar1(StarBean bean) {
		inter.updateStar1(bean);
	}
	
	@Override
	public void updateStar2(StarBean bean) {
		inter.updateStar2(bean);
	}
	
	@Override
	public String point1(String name) {
		System.out.println("얍얍" + inter.point1(name));
		return inter.point1(name);
	}
	@Override
	public String point2(String name) {
		return inter.point2(name);
	}
	@Override
	public String point3(String name) {
		return inter.point3(name);
	}
	@Override
	public String point4(String name) {
		return inter.point4(name);
	}
	@Override
	public String point5(String name) {
		return inter.point5(name);
	}
	@Override
	public List<InfoDto> moselgenre(GenreBean bean) {
		return inter.moselgenre(bean);
	}
	@Override
	public List<InfoDto> tvselgenre(GenreBean bean) {
		return inter.tvselgenre(bean);
	}
	@Override
	public List<InfoDto> directorMovie(String director) {
		return inter.directorMovie(director);
	}
	@Override
	public List<InfoDto> directorTv(String director) {
		return inter.directorTv(director);
	}
	@Override
	public List<InfoDto> actorMovieInfo(String actor) {
		return inter.actorMovieInfo(actor);
	}
	@Override
	public List<InfoDto> actorTvInfo(String actor) {
		return inter.actorTvInfo(actor);
	}
	@Override
	public List<GogekDto> gogekInfo(String gogek_id) {
		return inter.gogekInfo(gogek_id);
	}
	@Override
	public String gmStar(String gogek_id) {
		return inter.gmStar(gogek_id);
	}
	@Override
	public String gtStar(String gogek_id) {
		return inter.gtStar(gogek_id);
	}
	@Override
	public String gmPick(String gogek_id) {
		return inter.gmPick(gogek_id);
	}
	@Override
	public String gtPick(String gogek_id) {
		return inter.gtPick(gogek_id);
	}
	@Override
	public List<InfoDto> gogekMovie(String gogek_id) {
		return inter.gogekMovie(gogek_id);
	}
	@Override
	public List<InfoDto> gogekTv(String gogek_id) {
		return inter.gogekTv(gogek_id);
	}
	@Override
	public List<InfoDto> gogekMop(String gogek_id) {
		return inter.gogekMop(gogek_id);
	}
	@Override
	public List<InfoDto> gogekTvp(String gogek_id) {
		return inter.gogekTvp(gogek_id);
	}
}
