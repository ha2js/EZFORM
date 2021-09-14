package com.ezform.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezform.test.testController;

@Controller
public class EZ_emp_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	// http://localhost:8088/controller/main
	// 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getMainPage(HttpSession session) throws Exception {
		
		logger.info(" C : 메인페이지 이동!");
			
		// 세션 제어
		String em_id = (String)session.getAttribute("em_id");
	    
		
    	if(em_id == null) {
    		logger.info("em_id 값 : " + em_id);
    		
    		return "redirect:./login";
    	}
		
		return "index";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPageGET() throws Exception {
		
		logger.info(" C : 로그인 페이지 이동!");
		
		return "/ez_emp/loginPage";
	}
	
	
}
