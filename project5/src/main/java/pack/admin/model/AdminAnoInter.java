package pack.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.admin.controller.GogekSearch;
import pack.admin.controller.ImageBean;
import pack.admin.controller.MovieBean;
import pack.admin.controller.ReviewSearch;
import pack.admin.controller.TvBean;
import pack.admin.controller.moviePartBean;
import pack.admin.controller.tvPartBean;

public interface AdminAnoInter {
	
	//영화--------------------------------------------------------------------------------------------------------------
	
	//영화 리스트 페이징 추가
	@Select("select * from team.movie join actor on name = pro_name order by no desc limit #{startRow},7")
	List<MovieDto> selectMovie(int startRow);
	
	// 영화 리스트 검색 페이징 추가
	@Select("select * from movie join actor on name = pro_name where name like concat('%',#{search},'%') order by no desc limit #{startRow},7 ")
	public List<MovieDto> moviePart(moviePartBean bean);
		
	@Select("select * from movie join actor on pro_name = name where name = #{name}")
	public MovieDto updatePart(String name);
	
	//movie 리스트의 페이징을 위한 갯수 알기
	@Select("select count(*) from team.movie")
	int getCount();
	
	//movie 검색리스트의 페이징을 위한 갯수 알기
	@Select("select count(*) from team.movie where name like concat(#{search},'%')")
	int getmovieCount(moviePartBean bean);

	
	//영화 추가하기
	@Insert("insert into team.movie(name,date,country,time,director,genre,content,preview,image) values(#{name},#{date},#{country},#{time},#{director},#{genre},#{content},#{preview},#{image2})")
	boolean insertMovieData(MovieBean bean);
	
	//배우 추가하기
	@Insert("insert into actor(pro_name,actor_name) values(#{name},#{actor_name})")
	boolean insertMovieActor(MovieBean bean);


	//영화 수정하기
	@Update("update team.movie set name=#{name},date=#{date},country=#{country},time=#{time},director=#{director},genre=#{genre},content=#{content},preview=#{preview},image=#{image2} where no = #{no}")
	boolean updateMovieData(MovieBean bean);
	//배우 수정하기
	@Update("update actor set actor_name=#{actor_name},pro_name=#{name} where pro_name = #{common}")
	boolean updateActorData(MovieBean bean);
	
	//영화 삭제
	@Delete("delete from movie where name=#{name}")
	boolean deleteMovieData(String no);
	//배우 삭제
	@Delete("delete from actor where pro_name=#{name}")
	boolean deleteActorData(String name);
	
	//tv----------------------------------------------------------------------
	//tv 리스트 출력(페이징)
	@Select("select * from team.tv join actor on name = pro_name order by no desc limit #{startRow},7")
	List<TvDto> selecttv(int startRow);
	//tv 검색 리스트 출력(페이징)
	@Select("select * from tv join actor on name = pro_name where name like concat(#{search},'%') order by no desc limit #{startRow},7")
	public List<TvDto> tvPart(tvPartBean bean);
	
	//tv 리스트 출력시 페이징을 위한 카운트
	@Select("select count(*) from tv")
	int gettCount();
	
	//tv 검색시 페이징을 위한 카운트
	@Select("select count(*) from tv where name like concat(#{search},'%')")
	int gettvCount(tvPartBean bean);

	//tv 프로그램 추가하기
	@Insert("insert into tv(name,date,country,time,director,genre,content,preview,image) values(#{name},#{date},#{country},#{time},#{director},#{genre},#{content},#{preview},#{image2})")
	boolean insertTvData(TvBean bean);
	//배우 추가하기 
	@Insert("insert into actor(pro_name,actor_name) values(#{name},#{actor_name})")
	boolean insertTvActor(TvBean bean);
	
	//tv 프로그램 수정하기
	@Update("update team.tv set name=#{name},date=#{date},country=#{country},time=#{time},director=#{director},genre=#{genre},content=#{content},preview=#{preview},image=#{image2} where no = #{no}")
	boolean updatetvData(TvBean bean);
	//배우 수정하기
	@Update("update actor set actor_name=#{actor_name},pro_name=#{name} where pro_name = #{common}")
	boolean updatetvActorData(TvBean bean);
	//tv 프로그램 삭제하기
	@Delete("delete from tv where name=#{name}")
	boolean deletetveData(String name);
	//배우 삭제하기
	@Delete("delete from actor where pro_name=#{name}")
	boolean deletetvActorData(String name);
	
	
	
	//review -----------------------------------------------------------------------
	
	//--review 전체 리스트
	@Select("select * from review join gogek on gogek.gogek_id = review.gogek_id order by review_no desc limit #{startRow},10")
	List<ReviewDto> reviewlist(int startRow);
	@Select("select * from review  join gogek on gogek.gogek_id = review.gogek_id order by review_no desc limit #{startRow},10")
	List<ReviewDto> reviewlist2(int startRow);
		
	//--review 전체 카운트
	@Select("select count(*) from review")
	int reviewCount();
	
	//-- review 검색 리스트
	@Select("select * from review  join gogek on gogek.gogek_id = review.gogek_id where ${data} like concat('%',#{search},'%') order by review_no desc")
	List<ReviewDto> reviewsearchlist(ReviewSearch search);
		
	
	//-- review 검색 카운트
	@Select("select count(*) from review where ${data} like concat('%',#{search},'%')")
	int reviewsearchCount(ReviewSearch search);
	
	//-- top 추천 리뷰
	@Select("select * from review order by review_cnt desc limit #{startRow},10;")
	List<ReviewDto> recommendlist(int startRow);
	
	//-- top 신고 리뷰
	@Select("select * from review order by review_report desc limit #{startRow},10;")
	List<ReviewDto> reportlist(int startRow);
	
	// 리뷰 삭제
	@Delete("delete from review where review_no=#{no}")
	boolean deletereviewData(String no);
	
	
	//고객관리--------------------------------------
	
	//고객 리스트
	@Select("select * from gogek order by gogek_date limit #{startRow},7")
	List<AdminGogekDto> selectGogek(int startRow);
	
	//신고 top 5 고객 리스트
	@Select("select gogek.gogek_id,gogek_email, gogek_name,sum(review_report) as report from gogek inner join review on gogek.gogek_id = review.gogek_id group by gogek.gogek_id order by review_report desc")
	List<ReportDto> selectReportGogek();
	
	//추천 top 5 고객 리스트
	@Select(" select gogek.gogek_id,gogek_email, gogek_name,sum(review_cnt) as cnt from gogek inner join review on gogek.gogek_id = review.gogek_id group by gogek.gogek_id order by review_cnt desc")
	List<ReportDto> selectReccoGogek();
		
	//검색시 고객리스트
	@Select("select * from gogek where gogek_id like concat('%',#{search},'%') order by gogek_date desc limit #{startRow},10")
	List<AdminGogekDto> reviewsearchGogek(GogekSearch search);
	
	
	//고객 페이징처리를 위한 카운트
	@Select("select count(*) from gogek")
	int getgogekCount();
	
	//고객 삭제
	@Delete("delete from gogek where gogek_id =#{id}")
	boolean admingogekdel(String id);
	
	//고객 검색
	@Select("select count(*) from gogek where gogek_id like concat('%',#{search},'%')")
	int getsearchGogekCount(GogekSearch search);
	
	// 일주일치 회원가입 자료 데이터 sql
	@Select("SELECT gogek_date,COUNT(*) as count FROM gogek WHERE gogek_date BETWEEN DATE_ADD(NOW(),INTERVAL -1 WEEK ) AND NOW() GROUP BY gogek_date;")
	List<WeekDto> weekdata();
	
	
	// 고객 탈퇴사유 리스트를 위한 sql
	
	@Select("select count(*) from deletemem join deletemem_reason on reason_num = deletemem_reason.num where reason_num = 1")
	int getgogekreason1();
	
	@Select("select count(*) from deletemem join deletemem_reason on reason_num = deletemem_reason.num where reason_num = 2")
	int getgogekreason2();
	
	@Select("select count(*) from deletemem join deletemem_reason on reason_num = deletemem_reason.num where reason_num = 3")
	int getgogekreason3();
	
	@Select("select count(*) from deletemem join deletemem_reason on reason_num = deletemem_reason.num where reason_num = 4")
	int getgogekreason4();
	
	@Select("select count(*) from deletemem join deletemem_reason on reason_num = deletemem_reason.num where reason_num = 5")
	int getgogekreason5();
	
	@Select("select count(*) from deletemem join deletemem_reason on reason_num = deletemem_reason.num where reason_num = 6")
	int getgogekreason6();
	
	

}
