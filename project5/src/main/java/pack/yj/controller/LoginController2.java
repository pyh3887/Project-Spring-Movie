package pack.yj.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import pack.lcg.controller.GogekBean;
import pack.lcg.model.GogekDto;
import pack.lcg.model.GogekInter;

@Controller
public class LoginController2 {    //네이버 로그인
	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}


	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverSuccess", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
	    
	    JSONParser parser = new JSONParser();
	    Object obj = parser.parse(apiResult);
	    JSONObject jsonObj = (JSONObject) obj;
	    
	    //데이터 파싱
	    //Top레벨 단계 _response 파싱
	    JSONObject response_obj = (JSONObject)jsonObj.get("response");
	    //response의 nickname값 파싱
	    String naver_id = (String)response_obj.get("id");
	    String naver_email = (String)response_obj.get("email");
	    GogekBean bean = new GogekBean();
	    bean.setGogek_id(naver_id);
	    bean.setGogek_email(naver_email);
	    
	    GogekDto dto = gogekInter.selectDataNaver(naver_id);
//	    System.out.println(id);
	    //파싱 닉네임 세션으로 저장
	    if(dto != null) { //이미 네이버로 로그인 한적이 있는 사람들
	    	  session.setAttribute("gogek_id",naver_id); //세션 생성
	    	  
	    	session.setAttribute("image", dto.getGogek_image());
	  		model.addAttribute("result", apiResult);
//	  		session.setAttribute("naverid", apiResult);

	          /* 네이버 로그인 성공 페이지 View 호출 */
	  		return new ModelAndView("redirect:/index","result",apiResult);
	    }else {//네이버 로그인을 처음 한 사람들 
	    	boolean b = gogekInter.insertDataNaver(bean);
	    	 session.setAttribute("gogek_id",naver_id); //세션 생성

	    		session.setAttribute("image", dto.getGogek_image());
		  		model.addAttribute("result", apiResult);
//		  		session.setAttribute("naverid", apiResult);

		          /* 네이버 로그인 성공 페이지 View 호출 */
		  		
		  		return new ModelAndView("redirect:/index","result",apiResult);
	    }
	  
	}
}



