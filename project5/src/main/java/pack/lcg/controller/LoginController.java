package pack.lcg.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.lcg.model.AdminIdCheckBean;
import pack.lcg.model.AdmincheckDto;
import pack.lcg.model.GogekDto;
import pack.lcg.model.GogekInter;
import pack.yj.controller.NaverLoginBO;

@Controller
public class LoginController {


	@Autowired
	private GogekInter inter;
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Model model,HttpSession session) {
		if(session.getAttribute("gogek_id") == null) {
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			
			//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버:" + naverAuthUrl);
			
			//네이버 
			model.addAttribute("url", naverAuthUrl);

			/* 생성한 인증 URL을 View로 전달 */
			
			return "gogek/login";
		} else {
			return "gogek/mypage";
			//return "redirect:/successlogin.jsp";
		}
	}
	


	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public Map<String, String> goSubmit(HttpSession session, @RequestParam("gogek_id") String gogek_id,
			@RequestParam("gogek_passwd") String gogek_passwd, AdminIdCheckBean bean) {
		Map<String, String> loginResult = null;
		loginResult = new HashMap<String, String>();

		
		AdmincheckDto dto2 = inter.selectadminLoginData(bean);
		GogekDto dto = inter.selectLoginData(gogek_id);
		if (dto2 != null) {
			session.setAttribute("admin_id", dto2.getId());
			session.setAttribute("abc", "1");
			loginResult.put("loginResult", "success");
			
			return loginResult;
		}

		else if (dto != null) {
			
			String loginResultId = dto.getGogek_id();
			String loginResultPasswd = dto.getGogek_passwd();
			System.out
					.println("dto.getGogekid()" + dto.getGogek_id() + " dto.getGogek_passwd()" + dto.getGogek_passwd());
			if (loginResultId.equals(gogek_id) && loginResultPasswd.equals(gogek_passwd)) {
				session.setAttribute("gogek_id", gogek_id);
				session.setAttribute("abc1", "2");		
				session.setAttribute("image",dto.getGogek_image());
				loginResult.put("loginResult", "success");
				loginResult.put("image",dto.getGogek_image());
				return loginResult;
			} 
			
		}
		loginResult.put("loginResult", "false");
		return loginResult;
		

	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String goLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

}
