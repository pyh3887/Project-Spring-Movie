package pack.admin.model;

import java.util.List;

import pack.admin.controller.TvBean;
import pack.admin.controller.tvPartBean;

public interface TvInter {
	List<TvDto> selecttv(int startRow);
	public List<TvDto> tvPart(tvPartBean bean);

	int gettvCount();
	int gettvCount(tvPartBean bean);	
	boolean insertTvActor(TvBean bean);
	boolean insertTvData(TvBean bean);
	boolean updatetvData(TvBean bean);
	boolean updatetvActorData(TvBean bean);
	boolean deletetveData(String no);
	boolean deleteTvActordata(String name);



}
