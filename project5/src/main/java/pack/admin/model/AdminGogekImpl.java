package pack.admin.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.admin.controller.GogekSearch;
import pack.admin.controller.ImageBean;
import pack.admin.controller.MovieBean;
import pack.admin.controller.moviePartBean;

@Repository
public class AdminGogekImpl implements GogekInter {
	@Autowired
	private AdminAnoInter adminAnoInter;
	
	@Override
	public List<AdminGogekDto> selectGogek(int startRow) {

		return adminAnoInter.selectGogek(startRow);
	}
	@Override
	public List<ReportDto> selectReportGogek() {

		return adminAnoInter.selectReportGogek();
	}
	@Override
	public List<ReportDto> selectRecoGogek() {

		return adminAnoInter.selectReccoGogek();
	}
	@Override
	public List<WeekDto> weekdata() {

		return adminAnoInter.weekdata();
	}


	@Override
	public List<AdminGogekDto> selectSearchGogek(GogekSearch search) {

		return adminAnoInter.reviewsearchGogek(search);
	}
	@Override
	public int gogekcount() {

		return adminAnoInter.getgogekCount();
	}
	@Override
	public int gogeksearchcount(GogekSearch search) {

		return adminAnoInter.getsearchGogekCount(search);
	}
	@Override
	public boolean gogekdelete(String id) {
		return adminAnoInter.admingogekdel(id);
	}
	
	//차트 고객 탈퇴사유----------------------
	@Override
	public int gogekreason1() {

		return adminAnoInter.getgogekreason1();
	}
	@Override
	public int gogekreason2() {

		return adminAnoInter.getgogekreason2();
	}
	@Override
	public int gogekreason3() {

		return adminAnoInter.getgogekreason3();
	}
	@Override
	public int gogekreason4() {

		return adminAnoInter.getgogekreason4();
	}
	@Override
	public int gogekreason5() {

		return adminAnoInter.getgogekreason5();
	}
	@Override
	public int gogekreason6() {

		return adminAnoInter.getgogekreason6();
	}
}
