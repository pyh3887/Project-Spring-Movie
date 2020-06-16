package pack.admin.model;

import java.util.List;

import pack.admin.controller.GogekSearch;

public interface GogekInter {
	List<AdminGogekDto> selectGogek(int startRow); 
	List<ReportDto> selectReportGogek();
	List<ReportDto> selectRecoGogek();
	 List<WeekDto> weekdata();
	 List<AdminGogekDto> selectSearchGogek(GogekSearch search);
	 int gogekcount();
	 int gogeksearchcount(GogekSearch search);
	 boolean gogekdelete(String id);
	 int gogekreason1();
	 int gogekreason2();
	 int gogekreason3();
	 int gogekreason4();
	 int gogekreason5();
	 int gogekreason6();
	 
	
}
