package com.ezform.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezform.domain.EZ_empVO;
import com.ezform.service.EZ_emp_Service;
import com.ezform.test.testController;

@RequestMapping("/ez_emp/*")
@Controller
public class EZ_emp_Controller {
	
	@Inject
	private EZ_emp_Service service;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	
	// 회원정보 조회 ( http://localhost:8088/test/ez_emp/info )
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String infoPageGET(HttpSession session, Model model) throws Exception {
		logger.info(" C : emp_infoPageGET() 실행 ");
		
		String em_id = (String)session.getAttribute("em_id");
		
		EZ_empVO evo = service.getEmp(em_id);
		
		model.addAttribute("evo", evo);
		return "/ez_emp/infoPage";
		
	}
	
	// 회원 목록 ( http://localhost:8088/test/ez_emp/list )
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPageGET(HttpSession session, Model model) throws Exception {
		logger.info(" C : emp_listPageGET() 실행 ");
		
		String em_id = (String)session.getAttribute("em_id");
		session.setMaxInactiveInterval(7200); // 자리비움시 세션삭제
//		if(em_id != "20210420") { // 관리자 아이디 확인하기
//			return "redirect:./login";
//		}
		List empList = service.empList(Integer.parseInt(em_id));
		model.addAttribute("empList", empList);
		
		return "/ez_emp/listPage";			
	}
	
}
