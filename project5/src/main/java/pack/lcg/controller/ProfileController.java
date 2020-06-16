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

import pack.lcg.model.GogekDto;
import pack.lcg.model.GogekInter;

@Controller
public class ProfileController {

	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;

	
	
	 @ResponseBody
	   @RequestMapping(value = "goprofile", method =  RequestMethod.GET)
	   public Map<String, String> goSubmit(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){
	      Map<String, String> profileResult = null;
	      profileResult = new HashMap<String, String>();
	      GogekDto dto = gogekInter.selectGogekProfileData(gogek_id);
	      if(dto != null) {
	         String profileResultId = dto.getGogek_id();
	         System.out.println("dto.getGogekid()" + dto.getGogek_id() + " dto.getGogek_passwd()" + dto.getGogek_passwd());
	         if(profileResultId.equals(gogek_id)) {
	            session.setAttribute("gogek_id", gogek_id);
	            profileResult.put("profileResult","success");
	            return profileResult;
	         }
	      }
	      profileResult.put("profileResult","false");
	      return profileResult;
	      
	   }
	
	 @ResponseBody
	   @RequestMapping(value = "goprofile1", method =  RequestMethod.POST)
	   public Map<String, Object> goSubmit2(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){

		 List<Map<String,String>> dataList = new ArrayList<Map<String,String>>();
		 Map<String,String> data = null;
		 List<GogekDto> List = gogekInter.selectProfileData(gogek_id); //모델과 통신

	      if(List != null) {

	    	  for(GogekDto s : List) {
		  			data = new HashMap<String, String>();
		  			
		  			data.put("id", s.getGogek_id());
		  			data.put("passwd", s.getGogek_passwd());
		  			data.put("name", s.getGogek_name());
		  			data.put("age", s.getGogek_age());
		  			data.put("email", s.getGogek_email());
		  			data.put("image", s.getGogek_image());
		  			data.put("date", s.getGogek_date());
		  			dataList.add(data);
		  			
		  		}

	    	  
	    	  
	      }
	      Map<String,Object> datas = new HashMap<String, Object>();
			datas.put("datas", dataList);
			
			return datas;
	      
	   }
	 
	
	
}
