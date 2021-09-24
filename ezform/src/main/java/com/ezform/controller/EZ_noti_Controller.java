package com.ezform.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezform.domain.EZ_noticeVO;
import com.ezform.service.EZ_noti_Service;

@Controller
@RequestMapping("/notice/*")
public class EZ_noti_Controller {
	
	@Inject
	private EZ_noti_Service service;
	
	private static final Logger logger =
			LoggerFactory.getLogger(EZ_noti_Controller.class);
	
	//공지사항 글쓰기(GET)
	//http://localhost:8088/notice/register
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public void registerGET() throws Exception{
		logger.info("registerGET() 호출 -> view 페이지 이동");
	}
	
	//공지사항 글쓰기(POST)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(EZ_noticeVO vo, RedirectAttributes rttr) throws Exception{
		
		logger.info("registerPOST() 호출");
		
		logger.info("정보전달 저장"+vo);
		
		// 파일 업로드 처리
		String not_file = null;
		
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			
			String ext = FilenameUtils.getExtension(originalFileName);
		}
		
		
		
		
		service.regist(vo);
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/notice/listAll";
	}
	
	
	// 공지사항 글 조회
	//http://localhost:8088/notice/listAll
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listALLGET(Model model, @ModelAttribute("result") String result) throws Exception {
		logger.info(" listALLGET() 호출 -> view 페이지 이동 ");
		logger.info("페이지 처리 결과 : "+result);
		model.addAttribute("noticeList", service.listALL());
		
	}
	
	// 공지사항 글 읽기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(Model model, @RequestParam("not_num") int not_num ) throws Exception {
		logger.info(" readGET() 호출! ");
		
		logger.info(" 전달된 정보(not_num) : "+not_num);
		
		EZ_noticeVO vo = service.read(not_num);
		
		model.addAttribute("vo",vo);
		
		
	}
	
	// 공지사항 글 수정(GET) - DB에서 가져온 정보를 화면에 출력
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int not_num, Model model) throws Exception {
		logger.info(" modifyGET() 호출 ");
		
		logger.info(" 수정 할 글 번호 : " + not_num);
		
		model.addAttribute("nvo",service.read(not_num));
		
	}
	
	// 공지사항 글 수정(POST)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(EZ_noticeVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info(" modifyPOST() 호출 "+vo);
		
		service.modify(vo);
		
		logger.info(" 서비스 처리(수정) 완료! ");
		
		return "redirect:/notice/listAll";
	}
	
	// 공지사항 글 삭제하기
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST(Integer not_num) throws Exception{
		
		logger.info(" deletePOST() 호출 ");
		
		service.remove(not_num);
		
		logger.info(" 서비스 처리(삭제) 완료! ");
		
		return "redirect:/notice/listAll";
	}
	
	
	
	
	
	
	
	
	
	
}
