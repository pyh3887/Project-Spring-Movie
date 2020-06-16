package pack.yj.controller;

import java.io.File;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.lcg.model.GogekDto;
import pack.lcg.model.GogekInter;

@Controller
public class PasswdController {   //비밀번호 찾기 controller
	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
	@RequestMapping(value="/passwd",method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView view = new ModelAndView();
		
		view.setViewName("gogek/passwd");
		return view;
	}

	 @ResponseBody
	   @RequestMapping(value = "idCheck2", method =  RequestMethod.POST)
	   public Map<String, String> IdCheck(@RequestParam("gogek_id") String id){
	      Map<String, String> IdCheckResult = null;
	      IdCheckResult = new HashMap<String, String>(); 
	      
	      //	System.out.println(gogekInter.idCheck(id));
	      	
	         if(gogekInter.idCheck(id) > 0) {
	            IdCheckResult.put("idCheckResult", "true");
	            System.out.println(IdCheckResult);
	         }
	         else {
	            IdCheckResult.put("idCheckResult", "false");
	         }
	         return IdCheckResult;
	      
	   }
	@Autowired
	private JavaMailSender mailSender;
	//비밀번호를 이메일로 보내주는 method
	@RequestMapping(value = "/passwd" , method=RequestMethod.POST) 
	public String sendMail(GogekDto dto, @RequestParam("gogek_id") String id) { 
		GogekDto map = gogekInter.getMail_Pwd(id);
		
		if (map.getGogek_id() != null) {
			String setfrom = "dbswls1999@gmail.com";   //보내는 사람의 email
			String tomail = (String) map.getGogek_email(); // 받는 사람 이메일
			String title = "BAEFLIX 비밀번호 찾기 메시지 입니다.";   //제목
		
		try { 
			MimeMessage message = mailSender.createMimeMessage(); 
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(tomail); 
			String text = "<html><body><br><br><h1>고객님의 비밀번호는 " + (String)map.getGogek_passwd() + "입니다.</h1></body></html>";  //본문
			//messageHelper.setText(text); 
			messageHelper.setFrom(setfrom); 
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			
			
			//이미지를 본문에 첨부할 때
			String contents =  "<img src=\'cid:logo.png\'>"; 
			messageHelper.setText(contents + text, true);
			FileSystemResource file = new FileSystemResource(new File("C:/work/logo.png")); 
			messageHelper.addInline("logo.png", file);

			
			mailSender.send(message);  
		}catch(Exception e){ 
			
				} 

		return "gogek/success";
			}else {
				return "gogek/error";
			}
		
	}
}
	


