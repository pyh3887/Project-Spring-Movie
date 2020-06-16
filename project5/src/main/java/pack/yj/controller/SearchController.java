package pack.yj.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.yj.model.TvDaoInter;
import pack.yj.model.TvDto;

@Controller
public class SearchController {  //검색 controller
	
	
	
	@Autowired
	private TvDaoInter inter;

	@RequestMapping(value = "search", method = RequestMethod.POST)
	public ModelAndView searchProcess(String name) {
		return new ModelAndView("main/search", "datas", inter.search(name));
	}
	

	@RequestMapping(value= "abc",produces = "application/json; charset=utf8")
	@ResponseBody
	 public void AutoTest(Locale locale, Model model, HttpServletRequest request,
	 HttpServletResponse resp, TvDto dto) throws IOException {
	 
	 String result = request.getParameter("name");
	 //System.out.println(result);
	 List<TvDto> list = inter.autosearch(result); //result값이 포함되어 있는 emp테이블의 네임을 리턴
	 
	 JSONArray ja = new JSONArray();
	 for (int i = 0; i < list.size(); i++) {
	 ja.add(list.get(i).getName());
	 //System.out.println(list.get(i).getName());
	 }
	 resp.setCharacterEncoding("UTF-8");
	 resp.setContentType("text/html; charset=UTF-8");
	 PrintWriter out = resp.getWriter();
	
	 out.print(ja.toString());
	 
	 }
}
