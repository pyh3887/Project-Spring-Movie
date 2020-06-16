package pack.yj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.yj.model.TvDaoInter;
import pack.yj.model.TvDto;

@Controller
public class ControllerTv {    //tv화면에서 사용할 모든 메소드 적어놓을 곳
	@Autowired
	@Qualifier("tvDaoImpl")
	private TvDaoInter tvinter;
	
	@RequestMapping("tv")
	public ModelAndView list() {
		ModelAndView view = new ModelAndView();
		
		view.setViewName("main/tv");
		view.addObject("tvtop5",tvinter.selectPartTvMain());
		view.addObject("tvdto",tvinter.selectPartTv2());
		view.addObject("american",tvinter.selectAmerican());
		view.addObject("fan",tvinter.selectFan());
		view.addObject("ho",tvinter.selectHorrorTv());
		
		return view;
	}
	
	@RequestMapping("genre")  //장르별 티비
	@ResponseBody  //Map을 반환하면 자동으로 Map 정보가 JSON 객체로 변환되어 전송
	public Map<String,Object> genreFunc(String genre){
		
		List<Map<String,String>> dataList = new ArrayList<Map<String,String>>();
		Map<String,String> data = null;
		List<TvDto> genList = tvinter.getDataGenre(genre); //모델과 통신
		
		for(TvDto s : genList) {
			data = new HashMap<String, String>();
			
			data.put("name", s.getName());
			data.put("image", s.getImage());
			
			dataList.add(data);
			
		}
		Map<String,Object> genres = new HashMap<String, Object>();
		genres.put("datas", dataList);
		
		return genres;
	}
}
