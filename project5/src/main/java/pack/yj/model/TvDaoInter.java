package pack.yj.model;

import java.util.List;


public interface TvDaoInter {
	List<TvDto> selectDataAll();

	List<TvDto> selectPartTv(); // 인기순 드라마

	List<MovieDto> selectPartMovie(); // 인기순 영화

	List<TvDto> selectCountryTv(); // 한국 드라마

	List<MovieDto> selectCountryMovie(); // 한국 영화

	List<TvDto> selectPartTvMain();

	List<MovieDto> selectPartMovieMain();

	List<TvDto> selectAmerican();

	List<TvDto> selectFan();

	List<TvDto> selectHorrorTv();

	List<MovieDto> selectBong();

	List<MovieDto> selectHorrorMovie();
	
	List<TvDto> getDataGenre(String genre);
	
	List<MovieDto> getDataGenreM(String genre);
	
	List<MovieDto> selectRomanceMovie();
	
	List<TvDto> search(String name);
	
	List<TvDto> autosearch(String name);
	
List<MovieDto> selectPartMovie2();
	
	
	
	List<TvDto> selectPartTv2();
}
