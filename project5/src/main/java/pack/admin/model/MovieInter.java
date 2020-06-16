package pack.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import pack.admin.controller.MovieBean;
import pack.admin.controller.TvBean;
import pack.admin.controller.moviePartBean;

public interface MovieInter {
	
	
	List<MovieDto> selectMovie(int startRow);
	
	boolean insertMovieData(MovieBean bean);

	boolean insertMovieActor(MovieBean bean);
	
	int getCount();
	
	int getmovieCount(moviePartBean bean);
	 boolean deleteActorData(String name);
	 boolean deleteMovieData(String no);
	 boolean updateMovieActor(MovieBean bean);
	 boolean updateMovieData(MovieBean bean);
	 List<MovieDto> moviePart(moviePartBean bean);
	 MovieDto partdata(String name);
}