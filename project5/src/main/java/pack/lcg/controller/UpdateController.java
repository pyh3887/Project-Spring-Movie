package pack.lcg.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.lcg.model.GogekDto;
import pack.lcg.model.GogekInter;

@Controller
public class UpdateController {

	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
//	@ResponseBody
//	@RequestMapping(value="update", method = RequestMethod.GET)
//	public ModelAndView up(@RequestParam("gogek_id") String id) {
//		GogekDto dto = gogekInter.selectGogekOneData(id);
//		
//		return new ModelAndView("gogek/gogekupdatepage", "dto", dto);
//		
//	} 
	
	 @ResponseBody
	   @RequestMapping(value = "update", method =  RequestMethod.GET)
	   public Map<String, String> goSubmit(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){
	      Map<String, String> loginResult = null;
	      loginResult = new HashMap<String, String>();
	      GogekDto dto = gogekInter.selectGogekOneData(gogek_id);
	      if(dto != null) {
	         String loginResultId = dto.getGogek_id();
	         System.out.println("dto.getGogekid()" + dto.getGogek_id() + " dto.getGogek_passwd()" + dto.getGogek_passwd());
	         if(loginResultId.equals(gogek_id)) {
	            session.setAttribute("gogek_id", gogek_id);
	            loginResult.put("loginResult","success");
	            return loginResult;
	         }
	      }
	      loginResult.put("loginResult","false");
	      return loginResult;
	      
	   }
	
	 @ResponseBody
	   @RequestMapping(value = "select2", method =  RequestMethod.POST)
	   public Map<String, Object> goSubmit2(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){
//	      Map<String, String> loginResult = null;
		 List<Map<String,String>> dataList = new ArrayList<Map<String,String>>();
		 Map<String,String> data = null;
		 List<GogekDto> List = gogekInter.selectData(gogek_id); //모델과 통신
//	      loginResult = new HashMap<String, String>();
//	      GogekDto dto = gogekInter.selectData(gogek_id);
	      if(List != null) {
	        // String loginResultId = dto.getGogek_id();
//	         System.out.println("dto.getGogekid()" + dto.getGogek_id() + " dto.getGogek_passwd()" + dto.getGogek_passwd());
//	         System.out.println("dto.getGogekname()" + dto.getGogek_name() + " dto.getGogek_age()" + dto.getGogek_age());
//	         System.out.println("dto.getGogekemail()" + dto.getGogek_email());
//	         if(loginResultId.equals(gogek_id)) {
//	            session.setAttribute("gogek_id", gogek_id);
//	            loginResult.put("loginResult","success");
//	            return loginResult;
	    	  for(GogekDto s : List) {
		  			data = new HashMap<String, String>();
		  			
		  			data.put("id", s.getGogek_id());
		  			data.put("passwd", s.getGogek_passwd());
		  			data.put("name", s.getGogek_name());
		  			data.put("age", s.getGogek_age());
		  			data.put("email", s.getGogek_email());
		  			dataList.add(data);
		  			
		  		}
//	         }
	    	  
	    	  
	      }
	      Map<String,Object> datas = new HashMap<String, Object>();
			datas.put("datas", dataList);
			
			return datas;
	      
	   }
	 
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String submit(GogekBean bean) {
		boolean b = gogekInter.updateData(bean);
		if(b)
			return "redirect:/index";
		else
			return "gogek/error";
	}
	
}
