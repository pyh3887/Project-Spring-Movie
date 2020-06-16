package pack.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.admin.controller.ImageBean;
import pack.admin.controller.MovieBean;
import pack.admin.controller.moviePartBean;

@Repository
public class MovieImpl implements MovieInter {
	@Autowired
	private AdminAnoInter adminAnoInter;

	@Override
	public List<MovieDto> selectMovie(int startRow) {

		return adminAnoInter.selectMovie(startRow);
	}
	@Override
	public MovieDto partdata(String name) {
		return adminAnoInter.updatePart(name);
	}
	
	@Override
	public List<MovieDto> moviePart(moviePartBean bean) {
		
		return adminAnoInter.moviePart(bean);

	}

	@Override
	public boolean insertMovieData(MovieBean bean) {
		return adminAnoInter.insertMovieData(bean);
	}
	
	
	@Override
	public boolean insertMovieActor(MovieBean bean) {
		return adminAnoInter.insertMovieActor(bean);
	}
	
	@Override
	public boolean updateMovieData(MovieBean bean) {
		return adminAnoInter.updateMovieData(bean);
	}
	
	@Override
	public boolean updateMovieActor(MovieBean bean) {
		return adminAnoInter.updateActorData(bean);
	}
	@Override
	public boolean deleteMovieData(String no) {
		return adminAnoInter.deleteMovieData(no);
	}
	
	@Override
	public boolean deleteActorData(String name) {
		return adminAnoInter.deleteActorData(name);
	}
	
	@Override
	public int getCount() {
		return adminAnoInter.getCount();
	}
	@Override
	public int getmovieCount(moviePartBean bean) {
		return adminAnoInter.getmovieCount(bean);
	}

}
