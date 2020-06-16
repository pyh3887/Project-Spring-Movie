package pack.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.admin.model.AdminGogekDto;
import pack.admin.model.AdminGogekImpl;
import pack.admin.model.AdminReviewImpl;
import pack.admin.model.ReportDto;
import pack.admin.model.ReviewDto;
import pack.admin.model.WeekDto;
import pack.lcg.model.GogekDto;

@Controller
public class AdminGogekController {

	@Autowired
	private AdminGogekImpl gogekImpl;
	private int pageSize = 10;

	@RequestMapping("customer")   //고객 리스트
	public ModelAndView list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum) {

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		int count = gogekImpl.gogekcount();   //페이징 처리를 위한 로직

		List<AdminGogekDto> list = gogekImpl.selectGogek(startRow);
		List<ReportDto> list2 = gogekImpl.selectReportGogek();	// 신고 top 5 리스트 출력
		List<ReportDto> list3 = gogekImpl.selectRecoGogek();	// 추천 top 5 리스트 출력
		ModelAndView view = new ModelAndView();

		view.setViewName("admin/admingogek");
		view.addObject("list", list);
		view.addObject("list2", list2);	
		view.addObject("list3", list3);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "customer");		//다음 이동 페이지를 위한 플래그

		return view;

	}

	
	
	@RequestMapping("searchcustomer")	// 고객 검색시 리스트
	public ModelAndView list2(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, GogekSearch search) {

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize; // 0,3,6..
		int endRow = pageSize;
		System.out.println(startRow);
		search.setStartRow(startRow);
		int count = gogekImpl.gogeksearchcount(search);

		System.out.println(startRow);
			

		List<AdminGogekDto> list = gogekImpl.selectSearchGogek(search);
		List<ReportDto> list2 = gogekImpl.selectReportGogek();
		List<ReportDto> list3 = gogekImpl.selectRecoGogek();
		
		ModelAndView view = new ModelAndView();
		view.setViewName("admin/admingogek");		
		view.addObject("search",search.getSearch());
		view.addObject("list", list);
		view.addObject("list2", list2);
		view.addObject("list3", list3);
		view.addObject("currentPage", currentPage);
		view.addObject("count", count);
		view.addObject("pageSize", pageSize);
		view.addObject("what", "searchcustomer");
		return view;

	}

	@RequestMapping(value = "reason", method = RequestMethod.GET)
	@ResponseBody	//고객 탈퇴 사유 차트 데이터
	public Map<String, Integer> reveiwFunc() {
		Map<String, Integer> data = null;

		data = new HashMap<String, Integer>();
		data.put("reason1", gogekImpl.gogekreason1());
		data.put("reason2", gogekImpl.gogekreason2());
		data.put("reason3", gogekImpl.gogekreason3());
		data.put("reason4", gogekImpl.gogekreason4());
		data.put("reason5", gogekImpl.gogekreason5());
		data.put("reason6", gogekImpl.gogekreason6());
		
		// 해쉬 맵을 통해 키 , value 로 데이터를 넣어준다 해쉬맵은 순서가 상관없음
		
		return data;
	}
	
	
	
	//고객 삭제하기
	@RequestMapping(value = "admingogekdel", method = RequestMethod.GET)
	public String delteprocess(@RequestParam(value = "id") String id) {
	

		boolean b = gogekImpl.gogekdelete(id);
	

		try {
			if (b) {
				return "redirect:/customer";

			} else
				return "error";

		} catch (Exception e) {
			return "error";
		}

	}
	
	//날짜별 회원가입 차트 
	@RequestMapping(value = "weekday", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> weekdate() {
		Map<String, String> data = null;

		data = new HashMap<String, String>();
		
		List<WeekDto> reviewList = 	gogekImpl.weekdata();//모델과 통신
		
		
		
	
		
		data = new HashMap<String, String>();
		data.put("d","d");
		data.put("c","d");
		int i=0;
		for(WeekDto j:reviewList) {
			data.put("date"+i, j.getGogek_date());	// 데이터에 순서를 차례대로 붙혀 제이슨 형태로 js 에 보내준다
			data.put("count"+i, j.getCount());
			i=i +1;
			
			System.out.println(j.getGogek_date() + " " + j.getCount());			
			
			
		}
		
		System.out.println(data);
		

		return data;
	}

}
