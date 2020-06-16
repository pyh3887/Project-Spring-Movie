package pack.yj.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class MovieDaoImpl implements MovieDaoInter{
	@Autowired
	private TvDaoAnnoInter inter;
	
	@Override
	public List<MovieDto> selectPartMovie() {
		return inter.selectPartMovie();
	}
}
