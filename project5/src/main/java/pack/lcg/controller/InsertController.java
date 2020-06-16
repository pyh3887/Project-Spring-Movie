package pack.lcg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import pack.lcg.model.GogekInter;


@Controller
public class InsertController {

	@Autowired
	@Qualifier("gogekImpl")
	private GogekInter gogekInter;
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String control() {
		return "gogek/login";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(GogekBean bean) {
		
//		System.out.println(bean.getGogek_id());
//		System.out.println(bean.getGogek_passwd());
//		System.out.println(bean.getGogek_passwd1());
//		System.out.println(bean.getGogek_name());
//		System.out.println(bean.getGogek_age());
//		System.out.println(bean.getGogek_pick());
//		System.out.println(bean.getGogek_email());
		
		boolean b = gogekInter.insertData(bean);
		if(b) { 
			return "gogek/login";
		} else {
			return "gogek/error";
		}
	}
	
}
