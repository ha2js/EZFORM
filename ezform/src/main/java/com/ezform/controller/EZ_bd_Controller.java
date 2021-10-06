package com.ezform.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezform.domain.EZ_boardVO;
import com.ezform.domain.EZ_board_comVO;
import com.ezform.domain.EZ_empVO;
import com.ezform.domain.ez_cm_likeVO;
import com.ezform.service.EZ_bd_Service;
import com.ezform.service.EZ_bdcom_Service;
import com.ezform.test.testController;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping("/board/*")
public class EZ_bd_Controller {

	@Inject
	private EZ_bd_Service service;

	@Inject
	private EZ_bdcom_Service ReplyService;

	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	// 목록
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPageGET(Model model) throws Exception {

		logger.info("listPageGET() 호출");

		// list
		model.addAttribute("boardList", service.listCri());
	}

	// * 글쓰기 *
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("registerGET() 호출");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void registerPOST(EZ_boardVO vo, Model model, HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws Exception {
		
		logger.info("registerPOST() 호출");

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		if (evo == null) {
			out.print("<script>location.href='/ezform/logout';</script>");
			out.flush();
		}
		
		// 사원번호, 부서명, 이름
		vo.setCm_id(evo.getEm_id());
		vo.setCm_dname(evo.getEm_dept());
		vo.setCm_name(evo.getEm_name());

		String cm_file = null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			cm_file = uuid + "." + ext;

			// 절대경로
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "upload\\boardUpload\\";

			String temp_path = path + cm_file;

			logger.info("파일명 : " + cm_file);
			logger.info("path : " + temp_path);
			uploadFile.transferTo(new File(temp_path));

		}
		vo.setCm_file(cm_file);

		// 서비스 객체를 주입 -> 동작 호출
		service.create(vo);

		out.print("<script>alert('등록 완료'); location.href='/ezform/board/listPage';</script>");
		out.flush();
	}

	// http://localhost:8088/ezform/board/read
	// * 글읽기(read) *
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(@RequestParam("cm_bnum") int cm_bnum, @RequestParam(value = "nohit", required = false) String hit_chk, Model model, HttpSession session) throws Exception {
		
		logger.info("readGET() 호출");
		
		// 세션
		EZ_empVO evo = (EZ_empVO) session.getAttribute("resultVO");
		
		// DB정보 -> 저장
		if (hit_chk == null) 
			model.addAttribute("vo", service.read_hit(cm_bnum));
		else
			model.addAttribute("vo",service.read_nohits(cm_bnum));
		

		// 댓글 조회
		model.addAttribute("replyList", ReplyService.list(cm_bnum));
		
		// 작성자 본인인지 확인 (삭제 버튼 처리)
		model.addAttribute("isWriter",evo.getEm_id());
	}

	// *글수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("cm_bnum") int cm_bnum, Model model, HttpSession session) throws Exception {
		
		logger.info("modifyGET() 호출");
		
		model.addAttribute("vo", service.read_nohits(cm_bnum));
	}

	// * 글수정(POST)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modifyPOST(EZ_boardVO vo, HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		logger.info("modifyPOST() 호출");

		// 세션
		EZ_empVO evo = (EZ_empVO) session.getAttribute("resultVO");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (evo == null) {
			out.print("<script>location.href='/ezform/logout';</script>");
			out.flush();
		}
		
		String cm_file = null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			cm_file = uuid + "." + ext;

			String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
			path += "upload\\boardUpload\\";

			String temp_path = path + cm_file;

			logger.info("파일명 : " + cm_file);
			logger.info("path : " + temp_path);
			uploadFile.transferTo(new File(temp_path));
		}
		
		vo.setCm_file(cm_file);
		service.modify(vo);
		
		out.print("<script>alert('수정 완료'); location.href='/ezform/board/listPage';</script>");
		out.flush();
	}
	

	// * 글삭제 (remove) *
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public void removeGET(@RequestParam("cm_bnum") int cm_bnum, HttpServletResponse response) throws Exception {
		logger.info("removeGET() 호출");

		// 서비스
		service.remove(cm_bnum);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		out.print("<script>alert('삭제 완료'); location.href='/ezform/board/listPage';</script>");
		out.flush();
	}

	@RequestMapping(value = "/like", method = RequestMethod.GET)
	public String like(@RequestParam("cm_bnum") int cm_bnum, HttpSession session) throws Exception {

		// 세션
		EZ_empVO evo = (EZ_empVO) session.getAttribute("resultVO");
		
		ez_cm_likeVO clvo = new ez_cm_likeVO();
		
		clvo.setLike_bnum(cm_bnum);
		clvo.setLike_id(evo.getEm_id());
		
		// 서비스 구현하기
		service.like(clvo);

		return "redirect:/board/read?nohit=true&cm_bnum="+cm_bnum;
	}
	
	@RequestMapping("/userpic")
	 public String listAttach(HttpSession session,HttpServletResponse response, HttpServletRequest request, @RequestParam("imgName") String imgName) throws Exception {
		
		response.setContentType("image/gif");
		ServletOutputStream bout = response.getOutputStream();
		
		String imgPath = request.getSession().getServletContext().getRealPath("/");
		imgPath += "upload\\boardUpload\\";
		imgPath += imgName;
	
		// String exts = {".jpg",".png",".jpeg",".gif"};
		
		FileInputStream f = new FileInputStream(imgPath);
		
		int len;
		byte[] buffer = new byte[10];
		
		while ((len = f.read(buffer)) != -1)
			bout.write(buffer,0,len);
		
		return null;
	 }
	
	@RequestMapping("/viewImg")
	public void viewImg(@RequestParam("imgName") String imgName, Model model) throws Exception {
		
		model.addAttribute("imgName",imgName);
	}
}