package com.ezform.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_noticeVO;
import com.ezform.service.EZ_noti_Service;
import com.ezform.test.testController;

@Controller
@RequestMapping("/ez_notice/*")
public class EZ_noti_Controller {
	
	@Inject
	private EZ_noti_Service service;
	
	private static final Logger logger =
			LoggerFactory.getLogger(testController.class);
	
	// 관리자가 여러 계정 존재해도 배열값만 넣어주면 제어 가능하도록 처리
	private static int[] adminInfo = {9999};
	
	// 관리자인지 체크
	static boolean adminChk(int chkAdmin) {
		boolean isAdmin = false;
		for (int i=0; i<adminInfo.length; i++) {
			if (chkAdmin == adminInfo[i]) {
				isAdmin = true;
				break;
			}
		}
		return isAdmin;
	}
	
	// 공지사항 글쓰기(GET)
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String registerGET(HttpSession session) throws Exception{
		logger.info("notice - registerGET() 호출");
		
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		if (evo == null) return "redirect:/logout";
				
		int chkAdmin = evo.getEm_id();
		
		// 관리자인지 확인
		boolean isAdmin = adminChk(chkAdmin);
		
		if (!isAdmin) return "redirect:/ez_notice/listAll";
		else return "/ez_notice/register";
	}
	
	// 공지사항 글쓰기(POST)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void registerPOST(EZ_noticeVO vo, Model model, HttpServletResponse response, HttpServletRequest request, HttpSession session) throws Exception{
		
		logger.info("notice - registerPOST() 호출");
		
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		
		int chkAdmin = evo.getEm_id();
		boolean isAdmin = adminChk(chkAdmin);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (!isAdmin) {
			out.print("<script>alert('권한이 없습니다'); history.back();</script>");
			out.flush();
		}
		
		else {
			// 파일 업로드 처리
			String not_file = null;
			MultipartFile uploadFile = vo.getUploadFile();
			
			if(!uploadFile.isEmpty()) {
				String originalFileName = uploadFile.getOriginalFilename();
				String ext = FilenameUtils.getExtension(originalFileName);
				UUID uuid = UUID.randomUUID();
				not_file = uuid+"."+ext;
				
				String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
				path += "upload\\noticeUpload\\";
				
				String temp_path = path+not_file;
				
				logger.info("파일명 : "+not_file);
				logger.info("path : "+temp_path);
				uploadFile.transferTo(new File(temp_path));
			}
			
			vo.setNot_id(chkAdmin);
			vo.setNot_file(not_file);
			service.regist(vo);
					
			out.print("<script>alert('등록 완료'); location.href='/test/ez_notice/listAll';</script>");
			out.flush();
		}
	}
	
	// 공지사항 글 조회
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listALLGET(Model model, HttpSession session) throws Exception {
		logger.info("notice - listALLGET() 호출");
		
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		
		int chkAdmin = evo.getEm_id();
		
		// 관리자인지 확인
		boolean isAdmin = adminChk(chkAdmin);
		
		if (isAdmin) model.addAttribute("admin", "admin");
		
		model.addAttribute("noticeList", service.listALL());
	}
	
	// 공지사항 글 읽기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(Model model, @RequestParam("not_num") int not_num, HttpSession session) throws Exception {
		logger.info("notice - readGET() 호출! ");
		
		EZ_noticeVO vo = service.read(not_num);
		
		model.addAttribute("vo",vo);
		
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		
		int chkAdmin = evo.getEm_id();
		
		// 관리자인지 확인
		boolean isAdmin = adminChk(chkAdmin);
		
		if (isAdmin) model.addAttribute("admin", "admin");
	}
	
	@RequestMapping(value="/filedown", method=RequestMethod.GET)
	public void mail_fileDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파일 다운로드
		
		logger.info("notice_fileDown() 호출");
		
		String fileName = request.getParameter("fileName");
		String realFileName = "";
		
		logger.info("파일명 : "+fileName);
		
		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
			}
			else {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
		} catch(UnsupportedEncodingException ex) {
			logger.info("UnsupportedEncodingException");
		}
		
		String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
		path += "upload\\noticeUpload\\";
		
		realFileName = path+fileName;
		logger.info("절대 경로 : "+realFileName);
		
		File tmpFile = new File(realFileName);
		
		if (!tmpFile.exists()) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('다운로드 오류! 관리자에게 문의하세요'); location.href='/test/ez_notice/listAll';</script>");
			out.flush();
		}
			
		// 파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFileName);
			
			int Ncnt = 0;
			byte[] bytes = new byte[512];
			
			while ((Ncnt = fis.read(bytes)) != -1) {
				os.write(bytes,0,Ncnt);
			}
			
			fis.close();
			os.close();
			
		} catch (Exception e) {
			logger.info("FileNotFoundException : "+e);
		}
	}
	
	// 공지사항 글 수정(GET) - DB에서 가져온 정보를 화면에 출력
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int not_num, Model model) throws Exception {
		logger.info(" modifyGET() 호출 ");
			
		model.addAttribute("nvo",service.read(not_num));
	}
	
	// 공지사항 글 수정(POST)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modifyPOST(EZ_noticeVO vo, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		logger.info(" modifyPOST() 호출 ");
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		
		int chkAdmin = evo.getEm_id();
		boolean isAdmin = adminChk(chkAdmin);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (!isAdmin) {
			out.print("<script>alert('권한이 없습니다'); history.back();</script>");
			out.flush();
		}
		
		else {
			// 파일 업로드 처리
			String not_file = null;
			MultipartFile uploadFile = vo.getUploadFile();
			
			if(!uploadFile.isEmpty()) {
				String originalFileName = uploadFile.getOriginalFilename();
				String ext = FilenameUtils.getExtension(originalFileName);
				UUID uuid = UUID.randomUUID();
				not_file = uuid+"."+ext;
				
				String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
				path += "upload\\noticeUpload\\";
				
				String temp_path = path+not_file;
				
				logger.info("파일명 : "+not_file);
				logger.info("path : "+temp_path);
				uploadFile.transferTo(new File(temp_path));
			}
			vo.setNot_file(not_file);
			service.modify(vo);
			
			out.println("<script>alert('수정 완료'); location.href='/test/ez_notice/listAll';</script>");
			out.flush();
		}
		
	}	
	
	// 공지사항 글 삭제하기
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST(Integer not_num) throws Exception{
		
		logger.info(" deletePOST() 호출 ");
		
		service.remove(not_num);
		
		logger.info(" 서비스 처리(삭제) 완료! ");
		
		return "redirect:/ez_notice/listAll";
	}
	
}
