package pack.yj.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import pack.yj.controller.TvBean;


public interface TvDaoAnnoInter {   //movie도 같이 넣음
	@Select("select * from tv union select * from movie order by cnt desc limit 4")
	public List<TvDto> selectDataAll();
	
	@Select("select * from tv order by cnt desc limit 3")
	public List<TvDto> selectPartTv();        //인기 드라마 목록 뽑는 sql
	
	@Select("select * from movie order by cnt desc limit 3")
	public List<MovieDto> selectPartMovie();  //인기 영화 목록 뽑는 sql
	
	@Select("select * from tv where country='한국'")
	public List<TvDto> selectCountryTv();   //한국 드라마
	
	@Select("select * from movie where country='한국'")
	public List<MovieDto> selectCountryMovie();  //한국 영화
	
	@Select("select * from tv order by cnt desc limit 5")
	public List<TvDto> selectPartTvMain();         //인기 많은 드라마 5개
	
	@Select("select * from movie order by cnt desc limit 5")
	public List<MovieDto> selectPartMovieMain();    //인기 많은 영화 5개
	
	@Select("select * from tv where country='미국'")
	public List<TvDto> selectAmerican();
	
	@Select("select * from tv where genre like concat('%','판타지','%')")
	public List<TvDto> selectFan();
	
	@Select("select * from tv where genre like concat('%','공포','%')")
	public List<TvDto> selectHorrorTv();
	
	@Select("select * from movie where director = '봉준호'")
	public List<MovieDto> selectBong();
	
	@Select("select * from movie where genre like concat('%','공포','%')")
	public List<MovieDto> selectHorrorMovie();
	
	@Select("select * from movie where genre like concat('%','로맨스','%')")
	public List<MovieDto> selectRomanceMovie();
	
	@Select("select * from tv where genre like concat('%',#{genre},'%')")
	public List<TvDto> getDataGenre(String genre); 
	
	@Select("select * from movie where genre like concat('%',#{genre},'%')")
	public List<MovieDto> getDataGenreM(String genre);
	
	@Select("select * from tv where name like concat('%',#{name},'%') union select * from movie where name like concat('%',#{name},'%')")
	public List<TvDto> search(String name);
	
	@Select("select name from tv where name like concat('%',concat(UPPER(#{b}),'%')) or name like concat('%',concat(LOWER(#{b}),'%')) union select name from movie where name like concat('%',concat(UPPER(#{b}),'%')) or name like concat('%',concat(LOWER(#{b}),'%'))")
	public List<TvDto> autosearch(String name);
	
	@Select("select * from movie order by cnt desc limit 12")
	public List<MovieDto> selectPartMovie2();
	
	@Select("select * from tv order by cnt desc limit 12")
	public List<TvDto> selectPartTv2();;
}
