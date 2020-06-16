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
public class EmailCheckController {
	
	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
	
	  @ResponseBody
	   @RequestMapping(value = "emailCheck", method =  RequestMethod.POST)
	   public Map<String, String> EmailCheck(@RequestParam("gogek_email") String gogek_email){
	      Map<String, String> EmailCheckResult = null;
	      EmailCheckResult = new HashMap<String, String>(); 
	      
	      	System.out.println(gogekInter.emailCheck(gogek_email));
	      	
	         if(gogekInter.emailCheck(gogek_email) > 0) {
	            EmailCheckResult.put("emailCheckResult", "false");
	            System.out.println(EmailCheckResult);
	         }
	         else {
	            EmailCheckResult.put("emailCheckResult", "true");
	         }
	         return EmailCheckResult;
	      
	   }
	
}
