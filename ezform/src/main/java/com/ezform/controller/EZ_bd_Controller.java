package com.ezform.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezform.domain.EZ_boardVO;
import com.ezform.service.EZ_bd_Service;

@Controller
@RequestMapping("/board/*")
public class EZ_bd_Controller {
	
	@Inject
	private EZ_bd_Service service;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EZ_bd_Controller.class);
	
	// * 글쓰기 *
	// http://localhost:8088/board/register
	// 글쓰기 (GET)
	@RequestMapping(value ="/register", method= RequestMethod.GET)
	public void registerGET() throws Exception{
		logger.info("registerGET() 호출"); 
	}
	
	// 글쓰기 (POST)
	@RequestMapping(value= "/register", method = RequestMethod.POST)
	public String registerPOST(EZ_boardVO vo,RedirectAttributes rttr) throws Exception {
		logger.info("registerPOST() 호출");
	
	// 서비스 객체를 주입 -> 동작 호출
	service.regist(vo);
	
	// 정보 저장 -> 전달
	rttr.addFlashAttribute("","");
	
	// 페이지 이동
	return "redirect:/board/listAll";
	}
	
	// http://localhost:8088/board/listAll
	// * 글 전체 조회* 
	@RequestMapping(value = "/listAll", method=RequestMethod.GET)
	public void listAllGET(Model model,@ModelAttribute("result") String result)throws Exception{
		logger.info("listGET() 호출");

	// DB정보 -> view페이지	
	model.addAttribute("boardList", service.listALL());
	
	}
	
	//http://localhost:8088/board/read
	// * 글읽기(read) *
	@RequestMapping(value ="/read",method = RequestMethod.GET)
	public void readGET(@RequestParam("cm_bnum")int cm_bnum,Model model) throws Exception{
		logger.info("readGET() 호출");
	
		// 전달된 정보저장
		logger.info(" 전달된 정보(cm_bum) : "+cm_bnum);
	
	// 서비스 객체
	EZ_boardVO vo = service.read(cm_bnum);
	
	// DB정보 -> 저장
	model.addAttribute("vo", vo);
	}
	
	// * 글수정 (modify) *
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(EZ_boardVO vo) throws Exception{
		logger.info("modifyPOST(EZ_boardVO vo) 호출");
	
	// 서비스
	service.modify(vo);

	// 페이지 이동
	return "redirect:/listAll";
		
	}

	// * 글삭제 (remove) *
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String removePOST(Integer cm_bnum) throws Exception{
		logger.info("removePOST(Integer cm_bnum) 호출");
		
	// 서비스
	service.remove(cm_bnum);

	// 페이지 이동
	return "redirect:/listAll";
	
	}

}
