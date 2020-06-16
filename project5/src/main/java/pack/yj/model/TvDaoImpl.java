package pack.yj.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.yj.controller.TvBean;

@Repository
public class TvDaoImpl implements TvDaoInter {
	@Autowired
	private TvDaoAnnoInter inter;

	@Override
	public List<TvDto> selectDataAll() {
		return inter.selectDataAll();
	}

	@Override
	public List<TvDto> selectPartTv() {
		return inter.selectPartTv();
	}

	@Override
	public List<MovieDto> selectPartMovie() {
		return inter.selectPartMovie();
	}

	@Override
	public List<MovieDto> selectCountryMovie() {
		return inter.selectCountryMovie();
	}

	@Override
	public List<TvDto> selectCountryTv() {
		return inter.selectCountryTv();
	}

	@Override
	public List<MovieDto> selectPartMovieMain() {
		return inter.selectPartMovieMain();
	}

	
	@Override
	public List<TvDto> selectPartTvMain() {
		return inter.selectPartTvMain();
	}

	@Override
	public List<TvDto> selectAmerican() {
		return inter.selectAmerican();    //미국 드라마
	}

	@Override
	public List<MovieDto> selectBong() {
		return inter.selectBong();  //봉준호 감독 영화
	}

	@Override
	public List<TvDto> selectFan() {
		return inter.selectFan();  //판타지 드라마
	}

	@Override
	public List<MovieDto> selectHorrorMovie() {
		return inter.selectHorrorMovie();//호러 영화
	}

	@Override
	public List<TvDto> selectHorrorTv() {
		return inter.selectHorrorTv(); //호러 드라마
	}
	
	@Override
	public List<TvDto> getDataGenre(String genre) {
		return inter.getDataGenre(genre);
	}
	
	@Override
	public List<MovieDto> getDataGenreM(String genre) {
		return inter.getDataGenreM(genre);
	}
	
	@Override
	public List<MovieDto> selectRomanceMovie() {
		return inter.selectRomanceMovie();
	}
	
	@Override
	public List<TvDto> search(String name) {
		return inter.search(name);
	}
	@Override
	public List<TvDto> autosearch(String name) {
		return inter.autosearch(name);
	}
	
	@Override
	public List<MovieDto> selectPartMovie2() {
		return inter.selectPartMovie2();
	}
	
	@Override
	public List<TvDto> selectPartTv2() {
		return inter.selectPartTv2();
	}


}
