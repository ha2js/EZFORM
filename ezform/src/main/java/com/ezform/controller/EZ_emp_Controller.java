package com.ezform.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;
import com.ezform.service.EZ_emp_Service;
import com.ezform.test.testController;


@Controller
@RequestMapping("/emp/*")
public class EZ_emp_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	// 서비스 객체 주입
	@Inject
	private EZ_emp_Service emp_service;
	
	// 가입폼 ---GET    정보입력페이지
	// localhost:8088/emp/joins
	@RequestMapping(value = "/joins", method = RequestMethod.GET) 
	public String empJoinGET() throws Exception{
		logger.info("EmpJoinGET() 호출!");
		logger.info("회원가입 페이지 이동!");
			
		return "/dashboard/auth/sign-up";		
	}
	
	// 직원가입 처리 ---POST  
	@RequestMapping(value = "/joins", method = RequestMethod.POST) 
	public String empJoinPOST(EZ_empVO vo) throws Exception{
		//
		logger.info("EmpJoinPOST() 호출!");
		logger.info("전달된 객체(vo) : "+vo);
		
		emp_service.joinEmp(vo);
		
		logger.info("직원생성 성공");
		// logger.info("로그인 페이지 이동!");
		
		return "redirect:/emp/list";			
	}
	
	
	
	// 로그인 form 페이지 호출
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String empLoginGET() throws Exception{
		logger.info("EmpLoginGET()호출");
			
		return "/dashboard/auth/sign-in";		
	}
	
	// 로그인체크!
	// 2) 입력받은 정보 처리(DB)    
	//   login시 입력받은 (id,pass)jsp페이지정보에 session도 같이 온다.
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String empLoginPOST(EZ_empVO vo, EZ_workVO wvo,
								HttpSession session, Model model) throws Exception{
		logger.info("EmpLoginPOST()호출 vo: "+vo);
			
		//로그인체크
		EZ_empVO loginResultVO = emp_service.loginCheck(vo);
			
		logger.info(""+loginResultVO);
		logger.info(""+vo.getEm_dept());
			
			// 로그인 실패  
			// => 주소이동 redirect
			if(loginResultVO == null) {
				return "redirect:/emp/login";
			}
			
		// 로그인 ok
		// -> 세션정보id를 저장, 메인페이지 이동
		// 세션정보 저장 (여기서는 jsp가아니므로 request객체가 없다.)
		session.setAttribute("em_id", loginResultVO.getEm_id());
		logger.info("session에 id정보 저장완료: "+loginResultVO.getEm_id());
			
		// vo에는 login시 입력받은 (id,pass)만 있으므로 전체vo를 가져오기위해
		session.setAttribute("empvo", emp_service.getEmp(vo.getEm_id()));
			
		// 근태 리스트
		// model.addAttribute("wslist", emp_service.wstatusListEmp());
					
		return "redirect:/main";	// 요청주소변경 		
	}
	
	
	
	// 정보수정 화면 -  수정처리전 기존정보view
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String empUpdateGET(HttpSession session, @RequestParam("em_id") int id,
								Model model) throws Exception{
		logger.info("empUpdateGET() 호출 em_id: "+id);
			
		// id 가져오기
			
		logger.info("접속em_id: "+ id);
			
		// 기존회원정보 가져오기   
		// model객체에 저장, view페이지 까지 전달
		model.addAttribute("empvo",emp_service.getEmp(id));
			
		// view페이지 
		return "/dashboard/auth/updateForm";
	}
		
	// 정보수정 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String empUpdatePOST(EZ_empVO uvo) throws Exception{
			
		logger.info("empUpdatePOST() 호출 $$$");
		
		// 전달정보 저장 (수정할 데이터)
		logger.info("수정할 정보: "+uvo);
		
		// service를 사용해 회원정보수정
		int result = emp_service.updateEmp(uvo);
			
		logger.info("정보수정결과: "+result);
		// 페이지이동				
		logger.info(" main페이지이동(화면전환) ");
			
		return "redirect:/emp/list";    // 주소와 화면바뀜 redirect
	}
	
	
	
	// 사원 전체리스트(관리자 기능) --- GET  
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
		
		// 로그인vo (admin) 
		emodel.addAttribute("empvo", empvo);
		logger.info("회원전체목록:");
		
		return "/dashboard/app/user-list";		
	}
	
	
	
	// 근태처리 --- POST  
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
	
	
	
	// logout처리
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session) throws Exception{
		logger.info("logoutGET()호출 !!!");
		// 로그아웃 버튼클릭시 session정보가 같이 온다
		// 로그아웃 처리  - 세션값 초기화
		session.invalidate();
		return "redirect:/main";			
//		return "./logout";    			// 주소는 그대로, logout.jsp페이지를 보여준다.
//		return "redirect:./logout";	// 주소가 이동		
		//redirect: <=> URL: http://localhost:8080/
	}
	
	
	// 탈퇴-처리 (POST)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String empDeletePOST(HttpSession session, EZ_empVO dvo) throws Exception{
		logger.info("memberDeletePOST() 호출!");
		
		//
		logger.info(dvo + "");
		
		// service에 탈퇴동작
		emp_service.deleteEmp(dvo);
		emp_service.deleteWork(dvo.getEm_id());
		
		// 여기서 로그인정보는 admin인데 admin session을 삭제하지 않는다	(탈퇴후 로그인정보 session삭제)
		// session.invalidate();
		
		logger.info(" 직원정보 삭제완료");
		logger.info(" 기존근태 삭제완료");
	
		return "redirect:/emp/list";   // 주소와 화면바뀜 redirect
	}				
		
}