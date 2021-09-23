package com.ezform.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

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
		String mail_id = "test@ezform.com";
		cri.setMail_id(mail_id);
		
		// 수신 메일 list
		model.addAttribute("mailList",service.mailList(cri));
		
		int mail_cnt = service.recMailCnt(mail_id);		
		
		EZ_mail_pageMarker mpm = new EZ_mail_pageMarker();
		mpm.setCri(cri);
		mpm.setTotalCount(mail_cnt);
		
		model.addAttribute("mpm",mpm);
		
	}
	
	@RequestMapping(value="/sendMail", method = RequestMethod.GET)
	public void read_SendMailGET() throws Exception {
		//  보낸 메일
	}
	
	@RequestMapping(value="/emp_select", method = RequestMethod.GET)
	public void emp_selectGET() throws Exception {
		logger.info("emp_selectGET() 호출");
	}
	
	@RequestMapping(value="/writeMail", method = RequestMethod.GET)
	public void mailWriteGET() throws Exception {
		// 메일 쓰기
		logger.info("mailWriteGET() 호출");
	}
	
	@RequestMapping(value="/writeMail", method = RequestMethod.POST)
	public void mailWritePOST(EZ_mailVO vo, Model model, HttpServletResponse response) throws Exception {
		// 메일 쓰기		
		logger.info("mailWritePOST() 호출");
		
		// 임시로 -> 세션 값 불러와서 테스트 (EZ_empVO resultVO)
		// 보내는 사람
		String mail_email = "ha2js@ezform.com";
		vo.setMail_email(mail_email);
		
		// 보내는 이메일 주소가 em 테이블에 있는지 검사
		boolean check = service.sendEmailCk(vo.getMail_id());
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (!check) {
			out.print("<script>alert('해당 이메일 주소가 존재하지 않습니다'); location.href='/test/ez_mail/writeMail'</script>");
			out.flush();
		}
		else {
			// 메일 보내기
			service.mailWrite(vo);
			
			// alert
			out.println("<script>alert('전송 완료'); location.href='/test/ez_mail/recMail'</script>");
			out.flush();
		}
	}
	
}
