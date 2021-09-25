package com.ezform.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezform.domain.EZ_boardCri;
import com.ezform.domain.EZ_boardVO;
import com.ezform.domain.EZ_board_PageMaker;
import com.ezform.service.EZ_bd_Service;
import com.ezform.test.testController;

@Controller
@RequestMapping("/board/*")
public class EZ_bd_Controller {
	
	@Inject
	private EZ_bd_Service service;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(testController.class);
	
	// * 글쓰기 *
	
	// http://localhost:8088/test/board/register
	// http://localhost:8088/test/board/listPage
	// 글쓰기 (GET)
	
	  @RequestMapping(value ="/register", method= RequestMethod.GET) 
	  public void registerGET() throws Exception { 
		  logger.info("registerGET() 호출"); 
	  }
		
	  // 글쓰기 (POST)
		 
	  @RequestMapping(value= "/register", method = RequestMethod.POST) 
	  public String registerPOST(EZ_boardVO vo) throws Exception {
		  logger.info("registerPOST() 호출"); 
		  logger.info(vo+""); 
			
		  //String cm_name = "admin";
		  //vo.setCm_name(cm_name);
		
		  // 서비스 객체를 주입 -> 동작 호출
		
		  service.create(vo);
		
	
		  // 페이지 이동
		  return "redirect:/board/listPage";
	  }
	
	
	//http://localhost:8088/test/board/read
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
	
	// 글수정 GET - DB에서 가져온 정보를 화면에 출력
	@RequestMapping(value="/modify", method= {RequestMethod.GET})
	public void modifyGET(int cm_bnum, Model model) throws Exception {
		logger.info("modifyGET() 호출");
		logger.info("수정할 글 번호 : "+cm_bnum);
		
		model.addAttribute("vo", service.read(cm_bnum));
		
	}
	
	// * 글수정 POST (modify) *
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
		service.delete(cm_bnum);
	
		// 페이지 이동
		return "redirect:/listAll";
	
	}
	
	// http://localhost:8088/test/board/listPage
	@RequestMapping(value= "/listPage", method= RequestMethod.GET)
	public void listPageGET(EZ_boardCri cri,Model model) throws Exception {
	
		//Criteria 객체정보 저장(pageStart/pageSize)
		model.addAttribute("boardList", service.listCri(cri));
		
		// 페이징처리 정보생성(하단부)
		EZ_board_PageMaker pm = new EZ_board_PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(150); // 이 부분 150에서 현재 cm 테이블에 있는 데이터 개수를 불러오는 동작으로 바꾸셔야 돼요
		
		model.addAttribute("pm", pm);
	}
	
}
