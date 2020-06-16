package pack.lcg.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface PickAnnoInter {
	
	// 찜 목록 조회할 아이디 검색
	@Select("select gogek_id from team.gogek where gogek_id = #{gogek_id}")
	public ListPickDto selectPickGogek(String gogek_id);
	
	// 해당 회원이 찜한 영화 목록 조회
	@Select("select name, image from pick inner join movie on pro_name = name where gogek_id = #{gogek_id}")
	public List<ListPickDto> selectMoviePickInfo(String gogek_id);
	
	// 해당 회원이 찜한 티비 프로그램 목록 조회
	@Select("select name, image from pick inner join tv on pro_name = name where gogek_id = #{gogek_id}")
	public List<ListPickDto> selectTvPickInfo(String gogek_id);
}
