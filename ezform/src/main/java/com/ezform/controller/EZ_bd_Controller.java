package com.ezform.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezform.domain.EZ_boardVO;
import com.ezform.domain.EZ_board_comVO;
import com.ezform.service.EZ_bd_Service;
import com.ezform.service.EZ_bdcom_Service;
import com.ezform.test.testController;

@Controller
@RequestMapping("/reply/*")
public class EZ_bdcom_Controller {
	
	private static final Logger logger = 
					LoggerFactory.getLogger(testController.class);

	@Inject
	public EZ_bdcom_Service ReplyService;
	
	@Inject
	private EZ_bd_Service service;

	// 댓글 작성
	@RequestMapping(value= "/write", method=RequestMethod.POST)
	public String postWritePOST(EZ_board_comVO vo) throws Exception{
		
		
		ReplyService.write(vo);
		
		return "redirect:/board/read?com_bnum=" + vo.getCom_bnum();
		
		
	}

	
}