package com.ezform.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezform.domain.EZ_empVO;
import com.ezform.service.EZ_mem_Service;

@Controller
public class EZ_mem_Controller {

	@Inject
	EZ_mem_Service mem_service;

	private static final Logger logger = LoggerFactory.getLogger(EZ_mem_Controller.class);

	// http://localhost:8088/testView/main
	// 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGET(HttpSession session) throws Exception {

		System.out.println(" C : 메인페이지 이동(get)!");

		return "index";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpSession session) throws Exception {
		
		System.out.println(" C : logoutGET() 실행");
		
		session.invalidate();
		
		return "redirect:./login";
		
	}
	
	
	
	// 로그인 - 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPageGET() throws Exception {

		System.out.println(" C : 로그인 페이지 이동!");

		return "/ez_mem/loginPage";
	}

	// 로그인 - 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPagePOST(EZ_empVO evo, HttpSession session, Model model) throws Exception {

		System.out.println(" C : loginPagePOST() 실행!");

		// DB에 이메일이 존재하는지 확인

		System.out.println(" 로그인 : 아디, 패스워드 확인 : " + evo);

		System.out.println(" C : 서비스로 이동(memLogin())");
		List loginList = mem_service.memLogin(evo);

		EZ_empVO resultVO = (EZ_empVO) loginList.get(0);
		int result = (int) loginList.get(1);

		// result 결과 = (-2 : 이메일존재X) / (-1 : 패스워드 오류) / (0 : null) / (1 : 로그인 성공)
		
		System.out.println(" C : 결과 값(resultVO) = " + resultVO);
		System.out.println(" C : 결과 값(result) = " + result);

		// 로그인 결과값
		session.setAttribute("result", result);

		if (resultVO != null) {
			// 회원정보 세션처리
			session.setAttribute("resultVO", resultVO);
		}

		return "redirect:./main";
	}

	// 회원가입 - 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinPageGET() throws Exception {

		System.out.println(" C : 회원가입 페이지 이동!");

		return "/ez_mem/joinPage";
	}

	// 회원가입 - 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPagePOST(MultipartHttpServletRequest multiRequest) throws Exception {

		System.out.println(" C : joinPagePOST(evo) 실행");

		// 회원ID 만들기(임시 : 카운트값으로 그냥 1~ 올리는 식으로 사용)
		int em_id = mem_service.madeEmpID();
		System.out.println(" C : 회원ID 값 - " + em_id);

		// 해당 파일 가져오기
		MultipartFile file = multiRequest.getFile("em_image");

		// 절대경로 설정
		String file_path = multiRequest.getSession().getServletContext().getRealPath("/resources/upload/emp_files");

		// 중복 파일명 방지
		String uuid = UUID.randomUUID().toString();

		// 파일 업로드
		String file_newName = uuid + "_" + file.getOriginalFilename();
		
		file.transferTo(new File(file_path + "/" + file_newName));

		System.out.println("파일 업로드 완료!");

		EZ_empVO evo = new EZ_empVO();

		evo.setEm_id(em_id);
		evo.setEm_email((String) multiRequest.getParameter("em_email"));
		evo.setEm_name((String) multiRequest.getParameter("em_name"));
		evo.setEm_pw((String) multiRequest.getParameter("em_pw"));
		evo.setEm_extension(multiRequest.getParameter("em_extension"));
		evo.setEm_dept((String) multiRequest.getParameter("em_dept"));
		evo.setEm_posi((String) multiRequest.getParameter("em_posi"));
		evo.setEm_image(file_newName);

		System.out.println(" C : 파라미터 값" + evo);

		// 회원가입하기
		mem_service.memJoin(evo);

		System.out.println(" C : 회원가입 완료 - login 페이지로 이동");

		return "redirect:./login";
	}
	
	
	// 회원정보 수정
	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	public String mem_updateGET(HttpSession session) throws Exception {
		
		System.out.println(" C : mem_updateGET() 실행");
		
		return "/ez_mem/mem_update";
	}
	
	

}
