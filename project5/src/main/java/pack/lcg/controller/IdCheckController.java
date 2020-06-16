package pack.lcg.controller;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.lcg.model.GogekAnnoInter;
import pack.lcg.model.GogekDto;
import pack.lcg.model.GogekInter;

@Controller
public class IdCheckController {
	
	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
	
	  @ResponseBody
	   @RequestMapping(value = "idCheck", method =  RequestMethod.POST)
	   public Map<String, String> IdCheck(@RequestParam("gogek_id") String id){
	      Map<String, String> IdCheckResult = null;
	      IdCheckResult = new HashMap<String, String>(); 
	      
	      	System.out.println(gogekInter.idCheck(id));
	      	
	         if(gogekInter.idCheck(id) > 0) {
	            IdCheckResult.put("idCheckResult", "false");
	            System.out.println(IdCheckResult);
	         }
	         else {
	            IdCheckResult.put("idCheckResult", "true");
	         }
	         return IdCheckResult;
	      
	   }
	
}
