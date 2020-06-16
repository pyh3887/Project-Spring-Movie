package pack.ks.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.ks.controller.GenreBean;
import pack.ks.controller.PickBean;
import pack.ks.controller.ReviewBean;
import pack.ks.controller.StarBean;

public interface InfoAnnoInter {
	@Select("select * from movie where name = #{name}")
	public List<InfoDto> selectMovieInfo(String name);
	
	@Select("select * from tv where name = #{name}")
	public List<InfoDto> selectTvInfo(String name);
	
	@Update("update movie set cnt = cnt+1 where name = #{name}")
	public void updateMoCnt(String name);
	
	@Update("update tv set cnt = cnt+1 where name = #{name}")
	public void updateTvCnt(String name);
	
	@Insert("insert into review(gogek_id, pro_name, content, review_title, review_date) values(#{gogek_id}, #{pro_name}, #{content}, #{review_title}, now())")	//id는 나중에 로그인 연결하고 받아줘야 됨
	public void insertReview(ReviewBean bean);

	//@Select("select * from review where pro_name = #{name} order by review_cnt desc")
	@Select("select review_no, review.gogek_id as gogek_id, content, review_cnt, review_title, pro_name, gogek_image, review_date from review inner join gogek on review.gogek_id = gogek.gogek_id where pro_name = #{name} order by review_cnt desc")
	public List<ReviewDto> selectReview(String name);
	
	@Update("update review set review_cnt = review_cnt+1 where review_no = #{review_no}")
	public void updateReview(String review_no);
	
	@Update("update review set review_report = review_report+1 where review_no = #{review_no}")
	public void updateReport(String review_no);
	
	@Insert("insert into pick(gogek_id, pro_name) values(#{gogek_id}, #{pro_name})")
	public void insertPick(PickBean bean);
	
	@Delete("delete from pick where gogek_id = #{gogek_id} and pro_name = #{pro_name}")
	public void deletePick(PickBean bean);
	
	@Select("select * from pick where gogek_id = #{gogek_id} and pro_name = #{pro_name}")
	public List<PickDto> selectPickCheck(PickBean bean);
	
	@Select("select actor_name from actor where pro_name = #{name}")
	public String selectActor(String name);
	
	@Delete("delete from star where gogek_id = #{gogek_id} and pro_name = #{pro_name}")
	public void deleteStar(StarBean bean);
	
	@Insert("insert into star(gogek_id, pro_name, point) values(#{gogek_id}, #{pro_name}, #{point})")
	public void insertStar(StarBean bean);
	
	@Select("SELECT AVG(POINT) FROM star WHERE pro_name = #{pro_name}")
	public double selectStar(StarBean bean);
	
	@Update("update movie set cnt = #{cnt} where name = #{pro_name}")
	public void updateStar1(StarBean bean);
	
	@Update("update tv set cnt = #{cnt} where name = #{pro_name}")
	public void updateStar2(StarBean bean);
	
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 1")
	public String point1(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 2")
	public String point2(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 3")
	public String point3(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 4")
	public String point4(String name);
	@Select("select count(point) as po from star where pro_name = #{name} AND POINT = 5")
	public String point5(String name);
	
	@Select("select * from movie where genre = #{genre} and name not in (select name from movie where name = #{name}) order by cnt desc")
	public List<InfoDto> moselgenre(GenreBean bean);
	@Select("select * from tv where genre = #{genre} and name not in (select name from tv where name = #{name}) order by cnt desc")
	public List<InfoDto> tvselgenre(GenreBean bean);
	
	@Select("select * from movie where director = #{director}")
	public List<InfoDto> directorMovie(String director);
	@Select("select * from tv where director = #{director}")
	public List<InfoDto> directorTv(String director);
	
	@Select("SELECT * FROM movie WHERE name IN (SELECT pro_name FROM actor WHERE actor_name LIKE #{actor})")
	public List<InfoDto> actorMovieInfo(String actor);
	@Select("SELECT * FROM tv WHERE name IN (SELECT pro_name FROM actor WHERE actor_name LIKE #{actor})")
	public List<InfoDto> actorTvInfo(String actor);
	
	@Select("select * from gogek where gogek_id = #{gogek_id}")
	public List<GogekDto> gogekInfo(String gogek_id);
	
	@Select("SELECT count(gogek_id) AS count FROM star JOIN movie ON pro_name = NAME WHERE gogek_id = #{gogek_id}")
	public String gmStar(String gogek_id);
	@Select("SELECT count(gogek_id) AS count FROM star JOIN tv ON pro_name = NAME WHERE gogek_id = #{gogek_id}")
	public String gtStar(String gogek_id);
	@Select("SELECT count(gogek_id) AS count FROM pick JOIN movie ON pro_name = NAME WHERE gogek_id = #{gogek_id}")
	public String gmPick(String gogek_id);
	@Select("SELECT count(gogek_id) AS count FROM pick JOIN tv ON pro_name = NAME WHERE gogek_id = #{gogek_id}")
	public String gtPick(String gogek_id);
	
	@Select("SELECT * FROM star JOIN movie ON pro_name = NAME WHERE gogek_id = #{gogek_id} order by cnt desc")
	public List<InfoDto> gogekMovie(String gogek_id);
	@Select("SELECT * FROM star JOIN tv ON pro_name = NAME WHERE gogek_id = #{gogek_id} order by cnt desc")
	public List<InfoDto> gogekTv(String gogek_id);
	@Select("SELECT * FROM pick JOIN movie ON pro_name = NAME WHERE gogek_id = #{gogek_id} order by cnt desc")
	public List<InfoDto> gogekMop(String gogek_id);
	@Select("SELECT * FROM pick JOIN tv ON pro_name = NAME WHERE gogek_id = #{gogek_id} order by cnt desc")
	public List<InfoDto> gogekTvp(String gogek_id);
}
