package pack.lcg.model;

import java.util.List;

public interface PickInter {
	List<ListPickDto> selectMoviePickInfo(String gogek_id);
	List<ListPickDto> selectTvPickInfo(String gogek_id);
	ListPickDto selectPickGogek(String gogek_id);
	
}
