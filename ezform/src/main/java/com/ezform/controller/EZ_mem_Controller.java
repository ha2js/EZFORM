package com.ezform.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezform.domain.EZ_empVO;
import com.ezform.service.EZ_mem_Service;


@Controller
public class EZ_mem_Controller {
	
	@Inject
	EZ_mem_Service mem_service;
	
	private static final Logger logger = LoggerFactory.getLogger(EZ_mem_Controller.class);

	// http://localhost:8088/test/main
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
		
	// 로그인 - 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPageGET() throws Exception {
		
		logger.info(" C : 로그인 페이지 이동!");
		
		return "/ez_emp/loginPage";
	}
	
	// 로그인 - 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPagePOST() throws Exception {
		
		logger.info(" C : loginPagePOST() 실행!");
		
		// DB에 이메일이 존재하는지 확인
		
		// 존재하면 비밀번호 체크 후 로그인
		// 존재하지 않는다면 회원가입페이지로 이동
		
		return "";
	}

	
	// 회원가입 - 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinPageGET() throws Exception {
		
		logger.info(" C : 회원가입 페이지 이동!");
		
		return "/ez_emp/joinPage";
	}
	
	 // 회원가입 - 처리
	 
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPagePOST(EZ_empVO evo) throws Exception {
	
		logger.info(" C : joinPagePOST(evo) 실행");	 
		logger.info(" C : empVO 값 : " + evo);
	  
		mem_service.memJoin(evo);
		
		logger.info(" C : 회원가입 완료 - login 페이지로 이동");
		
	 	return ""; 
	}
		
}
