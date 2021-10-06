package com.ezform.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;
import com.ezform.service.EZ_emp_Service;

@Controller
@RequestMapping("/ez_emp/*") 
public class EZ_emp_Controller {

	private static final Logger logger =
				LoggerFactory.getLogger(EZ_emp_Controller.class);
	
	//서비스객체 주입
	@Inject
	private EZ_emp_Service emp_service;
	

	//정보수정 화면 -  수정처리전 기존정보view
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String empUpdateGET(HttpSession session, @RequestParam("em_id") int id,
								Model model) throws Exception{
		logger.info("empUpdateGET() 호출 em_id: "+id);
		
		//id 가져오기
		
		logger.info("접속em_id: "+ id);
		
		//기존회원정보 가져오기   
		//model객체에 저장, view페이지 까지 전달
		model.addAttribute("empvo",emp_service.getEmp(id));
		
		//view페이지 
		return "/ez_emp/user-update";
	}
	
	//정보수정 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String empUpdatePOST(EZ_empVO uvo) throws Exception{
		
		logger.info("empUpdatePOST() 호출 $$$");
		
		//전달정보 저장 (수정할 데이터)
		logger.info("수정할 정보: "+uvo);
		
		//service를 사용해 회원정보수정
		int result = emp_service.updateEmp(uvo);
		
		logger.info("정보수정결과: "+result);
		//페이지이동				
		logger.info(" main페이지이동(화면전환 ");
		
		return "redirect:/ez_emp/list";    //주소와 화면바뀜 redirect
	}
	
	//사원 전체리스트(관리자 기능) ---GET  
	@RequestMapping(value = "/list", method = RequestMethod.GET) 
	public String empList(HttpSession session, Model model,Model emodel) throws Exception{ 
		//
		logger.info("EmpList() 호출!");
		
		int em_id = (int) session.getAttribute("em_id");
//		id = "admin";
//		if(id == null|| id !="admin") {
//			return "redirect:/main";
//		}
		EZ_empVO empvo = emp_service.getEmp(em_id);
		// 
		model.addAttribute("empList", emp_service.getEmpList(em_id));
		
		//로그인vo(admin) 
		emodel.addAttribute("empvo", empvo);
		logger.info("회원전체목록:");
		
		return "/ez_emp/user-list";		
	}
	
	//근태처리 ---POST  
	@RequestMapping(value = "/wstatus", method = RequestMethod.POST) 
	public String empWstatus(HttpSession session,
			EZ_workVO workvo) throws Exception{
		//
		logger.info("empWstatus() 호출!");
		int em_id = (int) session.getAttribute("em_id");
		logger.info("전달된 id : "+em_id);
		
		workvo.setEm_id(em_id);
		logger.info("전달된 EZ_workVO : "+workvo);
		
		emp_service.wstatusEmp(workvo);
		
		logger.info(em_id +": 근태처리 완료!");
		
		return "redirect:/main";	
	}

	//탈퇴-처리 (POST)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String empDeletePOST(HttpSession session, EZ_empVO dvo) throws Exception{
		logger.info("memberDeletePOST() 호출!");
		
		//
		logger.info(dvo+"");
		
		//service에 탈퇴동작
		emp_service.deleteEmp(dvo);
		emp_service.deleteWork(dvo.getEm_id());
		
		// 여기서 로그인정보는 admin인데 admin session을 삭제하지 않는다	(탈퇴후 로그인정보 session삭제)
		//session.invalidate();
		
		logger.info(" 직원정보 삭제완료");
		logger.info(" 기존근태 삭제완료");
	
		return "redirect:/ez_emp/list";   //주소와 화면바뀜 redirect
	}
	
	
	
	
}
