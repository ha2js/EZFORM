package com.ezform.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezform.domain.EZ_mailCri;
import com.ezform.domain.EZ_mailVO;
import com.ezform.domain.EZ_mail_pageMarker;
import com.ezform.service.EZ_mail_Service;
import com.ezform.test.testController;


@Controller
@RequestMapping("/ez_mail/*")
public class EZ_mail_Controller {
	
	@Inject
	private EZ_mail_Service service;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	// http://localhost:8088/test/ez_mail/recMail
	@RequestMapping(value="/recMail", method = RequestMethod.GET)
	public void read_RecMailGET(EZ_mailCri cri, Model model) throws Exception {
		//  받은 메일
		logger.info("read_RecMailGET() 호출");
		
		// 임시로 -> 세션 값 불러와서 테스트 (EZ_empVO resultVO)
		cri.setMail_id("test@ezform.com");
		
		// service -> dao
		
		model.addAttribute("mailList",service.mailList(cri));
		
		EZ_mail_pageMarker mpm = new EZ_mail_pageMarker();
		mpm.setCri(cri);
		mpm.setTotalCount(3); // 임시로 3 -> db 접근 -> count(*)
		
		model.addAttribute("mpm",mpm);
		
	}
	
	@RequestMapping(value="/sendMail", method = RequestMethod.GET)
	public void read_SendMailGET() throws Exception {
		//  보낸 메일
	}
	
	@RequestMapping(value="/writeMail", method = RequestMethod.GET)
	public void mailWriteGET() throws Exception {
		// 메일 쓰기
	}
	
}
