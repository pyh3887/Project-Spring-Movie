package pack.yj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.yj.model.MovieDaoInter;
import pack.yj.model.TvDaoInter;
import pack.yj.model.TvDto;

@Controller
public class TvController {  //main 화면에서의 모든 기능들 다 넣어놓은 곳.
	@Autowired
	@Qualifier("tvDaoImpl")
	private TvDaoInter tvinter;
	
	@RequestMapping("index")
	public ModelAndView list() {
		ModelAndView view = new ModelAndView();
		
		view.setViewName("main/index");
		view.addObject("dto",tvinter.selectDataAll());
		view.addObject("tvdto",tvinter.selectPartTv());
		view.addObject("moviedto",tvinter.selectPartMovie());
		view.addObject("tcounrty",tvinter.selectCountryTv());
		view.addObject("mcounrty",tvinter.selectCountryMovie());
		return view;
	}
	

}
