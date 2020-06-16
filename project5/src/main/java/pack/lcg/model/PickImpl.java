package pack.lcg.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("pickImpl")
public class PickImpl implements PickInter{
	@Autowired
	private PickAnnoInter inter;
	
	// 해당 아이디의 찜한 영화 목록
	@Override
	public List<ListPickDto> selectMoviePickInfo(String gogek_id) {
		return inter.selectMoviePickInfo(gogek_id);
	}
	
	// 해당 아이디의 찜한 티비 프로그램 목록
	@Override
	public List<ListPickDto> selectTvPickInfo(String gogek_id) {
		return inter.selectTvPickInfo(gogek_id);
	}

	// 찜목록 불러올 고객 아이디 조회
	@Override
	public ListPickDto selectPickGogek(String gogek_id) {
		// TODO Auto-generated method stub
		return inter.selectPickGogek(gogek_id);
	}
}
