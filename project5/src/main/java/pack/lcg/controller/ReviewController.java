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
import pack.lcg.model.ReviewDto;
import pack.lcg.model.ReviewInter;

@Controller
public class ReviewController {

	@Autowired
	@Qualifier("reviewImpl")
	private ReviewInter reviewInter;
	
	 @ResponseBody
	   @RequestMapping(value = "reviewdata", method =  RequestMethod.GET)
	   public Map<String, String> goSubmit(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){
	      Map<String, String> reviewResult = null;
	      reviewResult = new HashMap<String, String>();
	      ReviewDto dto = reviewInter.selectReviewGogek(gogek_id);
	      if(dto != null) {
	         String reviewResultId = dto.getGogek_id();
	         System.out.println("dto.getGogekid()" + dto.getGogek_id());
	         if(reviewResultId.equals(gogek_id)) {
	            session.setAttribute("gogek_id", gogek_id);
	            reviewResult.put("loginResult","success");
	            return reviewResult;
	         }
	      }
	      reviewResult.put("reviewResult","false");
	      return reviewResult;
	      
	   }
	
	
	 @ResponseBody
	   @RequestMapping(value = "reviewdata1", method =  RequestMethod.POST)
	   public Map<String, Object> goSubmit2(HttpSession session,
	   @RequestParam("gogek_id") String gogek_id){
		 List<Map<String,String>> dataList = new ArrayList<Map<String,String>>();
		 Map<String,String> data = null;
		 List<ReviewDto> List = reviewInter.selectReview(gogek_id); //모델과 통신
	      if(List != null) {
	    	  for(ReviewDto s : List) {
		  			data = new HashMap<String, String>();
	  			
		  			data.put("reviewno", s.getReview_no());
		  			data.put("proname", s.getPro_name());
		  			data.put("title", s.getReview_title());
		  			data.put("content", s.getContent());
		  			data.put("id", s.getGogek_id());
		  			data.put("date", s.getReview_date());
		  			//System.out.println("no " + s.getReview_no() + " proname " + s.getPro_name() + " title " + s.getReview_title() + " content " + s.getContent() + " id " + s.getGogek_id());
		  			dataList.add(data);
		  			
		  		}
	      }
	      Map<String,Object> datas = new HashMap<String, Object>();
			datas.put("datas", dataList);
			
			return datas;
	      
	   }
	 
	// reviewController

	 @RequestMapping("del")
	 	public String goDelete(@RequestParam("pro_name") String pro_name) {

	 		int re = reviewInter.selectDeleteReview(pro_name);
	 		if (re > 0) {
	 			return "gogek/mypage";
	 		} else {
	 			return "gogek/mypage";
	 		}

	 	}
}
