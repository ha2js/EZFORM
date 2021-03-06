package com.ezform.controller;

import java.io.File;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
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
import com.ezform.service.EZ_noti_Service;
import com.ezform.service.EZ_bd_Service;
import com.ezform.service.EZ_emp_Service;

@Controller
public class EZ_mem_Controller {

	@Inject
	private EZ_mem_Service mem_service;
	@Inject
	private EZ_noti_Service noti_service;
	@Inject
	private EZ_bd_Service bd_service;
	@Inject
	private EZ_emp_Service emp_service;

	private static final Logger logger = LoggerFactory.getLogger(EZ_mem_Controller.class);

	// http://localhost:8088/testView/main
	// 메인페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainPageGET(Model model) throws Exception {

		System.out.println(" C : 메인페이지 이동(get)!");
		
		// 커뮤니티 리스트
		model.addAttribute("boardList", bd_service.listCri());
		// 공지사항 리스트
		model.addAttribute("notiList", noti_service.listALL());
		// 근태 리스트
		model.addAttribute("wslist", emp_service.wstatusListEmp());
		logger.info("근태 리스트 : "+emp_service.wstatusListEmp());
		
		
		
		return "index";
	}
	

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logoutGET(HttpSession session, HttpServletResponse response) throws Exception {
		
		System.out.println(" C : logoutGET() 실행");
		
		session.invalidate();
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print("<script>alert('로그아웃 되었습니다'); location.href='./login';</script>");
		out.flush();
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
			session.setAttribute("em_id", resultVO.getEm_id());
		
		}

		return "redirect:./main";
	}

	// 사원생성 - 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinPageGET() throws Exception {

		System.out.println(" C : 회원가입 페이지 이동!");

		return "/ez_mem/joinPage";
	}

	// 사원생성 - 처리
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPagePOST(MultipartHttpServletRequest multiRequest, Model model) throws Exception {

		System.out.println(" C : joinPagePOST(evo) 실행");
		
		System.out.println(" CC : em_id 값 : " + Integer.parseInt(multiRequest.getParameter("em_id")));
		
		// 사원ID 중복체크 확인
		int checkID = mem_service.checkEmpId(Integer.parseInt(multiRequest.getParameter("em_id")));
		
		System.out.println(" C: 사원ID 중복체크 확인 결과 = " + checkID);
		if(checkID == 1) {
			model.addAttribute("checkID", checkID);
		} else {
			model.addAttribute("checkID", checkID);
			
			// 해당 파일 가져오기
			MultipartFile file = multiRequest.getFile("em_image");
			
			System.out.println("파일값 : " + file.getOriginalFilename());
			 
			// 절대경로 설정
			String file_path = multiRequest.getSession().getServletContext().getRealPath("/resources/upload/mem_Image");

			EZ_empVO evo = new EZ_empVO();
			
			evo.setEm_id(Integer.parseInt(multiRequest.getParameter("em_id")));
			evo.setEm_email((String) multiRequest.getParameter("em_email"));
			evo.setEm_name((String) multiRequest.getParameter("em_name"));
			evo.setEm_pw((String) multiRequest.getParameter("em_pw"));
			evo.setEm_extension(multiRequest.getParameter("em_extension"));
			evo.setEm_dept((String) multiRequest.getParameter("em_dept"));
			evo.setEm_posi((String) multiRequest.getParameter("em_posi"));

			// 파일 업로드
			if(file.getOriginalFilename() != "") {
				
				// 중복 파일명 방지
				String uuid = UUID.randomUUID().toString();
				
				String file_newName = uuid + "_" + file.getOriginalFilename();
				file.transferTo(new File(file_path + "/" + file_newName));
				
				System.out.println("파일 업로드 완료!");
				
				evo.setEm_image(file_newName);
			}

			System.out.println(" C : 파라미터 값" + evo);

			// 회원가입하기
			mem_service.memJoin(evo);

			System.out.println(" C : 회원가입 완료 - login 페이지로 이동");
		}
		
	

		return "redirect:./join";
	}
	
	
	// 회원정보
	@RequestMapping(value = "/infoMember", method = RequestMethod.GET)
	public String mem_infoGET(HttpSession session) throws Exception {
		
		System.out.println(" C : mem_infoGET() 실행");
		
		System.out.println(" C : sessionId = " + session.getAttribute("em_id"));
		
		int em_id = (int)session.getAttribute("em_id");
		
		EZ_empVO resultVO = mem_service.memInfo(em_id);
		
		System.out.println(" C : 회원정보 조회 값 : " + resultVO);
		
		session.setAttribute("resultVO", resultVO);
		
		return "/ez_mem/infoMember";
	}
	
	
	// 회원정보 수정 GET
	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	public String mem_updateGET() throws Exception {
		
		System.out.println(" C : mem_updateGET() 실행");
		
		return "/ez_mem/updateMember";
	}
	
	// 회원정보 수정 POST
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String mem_updatePOST(MultipartHttpServletRequest multiRequest, Model model) throws Exception {
		
		System.out.println(" C : mem_updatePOST() 실행");
		
		System.out.println("기존파일 : " + multiRequest.getParameter("default_file"));
		
		String em_image = "";
		
		// 해당 파일 가져오기
		MultipartFile file = multiRequest.getFile("em_image");
		
		if(file.getOriginalFilename() == "") {
			System.out.print("11 : 기존파일이 넣기");
			em_image = multiRequest.getParameter("default_file");
		} else {
			System.out.print("11 : 변경파일이 넣기");
			
			// 절대경로 설정
			String file_path = multiRequest.getSession().getServletContext().getRealPath("/resources/upload/mem_Image");

			// 중복 파일명 방지
			String uuid = UUID.randomUUID().toString();

			// 파일 업로드
			em_image = uuid + "_" + file.getOriginalFilename();
			
			file.transferTo(new File(file_path + "/" + em_image));
				
			// 기존 파일 삭제
			File f = new File(file_path + "/" + multiRequest.getParameter("default_file"));
			if(f.exists()) {
				f.delete();
			}
		}
	
		
		EZ_empVO evo = new EZ_empVO();

		evo.setEm_id(Integer.parseInt((String)multiRequest.getParameter("em_id")));
		evo.setEm_email((String) multiRequest.getParameter("em_email"));
		evo.setEm_name((String) multiRequest.getParameter("em_name"));
		evo.setEm_pw((String) multiRequest.getParameter("em_pw"));
		evo.setEm_extension(multiRequest.getParameter("em_extension"));
		evo.setEm_dept((String) multiRequest.getParameter("em_dept"));
		evo.setEm_posi((String) multiRequest.getParameter("em_posi"));
		evo.setEm_image(em_image);

		System.out.println(" C : 파라미터 값" + evo);
		
		int result = mem_service.memUpdate(evo);
		
		System.out.println(" C : result 결과 = " + result);
		model.addAttribute("updateMem_result", result);
		
		return "redirect:./infoMember";
	}
	
	// 회원탈퇴 GET
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String mem_deleteGET(Model model) throws Exception {
		
		System.out.println(" C : mem_deleteGET() 실행");
		
		// 가입된 모든 회원 리스트 가져오기
		List<EZ_empVO> listEmp = mem_service.memList();
		
		model.addAttribute("listEmp", listEmp);
		
		return "/ez_mem/deleteMember";
	}
	
	
	// 회원탈퇴 POST
	@RequestMapping(value = "/deleteMember", method = RequestMethod.POST)
	public String mem_deletePOST(MultipartHttpServletRequest multiRequest, HttpSession session, Model model) throws Exception {
		
		System.out.println(" C : mem_deletePOST() 실행");
		
		EZ_empVO evo = new EZ_empVO();
		
		evo.setEm_id(Integer.parseInt((String)multiRequest.getParameter("em_id")));
		evo.setEm_email((String) multiRequest.getParameter("em_email"));
		evo.setEm_pw((String) multiRequest.getParameter("em_pw"));
		evo.setEm_image((String)multiRequest.getParameter("default_file"));
		
		System.out.println(" C: 회원탈퇴 시 사원 값 = " + evo);
		
		int result = mem_service.memDelete(evo);
	
		// 회원탈퇴 결과 완료 시
		if(result == 1) {
			// 기존 회원 이미지 파일 삭제
			String file_path = multiRequest.getSession().getServletContext().getRealPath("/resources/upload/mem_Image");
			File f = new File(file_path + "/" + multiRequest.getParameter("default_file"));
			if(f.exists()) {
				f.delete();
			}
		}
		
		System.out.println(" C : 회원탈퇴 결과 = " + result);
	
		model.addAttribute("deleteMem_result", result);
			
		return "redirect:./deleteMember";

	}

}
