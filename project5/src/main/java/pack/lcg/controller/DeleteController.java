package pack.lcg.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

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
public class DeleteController {
	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
	 @ResponseBody
	   @RequestMapping(value = "delete", method =  RequestMethod.GET)
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
		  			
		  			dataList.add(data);
		  			
		  		}
//	         }
	    	  
	    	  
	      }
	      Map<String,Object> datas = new HashMap<String, Object>();
			datas.put("datas", dataList);
			
			return datas;
	      
	   }
	  @ResponseBody
	   @RequestMapping(value = "delete3", method =  RequestMethod.POST)
	   public Map<String, String> goSubmit(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id,
	   @RequestParam("gogek_passwd")String gogek_passwd){
	      Map<String, String> loginResult = null;
	      loginResult = new HashMap<String, String>();
	      GogekDto dto = gogekInter.selectLoginData(gogek_id);
	     
	
	    if(dto != null) {
	         String loginResultId = dto.getGogek_id();
	         String loginResultPasswd = dto.getGogek_passwd();
	         System.out.println("dto.getGogekid()" + dto.getGogek_id() + " dto.getGogek_passwd()" + dto.getGogek_passwd());
	         if(loginResultId.equals(gogek_id) && loginResultPasswd.equals(gogek_passwd)) {
	            session.setAttribute("gogek_id", gogek_id);
	            loginResult.put("deleteResult","success");
	            return loginResult;
	         }
	      }
	      loginResult.put("loginResult","false");
	      return loginResult;
	      
	   }
	  
	@RequestMapping(value="delete2", method = RequestMethod.POST)
	public String submit(HttpSession session,GogekBean bean,@RequestParam("gogek_id") String gogek_id,@RequestParam("gogek_passwd") String gogek_passwd,
			@RequestParam("reason_num") String reason_num) {
		//System.out.println(gogek_id);
		//System.out.println(gogek_passwd);
		//System.out.println(reason);
		int cnt = gogekInter.checkData(bean);
		if(cnt == 1) {
			boolean a = gogekInter.deleteinsertData(bean);
			boolean b = gogekInter.deleteData(bean.getGogek_id());
			if(a) {
				if(b) {
					session.invalidate();
					return "redirect:/main.jsp";
				}else {
					return "gogek/error";
				}
				
			}
				
			else
				return "gogek/error";
		}
		else
			return "gogek/error";
	}
	
}
