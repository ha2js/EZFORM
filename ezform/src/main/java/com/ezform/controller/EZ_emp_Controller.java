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

@Controller
public class EZ_emp_Controller {
	
	@Inject
	EZ_emp_Service emp_service;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	
	// 회원정보 조회 (/ezform/info)
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String infoPageGET(HttpSession session, Model model) throws Exception {
		logger.info(" C : infoPageGET() 실행 ");
		
		String em_id = (String)session.getAttribute("em_id");
		
		EZ_empVO evo = emp_service.getEmp(em_id);
		
		model.addAttribute("evo", evo);
		return "/ez_emp/infoPage";
		
	}
	
	// 회원 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPageGET(HttpSession session, Model model) throws Exception {
		logger.info(" C : listPageGET() 실행 ");
		
		String em_id = (String)session.getAttribute("em_id");
		session.setMaxInactiveInterval(7200); // 자리비움시 세션삭제
		if(em_id != "20210420") { // 관리자 아이디 확인하기
			return "redirect:./login";
		}
		List empList = emp_service.getEmpList(Integer.parseInt(em_id));
		model.addAttribute("empList", empList);
		
		return "ez_emp/listPage";	
	}
	
	
}
