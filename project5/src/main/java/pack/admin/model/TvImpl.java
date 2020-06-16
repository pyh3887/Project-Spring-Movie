package pack.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.admin.controller.MovieBean;
import pack.admin.controller.TvBean;
import pack.admin.controller.moviePartBean;
import pack.admin.controller.tvPartBean;

@Repository
public class TvImpl implements TvInter {
	@Autowired
	private AdminAnoInter adminAnoInter;

	@Override
	public List<TvDto> selecttv(int startRow) {
		return adminAnoInter.selecttv(startRow);
	}

	@Override
	public List<TvDto> tvPart(tvPartBean bean) {
		return adminAnoInter.tvPart(bean);
	}

	

	@Override
	public int gettvCount() {
		return adminAnoInter.gettCount();
	}

	@Override
	public int gettvCount(tvPartBean bean) {
		return adminAnoInter.gettvCount(bean);
	}

	@Override
	public boolean insertTvData(TvBean bean) {
		return adminAnoInter.insertTvData(bean);
	}

	@Override
	public boolean insertTvActor(TvBean bean) {
		return adminAnoInter.insertTvActor(bean);
	}	

	@Override
	public boolean updatetvData(TvBean bean) {
		return adminAnoInter.updatetvData(bean);
	}

	@Override
	public boolean updatetvActorData(TvBean bean) {
		return adminAnoInter.updatetvActorData(bean);
	}

	@Override
	public boolean deletetveData(String no) {
		return adminAnoInter.deletetveData(no);
	}
	@Override
	public boolean deleteTvActordata(String name) {
		return adminAnoInter.deletetvActorData(name);
	}

}
