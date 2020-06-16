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

import pack.lcg.model.ListPickDto;
import pack.lcg.model.PickInter;



@Controller
public class PickController {
	@Autowired
	@Qualifier("pickImpl")
	private PickInter pickInter;
	
	 @ResponseBody
	   @RequestMapping(value = "gopick", method =  RequestMethod.GET)
	   public Map<String, String> goSubmit(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){
	      Map<String, String> pickResult = null;
	      pickResult = new HashMap<String, String>();
	      ListPickDto dto = pickInter.selectPickGogek(gogek_id);
	      if(dto != null) {
	         String pickResultId = dto.getGogek_id();
	         System.out.println("dto.getGogekid()" + dto.getGogek_id());

	         if(pickResultId.equals(gogek_id)) {
	            session.setAttribute("gogek_id", gogek_id);
	            pickResult.put("pickResult","success");
	            return pickResult;
	         }
	      }
	      pickResult.put("pickResult","false");
	      return pickResult;
	      
	   }
	
	@ResponseBody
	@RequestMapping(value="gopick1", method = RequestMethod.POST)
	   public Map<String, Object> gopick2(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){
		 List<Map<String,String>> dataList = new ArrayList<Map<String,String>>();
		 Map<String,String> data = null;
		 List<ListPickDto> List = pickInter.selectMoviePickInfo(gogek_id); //모델과 통신
		 List<ListPickDto> List1 = pickInter.selectTvPickInfo(gogek_id); //모델과 통신
	      if(List != null) {
	    	  for(ListPickDto p : List) {
		  			data = new HashMap<String, String>();
	  			
		  			data.put("name", p.getName());
		  			data.put("image", p.getImage());
		  			System.out.println("Moviename " + p.getName() + " Movieimage " + p.getImage());
		  			dataList.add(data);
		  			
		  		}
	      }
	      if(List1 != null) {
	    	  for(ListPickDto p : List1) {
		  			data = new HashMap<String, String>();
	  			
		  			data.put("name", p.getName());
		  			data.put("image", p.getImage());
		  			System.out.println("TVname " + p.getName() + " TVimage " + p.getImage());
		  			dataList.add(data);
		  			
		  		}
	      }
	      Map<String,Object> datas = new HashMap<String, Object>();
			datas.put("datas", dataList);
			System.out.println(datas);
			return datas;
	      
	   }
		
		
//		@RequestMapping(value="gopick1")
//		public ModelAndView goPick(HttpSession session,@RequestParam("gogek_id") String gogek_id){
//			List<ListPickDto> aa = pickInter.selectMoviePickInfo(gogek_id);
//			List<ListPickDto> bb = pickInter.selectTvPickInfo(gogek_id);
//			aa.addAll(bb);
//			
//			System.out.println("이건 aa " + aa.addAll(bb));
//			return new ModelAndView("gogek/mypage", "picks", aa);
//			//return new ModelAndView("picklist/picklist", "picks", aa);
			
	
}
