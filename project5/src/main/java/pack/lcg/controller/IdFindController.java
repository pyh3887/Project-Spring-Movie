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

import pack.lcg.model.GogekAnnoInter;
import pack.lcg.model.GogekDto;
import pack.lcg.model.GogekInter;

@Controller
public class IdFindController {
	
	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
	
	   @ResponseBody
	   @RequestMapping(value = "idFind", method =  RequestMethod.POST)
	   public Map<String, String> goSubmit(
	   @RequestParam("gogek_email") String gogek_email,
	   @RequestParam("gogek_name")String gogek_name){
	      Map<String, String> FindResult = null;
	      FindResult = new HashMap<String, String>();
	      GogekDto dto = gogekInter.selectFindData(gogek_email);
	      
	    if(dto != null) {
	         String idFindResultEmail = dto.getGogek_email();
	         String idFindResultName = dto.getGogek_name();
	         System.out.println("dto.getGogekemail()" + dto.getGogek_email() + " dto.getGogek_name()" + dto.getGogek_name() + "dto.getGogek_id() " + dto.getGogek_id());
	         if(idFindResultEmail.equals(gogek_email) && idFindResultName.equals(gogek_name)) {
	            FindResult.put("FindResult","success");
	            System.out.println("성공 " +FindResult);
	            return FindResult;
	         }
	      }
	      FindResult.put("FindResult","false");
	      System.out.println("실패한 findResult" + FindResult);
	      return FindResult;
	      
	   }
	   
	   
	   @ResponseBody
	   @RequestMapping(value = "idlist", method =  RequestMethod.POST)
	   public Map<String, String> goSubmit2(
	   @RequestParam("gogek_email") String gogek_email
	   ){
	      Map<String, String> idlistResult = null;
	      idlistResult = new HashMap<String, String>();
	      GogekDto dto = gogekInter.selectFindData(gogek_email);
	      System.out.println("dto 값은 : " + dto);
	      
	    if(dto != null) {
//	         String idlistResult1 = dto.getGogek_id();

	         System.out.println("dto.getGogekemail()" + dto.getGogek_email() + " dto.getGogek_name()" + dto.getGogek_name() + "dto.getGogek_id() " + dto.getGogek_id());
//	         if(idlistResult1.equals(gogek_email)) {
	            idlistResult.put("idlistResult", dto.getGogek_id());
	            System.out.println("성공 idlistResult " +idlistResult);
//	            return idlistResult;
//	         }
	      }
//	      idlistResult.put("idlistResult", dto.getGogek_id());
//	      System.out.println("실패한 idlistResult " + idlistResult);
//	      return idlistResult;
//	      
		return idlistResult;
	   }
	   

	   
	
}
